unit uExportImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm, ICSLanguages, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, PngImageList, XML.XMLIntf;

type
  TfrmExportImport = class(TfrmForm)
    PngBitBtn1: TButton;
    PngBitBtn2: TButton;
    btnClose: TButton;
    GroupBox1: TGroupBox;
    cbObjects: TCheckBox;
    cbProtocols: TCheckBox;
    cbSoftware: TCheckBox;
    cbCredentials: TCheckBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    cbAlerts: TCheckBox;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionExport: TAction;
    ActionImport: TAction;
    PngImageList1: TPngImageList;
    GroupBox2: TGroupBox;
    lePassword: TLabeledEdit;
    lePasswordRetype: TLabeledEdit;
    cbPasswords: TCheckBox;
    cbSelected: TCheckBox;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionImportUpdate(Sender: TObject);
    procedure ActionExportUpdate(Sender: TObject);
    procedure ActionExportExecute(Sender: TObject);
    procedure ActionImportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FXMLNodeProperties: IXMLNode;
    procedure ExportSelectedData;
    function ImportSelectedData: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportImport: TfrmExportImport = nil;

implementation

{$R *.dfm}

uses
  uCommonTools, uClasses, XML.XMLDoc, uXMLTools, uPWD;

function ImportDataFromFile(FileName: String): Boolean;
 var TmpXML: IXMLDocument;
begin
  Result := False;
  if FileExists(FileName) and Assigned(FXML) then begin
    TmpXML := NewXMLDocument;
    try
      TmpXML.Options := [doNodeAutoCreate];
      TmpXML.ParseOptions := [poValidateOnParse];
      Result := LoadXMLFromFile(TmpXML, FileName, False);
      if Result then begin
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_GROUPS], FXML.DocumentElement.ChildNodes[ND_GROUPS], True, ND_PARAM_ID);
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_HOSTS], FXML.DocumentElement.ChildNodes[ND_HOSTS], True, ND_PARAM_ID);
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_PROTOCOLS], FXML.DocumentElement.ChildNodes[ND_PROTOCOLS], True, ND_PARAM_ID);
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_SOFTWARE], FXML.DocumentElement.ChildNodes[ND_SOFTWARE], True, ND_PARAM_ID);
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_CREDENTIALS], FXML.DocumentElement.ChildNodes[ND_CREDENTIALS], True, ND_PARAM_ID);
        xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_ALERTS], FXML.DocumentElement.ChildNodes[ND_ALERTS], True, ND_PARAM_ID);
      end;
    finally
      TmpXML := nil;
    end;
  end;
end;

procedure TfrmExportImport.ActionCloseExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExportImport.ActionExportExecute(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    ExportSelectedData;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmExportImport.ActionExportUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (cbObjects.Checked or cbProtocols.Checked or cbSoftware.Checked or cbCredentials.Checked or cbAlerts.Checked) and (lePassword.Text = lePasswordRetype.Text);
end;

procedure TfrmExportImport.ActionImportExecute(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    Application.ProcessMessages;
    if ImportSelectedData then SendMessage(PMemFile^.MainHandle, AR_MESSAGE_RECREATE_USER_INTERFACE, 0, 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmExportImport.ActionImportUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (cbObjects.Checked or cbProtocols.Checked or cbSoftware.Checked or cbCredentials.Checked or cbAlerts.Checked);
end;

procedure TfrmExportImport.ExportSelectedData;
 var
   TmpXML: IXMLDocument;
   ExcludeNodes: array of String;
   iNode: IXMLNode;
begin
  SaveDialog1.FileName := GetExportFileName;
  if SaveDialog1.Execute(Handle) then begin
    TmpXML := NewXMLDocument;
    try
      TmpXML.Options := [doNodeAutoCreate];
      TmpXML.ParseOptions := [poValidateOnParse];
      TmpXML.LoadFromXML(APP_XML_HEADER + APP_XML_ROOT);
      if cbObjects.Checked then begin
        xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_GROUPS], TmpXML.DocumentElement.ChildNodes[ND_GROUPS], []);
        SetLength(ExcludeNodes, 1);
        ExcludeNodes[High(ExcludeNodes)] := ND_SELECTED;
        if not cbPasswords.Checked then begin
          SetLength(ExcludeNodes, Length(ExcludeNodes) + 1);
          ExcludeNodes[High(ExcludeNodes)] := ND_PASSWORD;
        end;
        for var I: Integer := 0 to FXML.DocumentElement.ChildNodes[ND_HOSTS].ChildNodes.Count - 1 do if not cbSelected.Checked or xmlGetItemBoolean(FXML.DocumentElement.ChildNodes[ND_HOSTS].ChildNodes[I].ChildNodes[ND_SELECTED], ND_PARAM_VALUE) then begin
          iNode := TmpXML.DocumentElement.ChildNodes[ND_HOSTS].AddChild(ND_HOST);
          xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_HOSTS].ChildNodes[I], iNode, ExcludeNodes);
        end;
      end;
      if cbProtocols.Checked then xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_PROTOCOLS], TmpXML.DocumentElement.ChildNodes[ND_PROTOCOLS], ExcludeNodes);
      if cbSoftware.Checked then xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_SOFTWARE], TmpXML.DocumentElement.ChildNodes[ND_SOFTWARE], ExcludeNodes);
      if cbCredentials.Checked then xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_CREDENTIALS], TmpXML.DocumentElement.ChildNodes[ND_CREDENTIALS], ExcludeNodes);
      if cbAlerts.Checked then xmlXMLNodeCopyNodes(FXML.DocumentElement.ChildNodes[ND_ALERTS], TmpXML.DocumentElement.ChildNodes[ND_ALERTS], ExcludeNodes);
      SaveXMLToFile(TmpXML, SaveDialog1.FileName, lePassword.Text);
    finally
      TmpXML := nil;
      ModalResult := mrOk;
    end;
  end;
end;

const
  EI_FLAG_OBJECTS = $0001;
  EI_FLAG_PROTOCOLS = $0002;
  EI_FLAG_SOFTWARE = $0004;
  EI_FLAG_CREDENTIALS = $0008;
  EI_FLAG_ALERTS = $0010;

procedure TfrmExportImport.FormClose(Sender: TObject; var Action: TCloseAction);
 var dwFlags: DWORD;
begin
  inherited;
  dwflags := 0;
  if cbObjects.Checked then dwFlags := dwFlags or EI_FLAG_OBJECTS;
  if cbProtocols.Checked then dwFlags := dwFlags or EI_FLAG_PROTOCOLS;
  if cbSoftware.Checked then dwFlags := dwFlags or EI_FLAG_SOFTWARE;
  if cbCredentials.Checked then dwFlags := dwFlags or EI_FLAG_CREDENTIALS;
  if cbAlerts.Checked then dwFlags := dwFlags or EI_FLAG_ALERTS;
  xmlSetItemInteger(FXMLNodeProperties, ND_PARAM_FLAGS, dwFlags);
  xmlSetItemInteger(FXMLNodeProperties, ND_PARAM_PASSWORDS, Integer(cbPasswords.Checked));
  xmlSetItemInteger(FXMLNodeProperties, ND_PARAM_SELECTED, Integer(cbSelected.Checked));
  Action := caFree;
end;

procedure TfrmExportImport.FormCreate(Sender: TObject);
begin
  inherited;
  FXMLNodeProperties := FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_EXPORT_IMPORT];
end;

procedure TfrmExportImport.FormDestroy(Sender: TObject);
begin
  inherited;
  frmExportImport := nil;
end;

procedure TfrmExportImport.FormShow(Sender: TObject);
 var dwFlags: DWORD;
begin
  inherited;
  dwFlags := xmlGetItemInteger(FXMLNodeProperties, ND_PARAM_FLAGS);
  cbObjects.Checked := dwFlags and EI_FLAG_OBJECTS = EI_FLAG_OBJECTS;
  cbProtocols.Checked := dwFlags and EI_FLAG_PROTOCOLS = EI_FLAG_PROTOCOLS;
  cbSoftware.Checked := dwFlags and EI_FLAG_SOFTWARE = EI_FLAG_SOFTWARE;
  cbCredentials.Checked := dwFlags and EI_FLAG_CREDENTIALS = EI_FLAG_CREDENTIALS;
  cbAlerts.Checked := dwFlags and EI_FLAG_ALERTS = EI_FLAG_ALERTS;
  cbPasswords.Checked := Boolean(xmlGetItemInteger(FXMLNodeProperties, ND_PARAM_PASSWORDS));
  cbSelected.Checked := Boolean(xmlGetItemInteger(FXMLNodeProperties, ND_PARAM_SELECTED));
end;

function TfrmExportImport.ImportSelectedData: Boolean;
 var TmpXML: IXMLDocument;
begin
  Result := False;
  if OpenDialog1.Execute(Handle) then begin
    TmpXML := NewXMLDocument;
    try
      TmpXML.Options := [doNodeAutoCreate];
      TmpXML.ParseOptions := [poValidateOnParse];
      Result := LoadXMLFromFile(TmpXML, OpenDialog1.FileName, False);
      if Result then begin
        if cbObjects.Checked then begin
          xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_GROUPS], FXML.DocumentElement.ChildNodes[ND_GROUPS], True, ND_PARAM_ID);
          xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_HOSTS], FXML.DocumentElement.ChildNodes[ND_HOSTS], True, ND_PARAM_ID);
        end;
        if cbProtocols.Checked then xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_PROTOCOLS], FXML.DocumentElement.ChildNodes[ND_PROTOCOLS], True, ND_PARAM_ID);
        if cbSoftware.Checked then xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_SOFTWARE], FXML.DocumentElement.ChildNodes[ND_SOFTWARE], True, ND_PARAM_ID);
        if cbCredentials.Checked then xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_CREDENTIALS], FXML.DocumentElement.ChildNodes[ND_CREDENTIALS], True, ND_PARAM_ID);
        if cbAlerts.Checked then xmlXMLNodeUpdateNodes(TmpXML.DocumentElement.ChildNodes[ND_ALERTS], FXML.DocumentElement.ChildNodes[ND_ALERTS], True, ND_PARAM_ID);
        ModalResult := mrOk;
      end;
    finally
      TmpXML := nil;
    end;
  end;
end;

end.
