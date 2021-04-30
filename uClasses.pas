unit uClasses;

interface

uses
  Windows, Messages, Classes, SysUtils, Vcl.ComCtrls, XML.XMLIntf;

const
  APP_CLSID = '{DEB2B07E-46E6-4F35-92FB-21739786925A}';
  APP_NAME = 'A-Radar';
  APP_FILE_NAME = 'aradar';

  APP_XML_HEADER_P0 = '<?xml version="1.0"';
  APP_XML_HEADER_P1 = ' encoding="UTF-8"?>';
  APP_XML_HEADER = APP_XML_HEADER_P0 + APP_XML_HEADER_P1;

  APP_MAIN_DB_FILENAME = APP_FILE_NAME + '.dat';
  APP_RES_INIT_DB = 'AR_INIT_DB';
  APP_MAIN_ICL_FILENAME = APP_FILE_NAME + '.icl';
  APP_RES_INIT_ICL = 'AR_INIT_ICL';

  APP_CMD_PARAM_CLOSE = '-c';

  APP_X64_MAIN_FILE = 'aradar.x64.exe';

const
  ND_ROOT                                               = 'aradar';
  APP_XML_ROOT                                          = '<' + ND_ROOT + '/>';

  ND_PROPERTIES                                         = 'properties';
  ND_DATA_MANAGER                                       = 'dataManager';
  ND_EXPORT_IMPORT                                      = 'exportImport';
  ND_ITEM                                               = 'item';
  ND_SOFTWARE                                           = 'software';
  ND_SOFT_ID                                            = 'softId';
  ND_GROUPS                                             = 'groups';
  ND_PROTOCOLS                                          = 'protocols';
  ND_PROTOCOL_ID                                        = 'protocolId';
  ND_HOSTS                                              = 'hosts';
  ND_HOST                                               = 'host';
  ND_RESOURCES                                          = 'resources';
  ND_NAME                                               = 'name';
  ND_PORT                                               = 'port';
  ND_INTERVAL                                           = 'interval';
  ND_ERRORINTERVAL                                      = 'errorInterval';
  ND_TIMEOUT                                            = 'timeout';
  ND_MEMO                                               = 'memo';
  ND_USERNAME                                           = 'username';
  ND_PASSWORD                                           = 'password';
  ND_DOMAIN                                             = 'domain';
  ND_SHOW_WINDOW                                        = 'showWindow';
  ND_WIDTH                                              = 'width';
  ND_HEIGHT                                             = 'height';
  ND_SENDRECEIVE                                        = 'sendReceive';
  ND_SENDSTRING                                         = 'sendString';
  ND_RECEIVESTRING                                      = 'receiveString';
  ND_RUNASADMIN                                         = 'runAsAdmin';
  ND_PATH                                               = 'path';
  ND_PARAMS                                             = 'params';
  ND_DEFAULT_PORT                                       = 'defaultPort';
  ND_SCHEME                                             = 'scheme';
  ND_TYPE                                               = 'type';
  ND_DATA                                               = 'data';
  ND_TITLE                                              = 'title';
  ND_PARAMSTRINGS1                                      = 'paramStrings1';
  ND_URL                                                = 'url';
  ND_SHORTNAME                                          = 'shortName';
  ND_LOCATION_ID                                        = 'locationId';
  ND_ALERTS                                             = 'alerts';
  ND_MODIFIED                                           = 'modified';
  ND_CHECK_MODIFIED                                     = 'checkModified';
  ND_CREDENTIALS                                        = 'credentials';
  ND_CREDENTIAL_ID                                      = 'credentialId';

  ND_ALERT_ID                                           = 'alertId';
  ND_IGNORE_FIRST_CHECK                                 = 'ignoreFirstCheck';
  ND_SILENT_CHECK_COUNT_N                               = 'silentCheckCountN';
  ND_SILENT_CHECK_COUNT_P                               = 'silentCheckCountP';
  ND_SCREEN_MSG_N                                       = 'screenMessageN';
  ND_SCREEN_MSG_P                                       = 'screenMessageP';
  ND_REQUEST_URL                                        = 'requestURL';
  ND_REQUEST_URL_N                                      = 'requestURLN';
  ND_REQUEST_URL_P                                      = 'requestURLP';
  ND_ALERT_TEXT_N                                       = 'alertTextN';
  ND_ALERT_TEXT_P                                       = 'alertTextP';

  ND_UNSET_MODIFIES                                     = 'unsetModifies';
  ND_SELECTED                                           = 'selected';
  ND_LAST_SUCCESS_RUN                                   = 'lastSuccessRun';

  ND_PARAM_VALUE                                        = 'value';
  ND_PARAM_ID                                           = 'id';
  ND_PARAM_GROUP_ID                                     = 'groupId';
  ND_PARAM_TITLE                                        = 'title';
  ND_PARAM_COLOR                                        = 'color';
  ND_PARAM_COLLAPSED                                    = 'collapsed';
  ND_PARAM_ACTIVE                                       = 'active';
  ND_PARAM_GROUPVIEW                                    = 'groupView';
  ND_PARAM_ICONID                                       = 'iconID';
  ND_PARAM_LEFT                                         = 'x';
  ND_PARAM_TOP                                          = 'y';
  ND_PARAM_WIDTH                                        = 'w';
  ND_PARAM_HEIGHT                                       = 'h';
  ND_PARAM_START_MINIMIZED                              = 'startMinimized';
  ND_PARAM_SHOW_OBJECT_HINTS                            = 'showObjectHints';
  ND_PARAM_STYLE_ID                                     = 'styleID';
  ND_PARAM_LAST_PAGE_IDX                                = 'lastPageIdx';
  ND_PARAM_FLAGS                                        = 'flags';
  ND_PARAM_PASSWORDS                                    = 'passwords';
  ND_PARAM_SELECTED                                     = 'selected';
  ND_PARAM_FOCUSED                                      = 'focused';
  ND_PARAM_VIEW_STYLE                                   = 'viewStyle';
  ND_PARAM_APPBAR_EDGE                                  = 'appBarEdge';
  ND_PARAM_APPBAR_AUTOHIDE                              = 'appBarAutoHide';
  ND_PARAM_STAYONTOP                                    = 'stayOnTop';

const
  REG_AUTORUN_KEY                                       = 'Software\Microsoft\Windows\CurrentVersion\Run';

const
  APP_ARGROUP_ID_FAVORITES                              = MaxInt;
  APP_ARGROUP_ID_GENERAL                                = MaxInt - 1;
  APP_ARGROUP_ID_NORMAL                                 = MaxInt - 2;

  APP_ARGROUP_ID_FIRSTRESERVED                          = APP_ARGROUP_ID_NORMAL;

const
  APP_ARSERVICE_MESSAGE_ID_DELETE_HOSTS                 = 0;
  APP_ARSERVICE_MESSAGE_ID_DELETE_GROUPS                = 1;

type
  TARDataType = (dtProtocols, dtSoftware, dtCredentials, dtAlerts);
  TARObjectLocation = (olNetwork, olLocalOrShared, olRegistry);
  TARObjectState = (aroInactive, aroOffline, aroCheckState, aroOnline);

  TARObject = class;

  TARNotifyThread = class(TThread)
  private
    FOwner: TARObject;
    FNotifyHandle: THandle;
    FEvent: THandle;
    FLastError: DWORD;
    FCurrentKey: HKEY;
    procedure OnChanged;
    procedure OnTerminateEvent(Sender: TObject);
  protected
    procedure Execute; override;
  public
    constructor Create(Owner: TARObject);
    property LastError: DWORD read FLastError;
  end;

  TARCheckStateThread = class(TThread)
  private
    FOwner: TARObject;
    FCounter: Integer;
    FInterval: Integer;
    FErrorInterval: Integer;
    FNotifyThread: TARNotifyThread;
  protected
    procedure Execute; override;
  public
    constructor Create(Owner: TARObject);
    procedure TerminateNotifyThread;
    procedure StartCheckState;
    property NotifyThread: TARNotifyThread read FNotifyThread write FNotifyThread;
  end;

  TARObjectData = record
    Id: String;
    Name: String;
    Host: String;
    Resources: string;
    Port: String;
    Username: String;
    Password: String;
    Domain: String;
    Scheme: String;
    Location: TARObjectLocation;
    ParamStrings1: String;
    ShowCMD: DWORD;
    RunAsAdmin: Boolean;
    CMD: String;
    CMDParams: String;
    DefaultParamsStrings1: String;
    UnsetAfterOpen: Boolean;
  end;

  TARObjectStateData = record
    FirstCheckDone: Boolean;
    LastState: TARObjectState;
    LastModified: Boolean;
    CheckCounter: Integer;
  end;

  TARBalloonMessageData = record
    Title: String;
    Hint: String;
  end;

  TARObject = class
  private
    FXMLNode: IXMLNode;
    FState: TARObjectState;
    FActive: Boolean;
    FCheckStateThread: TARCheckStateThread;
    FOpenInProgress: Boolean;
    FStateData: TARObjectStateData;
    FBalloonMessageData: TARBalloonMessageData;
    procedure SetState(const Value: TARObjectState);
    procedure SetActive(const Value: Boolean);
    procedure DoActive;
    function GetProtocolNode: IXMLNode;
    function GetLocation: TARObjectLocation;
    procedure SetModified(const Value: Boolean);
    function GetFullPath: String;
    procedure BuildARDataRec(var ARObjectData: TARObjectData);
    function GetCheckModified: Boolean;
    function GetModified: Boolean;
    procedure DoCheckAlert;
    function GetSelected: Boolean;
    procedure SetSelected(const Value: Boolean);
    procedure ShowAlertMessage(iNode: IXMLNode);
    procedure DoAlert(iNode: IXMLNode);
    procedure AlertRequestURL(iNode: IXMLNode);
    function GetName: String;
    function GetGroupID: Integer;
    procedure SetGroupID(const Value: Integer);
    function GetId: String;
    procedure SetId(const Value: String);
    function GetLastSuccessRun: TDateTime;
    procedure SetLastSuccessRun(const Value: TDateTime);
  public
    constructor Create(XMLNode: IXMLNode);
    destructor Destroy; override;
    procedure DoCheckState;
    procedure StartCheckState;
    procedure Run;
    procedure TerminateCheckStateThread;
    property Id: String read GetId write SetId;
    property Name: String read GetName;
    property CheckStateThread: TARCheckStateThread read FCheckStateThread write FCheckStateThread;
    property State: TARObjectState read FState;
    property Active: Boolean read FActive write SetActive;
    property XMLNode: IXMLNode read FXMLNode;
    property XMLProtocolNode: IXMLNode read GetProtocolNode;
    property Location: TARObjectLocation read GetLocation;
    property CheckModified: Boolean read GetCheckModified;
    property Modified: Boolean read GetModified write SetModified;
    property FullPath: String read GetFullPath;
    property OpenInProgress: Boolean read FOpenInProgress write FOpenInProgress;
    property Selected: Boolean read GetSelected write SetSelected;
    property BalloonMessageData: TARBalloonMessageData read FBalloonMessageData;
    property GroupID: Integer read GetGroupID write SetGroupID;
    property LastSuccessRun: TDateTime read GetLastSuccessRun write SetLastSuccessRun;
  end;

  TARRunThread = class(TThread)
  private
    FOwner: TARObject;
  protected
    procedure Execute; override;
  public
    constructor Create(Owner: TARObject);
  end;

  TMemFile = packed record
    MainHandle: HWND;
  end;

  TARNetworkTool = (ntPing, ntTracert);

const
  APP_TEMPLATE_ID                       = '%SELF.ID%';
  APP_TEMPLATE_NAME                     = '%SELF.NAME%';
  APP_TEMPLATE_HOST                     = '%SELF.HOST%';
  APP_TEMPLATE_RESOURCES                = '%SELF.RESOURCES%';
  APP_TEMPLATE_PATH                     = '%SELF.PATH%';
  APP_TEMPLATE_URI                      = '%SELF.URI%';
  APP_TEMPLATE_PORT                     = '%SELF.PORT%';
  APP_TEMPLATE_USERNAME                 = '%SELF.USERNAME%';
  APP_TEMPLATE_FULL_USERNAME            = '%SELF.FULL_USERNAME%';
  APP_TEMPLATE_PASSWORD                 = '%SELF.PASSWORD%';
  APP_TEMPLATE_CRYPT_PASSWORD           = '%SELF.CRYPT_PASSWORD%';
  APP_TEMPLATE_DOMAIN                   = '%SELF.DOMAIN%';
  APP_TEMPLATE_SCHEME                   = '%SELF.SCHEME%';

  APP_TEMPLATE_USER_DEFINED_STRING      = '%SELF.USERDEF_STRING_';
  APP_TEMPLATE_PARAMFILE1               = '%SELF.PARAMFILE_1%';

  APP_TEMPLATE_STATE                    = '%SELF.STATE%';
  APP_TEMPLATE_MODIFIED                 = '%SELF.MODIFIED%';
  APP_TEMPLATE_MSG                      = '%SELF.MSG%';
  APP_TEMPLATE_LAST_SUCCESS_RUN         = '%SELF.LAST_RUN%';

  APP_TEMPLATE_APP_PATH                 = '%APP.PATH%';
  APP_TEMPLATE_APP_TEMP_FILE            = '%APP.TEMP_FILE%';

  APP_TEMPLATE_NOW                      = '%SYSTEM.NOW%';

const
  APP_EXPORT_DATA_FILE = 'ar_export_' + APP_TEMPLATE_NOW + '.dat';
  APP_GROUP_ICONS_DATA_FILE = APP_FILE_NAME + '.icl';

const
  AR_MESSAGE_SETACTIVE = WM_USER + $08;
  AR_MESSAGE_SETSTATE = WM_USER + $09;
  AR_MESSAGE_INITIALIZED = WM_USER + $10;
  AR_MESSAGE_UPDATE_LIST = WM_USER + $0A;
  AR_MESSAGE_RECREATE_USER_INTERFACE = WM_USER + $0B;
  AR_MESSAGE_CLOSE = WM_USER + $0C;
  AR_MESSAGE_RESTORE = WM_USER + $0D;
  AR_MESSAGE_BALLOON_MSG = WM_USER + $0E;

var
  PMemFile: ^TMemFile;
  FXML: IXMLDocument = nil;
  GlobalSleepPause: DWORD = 1000;

function GetExportFileName: String;
function GetMainXMLFileName: String;
function GetLogFileName: String;

function CreateOrOpenSharedFile: Boolean;
procedure CloseSharedFile;

function GetAutoStart: Boolean;
procedure SetAutoStart(AutoStart: Boolean);

function GetSoftNodeFromId(SoftId: String): IXMLNode;
function GetProtocolNodeFromId(ProtocolId: String): IXMLNode;
function GetAlertNodeFromId(sId: String): IXMLNode;
function GetDisplayProtocolName(iProtocolNode: IXMLNode): String;
function GetRegRootKeyFromString(RK: String): HKEY;

function BuildFullPath(const Host, Resources: String): String;

type
  TSystemCheckResult = (scrOk, scrWrongOperationSystem, scrNoDataFiles);

function ARCheckSystem: TSystemCheckResult;

implementation

uses
  WinINet, ActiveX, ShlObj, uCommonTools, ShellAPI, uRegLite, uXMLTools, uRegistry, uWinSocket;

{ --- }

function GetExportFileName: String;
 var S: String;
begin
  S := FormatDateTime('yyyymmddss', Now);
  Result := icsGetReplacedString(APP_EXPORT_DATA_FILE, APP_TEMPLATE_NOW, S);
end;

function GetMainXMLFileName: String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +  APP_MAIN_DB_FILENAME;
end;

function GetLogFileName: String;
begin
  Result := ChangeFileExt(ParamStr(0), '.log');
end;

var
  MemFileHandle: THandle = 0;

function CreateOrOpenSharedFile: Boolean;
 var Init: Boolean;
begin
  MemFileHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, SizeOf(TMemFile), APP_CLSID);
  Result := (MemFileHandle <> 0);
  if Result then begin
    Init := (GetLastError <> ERROR_ALREADY_EXISTS);
    PMemFile := MapViewOfFile(MemFileHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
    Result := (PMemFile <> nil);
    if Result and Init then FillChar(PMemFile^, SizeOf(TMemFile), 0);
  end;
end;

procedure CloseSharedFile;
begin
  if Assigned(PMemFile) then UnmapViewOfFile(PMemFile);
  if MemFileHandle <> 0 then CloseHandle(MemFileHandle);
end;

function GetAutoStart: Boolean;
begin
  Result := (UpperCase(icsGetReplacedString(RegGetString(HKEY_CURRENT_USER, REG_AUTORUN_KEY, APP_NAME), '"', '')) = UpperCase(ParamStr(0)));
end;

procedure SetAutoStart(AutoStart: Boolean);
begin
  if AutoStart then RegSetString(HKEY_CURRENT_USER, REG_AUTORUN_KEY, APP_NAME, '"' + ParamStr(0) + '"') else RegDelValue(HKEY_CURRENT_USER, REG_AUTORUN_KEY, APP_NAME);
end;

{ Replace Templates }

type
  PDATA_BLOB = ^DATA_BLOB;
  _CRYPTOAPI_BLOB = record
    cbData: DWORD;
    pbData: LPBYTE;
  end;
  DATA_BLOB = _CRYPTOAPI_BLOB;

  PCRYPTPROTECT_PROMPTSTRUCT = ^CRYPTPROTECT_PROMPTSTRUCT;
  _CRYPTPROTECT_PROMPTSTRUCT = record
    cbSize: DWORD;
    dwPromptFlags: DWORD;
    hwndApp: HWND;
    szPrompt: LPCWSTR;
  end;
  CRYPTPROTECT_PROMPTSTRUCT = _CRYPTPROTECT_PROMPTSTRUCT;

const
  CRYPTPROTECT_UI_FORBIDDEN = $1;

function CryptProtectData(pDataIn: PDATA_BLOB; szDataDescr: PChar; pOptionalEntropy: PDATA_BLOB; pvReserved: Pointer; pPromptStruct: PCRYPTPROTECT_PROMPTSTRUCT; dwFlags: DWORD; pDataOut: PDATA_BLOB): BOOL; stdcall; external 'crypt32.dll' name 'CryptProtectData';
//function CryptUnprotectData(pDataIn: PDATA_BLOB; ppszDataDescr: PPChar; pOptionalEntropy: PDATA_BLOB; pvReserved: Pointer; pPromptStruct: PCRYPTPROTECT_PROMPTSTRUCT; dwFlags: DWORD; pDataOut: PDATA_BLOB): BOOL; stdcall; external 'crypt32.dll' name 'CryptUnprotectData';

function CryptRDPPassword(Pwd: String): String;

  function _BlobDataToHexStr(P: PByte; I: Integer): String;
   var HexStr: String;
  begin
    HexStr := '';
    while (I > 0) do begin
      Dec(I);
      HexStr := HexStr + IntToHex(P^, 2);
      Inc(P);
    end;
    Result := HexStr;
  end;

 var DataIn, DataOut: DATA_BLOB;
begin
  Result := '';
  if Pwd <> '' then begin
    DataIn.cbData := Length(Pwd) * SizeOf(Char);
    DataIn.pbData := Pointer(String(Pwd));
    DataOut.cbData := 0;
    DataOut.pbData := nil;
    if CryptProtectData(@DataIn, 'psw', nil, nil, nil, CRYPTPROTECT_UI_FORBIDDEN, @DataOut) then Result := _BlobDataToHexStr(DataOut.pbData, DataOut.cbData);
  end;
end;

function CreateCMDParamFile(const ContentString: String): String;
 var SS: TStringStream;
begin
  Result := icsGetTempFileName('.tmp');
  SS := TStringStream.Create(ContentString);
  try
    SS.SaveToFile(Result);
  finally
    SS.Free;
  end;
end;

function BuildFullPath(const Host, Resources: String): String;
begin
  Result := IncludeTrailingPathDelimiter(Host) + ExcludeTrailingPathDelimiter(Resources);
end;

function ARCheckSystem: TSystemCheckResult;
 var sPath, sFile: String;
begin
  Result := scrOk;
  sPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  sFile := sPath + APP_MAIN_DB_FILENAME;
  if not FileExists(sFile) then icsExtractFileFromRes(APP_RES_INIT_DB, sFile);
  if not FileExists(sFile) then Result := scrNoDataFiles else begin
    sFile := sPath + APP_MAIN_ICL_FILENAME;
    if not FileExists(sFile) then icsExtractFileFromRes(APP_RES_INIT_ICL, sFile);
    if not FileExists(sFile) then Result := scrNoDataFiles;
  end;
{$IFDEF WIN32}
  if (Result = scrOk) and icsIsWindows64 then Result := scrWrongOperationSystem;
{$ENDIF}
end;

{ TARObject }

procedure TARObject.BuildARDataRec(var ARObjectData: TARObjectData);

  procedure _DeleteComments(var SL: TStringList);
   var I: Integer;
  begin
    for I := SL.Count - 1 downto 0 do if not SL[I].IsEmpty and CharInSet(SL[I].Chars[1], [';', '#']) then SL.Delete(I);
  end;

  function _GetDefaultParamStrings: String;
   var
     I: Integer;
     SLDefaultParams, SLParams: TStringList;
     sNameValueSeparator: Char;
  begin
    Result := ARObjectData.DefaultParamsStrings1;

    SLDefaultParams := TStringList.Create;
    SLParams := TStringList.Create;
    try
      SLDefaultParams.Text := ARObjectData.DefaultParamsStrings1;
      _DeleteComments(SLDefaultParams);
      SLParams.Text := ARObjectData.ParamStrings1;
      _DeleteComments(SLParams);

      if ((SLDefaultParams.Count > 0) and (Pos('=', SLDefaultParams[0]) > 0)) or ((SLParams.Count > 0) and (Pos('=', SLParams[0]) > 0)) then sNameValueSeparator := '='
      else if ((SLDefaultParams.Count > 0) and (Pos(':', SLDefaultParams[0]) > 0)) or ((SLParams.Count > 0) and (Pos(':', SLParams[0]) > 0)) then sNameValueSeparator := ':'
      else sNameValueSeparator := #0;

      SLDefaultParams.NameValueSeparator := sNameValueSeparator;
      SLParams.NameValueSeparator := sNameValueSeparator;
      try
        for I := 0 to SLParams.Count - 1 do if sNameValueSeparator <> #0 then begin
          if (I < SLDefaultParams.Count) and (SLDefaultParams.Values[SLParams.Names[I]] <> '') then SLDefaultParams.Values[SLParams.Names[I]] := SLParams.ValueFromIndex[I] else SLDefaultParams.Add(SLParams[I]);
        end else begin
          if (I < SLDefaultParams.Count) and (SLDefaultParams[I] <> '') then SLDefaultParams[I] := SLParams[I] else SLDefaultParams.Add(SLParams[I]);
        end;
      finally
        Result := SLDefaultParams.Text;
      end;
    finally
      SLParams.Free;
      SLDefaultParams.Free;
    end;
  end;

  function _BuildURI: String;
  begin
    Result := ARObjectData.Scheme;
    if ARObjectData.Username <> '' then Result := Result + ARObjectData.Username + ':' + ARObjectData.Password + '@';
    Result := ExcludeTrailingPathDelimiter(Result + ARObjectData.Host);
    if ARObjectData.Port <> '' then Result := Result + ':' + ARObjectData.Port;
    if ARObjectData.Resources <> '' then begin
      if not CharInSet(ARObjectData.Resources[1], ['/']) then ARObjectData.Resources := '/' + ARObjectData.Resources;
      Result := Result + ARObjectData.Resources;
    end;
  end;

  function _BuildFullUsername: String;
  begin
    if ARObjectData.Domain <> '' then Result := ARObjectData.Domain + '\' + ARObjectData.Username else Result := ARObjectData.Username;
  end;

  function _ReplaceAsUserDefinedStrings(const S: String): String;
   var
     I: Integer;
     SL: TStringList;
     sTemplate: String;
  begin
    Result := S;
    SL := TStringList.Create;
    try
      SL.Text := ARObjectData.DefaultParamsStrings1;
      for I := 0 to SL.Count - 1 do begin
        sTemplate := APP_TEMPLATE_USER_DEFINED_STRING + (I + 1).ToString + '%';
        Result := icsGetReplacedString(Result, sTemplate, SL[I]);
      end;
    finally
      SL.Free;
    end;
  end;

  function _ReplaceTemplates(const S: String): String;
  begin
    Result := S;
    if Result <> '' then begin

      Result := icsGetReplacedStringEx(S, [
                                           APP_TEMPLATE_ID,
                                           APP_TEMPLATE_NAME,
                                           APP_TEMPLATE_HOST,
                                           APP_TEMPLATE_PORT,
                                           APP_TEMPLATE_USERNAME,
                                           APP_TEMPLATE_PASSWORD,
                                           APP_TEMPLATE_DOMAIN,
                                           APP_TEMPLATE_SCHEME,
                                           APP_TEMPLATE_RESOURCES
                                          ],

                                          [
                                           ARObjectData.Id,
                                           ARObjectData.Name,
                                           ARObjectData.Host,
                                           ARObjectData.Port,
                                           ARObjectData.Username,
                                           ARObjectData.Password,
                                           ARObjectData.Domain,
                                           ARObjectData.Scheme,
                                           ARObjectData.Resources
                                          ]);

      if Pos(APP_TEMPLATE_PATH, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_PATH, BuildFullPath(ARObjectData.Host, ARObjectData.Resources));
      if Pos(APP_TEMPLATE_FULL_USERNAME, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_FULL_USERNAME, _BuildFullUserName);
      if Pos(APP_TEMPLATE_URI, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_URI, _BuildURI);
      if Pos(APP_TEMPLATE_CRYPT_PASSWORD, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_CRYPT_PASSWORD, CryptRDPPassword(ARObjectData.Password));
      if Pos(APP_TEMPLATE_USER_DEFINED_STRING, Result) > 0 then Result := _ReplaceAsUserDefinedStrings(Result);
      if Pos(APP_TEMPLATE_APP_PATH, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_APP_PATH, ExcludeTrailingPathDelimiter(ExtractFilePath(ARObjectData.CMD)));
      if Pos(APP_TEMPLATE_APP_TEMP_FILE, Result) > 0 then Result := icsGetReplacedString(Result, APP_TEMPLATE_APP_TEMP_FILE, icsGetTempFileName);
    end;
  end;

 const
   APP_SW_SHOW_DATA_ARRAY: array[0..3] of DWORD = (SW_SHOWNORMAL, SW_SHOWMAXIMIZED, SW_SHOWMINIMIZED, SW_HIDE);

 var iProtocolNode, iSoftNode: IXMLNode;
begin
  FillChar(ARObjectData, SizeOf(TARObjectData), 0);

  ARObjectData.Id := icsExpandString(xmlGetItemString(FXMLNode, ND_PARAM_ID));
  ARObjectData.Name := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE));
  ARObjectData.Host := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_HOST], ND_PARAM_VALUE));
  ARObjectData.Resources := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_RESOURCES], ND_PARAM_VALUE));
  ARObjectData.Port := xmlGetItemString(FXMLNode.ChildNodes[ND_PORT], ND_PARAM_VALUE);
  ARObjectData.Username := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_USERNAME], ND_PARAM_VALUE));
  ARObjectData.Password := xmlGetItemString(FXMLNode.ChildNodes[ND_PASSWORD], ND_PARAM_VALUE);
  ARObjectData.Domain := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_DOMAIN], ND_PARAM_VALUE));
  ARObjectData.ParamStrings1 := icsExpandString(icsB64Decode(xmlGetItemString(FXMLNode.ChildNodes[ND_PARAMSTRINGS1], ND_PARAM_VALUE)));

  ARObjectData.ShowCMD := APP_SW_SHOW_DATA_ARRAY[xmlGetItemInteger(FXMLNode.ChildNodes[ND_SHOW_WINDOW], ND_PARAM_VALUE)];
  ARObjectData.RunAsAdmin := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_RUNASADMIN], ND_PARAM_VALUE);

  iProtocolNode := GetProtocolNodeFromId(xmlGetItemString(FXMLNode.ChildNodes[ND_PROTOCOL_ID], ND_PARAM_VALUE));
  if Assigned(iProtocolNode) then begin
    ARObjectData.Scheme := xmlGetItemString(iProtocolNode.ChildNodes[ND_SCHEME], ND_PARAM_VALUE);
    ARObjectData.Location := TARObjectLocation(xmlGetItemInteger(iProtocolNode.ChildNodes[ND_LOCATION_ID], ND_PARAM_VALUE));
  end;

  iSoftNode := GetSoftNodeFromId(xmlGetItemString(FXMLNode.ChildNodes[ND_SOFT_ID], ND_PARAM_VALUE));
  if Assigned(iSoftNode) then begin
    ARObjectData.CMD := icsExpandString(icsB64Decode(xmlGetItemString(iSoftNode.ChildNodes[ND_PATH], ND_PARAM_VALUE)));
    ARObjectData.CMDParams := icsExpandString(icsB64Decode(xmlGetItemString(iSoftNode.ChildNodes[ND_PARAMS], ND_PARAM_VALUE)));
    ARObjectData.DefaultParamsStrings1 := icsExpandString(icsB64Decode(xmlGetItemString(iSoftNode.ChildNodes[ND_PARAMSTRINGS1], ND_PARAM_VALUE)));
  end;
  ARObjectData.DefaultParamsStrings1 := _GetDefaultParamStrings;

  ARObjectData.Host := _ReplaceTemplates(ARObjectData.Host);
  ARObjectData.Resources := _ReplaceTemplates(ARObjectData.Resources);
  ARObjectData.CMD := _ReplaceTemplates(ARObjectData.CMD);
  ARObjectData.CMDParams := _ReplaceTemplates(ARObjectData.CMDParams);
  ARObjectData.DefaultParamsStrings1 := _ReplaceTemplates(ARObjectData.DefaultParamsStrings1);

  ARObjectData.UnsetAfterOpen := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_UNSET_MODIFIES], ND_PARAM_VALUE);
end;

procedure TARObject.StartCheckState;
begin
  if Assigned(FCheckStateThread) then FCheckStateThread.StartCheckState;
end;

procedure TARObject.TerminateCheckStateThread;
begin
  if Assigned(FCheckStateThread) then begin
    FCheckStateThread.TerminateNotifyThread;
    FCheckStateThread.Terminate;
    FCheckStateThread := nil;
  end;
end;

constructor TARObject.Create(XMLNode: IXMLNode);
begin
  if Assigned(XMLNode) then FXMLNode := XMLNode;
  FState := aroInactive;
  FActive := False;
  FCheckStateThread := nil;
  FOpenInProgress := False;
end;

destructor TARObject.Destroy;
begin
  TerminateCheckStateThread;
  inherited;
end;

procedure TARObject.DoActive;
begin
  if FActive then begin
    if not Assigned(FCheckStateThread) then begin
      FillChar(FStateData, SizeOf(FStateData), 0);
      FCheckStateThread := TARCheckStateThread.Create(Self);
    end;
  end else begin
    TerminateCheckStateThread;
    SetState(aroInactive);
  end;
  xmlSetItemBoolean(FXMLNode, ND_PARAM_ACTIVE, FActive);
  SendMessage(PMemFile^.MainHandle, AR_MESSAGE_SETACTIVE, Integer(Self), Integer(FActive));
end;

procedure TARObject.ShowAlertMessage(iNode: IXMLNode);
 var S: String;
begin
  FBalloonMessageData.Title := xmlGetItemString(FXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE);
  if FState = aroOffline then S := xmlGetItemString(iNode.ChildNodes[ND_ALERT_TEXT_N], ND_PARAM_VALUE) else S := xmlGetItemString(iNode.ChildNodes[ND_ALERT_TEXT_P], ND_PARAM_VALUE);
  FBalloonMessageData.Hint := icsB64Decode(S);
  PostMessage(PMemFile^.MainHandle, AR_MESSAGE_BALLOON_MSG, NativeUInt(Self), 0);
end;

procedure TARObject.AlertRequestURL(iNode: IXMLNode);
 var sURL, sResult: String;
begin
  sURL := icsB64Decode(xmlGetItemString(iNode.ChildNodes[ND_REQUEST_URL], ND_PARAM_VALUE));
  if sURL <> '' then begin
    sURL := icsGetReplacedStringEx(sURL, [APP_TEMPLATE_NAME, APP_TEMPLATE_STATE, APP_TEMPLATE_MODIFIED], [Self.Name, Ord(FState).ToString, Self.Modified.ToString]);
    sResult := icsGetINetString(sURL);
  end;
end;

procedure TARObject.DoAlert(iNode: IXMLNode);
begin
  if ((FState = aroOffline) and xmlGetItemBoolean(iNode.ChildNodes[ND_SCREEN_MSG_N], ND_PARAM_VALUE))
    or ((FState = aroOnline) and xmlGetItemBoolean(iNode.ChildNodes[ND_SCREEN_MSG_P], ND_PARAM_VALUE)) then ShowAlertMessage(iNode);

  if ((FState = aroOffline) and xmlGetItemBoolean(iNode.ChildNodes[ND_REQUEST_URL_N], ND_PARAM_VALUE))
    or ((FState = aroOnline) and xmlGetItemBoolean(iNode.ChildNodes[ND_REQUEST_URL_P], ND_PARAM_VALUE)) then AlertRequestURL(iNode);
end;

procedure TARObject.DoCheckAlert;
 var iNode: IXMLNode;
begin
  iNode := GetAlertNodeFromId(xmlGetItemString(FXMLNode.ChildNodes[ND_ALERT_ID], ND_PARAM_VALUE));
  if Assigned(iNode) then begin

    if (FStateData.LastState <> FState) or (FStateData.LastModified <> GetModified) then begin

      if ((FState = aroOffline) and (FStateData.CheckCounter >= xmlGetItemInteger(iNode.ChildNodes[ND_SILENT_CHECK_COUNT_N], ND_PARAM_VALUE)))
        or ((FState <> aroOffline) and (FStateData.CheckCounter >= xmlGetItemInteger(iNode.ChildNodes[ND_SILENT_CHECK_COUNT_P], ND_PARAM_VALUE))) then begin

        FStateData.LastState := FState;
        FStateData.LastModified := GetModified;
        FStateData.CheckCounter := 0;
        if FStateData.FirstCheckDone or not xmlGetItemBoolean(iNode.ChildNodes[ND_IGNORE_FIRST_CHECK], ND_PARAM_VALUE) then DoAlert(iNode) else FStateData.FirstCheckDone := True;

      end else Inc(FStateData.CheckCounter);

    end;

  end;
end;

procedure TARObject.DoCheckState;
 var
   Host, Resources, SendString, ReceiveString: String;
   Port: Word;
   Timeout: Integer;
   bSendReceive, bCheckSuccess: Boolean;
begin
  if FState = aroCheckState then begin

    repeat
      Sleep(100);
    until (FState <> aroCheckState);

  end else begin

    SetState(aroCheckState);
    try

      bCheckSuccess := False;
      if GlobalSleepPause > 0 then Sleep(Random(GlobalSleepPause));

      Host := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_HOST], ND_PARAM_VALUE));
      Resources := icsExpandString(xmlGetItemString(FXMLNode.ChildNodes[ND_RESOURCES], ND_PARAM_VALUE));
      case GetLocation of
        olNetwork: begin
          Port := xmlGetItemInteger(FXMLNode.ChildNodes[ND_PORT], ND_PARAM_VALUE);
          Timeout := xmlGetItemInteger(FXMLNode.ChildNodes[ND_TIMEOUT], ND_PARAM_VALUE);
          if Timeout <= 0 then begin
            xmlSetItemInteger(FXMLNode.ChildNodes[ND_TIMEOUT], ND_PARAM_VALUE, 2);
            Timeout := xmlGetItemInteger(FXMLNode.ChildNodes[ND_TIMEOUT], ND_PARAM_VALUE);
          end;
          SendString := '';
          ReceiveString := '';
          bSendReceive := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_SENDRECEIVE], ND_PARAM_VALUE);
          if bSendReceive then begin
            SendString := icsB64Decode(xmlGetItemString(FXMLNode.ChildNodes[ND_SENDSTRING], ND_PARAM_VALUE));
            ReceiveString := icsB64Decode(xmlGetItemString(FXMLNode.ChildNodes[ND_RECEIVESTRING], ND_PARAM_VALUE));
          end;
          bCheckSuccess := (ConnectTimeOut(Host, Port, Timeout * 1000, bSendReceive, SendString, ReceiveString) = AR_CONNECT_SUCCESS);
        end;
        olLocalOrShared: begin
          Host := BuildFullPath(Host, Resources);
          bCheckSuccess := (FileExists(Host) or DirectoryExists(Host));
        end;
        olRegistry: begin
          bCheckSuccess := RegKeyExists(GetRegRootKeyFromString(Host), Resources);
        end;
      end;

      if not FActive then SetState(aroInactive) else begin
        if bCheckSuccess then begin
          SetState(aroOnline);
        end else begin
          SetState(aroOffline);
        end;
      end;

      if (FState <> aroInactive) and xmlGetItemBoolean(FXMLNode.ChildNodes[ND_ALERTS], ND_PARAM_VALUE) then DoCheckAlert;

    except
      SetState(aroOffline);
    end;

  end;
end;

function TARObject.GetCheckModified: Boolean;
begin
  Result := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_CHECK_MODIFIED], ND_PARAM_VALUE);
end;

function TARObject.GetFullPath: String;
begin
  Result := icsExpandString(IncludeTrailingPathDelimiter(xmlGetItemString(FXMLNode.ChildNodes[ND_HOST], ND_PARAM_VALUE)) + xmlGetItemString(FXMLNode.ChildNodes[ND_RESOURCES], ND_PARAM_VALUE));
end;

function TARObject.GetGroupID: Integer;
begin
  Result := xmlGetItemInteger(FXMLNode, ND_PARAM_GROUP_ID);
end;

function TARObject.GetId: String;
begin
  Result := xmlGetItemString(FXMLNode, ND_PARAM_ID);
end;

function TARObject.GetLastSuccessRun: TDateTime;
begin
  Result := StrToDateTimeDef(xmlGetItemString(FXMLNode.ChildNodes[ND_LAST_SUCCESS_RUN], ND_PARAM_VALUE, DateTimeToStr(Now)), Now);
end;

function TARObject.GetLocation: TARObjectLocation;
begin
  Result := TARObjectLocation(xmlGetItemInteger(GetProtocolNode.ChildNodes[ND_LOCATION_ID], ND_PARAM_VALUE));
end;

function TARObject.GetModified: Boolean;
begin
  Result := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_MODIFIED], ND_PARAM_VALUE);
end;

function TARObject.GetName: String;
begin
  Result := xmlGetItemString(FXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE);
end;

function TARObject.GetProtocolNode: IXMLNode;
begin
  Result := GetProtocolNodeFromId(xmlGetItemString(FXMLNode.ChildNodes[ND_PROTOCOL_ID], ND_PARAM_VALUE));
end;

function TARObject.GetSelected: Boolean;
begin
  Result := xmlGetItemBoolean(FXMLNode.ChildNodes[ND_SELECTED], ND_PARAM_VALUE);
end;

procedure TARObject.Run;
begin
  TARRunThread.Create(Self);
end;

procedure TARObject.SetActive(const Value: Boolean);
begin
  if FActive <> Value then begin
    FActive := Value;
    DoActive;
  end;
end;

procedure TARObject.SetGroupID(const Value: Integer);
begin
  xmlSetItemInteger(FXMLNode, ND_PARAM_GROUP_ID, Value);
end;

procedure TARObject.SetId(const Value: String);
begin
  xmlSetItemString(FXMLNode, ND_PARAM_ID, Value);
end;

procedure TARObject.SetLastSuccessRun(const Value: TDateTime);
begin
  xmlSetItemString(FXMLNode.ChildNodes[ND_LAST_SUCCESS_RUN], ND_PARAM_VALUE, DateTimeToStr(Value));
end;

procedure TARObject.SetModified(const Value: Boolean);
begin
  xmlSetItemBoolean(FXMLNode.ChildNodes[ND_MODIFIED], ND_PARAM_VALUE, Value);
  if FActive then SetState(FState);
end;

procedure TARObject.SetSelected(const Value: Boolean);
begin
  xmlSetItemBoolean(FXMLNode.ChildNodes[ND_SELECTED], ND_PARAM_VALUE, Value);
end;

procedure TARObject.SetState(const Value: TARObjectState);
 var IconStateIdx: Integer;
begin
  if FState <> Value then FState := Value;
  IconStateIdx := Ord(FState);
  if (FState in [aroOnline]) and GetModified then Inc(IconStateIdx);
  SendMessage(PMemFile^.MainHandle, AR_MESSAGE_SETSTATE, NativeUInt(Self), IconStateIdx);
end;

{ TARCheckStateThread }

procedure TARCheckStateThread.TerminateNotifyThread;
begin
  if Assigned(FNotifyThread) then begin
    FNotifyThread.DoTerminate;
    FNotifyThread.Terminate;
    FNotifyThread := nil;
  end;
end;

procedure TARCheckStateThread.StartCheckState;
begin
  FCounter := MaxInt - 1;
end;

constructor TARCheckStateThread.Create(Owner: TARObject);
begin
  inherited Create;
  FreeOnTerminate := True;
  FOwner := Owner;
  FInterval := 0;
  FErrorInterval := 0;
  FNotifyThread := nil;
end;

procedure TARCheckStateThread.Execute;
 const
   THREAD_SLEEP_PAUSE = 100;
   THREAD_SEC_ITEMS = 1000 div THREAD_SLEEP_PAUSE;
 var
   CounterSecs: Integer;
begin
  inherited;
  CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  try

    StartCheckState;
    while not Terminated and FOwner.Active do begin

      FInterval := xmlGetItemInteger(FOwner.XMLNode.ChildNodes[ND_INTERVAL], ND_PARAM_VALUE);
      FErrorInterval := xmlGetItemInteger(FOwner.XMLNode.ChildNodes[ND_ERRORINTERVAL], ND_PARAM_VALUE);

      Inc(FCounter);
      if ((FOwner.State = aroOnline) and (FCounter >= FInterval)) or ((FOwner.State <> aroOnline) and (FCounter >= FErrorInterval)) then begin

        if not FOwner.OpenInProgress then begin
          FOwner.DoCheckState;
          if FOwner.CheckModified and (FOwner.State in [aroOnline]) then begin
            if not Assigned(FNotifyThread) then FNotifyThread := TARNotifyThread.Create(FOwner);
          end else TerminateNotifyThread;
        end;

        FCounter := 0;
      end;

      CounterSecs := 0;
      while not Terminated and (CounterSecs < THREAD_SEC_ITEMS) do begin
        Sleep(THREAD_SLEEP_PAUSE);
        Inc(CounterSecs);
      end;

    end;

    TerminateNotifyThread;
    FOwner.CheckStateThread := nil;

  finally
    CoUninitialize;
  end;
end;

{ --- }

function GetSoftNodeFromId(SoftId: String): IXMLNode;
 var
   I: Integer;
   iNode: IXMLNode;
begin
  Result := nil;
  iNode := FXML.DocumentElement.ChildNodes[ND_SOFTWARE];
  for I := 0 to iNode.ChildNodes.Count - 1 do if xmlGetItemString(iNode.ChildNodes[I], ND_PARAM_ID) = SoftId then begin
    Result := iNode.ChildNodes[I];
    Break;
  end;
end;

function GetProtocolNodeFromId(ProtocolId: String): IXMLNode;
 var
   I: Integer;
   iNode: IXMLNode;
begin
  Result := nil;
  iNode := FXML.DocumentElement.ChildNodes[ND_PROTOCOLS];
  for I := 0 to iNode.ChildNodes.Count - 1 do if xmlGetItemString(iNode.ChildNodes[I], ND_PARAM_ID) = ProtocolId then begin
    Result := iNode.ChildNodes[I];
    Break;
  end;
end;

function GetAlertNodeFromId(sId: String): IXMLNode;
 var
   I: Integer;
   iNode: IXMLNode;
begin
  Result := nil;
  iNode := FXML.DocumentElement.ChildNodes[ND_ALERTS];
  for I := 0 to iNode.ChildNodes.Count - 1 do if xmlGetItemString(iNode.ChildNodes[I], ND_PARAM_ID) = sId then begin
    Result := iNode.ChildNodes[I];
    Break;
  end;
end;

function GetDisplayProtocolName(iProtocolNode: IXMLNode): String;
begin
  Result := icsB64Decode(xmlGetItemString(iProtocolNode.ChildNodes[ND_NAME], ND_PARAM_VALUE)) + ' (' + icsB64Decode(xmlGetItemString(iProtocolNode.ChildNodes[ND_SHORTNAME], ND_PARAM_VALUE)) + ')';
end;

function GetRegRootKeyFromString(RK: String): HKEY;
begin
  RK := UpperCase(RK);
  if (RK = 'HKEY_CLASSES_ROOT') or (RK = 'HKCR') then Result := HKEY_CLASSES_ROOT
  else if (RK = 'HKEY_CURRENT_USER') or (RK = 'HKCU') then Result := HKEY_CURRENT_USER
  else if (RK = 'HKEY_LOCAL_MACHINE') or (RK = 'HKLM') then Result := HKEY_LOCAL_MACHINE
  else if (RK = 'HKEY_USERS') or (RK = 'HKU') then Result := HKEY_USERS
  else if (RK = 'HKEY_PERFORMANCE_DATA') or (RK = 'HKPD') then Result := HKEY_PERFORMANCE_DATA
  else if (RK = 'HKEY_CURRENT_CONFIG') or (RK = 'HKCC') then Result := HKEY_CURRENT_CONFIG
  else if (RK = 'HKEY_DYN_DATA') or (RK = 'HKDD') then Result := HKEY_DYN_DATA
  else Result := HKEY_CURRENT_USER;
end;

{ TARRunThread }

constructor TARRunThread.Create(Owner: TARObject);
begin
  inherited Create;
  FreeOnTerminate := True;
  FOwner := Owner;
end;

procedure TARRunThread.Execute;
 var
   AROD: TARObjectData;
   ParamsFileName1: String;
   bExecuteResult: Boolean;
   StartExecuteDT: TDateTime;
begin
  inherited;
  if Assigned(FOwner) then begin
    FOwner.OpenInProgress := True;
    try
      if FOwner.Active then FOwner.DoCheckState;
      if not FOwner.Active or (FOwner.State in [aroOnline]) then begin

        FOwner.BuildARDataRec(AROD);
        if Pos(APP_TEMPLATE_PARAMFILE1, AROD.CMDParams) > 0 then begin
          ParamsFileName1 := CreateCMDParamFile(AROD.DefaultParamsStrings1);
          AROD.CMDParams := icsGetReplacedString(AROD.CMDParams, APP_TEMPLATE_PARAMFILE1, ParamsFileName1);
        end;

//              MessageBox(0, PChar(AROD.CMDParams), PChar(AROD.CMD), MB_OK); Exit;

        StartExecuteDT := Now;
        if AROD.CMD = '' then begin
          bExecuteResult := (ShellExecute(GetDesktopWindow, nil, PChar(AROD.CMDParams), '', '', AROD.ShowCMD) > 32);
        end else begin
          bExecuteResult := icsStartProcessEx(AROD.CMD, AROD.CMDParams, ExtractFilePath(AROD.CMD), AROD.ShowCMD, True, FOwner.Modified, AROD.RunAsAdmin);
          if FileExists(ParamsFileName1) then DeleteFile(ParamsFileName1);
        end;
        if bExecuteResult then begin
          FOwner.LastSuccessRun := StartExecuteDT;
          if AROD.UnsetAfterOpen then FOwner.Modified := False;
        end;

      end;
    finally
      FOwner.OpenInProgress := False;
    end;
  end;
end;

{ TARNotifyThread }

constructor TARNotifyThread.Create(Owner: TARObject);
begin
  inherited Create;
  FOwner := Owner;
  FNotifyHandle := INVALID_HANDLE_VALUE;
  FLastError := ERROR_SUCCESS;
  FCurrentKey := 0;
  OnTerminate := OnTerminateEvent;
end;

procedure TARNotifyThread.Execute;
 const
   FILE_NOTIFY_FLAGS = FILE_NOTIFY_CHANGE_FILE_NAME or FILE_NOTIFY_CHANGE_DIR_NAME or FILE_NOTIFY_CHANGE_SIZE or FILE_NOTIFY_CHANGE_LAST_WRITE or FILE_NOTIFY_CHANGE_CREATION;
   REG_NOTIFY_FLAGS = REG_NOTIFY_CHANGE_NAME or REG_NOTIFY_CHANGE_ATTRIBUTES or REG_NOTIFY_CHANGE_LAST_SET or REG_NOTIFY_CHANGE_SECURITY;
 var
   RKD: TRegistryKeyData;
   Handles: array [0..1] of THandle;
   FObjectData: String;
   FOwnerLocation: TARObjectLocation;
begin
  CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  try

    if Assigned(FOwner) then begin

      FObjectData := FOwner.FullPath;
      FOwnerLocation := FOwner.Location;
      FEvent := CreateEvent(nil, True, False, nil);
      if FEvent <> 0 then case FOwnerLocation of
        olLocalOrShared: FNotifyHandle := FindFirstChangeNotification(PChar(FObjectData), True, FILE_NOTIFY_FLAGS);
        olRegistry: begin
          RKD := GetRegistryKeyData(FObjectData);
          if RegOpenKeyEx(RKD.RootKey, PChar(RKD.SubKey), 0, KEY_NOTIFY, FCurrentKey) = ERROR_SUCCESS then FNotifyHandle := RegNotifyChangeKeyValue(FCurrentKey, True, REG_NOTIFY_FLAGS, FEvent, True);
        end;
      end;

      if FNotifyHandle = INVALID_HANDLE_VALUE then FLastError := GetLastError else begin

        while not Terminated and (FNotifyHandle <> INVALID_HANDLE_VALUE) do begin
          case FOwnerLocation of
            olLocalOrShared: begin
              Handles[0] := FNotifyHandle;
              Handles[1] := FEvent;
              case WaitForMultipleObjects(2, PWOHandleArray(@Handles), False, INFINITE) of
                WAIT_OBJECT_0: if not Terminated then begin
                  OnChanged;
                  if not FindNextChangeNotification(FNotifyHandle) then FLastError := GetLastError;
                end;
                WAIT_OBJECT_0 + 1: ;
                WAIT_FAILED: FLastError := GetLastError;
              end;
            end;
            olRegistry: case WaitForSingleObject(FEvent, INFINITE) of
              WAIT_OBJECT_0: if not Terminated then begin
                OnChanged;
                FNotifyHandle := RegNotifyChangeKeyValue(FCurrentKey, True, REG_NOTIFY_FLAGS, FEvent, True);
              end;
              WAIT_FAILED: FLastError := GetLastError;
            end;
          end;
        end;

        if FNotifyHandle <> INVALID_HANDLE_VALUE then case FOwnerLocation of
          olLocalOrShared: FindCloseChangeNotification(FNotifyHandle);
          olRegistry: if FCurrentKey <> 0 then RegCloseKey(FCurrentKey);
        end;
        if FEvent <> 0 then begin
          CloseHandle(FEvent);
          FEvent := 0;
        end;

      end;

    end;

  finally
    CoUninitialize;
  end;
end;

procedure TARNotifyThread.OnChanged;
begin
  if not Terminated and Assigned(FOwner) and not FOwner.OpenInProgress then FOwner.Modified := True;
end;

procedure TARNotifyThread.OnTerminateEvent(Sender: TObject);
begin
  if FEvent <> 0 then SetEvent(FEvent);
end;

initialization

  CoInitializeEx(nil, COINIT_APARTMENTTHREADED);

finalization

  CoUninitialize;

end.
