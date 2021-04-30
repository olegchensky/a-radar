inherited frmProps: TfrmProps
  BorderStyle = bsDialog
  ClientHeight = 195
  ClientWidth = 538
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitWidth = 544
  ExplicitHeight = 224
  PixelsPerInch = 96
  TextHeight = 13
  object ImageLogo: TImage [0]
    Left = 16
    Top = 16
    Width = 48
    Height = 48
    AutoSize = True
  end
  object btnOk: TButton [1]
    Tag = 1
    Left = 356
    Top = 159
    Width = 75
    Height = 25
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TButton [2]
    Tag = 2
    Left = 446
    Top = 159
    Width = 75
    Height = 25
    Cancel = True
    ModalResult = 2
    TabOrder = 5
  end
  object btnSetMasterPWD: TButton [3]
    Tag = 4
    Left = 16
    Top = 159
    Width = 265
    Height = 25
    TabOrder = 3
    OnClick = btnSetMasterPWDClick
  end
  object cbStartMinimized: TCheckBox [4]
    Tag = 6
    Left = 312
    Top = 16
    Width = 209
    Height = 17
    TabOrder = 1
  end
  object cbAutoStart: TCheckBox [5]
    Tag = 5
    Left = 80
    Top = 16
    Width = 209
    Height = 17
    TabOrder = 0
    OnClick = cbAutoStartClick
  end
  object GroupBox1: TGroupBox [6]
    Tag = 3
    Left = 16
    Top = 86
    Width = 505
    Height = 59
    TabOrder = 6
    object leInterval: TICSSpinLabeledEdit
      Tag = 8
      Left = 120
      Top = 22
      Width = 89
      Height = 21
      AutoSelect = False
      EditLabel.Width = 5
      EditLabel.Height = 13
      EditLabel.Caption = '*'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      UpDownWidth = 17
      Max = 3600
    end
    object leErrorInterval: TICSSpinLabeledEdit
      Tag = 9
      Left = 401
      Top = 22
      Width = 89
      Height = 21
      AutoSelect = False
      EditLabel.Width = 5
      EditLabel.Height = 13
      EditLabel.Caption = '*'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 1
      UpDownWidth = 17
      Max = 3600
    end
  end
  object cbShowObjectHints: TCheckBox [7]
    Tag = 10
    Left = 80
    Top = 48
    Width = 209
    Height = 17
    TabOrder = 2
  end
  object cbAppBarAutoHide: TCheckBox [8]
    Tag = 11
    Left = 312
    Top = 48
    Width = 209
    Height = 17
    TabOrder = 7
  end
  inherited ICSLanguagesBase: TICSLanguages
    Languages = <
      item
        Strings.Strings = (
          'A-Radar Properties'
          'Ok'
          'Cancel'
          ' Object default Parameters '
          'Set Master Password'
          'Start when Windows starts'
          'Start minimized'
          'Show in Taskbar if visible'
          'Check Interval (sec):'
          'Error Interval (sec):'
          'Show Object Hints'
          'Hide when deactivate')
        LocaleName = 'English'
      end>
  end
  object ICSLanguagesMsg: TICSLanguages
    Languages = <
      item
        Strings.Strings = (
          'Master Password has been set successfully.')
        LocaleName = 'English'
      end>
    Left = 40
    Top = 152
  end
end
