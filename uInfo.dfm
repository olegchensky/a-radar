inherited frmInfo: TfrmInfo
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 383
  ClientWidth = 418
  Position = poScreenCenter
  ExplicitWidth = 418
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  object ICSFrame1: TICSFrame [0]
    Left = 0
    Top = 0
    Width = 418
    Height = 383
    Align = alClient
    Color = 16776176
    ParentColor = False
    ExplicitLeft = 112
    ExplicitTop = 334
    ExplicitWidth = 80
    ExplicitHeight = 40
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 24
    Width = 387
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'A-Radar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lVersion: TLabel [2]
    Left = 23
    Top = 55
    Width = 387
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Remote Connection Manager and Monitor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ImageLogo: TImage [3]
    Left = 16
    Top = 16
    Width = 49
    Height = 48
    AutoSize = True
  end
  object btnOk: TButton [4]
    Tag = 1
    Left = 328
    Top = 344
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'btnOk'
    Default = True
    TabOrder = 0
    OnClick = btnOkClick
  end
  object Memo1: TMemo [5]
    Left = 16
    Top = 88
    Width = 387
    Height = 241
    Lines.Strings = (
      'Powered by Oleg Chensky'
      ''
      'www: https://www.chensky.de'
      'email: info@chensky.de'
      ''
      'Following placeholders are implemented. You can use it for all '
      'parameters '
      'and user defined strings.'
      ''
      'Object palceholders:'
      ''
      '%SELF.NAME%'
      '%SELF.HOST%'
      '%SELF.RESOURCES%'
      '%SELF.PATH%'
      '%SELF.URI%'
      '%SELF.PORT%'
      '%SELF.USERNAME%'
      '%SELF.FULL_USERNAME%'
      '%SELF.PASSWORD%'
      '%SELF.CRYPT_PASSWORD%'
      '%SELF.DOMAIN%'
      '%SELF.SCHEME%'
      '%SELF.STATE%'
      '%SELF.MODIFIED%'
      '%SELF.MSG%'
      ''
      '%SELF.USERDEF_STRING_#%'
      '%SELF.PARAMFILE_#%'
      ''
      'Application placeholders:'
      ''
      '%APP.PATH%'
      ''
      'System placeholders are all enveronment placeholders such as '
      '%USERNAME% and following:'
      ''
      '%SYSTEM.NOW%')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  inherited ICSLanguagesBase: TICSLanguages
    Languages = <
      item
        Strings.Strings = (
          'A-Radar Info'
          'Ok')
        LocaleName = 'English'
      end>
  end
end
