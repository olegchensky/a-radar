unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, ICSLanguages, Vcl.StdCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.AppEvnts,
  System.ImageList, Vcl.ImgList,
  PngImageList, XML.XMLIntf,
  uForm, uClasses, Vcl.ToolWin,
  uAppBar, System.Notification;

type
  TfrmMain = class(TfrmForm)
    ActionListMain: TActionList;
    PopupMenu1: TPopupMenu;
    ActionHostAdd: TAction;
    ActionHostEdit: TAction;
    ActionHostDelete: TAction;
    ActionClose: TAction;
    ItemAdd: TMenuItem;
    ItemEdit: TMenuItem;
    ItemDelete: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    PngImageListApp: TPngImageList;
    PngImageListMain: TPngImageList;
    N2: TMenuItem;
    ActionOpen: TAction;
    N3: TMenuItem;
    ItemConnect: TMenuItem;
    ListViewMain: TListView;
    ActionSetGroupView: TAction;
    ICSLanguagesGroups: TICSLanguages;
    ActionMoveToNewGroup: TAction;
    ActionMoveToFavorites: TAction;
    ActionDeleteEmptyGroups: TAction;
    ActionHostClone: TAction;
    ActionCloneHost1: TMenuItem;
    N5: TMenuItem;
    ActionSetActive: TAction;
    ActionSetInactive: TAction;
    ActionGroupCollapseAll: TAction;
    ActionGroupExpandAll: TAction;
    ActionHostSelectAll: TAction;
    ItemSelectAll: TMenuItem;
    ICSLanguagesMessages: TICSLanguages;
    MainMenu1: TMainMenu;
    ItemMainFile: TMenuItem;
    ItemMainEdit: TMenuItem;
    ItemClose: TMenuItem;
    N1: TMenuItem;
    ItemHostAdd: TMenuItem;
    ItemHostEdit: TMenuItem;
    ActionCloneHost2: TMenuItem;
    ItemHostDelete: TMenuItem;
    N7: TMenuItem;
    ItemHostSelectAll: TMenuItem;
    ItemGroupExpantAll: TMenuItem;
    ItemGroupCollapseAll: TMenuItem;
    ItemGroupDeleteEmpty: TMenuItem;
    ItemMainView: TMenuItem;
    ItemMainRun: TMenuItem;
    ActionSetGroupView1: TMenuItem;
    ItemMainMoveTo: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    ItemMainSetActive: TMenuItem;
    ItemMainSetInactive: TMenuItem;
    ItemMoveTo: TMenuItem;
    TrayIcon1: TTrayIcon;
    PopupMenuTray: TPopupMenu;
    ItemTrayClose: TMenuItem;
    ActionGroupEdit: TAction;
    ItemGroupEdit: TMenuItem;
    N8: TMenuItem;
    ItemMainGroupEdit: TMenuItem;
    ActionProperties: TAction;
    N11: TMenuItem;
    ItemAbout: TMenuItem;
    ActionAbout: TAction;
    ItemProperties: TMenuItem;
    N12: TMenuItem;
    ItemTrayProperties: TMenuItem;
    ItemTrayAbout: TMenuItem;
    TimerGlobalPause: TTimer;
    ActionExecutePing: TAction;
    ItemMainTools: TMenuItem;
    ItemMainPing: TMenuItem;
    ItemExecutePing: TMenuItem;
    ActionExecuteTracert: TAction;
    ItemMainTracert: TMenuItem;
    ItemNetworkTools: TMenuItem;
    ItemExecuteTracert: TMenuItem;
    ActionHostRename: TAction;
    ItemRename: TMenuItem;
    ItemMainRename: TMenuItem;
    N13: TMenuItem;
    TimerUpdateStatus: TTimer;
    ActionDataManager: TAction;
    ItemSoftManager: TMenuItem;
    ItemTrySoftManager: TMenuItem;
    N14: TMenuItem;
    ItemActivate: TMenuItem;
    ItemDeactivate: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActionExportImport: TAction;
    ItemExportImport: TMenuItem;
    ActionToggleModifies: TAction;
    N15: TMenuItem;
    ItemMainToggleModifies: TMenuItem;
    ItemToggleModifies: TMenuItem;
    ActionCMD: TAction;
    ItemCMD: TMenuItem;
    ItemMainCMD: TMenuItem;
    PngImageListGroups: TPngImageList;
    ActionGroupMoveUp: TAction;
    ActionGroupMoveDown: TAction;
    ItemMainGroupMoveUp: TMenuItem;
    ItemMainGroupMoveDown: TMenuItem;
    N16: TMenuItem;
    ActionStayOnTop: TAction;
    MainItemStayOnTop: TMenuItem;
    NotificationCenter1: TNotificationCenter;
    ActionMoveToRecycleBin: TAction;
    ActionEmptyRecycleBin: TAction;
    N9: TMenuItem;
    ItemEmptyRecycleBin: TMenuItem;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionHostEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1ModalBegin(Sender: TObject);
    procedure ApplicationEvents1ModalEnd(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ActionHostDeleteUpdate(Sender: TObject);
    procedure ActionGroupDeleteUpdate(Sender: TObject);
    procedure ActionHostDeleteExecute(Sender: TObject);
    procedure ActionSetGroupViewExecute(Sender: TObject);
    procedure ActionSetGroupViewUpdate(Sender: TObject);
    procedure ActionHostAddExecute(Sender: TObject);
    procedure ActionMoveToFavoritesExecute(Sender: TObject);
    procedure ActionMoveToNewGroupExecute(Sender: TObject);
    procedure ActionDeleteEmptyGroupsExecute(Sender: TObject);
    procedure ActionMoveToNewGroupUpdate(Sender: TObject);
    procedure ActionHostCloneExecute(Sender: TObject);
    procedure ListViewMainItemChecked(Sender: TObject; Item: TListItem);
    procedure ActionSetActiveExecute(Sender: TObject);
    procedure ActionSetInactiveExecute(Sender: TObject);
    procedure ActionSetActiveUpdate(Sender: TObject);
    procedure ActionSetInactiveUpdate(Sender: TObject);
    procedure ActionHostCloneUpdate(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionGroupCollapseAllExecute(Sender: TObject);
    procedure ActionGroupExpandAllExecute(Sender: TObject);
    procedure ActionGroupCollapseAllUpdate(Sender: TObject);
    procedure ActionHostSelectAllUpdate(Sender: TObject);
    procedure ActionHostSelectAllExecute(Sender: TObject);
    procedure ActionHostSelectNoneUpdate(Sender: TObject);
    procedure ListViewMainDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CreateGroupMenu(Sender: TObject);
    procedure OnItemGroupClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ItemMainEditClick(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure ActionGroupEditExecute(Sender: TObject);
    procedure ListViewMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionPropertiesExecute(Sender: TObject);
    procedure TimerGlobalPauseTimer(Sender: TObject);
    procedure ActionExecutePingExecute(Sender: TObject);
    procedure ActionExecuteTracertExecute(Sender: TObject);
    procedure ActionAddFirstUpdate(Sender: TObject);
    procedure ListViewMainEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure ActionHostRenameExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerUpdateStatusTimer(Sender: TObject);
    procedure ActionDataManagerExecute(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure ActionExportImportExecute(Sender: TObject);
    procedure ActionToggleModifiesExecute(Sender: TObject);
    procedure ListViewMainColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListViewMainCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure ActionCMDExecute(Sender: TObject);
    procedure ActionCMDUpdate(Sender: TObject);
    procedure ListViewMainSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure TrayIcon1BalloonClick(Sender: TObject);
    procedure ListViewMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ListViewMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ActionGroupMoveUpExecute(Sender: TObject);
    procedure ActionGroupMoveDownExecute(Sender: TObject);
    procedure ActionGroupMoveUpUpdate(Sender: TObject);
    procedure ListViewMainInfoTip(Sender: TObject; Item: TListItem; var InfoTip: string);
    procedure ActionStayOnTopUpdate(Sender: TObject);
    procedure ActionStayOnTopExecute(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ActionMoveToRecycleBinExecute(Sender: TObject);
    procedure ActionEmptyRecycleBinExecute(Sender: TObject);
    procedure ActionEmptyRecycleBinUpdate(Sender: TObject);
  private
    FModalCounter: Integer;
    FListViewWndProc: TWndMethod;
    FSortColumnToSort: Integer;
    FSortDescending: Boolean;
    procedure ListViewWndProc(var Message: TMessage);
    procedure OnWMQueryEndSession(var Msg: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure OnWMEndSession(var Msg: TWMEndSession); message WM_ENDSESSION;
    procedure OnWMExitSizeMove(var Msg: TMessage); message WM_EXITSIZEMOVE;
    procedure OnICSSetLanguageMsg(var Msg: TMessage); message ICS_SETLANGUAGE_MSG;
    procedure OnMessageSetActive(var Msg: TMessage); message AR_MESSAGE_SETACTIVE;
    procedure OnMessageSetState(var Msg: TMessage); message AR_MESSAGE_SETSTATE;
    procedure OnRecreateList(var Msg: TMessage); message AR_MESSAGE_UPDATE_LIST;
    procedure OnRecreateUserInterface(var Msg: TMessage); message AR_MESSAGE_RECREATE_USER_INTERFACE;
    procedure OnMessageClose(var Msg: TMessage); message AR_MESSAGE_CLOSE;
    procedure OnMessageRestore(var Msg: TMessage); message AR_MESSAGE_RESTORE;
    procedure OnMessageBalloonMsg(var Msg: TMessage); message AR_MESSAGE_BALLOON_MSG;
    procedure OnMessageInitialized(var Msg: TMessage); message AR_MESSAGE_INITIALIZED;
    procedure RecreateUserInterface;
    function GetNewGroupName: String;
    procedure InitializeHostNode(iNode: IXMLNode; GroupID: Integer; iSourceNode: IXMLNode; MultiEdit: Boolean);
    procedure CreateHostItem(iNode: IXMLNode);
    procedure CreateGroupItem(iNode: IXMLNode);
    procedure ApplyHostParams(aHost: TListItem);
    procedure ApplyGroupParams(aGroup: TListGroup; iNode: IXMLNode);
    procedure ApplyProperties;
    procedure SaveBounds;
    procedure NormalizeGroups;
    procedure SaveGroupProperties;
    function XMLCreateGroup(GroupName: String; GroupID: Integer; EditData: Boolean): Boolean;
    function XMLCreateHost(GroupID: Integer; const iSourceNode: IXMLNode = nil): Boolean;
    procedure SelectedMoveToGroup(GroupID: Integer);
    procedure OnClickMoveToExistedExecute(Sender: TObject);
    function EditHostNode(XMLNode: IXMLNode; MultiEdit: Boolean): Boolean;
    function GetGroupXMLNode(GroupID: Integer): IXMLNode;
    function EditGroupNode(XMLNode: IXMLNode): Boolean;
    procedure ApplyPropertiesOnShow;
    function GetGroupIndex(GroupID: Integer): Integer;
    function GetFocusedGroupIndex: Integer;
    function GetFirstGroupItem(GroupID: Integer): TListItem;
    procedure NetworkToolExecute(NetworkTool: TARNetworkTool);
    procedure DeleteListItemData(LI: TListItem);
    procedure RestoreMainWindow;
    procedure OnExit;
    procedure LoadGroupIcons;
    procedure SaveGroupIcons;
    procedure GroupMoveUpDown(bDown: Boolean);
    function GetNextNotEmptyGroupId(Idx: Integer): Integer;
    function GetPrevNotEmptyGroupId(Idx: Integer): Integer;
    function IsEmptyGroup(GroupID: Integer): Boolean;
    function GetInfoTip(Item: TListItem): String;
    procedure OnEdgeChangeEvent(Sender: TObject; ANewEdge: TAppBarEdge; var Allow: Boolean);
  end;

var
  frmMain: TfrmMain;
  ShuttingDown: Boolean = False;

implementation

{$R *.dfm}

uses
  ShellAPI, XML.XMLDoc, uCommonTools, uVCLTools, uEditHost, uEditGroup, uProps,
  uPWD, uNetworkTools, uDataManager, uXMLTools,
  Vcl.Themes, Vcl.Styles, uExportImport, uInfo;

procedure TfrmMain.ActionHostSelectAllExecute(Sender: TObject);
begin
  inherited;
  ListViewMain.SelectAll;
end;

procedure TfrmMain.ActionHostSelectAllUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.Items.Count > 0) and (ListViewMain.Items.Count > ListViewMain.SelCount);
end;

procedure TfrmMain.ActionHostSelectNoneUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 0);
end;

procedure TfrmMain.ActionSetActiveExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  if ListViewMain.SelCount > 1 then begin
    GlobalSleepPause := 1000;
    TimerGlobalPause.Enabled := True;
  end;
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected and Assigned(ListViewMain.Items[I].Data) then TARObject(ListViewMain.Items[I].Data).Active := True;
end;

procedure TfrmMain.ActionSetActiveUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 1) or ((ListViewMain.SelCount = 1) and (not TARObject(ListViewMain.Selected.Data).Active));
end;

procedure TfrmMain.ActionSetGroupViewExecute(Sender: TObject);
begin
  inherited;
  ListViewMain.Items.BeginUpdate;
  try
    ListViewMain.GroupView := not ListViewMain.GroupView;
    xmlSetItemBoolean(FXML.DocumentElement.ChildNodes[ND_PROPERTIES], ND_PARAM_GROUPVIEW, ListViewMain.GroupView);
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

procedure TfrmMain.ActionSetGroupViewUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := ListViewMain.GroupView;
end;

procedure TfrmMain.ActionSetInactiveExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected and Assigned(ListViewMain.Items[I].Data) then TARObject(ListViewMain.Items[I].Data).Active := False;
end;

procedure TfrmMain.ActionSetInactiveUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 1) or ((ListViewMain.SelCount = 1) and (TARObject(ListViewMain.Selected.Data).Active));
end;

procedure TfrmMain.ActionStayOnTopExecute(Sender: TObject);
begin
  if FormStyle = fsStayOnTop then FormStyle := fsNormal else FormStyle := fsStayOnTop;
  xmlSetItemInteger(FXML.DocumentElement.ChildNodes[ND_PROPERTIES], ND_PARAM_STAYONTOP, Ord(FormStyle));
end;

procedure TfrmMain.ActionStayOnTopUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Checked := (FormStyle = fsStayOnTop);
end;

procedure TfrmMain.ActionDataManagerExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDataManager) then frmDataManager := TfrmDataManager.Create(Application);
  frmDataManager.Show;
end;

procedure TfrmMain.ActionToggleModifiesExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then TARObject(ListViewMain.Items[I].Data).Modified := not TARObject(ListViewMain.Items[I].Data).Modified;
end;

function TfrmMain.GetGroupIndex(GroupID: Integer): Integer;
 var I: Integer;
begin
  Result := -1;
  for I := 0 to ListViewMain.Groups.Count - 1 do if ListViewMain.Groups[I].GroupID = GroupID then begin
    Result := ListViewMain.Groups[I].Index;
    Break;
  end;
end;

function TfrmMain.GetFocusedGroupIndex: Integer;
 var I: Integer;
begin
  Result := -1;
  for I := 0 to ListViewMain.Groups.Count - 1 do if lgsFocused in ListViewMain.Groups[I].State then begin
    Result := ListViewMain.Groups[I].Index;
    Break;
  end;
end;

function TfrmMain.GetFirstGroupItem(GroupID: Integer): TListItem;
 var I: Integer;
begin
  Result := nil;
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].GroupID = GroupID then begin
    Result := ListViewMain.Items[I];
    Break;
  end;
end;

function TfrmMain.GetGroupXMLNode(GroupID: Integer): IXMLNode;
 var
   I: Integer;
   iNode: IXMLNode;
begin
  Result := nil;
  iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS];
  for I := 0 to iNode.ChildNodes.Count - 1 do if iNode.ChildNodes[I].Attributes[ND_PARAM_ID] = GroupID.ToString then begin
    Result := iNode.ChildNodes[I];
    Break;
  end;
end;

procedure TfrmMain.ActionGroupEditExecute(Sender: TObject);
 var
   GroupID: Integer;
   iNode: IXMLNode;
begin
  inherited;
  GroupID := ListViewMain.Selected.GroupID;
  iNode := GetGroupXMLNode(GroupID);
  if EditGroupNode(iNode) then ApplyGroupParams(ListViewMain.Groups[GetGroupIndex(GroupID)], iNode);
end;

function TfrmMain.GetNewGroupName: String;

   function _Exists(Title: String): Boolean;
    var I: Integer;
   begin
     Result := False;
     for I := 0 to ListViewMain.Groups.Count - 1 do begin
       Result := (UpperCase(ListViewMain.Groups[I].Header) = UpperCase(Title));
       if Result then Break;
     end;
   end;

 var I: Integer;
begin
  I := 0;
  repeat
    Result := ICSLanguagesBase.CurrentStrings[15];
    if I > 0 then Result := Result + ' (' + IntToStr(I) + ')';
    Inc(I);
  until not _Exists(Result);
end;

procedure TfrmMain.ActionHostCloneExecute(Sender: TObject);
begin
  inherited;
  if Assigned(ListViewMain.Selected) then XMLCreateHost(ListViewMain.Selected.GroupID, TARObject(ListViewMain.Selected.Data).XMLNode);
end;

procedure TfrmMain.ActionHostCloneUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount = 1);
end;

procedure TfrmMain.ActionAboutExecute(Sender: TObject);
begin
  inherited;
  with TfrmInfo.Create(Application) do try
    ShowModal;
  finally
    Release;
  end;
end;

procedure TfrmMain.ActionAddFirstUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Visible := (ListViewMain.Items.Count = 0);
end;

procedure TfrmMain.ActionCloseExecute(Sender: TObject);
begin
  inherited;
  ShuttingDown := True;
  Close;
end;

procedure TfrmMain.ActionCMDExecute(Sender: TObject);
begin
  inherited;
  ShellExecute(Handle, nil, 'cmd.exe', nil, PChar(TARObject(ListViewMain.Selected.Data).FullPath), SW_SHOWNORMAL);
end;

procedure TfrmMain.ActionCMDUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount = 1) and (TARObject(ListViewMain.Selected.Data).Location = olLocalOrShared);
end;

procedure TfrmMain.ActionGroupCollapseAllExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  ListViewMain.Items.BeginUpdate;
  try
    for I := 0 to ListViewMain.Groups.Count - 1 do ListViewMain.Groups[I].State := ListViewMain.Groups[I].State + [lgsCollapsed]
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

procedure TfrmMain.ActionGroupCollapseAllUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := ListViewMain.GroupView and (ListViewMain.Groups.Count > 0);
end;

procedure TfrmMain.ActionOpenExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  if ListViewMain.SelCount = 1 then TARObject(ListViewMain.Selected.Data).Run else for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then TARObject(ListViewMain.Items[I].Data).Run;
end;

procedure TfrmMain.ActionHostAddExecute(Sender: TObject);
 var GroupID, Idx: Integer;
begin
  inherited;
  if Assigned(ListViewMain.Selected) then GroupID := ListViewMain.Selected.GroupID else GroupID := APP_ARGROUP_ID_GENERAL;
  if XMLCreateHost(GroupID) then begin
    Idx := GetGroupIndex(GroupID);
    if Idx in [0..ListViewMain.Groups.Count - 1] then ListViewMain.Groups[Idx].State := ListViewMain.Groups[Idx].State - [lgsCollapsed];
  end;
end;

procedure TfrmMain.DeleteListItemData(LI: TListItem);
begin
  if Assigned(LI.Data) then begin
    TARObject(LI.Data).Active := False;
    TARObject(LI.Data).XMLNode.ParentNode.ChildNodes.Remove(TARObject(LI.Data).XMLNode);
    TARObject(LI.Data).Free;
    LI.Data := nil;
  end;
end;

procedure TfrmMain.ActionHostDeleteExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  SelectedMoveToGroup(APP_ARGROUP_ID_RECYCLE_BIN);
end;

procedure TfrmMain.ActionHostDeleteUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 0);
end;

procedure TfrmMain.CreateGroupMenu(Sender: TObject);
 var
   I: Integer;
   MI :TMenuItem;
   SelectedGroupID: Integer;
begin
  inherited;
  if Assigned(ListViewMain.Selected) then SelectedGroupID := ListViewMain.Selected.GroupID else SelectedGroupID := -1;
  for I := (Sender as TMenuItem).Count - 1 downto 0 do if (Sender as TMenuItem).Items[I].HelpContext = 1 then (Sender as TMenuItem).Delete(I);
  for I := 0 to ListViewMain.Groups.Count - 1 do if (ListViewMain.Groups[I].GroupID <> APP_ARGROUP_ID_FAVORITES) and (ListViewMain.Groups[I].GroupID <> APP_ARGROUP_ID_RECYCLE_BIN) then begin
    MI := TMenuItem.Create(Self);
    MI.OnClick := OnClickMoveToExistedExecute;
    MI.Caption := ListViewMain.Groups[I].Header;
    MI.ImageIndex := -1;//ListViewMain.Groups[I].TitleImage;
    MI.Tag := ListViewMain.Groups[I].GroupID;
    MI.Enabled := (ListViewMain.Groups[I].GroupID <> SelectedGroupID);
    MI.HelpContext := 1;
    (Sender as TMenuItem).Add(MI);
  end;
  MI := TMenuItem.Create(Self);
  MI.Caption := '-';
  (Sender as TMenuItem).Add(MI);
  MI := TMenuItem.Create(Self);
  MI.Action := ActionMoveToRecycleBin;
  MI.ImageIndex := -1;//ListViewMain.Groups[GetGroupIndex(APP_ARGROUP_ID_RECYCLE_BIN)].TitleImage;
  MI.Enabled := (SelectedGroupID <> APP_ARGROUP_ID_RECYCLE_BIN);
  (Sender as TMenuItem).Add(MI);
end;

function TfrmMain.IsEmptyGroup(GroupID: Integer): Boolean;
 var I: Integer;
begin
  Result := True;
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].GroupID = GroupID then begin
    Result := False;
    Break;
  end;
end;

procedure TfrmMain.ActionDeleteEmptyGroupsExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  if MessageBox(Handle, PChar(ICSLanguagesMessages.CurrentStrings[APP_ARSERVICE_MESSAGE_ID_DELETE_GROUPS]), PChar(Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then begin
    ListViewMain.Items.BeginUpdate;
    try
      SaveGroupProperties;
      for I := ListViewMain.Groups.Count - 1 downto 0 do if (ListViewMain.Groups[I].GroupID < APP_ARGROUP_ID_FIRSTRESERVED) and IsEmptyGroup(ListViewMain.Groups[I].GroupID) then begin
        ListViewMain.Groups.Delete(I);
        FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.Delete(I);
      end;
    finally
      ListViewMain.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.NetworkToolExecute(NetworkTool: TARNetworkTool);
 var I: Integer;
begin
  for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then begin
    frmNetworkTools := TfrmNetworkTools.Create(Application);
    frmNetworkTools.XMLNode := TARObject(ListViewMain.Items[I].Data).XMLNode;
    frmNetworkTools.NetworkTool := NetworkTool;
    frmNetworkTools.Show;
  end;
end;

procedure TfrmMain.ActionEmptyRecycleBinExecute(Sender: TObject);
begin
  inherited;
  if MessageBox(Handle, PChar(ICSLanguagesMessages.CurrentStrings[APP_ARSERVICE_MESSAGE_ID_EMPTY_RECYCLE_BIN]), PChar(Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then begin
    ListViewMain.Items.BeginUpdate;
    try
      for var I: Integer := ListViewMain.Items.Count - 1 downto 0 do if ListViewMain.Items[I].GroupID = APP_ARGROUP_ID_RECYCLE_BIN then begin
        DeleteListItemData(ListViewMain.Items[I]);
        ListViewMain.Items[I].Delete;
      end;
    finally
      ListViewMain.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.ActionEmptyRecycleBinUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := not IsEmptyGroup(APP_ARGROUP_ID_RECYCLE_BIN);
end;

procedure TfrmMain.ActionExecutePingExecute(Sender: TObject);
begin
  inherited;
  NetworkToolExecute(ntPing);
end;

procedure TfrmMain.ActionExecuteTracertExecute(Sender: TObject);
begin
  inherited;
  NetworkToolExecute(ntTracert);
end;

procedure TfrmMain.ActionExportImportExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmExportImport) then frmExportImport := TfrmExportImport.Create(Application);
  frmExportImport.Show;
end;

procedure TfrmMain.ActionGroupExpandAllExecute(Sender: TObject);
 var I: Integer;
begin
  inherited;
  ListViewMain.Items.BeginUpdate;
  try
    for I := 0 to ListViewMain.Groups.Count - 1 do ListViewMain.Groups[I].State := ListViewMain.Groups[I].State - [lgsCollapsed]
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

function TfrmMain.GetPrevNotEmptyGroupId(Idx: Integer): Integer;
begin
  Result := Idx - 1;
  while (Result >= 0) and IsEmptyGroup(ListViewMain.Groups[Result].GroupID) do Dec(Result);
end;

function TfrmMain.GetNextNotEmptyGroupId(Idx: Integer): Integer;
begin
  Result := Idx + 1;
  while (Result < ListViewMain.Groups.Count) and IsEmptyGroup(ListViewMain.Groups[Result].GroupID) do Inc(Result);
  if Result >= ListViewMain.Groups.Count then Result := -1;
end;

procedure TfrmMain.GroupMoveUpDown(bDown: Boolean);
 var
   iNode: IXMLNode;
   I, Idx, NewIdx, GId: Integer;
begin
  GId := -1;
  if Assigned(ListViewMain.ItemFocused) then GId := ListViewMain.ItemFocused.GroupID else begin
    Idx := GetFocusedGroupIndex;
    if Idx >= 0 then GId := ListViewMain.Groups[Idx].GroupID;
  end;

  if GId >= 0 then begin
    iNode := nil;
    for I := 0 to FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.Count - 1 do if xmlGetItemInteger(FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes[I], ND_PARAM_ID) = GID then begin
      iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes[I];
      Break;
    end;
    if Assigned(iNode) then begin
      Idx := FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.IndexOf(iNode);
      NewIdx := -1;
      if bDown and (iNode <> FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.Last) then NewIdx := GetNextNotEmptyGroupId(Idx) else if not bDown and (iNode <> FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.First) then NewIdx := GetPrevNotEmptyGroupId(Idx);
      if NewIdx >= 0 then begin
        ListViewMain.Groups.BeginUpdate;
        try
          SaveGroupProperties;
          FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.Remove(iNode);
          FXML.DocumentElement.ChildNodes[ND_GROUPS].ChildNodes.Insert(NewIdx, iNode);
          ListViewMain.Groups.Items[Idx].Index := NewIdx;
//          ListViewMain.Groups[NewIdx].State := ListViewMain.Groups[NewIdx].State + [lgsFocused];
        finally
          ListViewMain.Groups.EndUpdate;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.ActionGroupMoveDownExecute(Sender: TObject);
begin
  inherited;
  GroupMoveUpDown(True);
end;

procedure TfrmMain.ActionGroupMoveUpExecute(Sender: TObject);
begin
  inherited;
  GroupMoveUpDown(False);
end;

procedure TfrmMain.ActionGroupMoveUpUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := ListViewMain.GroupView;
end;

procedure TfrmMain.ActionGroupDeleteUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 0);
end;

procedure TfrmMain.ActionHostEditExecute(Sender: TObject);
 var
   I, J: Integer;
   iNode: IXMLNode;
   S, NodeName: String;
begin
  inherited;
  if ListViewMain.SelCount = 1 then begin
    iNode := TARObject(ListViewMain.Selected.Data).XMLNode;
    if EditHostNode(iNode, False) then ApplyHostParams(ListViewMain.Selected);
  end else begin
    iNode := FXML.DocumentElement.ChildNodes[ND_HOSTS].AddChild(ND_ITEM);
    try
      InitializeHostNode(iNode, -1, nil, True);
      if EditHostNode(iNode, True) then begin
        for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then begin
          for J := 0 to iNode.ChildNodes.Count - 1 do begin
            NodeName := iNode.ChildNodes[J].NodeName;
            S := xmlGetItemString(iNode.ChildNodes[NodeName], ND_PARAM_VALUE);
            if (S <> '') and
               ((S <> '-1') or ((NodeName <> ND_SHOW_WINDOW))) and
               ((S <> IntToStr(Ord(cbGrayed))) or ((NodeName <> ND_SENDRECEIVE)
                                               and (NodeName <> ND_RUNASADMIN)
                                               and (NodeName <> ND_CHECK_MODIFIED)
                                               and (NodeName <> ND_ALERTS)
                                               and (NodeName <> ND_UNSET_MODIFIES)
               )) then xmlSetItemString(TARObject(ListViewMain.Items[I].Data).XMLNode.ChildNodes[NodeName], ND_PARAM_VALUE, S);
          end;
          ApplyHostParams(ListViewMain.Items[I]);
        end;
      end;
    finally
      FXML.DocumentElement.ChildNodes[ND_HOSTS].ChildNodes.Remove(iNode);
    end;
  end;
end;

procedure TfrmMain.ActionHostRenameExecute(Sender: TObject);
begin
  inherited;
  if Assigned(ListViewMain.Selected) then ListViewMain.Selected.EditCaption;
end;

procedure TfrmMain.SelectedMoveToGroup(GroupID: Integer);
 var I: Integer;
begin
  inherited;
  ListViewMain.Items.BeginUpdate;
  try
    for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then begin
      ListViewMain.Items[I].GroupID := GroupID;
      TARObject(ListViewMain.Items[I].Data).GroupID := GroupID;
    end;
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

procedure TfrmMain.TimerGlobalPauseTimer(Sender: TObject);
begin
  inherited;
  GlobalSleepPause := 0;
  TimerGlobalPause.Enabled := False;
end;

procedure TfrmMain.TimerUpdateStatusTimer(Sender: TObject);
begin
  inherited;
  if FXML.Modified then SaveXMLToFile(FXML, GetMainXMLFileName, ARMasterPassword);
end;

procedure TfrmMain.RestoreMainWindow;
begin
  Application.Restore;
  WindowState := wsNormal;
  Visible := True;
  icsBringToTop(Application.Handle);
end;

procedure TfrmMain.TrayIcon1BalloonClick(Sender: TObject);
begin
  inherited;
  RestoreMainWindow;
end;

procedure TfrmMain.TrayIcon1Click(Sender: TObject);
begin
  inherited;
  RestoreMainWindow;
end;

procedure TfrmMain.OnWMEndSession(var Msg: TWMEndSession);
begin
  ShuttingDown := Msg.EndSession;
  inherited;
end;

procedure TfrmMain.OnWMExitSizeMove(var Msg: TMessage);
begin
  inherited;
  SaveBounds;
  AppBarWidth := Width;
end;

procedure TfrmMain.OnWMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  ShuttingDown := True;
  inherited;
end;

procedure TfrmMain.OnICSSetLanguageMsg(var Msg: TMessage);
 var I: Integer;
begin
  inherited;
  for I := 0 to ListViewMain.Columns.Count - 1 do ListViewMain.Columns[I].Caption := ICSLanguagesBase.CurrentStrings[ListViewMain.Columns[I].Tag];
end;

procedure TfrmMain.OnClickMoveToExistedExecute(Sender: TObject);
begin
  inherited;
  SelectedMoveToGroup((Sender as TComponent).Tag);
end;

procedure TfrmMain.OnEdgeChangeEvent(Sender: TObject; ANewEdge: TAppBarEdge; var Allow: Boolean);
begin
  Allow := True;
end;

procedure TfrmMain.OnExit;
 var I: Integer;
begin
  if Assigned(frmDataManager) then frmDataManager.Close;
  SaveGroupProperties;
  SaveBounds;
  if Assigned(ListViewMain.ItemFocused) and Assigned(ListViewMain.ItemFocused.Data) then xmlSetItemString(FXML.DocumentElement.ChildNodes[ND_HOSTS], ND_PARAM_FOCUSED, TARObject(ListViewMain.ItemFocused.Data).Id);
  for I := 0 to ListViewMain.Items.Count - 1 do if Assigned(ListViewMain.Items[I].Data) then TARObject(ListViewMain.Items[I].Data).Free;
  TimerUpdateStatus.Enabled := False;
  if FXML.Modified then SaveXMLToFile(FXML, GetMainXMLFileName, ARMasterPassword);
end;

procedure TfrmMain.ActionMoveToFavoritesExecute(Sender: TObject);
begin
  inherited;
  SelectedMoveToGroup(APP_ARGROUP_ID_FAVORITES);
end;

procedure TfrmMain.ActionMoveToNewGroupExecute(Sender: TObject);
 var GroupID: Integer;
begin
  inherited;
  GroupID := ListViewMain.Groups.NextGroupID;
  if XMLCreateGroup(GetNewGroupName, GroupID, True) then begin
    SaveGroupProperties;
    SelectedMoveToGroup(GroupID);
  end;
end;

procedure TfrmMain.ActionMoveToNewGroupUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (ListViewMain.SelCount > 0) and (ListViewMain.Groups.NextGroupID < APP_ARGROUP_ID_FIRSTRESERVED);
end;

procedure TfrmMain.ActionMoveToRecycleBinExecute(Sender: TObject);
begin
  inherited;
  SelectedMoveToGroup(APP_ARGROUP_ID_RECYCLE_BIN);
end;

procedure TfrmMain.ActionPropertiesExecute(Sender: TObject);
begin
  inherited;
  frmProps := TfrmProps.Create(Application);
  try
    if frmProps.ShowModal = mrOK then begin
      ApplyProperties;
      ApplyPropertiesOnShow;
    end;
  finally
    frmProps.Release;
  end;
end;

procedure TfrmMain.ApplicationEvents1Deactivate(Sender: TObject);
begin
  inherited;
  if xmlGetItemBoolean(FXML.DocumentElement.ChildNodes[ND_PROPERTIES], ND_PARAM_APPBAR_AUTOHIDE) and (AppBarEdge in [abeUnknown, abeFloat]) and (FModalCounter = 0) then Hide;
end;

procedure TfrmMain.ApplicationEvents1Exception(Sender: TObject; E: Exception);
 var
   F: TextFile;
   FName, Msg: String;
begin
  inherited;
  FName := GetLogFileName;
  Msg := FormatDateTime('dd.mm.yyyy - ss.nn.hh', Now) + ' - ' + Sender.ClassName + ': ' + E.Message;
  AssignFile(F, FName);
  if FileExists(FName) then Append(F) else Rewrite(F);
  Writeln(F, Msg);
  CloseFile(F);
  MessageBox(Handle, PChar(Msg), PChar(Application.Title), MB_OK + MB_ICONERROR);
end;

procedure TfrmMain.ApplicationEvents1ModalBegin(Sender: TObject);
begin
  inherited;
  Inc(FModalCounter);
  if FModalCounter > 0 then begin
    TrayIcon1.PopupMenu := nil;
    FormStyle := fsNormal;
  end;
end;

procedure TfrmMain.ApplicationEvents1ModalEnd(Sender: TObject);
begin
  inherited;
  Dec(FModalCounter);
  if FModalCounter <= 0 then begin
    TrayIcon1.PopupMenu := PopupMenuTray;
    FormStyle := fsStayOnTop;
  end;
end;

procedure TfrmMain.ListViewMainColumnClick(Sender: TObject; Column: TListColumn);
 var I: Integer;
begin
  inherited;
  for I := 0 to (Sender as TListView).Columns.Count - 1 do (Sender as TListView).Columns[I].ImageIndex := -1;
  (Sender as TListView).SortType := stNone;
  if Column.Index <> FSortColumnToSort then begin
    FSortColumnToSort := Column.Index;
    FSortDescending := False;
  end else FSortDescending := not FSortDescending;
  (Sender as TListView).Columns[Column.Index].ImageIndex := 38 + Integer(FSortDescending);
  (Sender as TListView).SortType := stText;
end;

procedure TfrmMain.ListViewMainCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
 var ix: Integer;
begin
  inherited;
  if FSortColumnToSort = 0 then Compare := CompareText(Item1.Caption, Item2.Caption) else begin
    ix := FSortColumnToSort - 1;
    Compare := CompareText(Item1.SubItems[ix], Item2.SubItems[ix]);
  end;
  if FSortDescending then Compare := -Compare;
end;

procedure TfrmMain.ListViewMainDblClick(Sender: TObject);
 var
   HitTests: THitTests;
   P: TPoint;
begin
  inherited;
  if GetCursorPos(P) then begin
    P := ListViewMain.ScreenToClient(P);
    HitTests := ListViewMain.GetHitTestInfoAt(P.X, P.Y);
    if ActionOpen.Enabled and ((htOnIcon in HitTests) or (htOnItem in HitTests) or (htOnLabel in HitTests)) then ActionOpen.Execute;
  end;
end;

procedure TfrmMain.ListViewMainDragDrop(Sender, Source: TObject; X, Y: Integer);
 var
   LI: TListItem;
   I: Integer;
begin
  inherited;
  LI := ListViewMain.GetItemAt(X, Y);
  if Assigned(LI) then begin
    ListViewMain.Items.BeginUpdate;
    try
      for I := 0 to ListViewMain.Items.Count - 1 do if ListViewMain.Items[I].Selected then begin
        ListViewMain.Items[I].GroupID := LI.GroupID;
        TARObject(ListViewMain.Items[I].Data).GroupID := LI.GroupID;
      end;
    finally
      ListViewMain.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.ListViewMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ListViewMain.GroupView and Assigned(ListViewMain.GetItemAt(X, Y));
end;

procedure TfrmMain.ListViewMainEdited(Sender: TObject; Item: TListItem; var S: string);
begin
  inherited;
  xmlSetItemString(TARObject(Item.Data).XMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE, S);
end;

procedure TfrmMain.ListViewMainInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: string);
begin
  inherited;
  InfoTip := GetInfoTip(Item);
end;

procedure TfrmMain.ListViewMainItemChecked(Sender: TObject; Item: TListItem);
begin
  inherited;
  if Assigned(Item.Data) then TARObject(Item.Data).Active := Item.Checked;
end;

procedure TfrmMain.ListViewMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 var
   Idx: Integer;
   Item: TListItem;
begin
  inherited;
  if (Shift = []) and not ListViewMain.IsEditing then case Key of
    VK_RETURN: if Assigned(ListViewMain.Selected) then begin
      Idx := GetGroupIndex(ListViewMain.Selected.GroupID);
      if (lgsFocused in ListViewMain.Groups[Idx].State) and ActionGroupEdit.Enabled then ActionGroupEdit.Execute else if ActionHostEdit.Enabled then ActionHostEdit.Execute;
    end;
    VK_LEFT, VK_RIGHT: begin
      if Assigned(ListViewMain.Selected) then Idx := GetGroupIndex(ListViewMain.Selected.GroupID) else Idx := GetFocusedGroupIndex;
      if Idx >= 0 then begin
        if Assigned(ListViewMain.ItemFocused) then Item := ListViewMain.ItemFocused else Item := ListViewMain.Selected;
        case Key of
          VK_LEFT: ListViewMain.Groups[Idx].State := ListViewMain.Groups[Idx].State + [lgsCollapsed];
          VK_RIGHT: ListViewMain.Groups[Idx].State := ListViewMain.Groups[Idx].State - [lgsCollapsed];
        end;
        if not Assigned(Item) then Item := GetFirstGroupItem(ListViewMain.Groups[Idx].GroupID);
        if Assigned(Item) then begin
          Item.Selected := True;
          Item.Focused := True;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.ListViewMainSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  inherited;
  if Assigned(Item.Data) then TARObject(Item.Data).Selected := Selected;
end;

procedure TfrmMain.ListViewWndProc(var Message: TMessage);
begin
  ShowScrollBar(ListViewMain.Handle, SB_HORZ, False);
  ShowScrollBar(ListViewMain.Handle, SB_VERT, True);
  FListViewWndProc(Message);
end;

procedure TfrmMain.LoadGroupIcons;
begin
  if FileExists(APP_GROUP_ICONS_DATA_FILE) then ReadComponentResFile(APP_GROUP_ICONS_DATA_FILE, PngImageListGroups);
end;

procedure TfrmMain.SaveGroupIcons;
begin
  WriteComponentResFile(APP_GROUP_ICONS_DATA_FILE, PngImageListGroups);
end;

procedure TfrmMain.NormalizeGroups;

 procedure _NormalizeGroup(GroupID: Integer);
  var
    I: Integer;
    bExists: Boolean;
 begin
   bExists := False;
   for I := 0 to ListViewMain.Groups.Count - 1 do begin
     bExists := (ListViewMain.Groups[I].GroupID = GroupID);
     if bExists then Break;
   end;
   if not bExists then XMLCreateGroup(ICSLanguagesGroups.CurrentStrings[MaxInt - GroupID], GroupID, False);
 end;

begin
  _NormalizeGroup(APP_ARGROUP_ID_FAVORITES);
  _NormalizeGroup(APP_ARGROUP_ID_GENERAL);
  _NormalizeGroup(APP_ARGROUP_ID_RECYCLE_BIN);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := ShuttingDown;
  if CanClose then OnExit else Hide;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  PMemFile^.MainHandle := Handle;
  TrayIcon1.Icon.Assign(Application.Icon);
  FListViewWndProc := ListViewMain.WindowProc;
  ListViewMain.WindowProc := ListViewWndProc;
  FModalCounter := 0;
  FSortColumnToSort := 0;
  FSortDescending := False;
  PngImageListApp.GetIcon(0, Application.Icon);
  LoadGroupIcons;
  ApplyProperties;
  RecreateUserInterface;
  OnEdgeChange := OnEdgeChangeEvent;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  ListViewMain.WindowProc := FListViewWndProc;
  FListViewWndProc := nil;
  inherited;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  inherited;
  ApplyPropertiesOnShow;
  PostMessage(Handle, AR_MESSAGE_INITIALIZED, 0, 0);
end;

procedure TfrmMain.ApplyHostParams(aHost: TListItem);
 const
   IMAGE_PROTOCOL_IDX_FIRST = 35;
   IMAGE_PROTOCOL_ERROR = 4;
 var
   iNode, iProtocolNode: IXMLNode;
begin
  iNode := TARObject(aHost.Data).XMLNode;
  aHost.Caption := TARObject(aHost.Data).Name;
  aHost.GroupID := TARObject(aHost.Data).GroupID;

  if TARObject(aHost.Data).Modified and not TARObject(aHost.Data).CheckModified then TARObject(aHost.Data).Modified := False;

  iProtocolNode := TARObject(aHost.Data).XMLProtocolNode;
  if Assigned(iProtocolNode) then begin
    aHost.SubItems[0] := icsB64Decode(xmlGetItemString(iProtocolNode.ChildNodes[ND_SHORTNAME], ND_PARAM_VALUE));
    aHost.SubItemImages[0] := IMAGE_PROTOCOL_IDX_FIRST + xmlGetItemInteger(iProtocolNode.ChildNodes[ND_LOCATION_ID], ND_PARAM_VALUE);
  end else begin
    aHost.SubItems[0] := xmlGetItemString(iNode.ChildNodes[ND_PORT], ND_PARAM_VALUE);
    aHost.SubItemImages[0] := IMAGE_PROTOCOL_ERROR;
  end;


  TARObject(aHost.Data).Active := xmlGetItemBoolean(iNode, ND_PARAM_ACTIVE);
  if TARObject(aHost.Data).Active then TARObject(aHost.Data).StartCheckState;

  aHost.Selected := TARObject(aHost.Data).Selected;
end;

function TfrmMain.GetInfoTip(Item: TListItem): String;
 var
   iNode: IXMLNode;
   S: String;
begin
  iNode := TARObject(Item.Data).XMLNode;
  Result := 'Host: ' + xmlGetItemString(iNode.ChildNodes[ND_HOST], ND_PARAM_VALUE) + ':' + xmlGetItemString(iNode.ChildNodes[ND_PORT], ND_PARAM_VALUE);
  S := xmlGetItemString(iNode.ChildNodes[ND_USERNAME], ND_PARAM_VALUE);
  if S <> '' then Result := Result + #13 + 'Username: ' + S;
end;

procedure TfrmMain.ApplyProperties;
 var iNode: IXMLNode;
begin
  iNode := FXML.DocumentElement.ChildNodes[ND_PROPERTIES];
  ListViewMain.GroupView := xmlGetItemBoolean(iNode, ND_PARAM_GROUPVIEW, True);
  ListViewMain.ShowHint := xmlGetItemBoolean(iNode, ND_PARAM_SHOW_OBJECT_HINTS, True);
  Visible := not xmlGetItemBoolean(iNode, ND_PARAM_START_MINIMIZED, False);
end;

procedure TfrmMain.ApplyPropertiesOnShow;
 var iNode: IXMLNode;
begin
  iNode := FXML.DocumentElement.ChildNodes[ND_PROPERTIES];
  SetBounds(xmlGetItemInteger(iNode, ND_PARAM_LEFT, Left), xmlGetItemInteger(iNode, ND_PARAM_TOP, Top), xmlGetItemInteger(iNode, ND_PARAM_WIDTH, Width), xmlGetItemInteger(iNode, ND_PARAM_HEIGHT, Height));
  AppBarWidth := xmlGetItemInteger(iNode, ND_PARAM_WIDTH, Width);
  AppBarHeight := xmlGetItemInteger(iNode, ND_PARAM_HEIGHT, Height);
  AppBarAutoHide := xmlGetItemBoolean(iNode, ND_PARAM_APPBAR_AUTOHIDE, False);
  AppBarEdge := TAppBarEdge(xmlGetItemInteger(iNode, ND_PARAM_APPBAR_EDGE, Ord(abeFloat)));
end;

procedure TfrmMain.SaveBounds;
 var iNode: IXMLNode;
begin
  iNode := FXML.DocumentElement.ChildNodes[ND_PROPERTIES];
  xmlSetItemInteger(iNode, ND_PARAM_APPBAR_EDGE, Ord(AppBarEdge));
  if AppBarEdge = abeFloat then begin
    xmlSetItemInteger(iNode, ND_PARAM_WIDTH, Width);
    xmlSetItemInteger(iNode, ND_PARAM_HEIGHT, Height);
    xmlSetItemInteger(iNode, ND_PARAM_LEFT, Left);
    xmlSetItemInteger(iNode, ND_PARAM_TOP, Top);
  end;
end;

procedure TfrmMain.CreateHostItem(iNode: IXMLNode);
 var Item: TListItem;
begin
  Item := ListViewMain.Items.Add;
  Item.ImageIndex := 0;
  Item.SubItems.Add('0');
  Item.Data := Pointer(TARObject.Create(iNode));
  ApplyHostParams(Item);
end;

procedure TfrmMain.ApplyGroupParams(aGroup: TListGroup; iNode: IXMLNode);
 var Idx: Integer;
begin
  if xmlGetItemString(iNode.ChildNodes[ND_NAME], ND_PARAM_VALUE) <> '' then begin
    ListViewMain.Items.BeginUpdate;
    try
      aGroup.Header := xmlGetItemString(iNode.ChildNodes[ND_NAME], ND_PARAM_VALUE);
      Idx := xmlGetItemInteger(iNode, ND_PARAM_ICONID);
      if Idx < PngImageListGroups.Count then aGroup.TitleImage := Idx else aGroup.TitleImage := MaxInt - APP_ARGROUP_ID_NORMAL;
      if xmlGetItemBoolean(iNode, ND_PARAM_COLLAPSED) then aGroup.State := aGroup.State + [lgsCollapsed];
    finally
      ListViewMain.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.CreateGroupItem(iNode: IXMLNode);
 var aGroup: TListGroup;
begin
  aGroup := ListViewMain.Groups.Add;
  aGroup.State := aGroup.State + [lgsCollapsible];
  aGroup.GroupID := xmlGetItemInteger(iNode, ND_PARAM_ID);
  ApplyGroupParams(aGroup, iNode);
end;

procedure TfrmMain.RecreateUserInterface;
 var
   I: Integer;
   iNode: IXMLNode;
   FocusedID: String;
begin
  ListViewMain.Items.BeginUpdate;
  try
    ListViewMain.Groups.Clear;
    iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS];
    for I := 0 to iNode.ChildNodes.Count - 1 do CreateGroupItem(iNode.ChildNodes[I]);
    NormalizeGroups;

    for I := 0 to ListViewMain.Items.Count - 1 do if Assigned(ListViewMain.Items[I].Data) then TARObject(ListViewMain.Items[I].Data).Free;
    ListViewMain.Items.Clear;
    iNode := FXML.DocumentElement.ChildNodes[ND_HOSTS];
    for I := 0 to iNode.ChildNodes.Count - 1 do CreateHostItem(iNode.ChildNodes[I]);

    FocusedID := xmlGetItemString(FXML.DocumentElement.ChildNodes[ND_HOSTS], ND_PARAM_FOCUSED);
    for I := 0 to ListViewMain.Items.Count - 1 do if TARObject(ListViewMain.Items[I].Data).Id = FocusedID then begin
      ListViewMain.Items[I].Focused := True;
      Break;
    end;
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

procedure TfrmMain.SaveGroupProperties;
 var
   I: Integer;
   iNode: IXMLNode;
begin
  for I := 0 to ListViewMain.Groups.Count - 1 do begin
    iNode := GetGroupXMLNode(ListViewMain.Groups[I].GroupID);
    if Assigned(iNode) then xmlSetItemBoolean(iNode, ND_PARAM_COLLAPSED, (lgsCollapsed in ListViewMain.Groups[I].State));
  end;
end;

function TfrmMain.XMLCreateGroup(GroupName: String; GroupID: Integer; EditData: Boolean): Boolean;
 var iNode: IXMLNode;
begin
  inherited;
  iNode := FXML.DocumentElement.ChildNodes[ND_GROUPS].AddChild(ND_ITEM);
  iNode.Attributes[ND_PARAM_ID] := IntToStr(GroupID);
  iNode.Attributes[ND_PARAM_COLLAPSED] := '0';
  if GroupID = APP_ARGROUP_ID_FAVORITES then iNode.Attributes[ND_PARAM_ICONID] := IntToStr(MaxInt - APP_ARGROUP_ID_FAVORITES)
    else if GroupID = APP_ARGROUP_ID_GENERAL then iNode.Attributes[ND_PARAM_ICONID] := IntToStr(MaxInt - APP_ARGROUP_ID_GENERAL)
    else iNode.Attributes[ND_PARAM_ICONID] := IntToStr(MaxInt - APP_ARGROUP_ID_NORMAL);
  iNode.AddChild(ND_NAME).Attributes[ND_PARAM_VALUE] := GroupName;
  Result := not EditData or EditGroupNode(iNode);
  if Result then CreateGroupItem(iNode) else iNode.ParentNode.ChildNodes.Remove(iNode);
end;

procedure TfrmMain.InitializeHostNode(iNode: IXMLNode; GroupID: Integer; iSourceNode: IXMLNode; MultiEdit: Boolean);
begin
  iNode.Attributes[ND_PARAM_ID] := icsGenerateGUIDString;
  if GroupID >= 0 then begin
    iNode.Attributes[ND_PARAM_GROUP_ID] := IntToStr(GroupID);
    iNode.Attributes[ND_PARAM_ACTIVE] := '0';
  end;
  if Assigned(iSourceNode) then begin
    iNode.AddChild(ND_PROTOCOL_ID).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_PROTOCOL_ID], ND_PARAM_VALUE);
    iNode.AddChild(ND_SOFT_ID).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_SOFT_ID], ND_PARAM_VALUE);
    iNode.AddChild(ND_NAME).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_NAME], ND_PARAM_VALUE);
    iNode.AddChild(ND_HOST).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_HOST], ND_PARAM_VALUE);
    iNode.AddChild(ND_RESOURCES).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_RESOURCES], ND_PARAM_VALUE);
    iNode.AddChild(ND_PORT).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_PORT], ND_PARAM_VALUE);
    iNode.AddChild(ND_INTERVAL).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_INTERVAL], ND_PARAM_VALUE);
    iNode.AddChild(ND_ERRORINTERVAL).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_ERRORINTERVAL], ND_PARAM_VALUE);
    iNode.AddChild(ND_TIMEOUT).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_TIMEOUT], ND_PARAM_VALUE);
    iNode.AddChild(ND_USERNAME).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_USERNAME], ND_PARAM_VALUE);
    iNode.AddChild(ND_PASSWORD).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_PASSWORD], ND_PARAM_VALUE);
    iNode.AddChild(ND_DOMAIN).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_DOMAIN], ND_PARAM_VALUE);
    iNode.AddChild(ND_ALERTS).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_ALERTS], ND_PARAM_VALUE);
    iNode.AddChild(ND_ALERT_ID).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_ALERT_ID], ND_PARAM_VALUE);
    iNode.AddChild(ND_CHECK_MODIFIED).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_CHECK_MODIFIED], ND_PARAM_VALUE);
    iNode.AddChild(ND_SENDRECEIVE).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_SENDRECEIVE], ND_PARAM_VALUE);
    iNode.AddChild(ND_SENDSTRING).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_SENDSTRING], ND_PARAM_VALUE);
    iNode.AddChild(ND_RECEIVESTRING).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_RECEIVESTRING], ND_PARAM_VALUE);
    iNode.AddChild(ND_SHOW_WINDOW).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_SHOW_WINDOW], ND_PARAM_VALUE);
    iNode.AddChild(ND_RUNASADMIN).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_RUNASADMIN], ND_PARAM_VALUE);
    iNode.AddChild(ND_UNSET_MODIFIES).Attributes[ND_PARAM_VALUE] := xmlGetItemString(iSourceNode.ChildNodes[ND_UNSET_MODIFIES], ND_PARAM_VALUE);
  end else begin
    iNode.AddChild(ND_PROTOCOL_ID).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_SOFT_ID).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_NAME).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_HOST).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_RESOURCES).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_PORT).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_SENDSTRING).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_RECEIVESTRING).Attributes[ND_PARAM_VALUE] := '';
    iNode.AddChild(ND_ALERT_ID).Attributes[ND_PARAM_VALUE] := '';
    if MultiEdit then begin
      iNode.AddChild(ND_INTERVAL).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_ERRORINTERVAL).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_TIMEOUT).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_USERNAME).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_PASSWORD).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_DOMAIN).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_CHECK_MODIFIED).Attributes[ND_PARAM_VALUE] := IntToStr(Ord(cbGrayed));
      iNode.AddChild(ND_SENDRECEIVE).Attributes[ND_PARAM_VALUE] := IntToStr(Ord(cbGrayed));
      iNode.AddChild(ND_RUNASADMIN).Attributes[ND_PARAM_VALUE] := IntToStr(Ord(cbGrayed));
      iNode.AddChild(ND_ALERTS).Attributes[ND_PARAM_VALUE] := IntToStr(Ord(cbGrayed));
      iNode.AddChild(ND_SHOW_WINDOW).Attributes[ND_PARAM_VALUE] := '-1';
      iNode.AddChild(ND_UNSET_MODIFIES).Attributes[ND_PARAM_VALUE] := IntToStr(Ord(cbGrayed));
    end else begin
      iNode.AddChild(ND_INTERVAL).Attributes[ND_PARAM_VALUE] := xmlGetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_INTERVAL], ND_PARAM_VALUE);
      iNode.AddChild(ND_ERRORINTERVAL).Attributes[ND_PARAM_VALUE] := xmlGetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_ERRORINTERVAL], ND_PARAM_VALUE);
      iNode.AddChild(ND_TIMEOUT).Attributes[ND_PARAM_VALUE] := '2';
      iNode.AddChild(ND_USERNAME).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_PASSWORD).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_DOMAIN).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_CHECK_MODIFIED).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_SENDRECEIVE).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_RUNASADMIN).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_ALERTS).Attributes[ND_PARAM_VALUE] := '';
      iNode.AddChild(ND_SHOW_WINDOW).Attributes[ND_PARAM_VALUE] := '0';
      iNode.AddChild(ND_UNSET_MODIFIES).Attributes[ND_PARAM_VALUE] := '';
    end;
  end;
end;

procedure TfrmMain.ItemMainEditClick(Sender: TObject);
begin
  inherited;
  OnItemGroupClick(ItemMainMoveTo);
end;

procedure TfrmMain.OnItemGroupClick(Sender: TObject);
 var MI: TMenuItem;
begin
  inherited;
  (Sender as TMenuItem).Enabled := (ListViewMain.SelCount > 0);
  (Sender as TMenuItem).Clear;
  if (Sender as TMenuItem).Enabled then begin
    MI := TMenuItem.Create(Self);
    MI.Action := ActionMoveToNewGroup;
    (Sender as TMenuItem).Add(MI);
    MI := TMenuItem.Create(Self);
    MI.Action := ActionMoveToFavorites;
    MI.ImageIndex := -1;//ListViewMain.Groups[GetGroupIndex(APP_ARGROUP_ID_FAVORITES)].TitleImage;
    (Sender as TMenuItem).Add(MI);
    MI := TMenuItem.Create(Self);
    MI.Caption := '-';
    (Sender as TMenuItem).Add(MI);
  end;
end;

procedure TfrmMain.OnMessageBalloonMsg(var Msg: TMessage);
 var
   AO: TARObject;
   Note: TNotification;
begin
  AO := TARObject(Msg.WParam);
  if Assigned(AO) then begin

    if TOSVersion.Major >= 8 then begin

      Note := NotificationCenter1.CreateNotification;
      try
        Note.Name := APP_NAME;
        Note.Title := Application.Title + ': ' + AO.BalloonMessageData.Title;
        Note.AlertBody := AO.BalloonMessageData.Hint;
        NotificationCenter1.PresentNotification(Note);
      finally
        Note.Free;
      end;

    end else begin

      if AO.State = aroOnline then TrayIcon1.BalloonFlags := bfInfo else TrayIcon1.BalloonFlags := bfWarning;
      TrayIcon1.BalloonTitle := Application.Title + ': ' + AO.BalloonMessageData.Title;
      TrayIcon1.BalloonHint := AO.BalloonMessageData.Hint;
      if TrayIcon1.BalloonHint = '' then TrayIcon1.BalloonHint := TrayIcon1.BalloonTitle;
      TrayIcon1.ShowBalloonHint;

    end;

  end;
end;

procedure TfrmMain.OnMessageClose(var Msg: TMessage);
begin
  ActionClose.Execute;
end;

procedure TfrmMain.OnMessageInitialized(var Msg: TMessage);
begin
  inherited;
  FormStyle := TFormStyle(xmlGetItemInteger(FXML.DocumentElement.ChildNodes[ND_PROPERTIES], ND_PARAM_STAYONTOP, Ord(fsNormal)));
end;

procedure TfrmMain.OnMessageRestore(var Msg: TMessage);
begin
  RestoreMainWindow;
end;

procedure TfrmMain.OnMessageSetActive(var Msg: TMessage);
 var Item: TListItem;
begin
  inherited;
  Item := ListViewMain.FindData(0, Pointer(Msg.WParam), True, False);
  if Assigned(Item) and (Item.StateIndex <> Msg.LParam) then Item.StateIndex := Msg.LParam;
end;

procedure TfrmMain.OnMessageSetState(var Msg: TMessage);
 var Item: TListItem;
begin
  inherited;
  Item := ListViewMain.FindData(0, Pointer(Msg.WParam), True, False);
  if Assigned(Item) then Item.ImageIndex := Msg.LParam;
end;

procedure TfrmMain.OnRecreateList(var Msg: TMessage);
 var I: Integer;
begin
  ListViewMain.Items.BeginUpdate;
  try
    for I := 0 to ListViewMain.Items.Count -1 do ApplyHostParams(ListViewMain.Items[I]);
  finally
    ListViewMain.Items.EndUpdate;
  end;
end;

procedure TfrmMain.OnRecreateUserInterface(var Msg: TMessage);
begin
  RecreateUserInterface;
  if Assigned(frmDataManager) then SendMessage(frmDataManager.Handle, AR_MESSAGE_RECREATE_USER_INTERFACE, 0, 0);
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  OnItemGroupClick(ItemMoveTo);
end;

function TfrmMain.XMLCreateHost(GroupID: Integer; const iSourceNode: IXMLNode = nil): Boolean;
 var iNode: IXMLNode;
begin
  inherited;
  iNode := FXML.DocumentElement.ChildNodes[ND_HOSTS].AddChild(ND_ITEM);
  InitializeHostNode(iNode, GroupID, iSourceNode, False);
  Result := EditHostNode(iNode, False);
  if Result then CreateHostItem(iNode) else FXML.DocumentElement.ChildNodes[ND_HOSTS].ChildNodes.Remove(iNode);
end;

function TfrmMain.EditGroupNode(XMLNode: IXMLNode): Boolean;
begin
  Result := False;
  if Assigned(XMLNode) then begin
    frmEditGroup := TfrmEditGroup.Create(Application);
    try
      frmEditGroup.XMLNode := XMLNode;
      frmEditGroup.PngImageListGroups.PngImages.Assign(PngImageListGroups.PngImages);
      Result := (frmEditGroup.ShowModal = mrOk);
      if Result then begin
        ListViewMain.GroupHeaderImages := nil;
        frmEditGroup.ApplyChanges;
        if frmEditGroup.IconLibModified then PngImageListGroups.PngImages.Assign(frmEditGroup.PngImageListResult.PngImages);
        ListViewMain.GroupHeaderImages := PngImageListGroups;
        SaveGroupIcons;
      end;
    finally
      frmEditGroup.Release;
    end;
  end;
end;

function TfrmMain.EditHostNode(XMLNode: IXMLNode; MultiEdit: Boolean): Boolean;
begin
  Result := False;
  if Assigned(XMLNode) then begin
    frmEditHost := TfrmEditHost.Create(Application);
    try
      frmEditHost.XMLNode := XMLNode;
      frmEditHost.FillControls(MultiEdit);
      Result := (frmEditHost.ShowModal = mrOk);
      if Result then frmEditHost.ApplyXML;
    finally
      frmEditHost.Release;
    end;
  end;
end;

end.
