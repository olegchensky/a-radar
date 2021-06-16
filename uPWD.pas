unit uPWD;

interface

uses
  uForm,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ICSLanguages, XML.XMLIntf, uClasses;

type
  TfrmPWD = class(TfrmForm)
    Image1: TImage;
    EditPWD: TEdit;
    Bevel1: TBevel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure EditPWDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ARMasterPassword: String = APP_CLSID;

function LoadXMLFromFile(XML: IXMLDocument; const XMLFileName: String; const IsMasterPassword: Boolean): Boolean;
function SaveXMLToFile(XML: IXMLDocument; const XMLFileName, Password: String): Boolean;

implementation

{$R *.dfm}

uses
  uCommonTools, uXMLTools, uExportImport;

function InputPassword: String;
 var frmPWD: TfrmPWD;
begin
  frmPWD := TfrmPWD.Create(Application);
  try
    if frmPWD.ShowModal = mrOk then Result := frmPWD.EditPWD.Text else Result := '';
  finally
    frmPWD.Release;
  end;
end;

function LoadXMLFromFile(XML: IXMLDocument; const XMLFileName: String; const IsMasterPassword: Boolean): Boolean;
 var
   sFile, sPWD: String;
   ST: TStringStream;

  function _LoadFromFileAndDecrypt: Boolean;
  begin
    ST.Clear;
    ST.LoadFromFile(sFile);
    if ST.Size > 0 then Result := icsCryptDecryptStream(ST, sPWD, False) else Result := False;
  end;

begin
  sFile := XMLFileName;
  sPWD := ARMasterPassword;
  ST := TStringStream.Create;
  try
    if FileExists(sFile) then begin
      _LoadFromFileAndDecrypt;
      if Copy(ST.DataString, 1, Length(APP_XML_HEADER_P0)) <> APP_XML_HEADER_P0 then begin
        sPWD := InputPassword;
        if sPWD <> '' then _LoadFromFileAndDecrypt;
      end;
    end else ST.WriteString(APP_XML_HEADER + APP_XML_ROOT);
    try
      if ST.Size > 0 then  try XML.LoadFromStream(ST); except end;
    finally
      Result := XML.Active and not XML.IsEmptyDoc;
      if Result then begin
        if IsMasterPassword then ARMasterPassword := sPWD;
        if xmlGetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_INTERVAL], ND_PARAM_VALUE) = '' then xmlSetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_INTERVAL], ND_PARAM_VALUE, '60');
        if xmlGetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_ERRORINTERVAL], ND_PARAM_VALUE) = '' then xmlSetItemString(FXML.DocumentElement.ChildNodes[ND_PROPERTIES].ChildNodes[ND_ERRORINTERVAL], ND_PARAM_VALUE, '5');
      end;
    end;
  finally
    ST.Free;
  end;
end;

function SaveXMLToFile(XML: IXMLDocument; const XMLFileName, Password: String): Boolean;
 var
   MS: TMemoryStream;
   sPWD: String;
begin
  Result := False;
  if Assigned(XML) then begin
    MS := TMemoryStream.Create;
    try
      XML.SaveToStream(MS); XML.SaveToFile(XMLFileName + '.xml');
      if Password = '' then sPWD := ARMasterPassword else sPWD := Password;
      Result := icsCryptDecryptStream(MS, sPWD, True);
      if Result then begin
        if FileExists(XMLFileName) then MoveFileEx(PChar(XMLFileName), PChar(ChangeFileExt(XMLFileName, '.bak')), MOVEFILE_REPLACE_EXISTING);
        MS.SaveToFile(XMLFileName);
      end;
    finally
      MS.Free;
    end;
  end;
end;

{ TfrmPWD }

procedure TfrmPWD.EditPWDChange(Sender: TObject);
begin
  inherited;
  btnOk.Enabled := EditPWD.Text <> '';
end;

end.
