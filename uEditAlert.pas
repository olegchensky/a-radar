unit uEditAlert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm, ICSLanguages, Vcl.StdCtrls,
  Vcl.ExtCtrls, XML.XMLIntf, Vcl.Imaging.pngimage, Vcl.Buttons,
  ICSSpinLabeledEdit;

type
  TfrmEditAlert = class(TfrmForm)
    btnOk: TButton;
    btnCancel: TButton;
    Image1: TImage;
    leName: TLabeledEdit;
    leRequestURL: TLabeledEdit;
    gdNegative: TGroupBox;
    cbNegativeURL: TCheckBox;
    cbNegativeScreenMessage: TCheckBox;
    gbPositive: TGroupBox;
    cbPositiveScreenMessage: TCheckBox;
    cbPositiveURL: TCheckBox;
    MemoTextN: TMemo;
    MemoTextP: TMemo;
    cbIgnoreFirstCheck: TCheckBox;
    leSilentCheckCountN: TICSSpinLabeledEdit;
    leSilentCheckCountP: TICSSpinLabeledEdit;
    procedure FormShow(Sender: TObject);
  private
    FAlertXMLNode: IXMLNode;
    procedure FillControls;
  public
    procedure ApplyXML;
    property AlertXMLNode: IXMLNode read FAlertXMLNode write FAlertXMLNode;
  end;

var
  frmEditAlert: TfrmEditAlert;

implementation

{$R *.dfm}

uses
  uCommonTools, uXMLTools, uClasses;

{ TfrmEditAlert }

procedure TfrmEditAlert.ApplyXML;
begin
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE, icsB64Encode(leName.Text));
  xmlSetItemBoolean(FAlertXMLNode.ChildNodes[ND_IGNORE_FIRST_CHECK], ND_PARAM_VALUE, cbIgnoreFirstCheck.Checked);
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_SILENT_CHECK_COUNT_N], ND_PARAM_VALUE, leSilentCheckCountN.Text);
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_SILENT_CHECK_COUNT_P], ND_PARAM_VALUE, leSilentCheckCountP.Text);
  xmlSetItemBoolean(FAlertXMLNode.ChildNodes[ND_SCREEN_MSG_N], ND_PARAM_VALUE, cbNegativeScreenMessage.Checked);
  xmlSetItemBoolean(FAlertXMLNode.ChildNodes[ND_SCREEN_MSG_P], ND_PARAM_VALUE, cbPositiveScreenMessage.Checked);
  xmlSetItemBoolean(FAlertXMLNode.ChildNodes[ND_REQUEST_URL_N], ND_PARAM_VALUE, cbNegativeURL.Checked);
  xmlSetItemBoolean(FAlertXMLNode.ChildNodes[ND_REQUEST_URL_P], ND_PARAM_VALUE, cbPositiveURL.Checked);
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_REQUEST_URL], ND_PARAM_VALUE, icsB64Encode(leRequestURL.Text));
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_ALERT_TEXT_N], ND_PARAM_VALUE, icsB64Encode(MemoTextN.Text));
  xmlSetItemString(FAlertXMLNode.ChildNodes[ND_ALERT_TEXT_P], ND_PARAM_VALUE, icsB64Encode(MemoTextP.Text));
end;

procedure TfrmEditAlert.FillControls;
begin
  leName.Text := icsB64Decode(xmlGetItemString(FAlertXMLNode.ChildNodes[ND_NAME], ND_PARAM_VALUE));
  cbIgnoreFirstCheck.Checked := xmlGetItemBoolean(FAlertXMLNode.ChildNodes[ND_IGNORE_FIRST_CHECK], ND_PARAM_VALUE, True);
  leSilentCheckCountN.Text := xmlGetItemString(FAlertXMLNode.ChildNodes[ND_SILENT_CHECK_COUNT_N], ND_PARAM_VALUE, '1');
  leSilentCheckCountP.Text := xmlGetItemString(FAlertXMLNode.ChildNodes[ND_SILENT_CHECK_COUNT_P], ND_PARAM_VALUE, '1');
  cbNegativeScreenMessage.Checked := xmlGetItemBoolean(FAlertXMLNode.ChildNodes[ND_SCREEN_MSG_N], ND_PARAM_VALUE);
  cbPositiveScreenMessage.Checked := xmlGetItemBoolean(FAlertXMLNode.ChildNodes[ND_SCREEN_MSG_P], ND_PARAM_VALUE);
  cbNegativeURL.Checked := xmlGetItemBoolean(FAlertXMLNode.ChildNodes[ND_REQUEST_URL_N], ND_PARAM_VALUE);
  cbPositiveURL.Checked := xmlGetItemBoolean(FAlertXMLNode.ChildNodes[ND_REQUEST_URL_P], ND_PARAM_VALUE);
  leRequestURL.Text := icsB64Decode(xmlGetItemString(FAlertXMLNode.ChildNodes[ND_REQUEST_URL], ND_PARAM_VALUE));
  MemoTextN.Text := icsB64Decode(xmlGetItemString(FAlertXMLNode.ChildNodes[ND_ALERT_TEXT_N], ND_PARAM_VALUE));
  MemoTextP.Text := icsB64Decode(xmlGetItemString(FAlertXMLNode.ChildNodes[ND_ALERT_TEXT_P], ND_PARAM_VALUE));
end;

procedure TfrmEditAlert.FormShow(Sender: TObject);
begin
  inherited;
  FillControls;
end;

end.
