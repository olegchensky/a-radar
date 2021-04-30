unit uInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uForm, ICSLanguages, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, ICSFrame;

type
  TfrmInfo = class(TfrmForm)
    ImageLogo: TImage;
    btnOk: TButton;
    Label1: TLabel;
    lVersion: TLabel;
    ICSFrame1: TICSFrame;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

uses
  uCommonTools;

procedure TfrmInfo.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmInfo.FormCreate(Sender: TObject);
begin
  inherited;
  ImageLogo.Picture.Icon.Assign(Application.Icon);
  lVersion.Caption := lVersion.Caption + ' v.' + icsGetFileVersion(ParamStr(0));
end;

end.
