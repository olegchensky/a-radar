program aradar;

{$R 'ar_resources.res' 'ar_resources.rc'}

uses
  Vcl.Forms,
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  XML.XMLIntf,
  XML.XMLDoc,
  uMain in 'uMain.pas' {frmMain},
  uClasses in 'uClasses.pas',
  uEditGroup in 'uEditGroup.pas' {frmEditGroup},
  uEditHost in 'uEditHost.pas' {frmEditHost},
  uProps in 'uProps.pas' {frmProps},
  uPWD in 'uPWD.pas' {frmPWD},
  uChangePWD in 'uChangePWD.pas' {frmChangeMasterPWD},
  uNetworkTools in 'uNetworkTools.pas' {frmNetworkTools},
  uDataManager in 'uDataManager.pas' {frmDataManager},
  uEditProtocol in 'uEditProtocol.pas' {frmEditProtocol},
  uEditSoft in 'uEditSoft.pas' {frmEditSoft},
  uExportImport in 'uExportImport.pas' {frmExportImport},
  uEditCredential in 'uEditCredential.pas' {frmEditCredential},
  uInfo in 'uInfo.pas' {frmInfo},
  uEditAlert in 'uEditAlert.pas' {frmEditAlert},
  Vcl.Themes,
  Vcl.Styles,
  uCommonTools,
  uForm in 'D:\Repository\uForm.pas' {frmForm};

{$R *.res}

var
  sCMD: String = '';

begin
  CreateOrOpenSharedFile;
  try
    if ParamCount = 0 then begin

      if not IsWindow(PMemFile^.MainHandle) then begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'A-Radar';
  Application.ShowMainForm := False;

        case ARCheckSystem of
          scrOk: begin
            FXML := NewXMLDocument;
            FXML.Options := [doNodeAutoCreate];
            FXML.ParseOptions := [poValidateOnParse];
            if LoadXMLFromFile(FXML, GetMainXMLFileName, True) then begin

  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

            end;

          end;
          scrNoDataFiles: MessageBox(GetDesktopWindow, 'No data files.', PChar(Application.Title), MB_OK or MB_ICONERROR);
          scrWrongOperationSystem: begin
            sCMD := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + APP_X64_MAIN_FILE;
            if not FileExists(sCMD) then begin
              sCMD := '';
              MessageBox(GetDesktopWindow, 'Wrong operation system.', PChar(Application.Title), MB_OK or MB_ICONERROR);
            end;
          end;
        end;

      end else PostMessage(PMemFile^.MainHandle, AR_MESSAGE_RESTORE, 0, 0);

    end else begin
      if ParamStr(1) = APP_CMD_PARAM_CLOSE then PostMessage(PMemFile^.MainHandle, AR_MESSAGE_CLOSE, 0, 0);
    end;

  finally

    CloseSharedFile;
    if FileExists(sCMD) then icsStartProcess(sCMD);

{$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  end;
end.
