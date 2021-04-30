inherited frmEditGroup: TfrmEditGroup
  ClientHeight = 308
  ClientWidth = 516
  DoubleBuffered = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 532
  ExplicitHeight = 347
  PixelsPerInch = 96
  TextHeight = 13
  object ImageLogo: TImage [0]
    Left = 16
    Top = 16
    Width = 32
    Height = 32
    AutoSize = True
  end
  object leName: TLabeledEdit [1]
    Tag = 3
    Left = 120
    Top = 16
    Width = 382
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 5
    EditLabel.Height = 13
    EditLabel.Caption = '*'
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object PageControl1: TPageControl [2]
    Left = 16
    Top = 56
    Width = 486
    Height = 201
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    Images = PngImageListTabs
    TabOrder = 3
    object TabSheet1: TTabSheet
      Tag = 6
      Caption = 'General'
      ImageName = 'cog'
      DesignSize = (
        478
        172)
      object ButtonGroupIcons: TButtonGroup
        Left = 3
        Top = 3
        Width = 472
        Height = 133
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        ButtonWidth = 26
        ButtonOptions = [gboAllowReorder, gboGroupStyle]
        Images = PngImageListGroups
        Items = <>
        TabOrder = 0
        OnButtonClicked = ButtonGroupIconsButtonClicked
        OnHotButton = ButtonGroupIconsHotButton
        OnKeyDown = ButtonGroupIconsKeyDown
        OnReorderButton = ButtonGroupIconsReorderButton
      end
      object btnAddIcons: TButton
        Tag = 4
        Left = 0
        Top = 142
        Width = 121
        Height = 25
        Action = ActionAdd
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 136
        Top = 142
        Width = 121
        Height = 25
        Action = ActionDelete
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
    end
    object Memo: TTabSheet
      Tag = 7
      Caption = 'Memo'
      ImageIndex = 1
      ImageName = 'data_grid'
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 281
      ExplicitHeight = 165
      object MemoMemo: TMemo
        Left = 0
        Top = 0
        Width = 478
        Height = 172
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'MemoMemo')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object btnCancel: TButton [3]
    Tag = 2
    Left = 427
    Top = 273
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
  object btnOk: TButton [4]
    Tag = 1
    Left = 340
    Top = 273
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  inherited ICSLanguagesBase: TICSLanguages
    Languages = <
      item
        Strings.Strings = (
          'A-Radar Group'
          'Ok'
          'Cancel'
          'Name:'
          'Add Icons'
          'Delete Icon'
          'General'
          'Memo')
        LocaleName = 'English'
      end>
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'ico'
    Filter = 'ICO (*.ico)|*.ico|PNG (*.png)|*.png'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 16
    Top = 172
  end
  object ActionList1: TActionList
    Left = 16
    Top = 48
    object ActionDelete: TAction
      Tag = 5
      Caption = 'ActionDelete'
      OnExecute = ActionDeleteExecute
      OnUpdate = ActionDeleteUpdate
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      OnExecute = ActionAddExecute
    end
  end
  object PngImageListGroups: TPngImageList
    PngImages = <>
    Left = 16
    Top = 136
  end
  object PngImageListResult: TPngImageList
    PngImages = <>
    Left = 48
    Top = 136
  end
  object PngImageListTabs: TPngImageList
    PngImages = <
      item
        Background = clWindow
        Name = 'cog'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000002DC4944415478DA75535D485361187ECE9C88A4B1621BCA
          D2B59928F9172AEA2464126A374576651616D64D88F83B356B3F4E317FB328EA
          AA5192E65584DDA4C21A154E45698AD6866D73E59AE88491620EDD4EDF996EB8
          C8F7E63BEF799FF37CEFF3BECFA17048F43C784893004551A8AFADA6FE87F1D5
          FD496777EF30393C8DB2BA6226BFDFD94DDF282BC38BFE7EDC6994F9701D5D3D
          EB84F013C15C0A2220E0E1C4C4840B1E8F070B0B5F9D04C4E571B938291663C9
          62C19AD3C980E9A4A4D3544848088C46D33B427A3140A050A947C56271417656
          960F2C14C6626BEB0F1CBF1CE0F379883C1A099BCD061E9787C9A929582C9631
          B54A517850429C5CA99E263770040201363736E1D7EF8F88C808D8ED76D2E182
          ABB54599495E998366704FA1A2AF5D2D85EDC732BC5E2FBE198DA0C9C962B120
          1209111E7E04C2D818BC1A18409B5A450566A052B7D1BBBBBBA4552E7273CF62
          E3F7060CB3062C2D59DF4C4E4CBCCCCEC9B92E12892EA7A59EF149191FFF8CD5
          5527D86C3694F2BB142557B6D0E5E5E570BBDD585D5B058B6241AFD7636C7424
          6F74E4FD5461D1F9AC82C2A28F1289045EDA0B3E8F8FB0B03068341A9039EC11
          ECECEC903645484B4DF3C9D14FE8E170389E935BDA4977CDD1D1D1372539125F
          6D766E1656AB15A1A1A17B04E45D0653A86F689A2E2D2D0523C7E572617E7E1E
          0C31034C4E4E0687C3F1B53D3838889EAE8ECCFD19CC0486582B6BF0E6E7E553
          2762044C0514195EC0716498642558FE698756A775F5F5761F0B32524353F37A
          7C7CFC71A9540A93C984B8B83830A6F2EE6F81318FD96C46424202743A1D1617
          17DF7675B41707082A2AAB3EA4A7A74B998FE6E6E65C64FF9CA8A8285C2929C1
          EBA121ACACAC309EA05352522886D06030681F3FEA3B1764A4DB15951AD293F7
          D9D327D524675756D54C2BE472A85B5B41C03ECDD5B5F55AF7F6F61782B945D2
          EF414622718A91C5388C496AEA64B45F02D1ECC7316BDAF463FE25F837320E3C
          CF1CF63BFF05C6B555F08ACDCA4C0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'data_grid'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000025C4944415478DA7D534D6F1251009CB7CB8252541A8D8D
          7A31D5BFE0C118A289072DD69BB626706DD1A44DD9456DB0D59B880D5041632C
          9A8817355EAC095A0FA6D15BF56EF422623DD4022D080B05F6CBB72C425A4827
          79D9DDF7F6CD9B999D25B1582C2FCBB25DD35440034060A079CFB10CBEE71864
          4A2A344DC37FB074DEC299DE904824A2F13C0F51ACA01B6C362B9C97EFE2DDA3
          C98EB561E11E482814D27C3E1F7EA4D2F444B259003DB1BFFF30CE8C04B0F0F8
          06B2A284D3C35E2CBE8A627F8F0917BD11907038ACB95C2E2C2D7D3636932645
          53EE89E3C7E09E4E2011BE0AF7D86DACAE6591FAF51BE92FF3189B8A1A0A785E
          C0CACA9FAE160E1DECC3E095194C4F7AA0A86AC3BB9E05C7B288C41206817782
          47269B6D86D43641A89A037DFB303411424D41635D5F6518021325B05838B1A5
          603D9FEF385D77B3B7770F063C3348C6FDC88B753AAAF8BB21A122AB988B3F37
          32703A07F1339DEA24A0E3280D713CF41AF30FFD58A75F2A2FD650AC4AA82A1A
          E2F197EDAF5014CBADE0DA0A0876D97A70CE1344F09A1BC5B28452B58632F553
          A7EFBE4D2E1A0482E043A552DE54141D0C2560A8D70B7CB4614755D4C65527E6
          4C2658779ADB0A24A90E4DDDA28061C0711C0646EF608166B01597F422E91938
          1C0E944AA5AE0AECBB6DF0CF7DC07B5AA453EE5BC8ACE5905A5E46F56B1243FC
          6C5BC176384B9BF89416A950A9C335EAC78B2741F45ACD18BFF9C0502008C2B6
          04E76991A6AE8FA02ECB60A92D95166A8799C3ECFD67208140E0A3C56239A928
          4AC74646FF1B4D2CBEE518B1B0416C8D72B5F221906BD54FFAF3113AECD81E3A
          3BDB65BEF00FE88416D68D71090E0000000049454E44AE426082}
      end>
    Left = 85
    Top = 136
  end
end
