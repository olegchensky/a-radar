unit uEditGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uForm, ICSLanguages, Vcl.StdCtrls, Vcl.ExtCtrls,
  XMLIntf, System.ImageList, Vcl.ImgList, PngImageList, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ButtonGroup, System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  TfrmEditGroup = class(TfrmForm)
    btnOk: TButton;
    btnCancel: TButton;
    leName: TLabeledEdit;
    ImageLogo: TImage;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    ActionDelete: TAction;
    PngImageListGroups: TPngImageList;
    PngImageListResult: TPngImageList;
    ActionAdd: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo: TTabSheet;
    ButtonGroupIcons: TButtonGroup;
    btnAddIcons: TButton;
    btnDelete: TButton;
    PngImageListTabs: TPngImageList;
    MemoMemo: TMemo;
    procedure ButtonGroupIconsHotButton(Sender: TObject; Index: Integer);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionDeleteUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ButtonGroupIconsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGroupIconsButtonClicked(Sender: TObject;
      Index: Integer);
    procedure ButtonGroupIconsReorderButton(Sender: TObject; OldIndex,
      NewIndex: Integer);
  private
    FXMLNode: IXMLNode;
    FIconLibModified: Boolean;
    procedure FillControls;
    procedure SaveBounds;
    procedure ApplyPropertiesOnShow;
  public
    procedure ApplyChanges;
    property XMLNode: IXMLNode read FXMLNode write FXMLNode;
    property IconLibModified: Boolean read FIconLibModified;
  end;

var
  frmEditGroup: TfrmEditGroup;

implementation

{$R *.dfm}

uses
  System.NetEncoding, uCommonTools, uVCLTools, uClasses, uXMLTools, Math;

{ TfrmEditGroup }

procedure TfrmEditGroup.ActionAddExecute(Sender: TObject);
 var
   I, ItemCountBefore: Integer;
   Ico: TIcon;
   Png: TPngImage;
   Ext: String;
begin
  inherited;
  if OpenDialog1.Execute(Handle) then begin
    Screen.Cursor := crHourGlass;
    ItemCountBefore := ButtonGroupIcons.Items.Count;
    Ico := TIcon.Create;
    Png := TPngImage.Create;
    try
      for I := 0 to OpenDialog1.Files.Count - 1 do begin
        Ext := UpperCase(ExtractFileExt(OpenDialog1.Files[I]));
        if Ext = '.ICO' then begin
          Ico.LoadFromFile(OpenDialog1.Files[I]);
          ButtonGroupIcons.Items.Add.ImageIndex := PngImageListGroups.AddIcon(Ico);
        end else if Ext = '.PNG' then begin
          Png.LoadFromFile(OpenDialog1.Files[I]);
          ButtonGroupIcons.Items.Add.ImageIndex := PngImageListGroups.AddPng(Png);
        end;
      end;
      ButtonGroupIcons.ItemIndex := Max(ItemCountBefore, 0);
      PngImageListGroups.GetIcon(ButtonGroupIcons.Items[ButtonGroupIcons.ItemIndex].ImageIndex, ImageLogo.Picture.Icon);
      if ButtonGroupIcons.ItemIndex > 0 then ButtonGroupIcons.ScrollIntoView(ButtonGroupIcons.ItemIndex);
    finally
      Png.Free;
      Ico.Free;
      FIconLibModified := True;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmEditGroup.ButtonGroupIconsButtonClicked(Sender: TObject;
  Index: Integer);
begin
  inherited;
  PngImageListGroups.GetIcon(ButtonGroupIcons.Items[Index].ImageIndex, ImageLogo.Picture.Icon);
end;

procedure TfrmEditGroup.ButtonGroupIconsHotButton(Sender: TObject;
  Index: Integer);
begin
  inherited;
  if Index < 0 then Index := Max(ButtonGroupIcons.ItemIndex, 0);
  if Index < ButtonGroupIcons.Items.Count then PngImageListGroups.GetIcon(ButtonGroupIcons.Items[Index].ImageIndex, ImageLogo.Picture.Icon);
end;

procedure TfrmEditGroup.ButtonGroupIconsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PngImageListGroups.GetIcon(ButtonGroupIcons.Items[ButtonGroupIcons.ItemIndex].ImageIndex, ImageLogo.Picture.Icon);
end;

procedure TfrmEditGroup.ButtonGroupIconsReorderButton(Sender: TObject;
  OldIndex, NewIndex: Integer);
begin
  inherited;
  FIconLibModified := True;
end;

procedure TfrmEditGroup.FillControls;
 var
   I, Idx: Integer;
begin
  leName.Text := xmlGetItemString(FXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE);
  MemoMemo.Lines.Text := icsB64Decode(xmlGetItemString(FXMLNode.ChildNodes[ND_MEMO], ND_PARAM_VALUE));
  ButtonGroupIcons.Items.BeginUpdate;
  try
    ButtonGroupIcons.Items.Clear;
    for I := 0 to PngImageListGroups.Count - 1 do ButtonGroupIcons.Items.Add.ImageIndex := I;
  finally
    ButtonGroupIcons.Items.EndUpdate;
    Idx := xmlGetItemInteger(FXMLNode, ND_PARAM_ICONID);
    if Idx < ButtonGroupIcons.Items.Count then ButtonGroupIcons.ItemIndex := Idx else ButtonGroupIcons.ItemIndex := MaxInt - APP_ARGROUP_ID_NORMAL;
    ButtonGroupIcons.ScrollIntoView(ButtonGroupIcons.ItemIndex);
    FIconLibModified := False;
end;
  PngImageListGroups.GetIcon(ButtonGroupIcons.ItemIndex, ImageLogo.Picture.Icon);
end;

procedure TfrmEditGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SaveBounds;
end;

procedure TfrmEditGroup.FormShow(Sender: TObject);
begin
  inherited;
  ApplyPropertiesOnShow;
  FillControls;
end;

procedure TfrmEditGroup.ActionDeleteExecute(Sender: TObject);
 var Idx: Integer;
begin
  inherited;
  Idx := ButtonGroupIcons.ItemIndex;
  ButtonGroupIcons.Items.Delete(Idx);
  if Idx in [0..ButtonGroupIcons.Items.Count - 1] then ButtonGroupIcons.ItemIndex := Idx else if ButtonGroupIcons.Items.Count > 0 then ButtonGroupIcons.ItemIndex := ButtonGroupIcons.Items.Count - 1 else ButtonGroupIcons.ItemIndex := -1;
  if ButtonGroupIcons.ItemIndex >= 0 then begin
    PngImageListGroups.GetIcon(ButtonGroupIcons.Items[ButtonGroupIcons.ItemIndex].ImageIndex, ImageLogo.Picture.Icon);
    ButtonGroupIcons.ScrollIntoView(ButtonGroupIcons.ItemIndex);
  end else ImageLogo.Picture := nil;
  FIconLibModified := True;
end;

procedure TfrmEditGroup.ActionDeleteUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ButtonGroupIcons.ItemIndex >= 0);
end;

procedure TfrmEditGroup.ApplyChanges;
 var
   I: Integer;
   Ico: TIcon;
begin
  xmlSetItemString(FXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE, leName.Text);
  xmlSetItemString(FXMLNode.ChildNodes[ND_MEMO], ND_PARAM_VALUE, icsB64Encode(MemoMemo.Lines.Text));
  xmlSetItemInteger(FXMLNode, ND_PARAM_ICONID, ButtonGroupIcons.ItemIndex);
  if FIconLibModified then begin
    PngImageListResult.Clear;
    Ico := TIcon.Create;
    try
      for I := 0 to ButtonGroupIcons.Items.Count - 1 do begin
        PngImageListGroups.GetIcon(ButtonGroupIcons.Items[I].ImageIndex, Ico);
        PngImageListResult.AddIcon(Ico);
      end;
    finally
      Ico.Free;
    end;
  end;
end;

procedure TfrmEditGroup.ApplyPropertiesOnShow;
 var iNode: IXMLNode;
begin
  iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS];
  SetBounds(xmlGetItemInteger(iNode, ND_PARAM_LEFT, Left), xmlGetItemInteger(iNode, ND_PARAM_TOP, Top), xmlGetItemInteger(iNode, ND_PARAM_WIDTH, Width), xmlGetItemInteger(iNode, ND_PARAM_HEIGHT, Height));
end;

procedure TfrmEditGroup.SaveBounds;
 var iNode: IXMLNode;
begin
  iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS];
  xmlSetItemInteger(iNode, ND_PARAM_WIDTH, Width);
  xmlSetItemInteger(iNode, ND_PARAM_HEIGHT, Height);
  xmlSetItemInteger(iNode, ND_PARAM_LEFT, Left);
  xmlSetItemInteger(iNode, ND_PARAM_TOP, Top);
end;

end.
