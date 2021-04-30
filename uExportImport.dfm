inherited frmExportImport: TfrmExportImport
  BorderStyle = bsDialog
  ClientHeight = 201
  ClientWidth = 611
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 617
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  object PngBitBtn1: TButton [0]
    Left = 199
    Top = 168
    Width = 185
    Height = 25
    Action = ActionExport
    TabOrder = 3
  end
  object PngBitBtn2: TButton [1]
    Left = 8
    Top = 168
    Width = 185
    Height = 25
    Action = ActionImport
    TabOrder = 2
  end
  object btnClose: TButton [2]
    Left = 528
    Top = 168
    Width = 75
    Height = 25
    Action = ActionClose
    TabOrder = 4
  end
  object GroupBox1: TGroupBox [3]
    Tag = 11
    Left = 8
    Top = 8
    Width = 185
    Height = 145
    TabOrder = 0
    object cbObjects: TCheckBox
      Tag = 4
      Left = 16
      Top = 23
      Width = 153
      Height = 17
      Caption = 'cbObjects'
      TabOrder = 0
    end
    object cbProtocols: TCheckBox
      Tag = 5
      Left = 16
      Top = 46
      Width = 153
      Height = 17
      Caption = 'cbProtocols'
      TabOrder = 1
    end
    object cbSoftware: TCheckBox
      Tag = 6
      Left = 16
      Top = 69
      Width = 153
      Height = 17
      Caption = 'cbSoftware'
      TabOrder = 2
    end
    object cbCredentials: TCheckBox
      Tag = 7
      Left = 16
      Top = 92
      Width = 153
      Height = 17
      Caption = 'cbCredentials'
      TabOrder = 3
    end
    object cbAlerts: TCheckBox
      Tag = 8
      Left = 16
      Top = 115
      Width = 153
      Height = 17
      Caption = 'cbAlerts'
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox [4]
    Tag = 12
    Left = 199
    Top = 8
    Width = 404
    Height = 145
    TabOrder = 1
    object lePassword: TLabeledEdit
      Tag = 9
      Left = 16
      Top = 40
      Width = 369
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'lePassword'
      PasswordChar = '*'
      TabOrder = 0
    end
    object lePasswordRetype: TLabeledEdit
      Tag = 10
      Left = 16
      Top = 83
      Width = 369
      Height = 21
      EditLabel.Width = 93
      EditLabel.Height = 13
      EditLabel.Caption = 'lePasswordRetype'
      PasswordChar = '*'
      TabOrder = 1
    end
    object cbPasswords: TCheckBox
      Tag = 13
      Left = 16
      Top = 115
      Width = 185
      Height = 17
      Caption = 'cbPasswords'
      TabOrder = 2
    end
    object cbSelected: TCheckBox
      Tag = 14
      Left = 224
      Top = 115
      Width = 161
      Height = 17
      Caption = 'cbSelected'
      TabOrder = 3
    end
  end
  inherited ICSLanguagesBase: TICSLanguages
    Languages = <
      item
        Strings.Strings = (
          'Export/Import Manager'
          'Close'
          'Export...'
          'Import...'
          'Objects and Groups'
          'Protocols'
          'Software'
          'Credentials'
          'Alerts'
          'Password for Export:'
          'Retype Password for Export:'
          ' Data Type '
          ' Export Parameters '
          'Include Passwords'
          'Selected only')
        LocaleName = 'English'
      end>
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dat'
    Left = 144
    Top = 152
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'dat'
    Left = 40
    Top = 152
  end
  object ActionList1: TActionList
    Images = PngImageList1
    Left = 144
    Top = 56
    object ActionClose: TAction
      Tag = 1
      Caption = 'ActionClose'
      ImageIndex = 0
      ImageName = 'cross'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionExport: TAction
      Tag = 2
      Caption = 'ActionExport'
      ImageIndex = 1
      ImageName = 'basket_remove'
      OnExecute = ActionExportExecute
      OnUpdate = ActionExportUpdate
    end
    object ActionImport: TAction
      Tag = 3
      Caption = 'ActionImport'
      ImageIndex = 2
      ImageName = 'basket_put'
      OnExecute = ActionImportExecute
      OnUpdate = ActionImportUpdate
    end
  end
  object PngImageList1: TPngImageList
    PngImages = <
      item
        Background = clWindow
        Name = 'cross'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000001604944415478DA63FCFFFF3F0323232303081C7130F80F
          A26D0E5C8008A0017479B05E98012049A3E62EB0C273B56518866093871B70D4
          D1F0BF617503C387BE5AB00281A26686F3AD0D7043409AB1C95BEF3FCF8830A0
          B89CE1D3AC6EB88D7C69A50CE77B3BC16C5C727003805E3006DA72C6203B8FE1
          DBB29970855C51E9601A5DECC2D44920D79900F59E65440A44B02186C9E90CDF
          372DC516860C9C7ED10CE7E7CE046B0672CFA2042214400C898D67F8B967138A
          6676173F86F38B17C23563C4024A68874530FC3ABE0FC500364B278673AB56A0
          C40E860160CD81410C7F2F9CC4EA056603738673EBD7E14E07C63EDE0CFF6E5E
          816B6052D701D3E86267B76CC54C0726EE6E0CFF1FDD832B6494536238B37317
          988D4B0E251D98393932FC7FF302A2404482E1D4BEFDB00003B9EE0C36798C74
          606167035670E2D01194D086C50EBA3CD67400CD2CC89A51A218591E6B3A80D2
          E89AB1CAC30DA004000057550FF07637089B0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'basket_remove'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000003554944415478DA7D937D4C95551CC73FE7B9978B416BC5
          9522EB769730252B5DF7252B5E43A151D714E74A665B580ABDFC711D444DA8B4
          B60B23C1CD35267AD55E4D586E80636422C5E0524D04663944E9B262935EE086
          7381DEEBE59ECEF3E0FCB3B39D7DCF393BBFCF737EDFE7F7134FF82F5059984E
          380A160B1CFC4C10AF340644E7914A309B109AD270044A5F964494C69B61CF37
          A38827FDA3543EBB9CEB3A204E013E1598942AA0DC577C508FC77BAC540F10F3
          3714A04401942ED2019D171139472ECACAE796311B4198D4E1FE2302A921EB36
          EDE5E7F17203B072E95EDE395E8E88215E7F4532AF3E9668417ED43986E0ED80
          7C6AD962767A96A3CEC53EBF90B59BAB19BDEC231A33E231ABF7A7DF57CDCE66
          1FDEED529840D6748CF1D3D88C0280938AFEB3ABD3EF6657511ACD8D4B18D7FE
          2077052C4D59008CFF093D236A1FBB97CD6F4EB2BB35C899D11034AC76898F6B
          777FB5A5646B7152DD65DC8F2CE1DD223B7961C9337E8D3DDB5FE4D2740B87DA
          E0E4B618DDF1025FEBEF0C9C9FE45AB58DFD873F3F26EA6A7CF2B5D26D5C1AFB
          1577B389928CC5ECB08579E3F4C3BCF5EA9DCCDEB842D317D0B86604FFA499C6
          DE7F385F1CE1FEB4749AFC87103E9F6FDAE3F158AFFD7B9538A10C92022112F9
          E45C29BFCC9C355278F42E375B571D40CA5994BFCA2BC16DB7DF4147474748F7
          60656D4DCDB9071E4C5317946BEACF6B220E93168F49588C7D8C8832F43A3119
          5D304508267E0B525555B54AD4D7D7138D4665766E1E030303389D4E86878671
          BA5C0C0D0EE1703A181C1CC4E178ECA63AD0348DDE9EEF309BCDC200CCCDCD8D
          E43EBDE6218B65113FFC18202B339B40BFD28C2CFAFAFB6E696646267D813E5C
          4E173DDF9FBE909090B0C2008442A12FB373F2B6D86C3655AE61BABBBB292828
          A0ABAB8BFCFC7C43D7E6AFE5D4B7A758E7F1303131A1BFE06892D5FA92686868
          606A6AEA7DB7FBF10FB2727238D0E4A768E3064EB49F60FD86F5B4B7B5F3BCAE
          AD6D78D6794849B987406FAF4AF7CCAEE4E4E40F0D4030182C5439766EDCF482
          2A57C9DFD321D53DC23050E822F5A52439C9AA9739ADC7BF666878B8303535F5
          A401A8A8A8482C2B2B2BB7DBEDEFA9ABAA958451A20B8E6380F4B6948AA48091
          99992B475B5A5A7678BDDEABB7EEA96155D37E33E4FF86CEFA4BCD497DFD1F78
          2D59FD39ED1C080000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'basket_put'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000034F4944415478DA7D937F4CD4651CC75FCFF7EEF0BC5A5B
          9CA07F7831C74DE8C772DD4198FCF2172CEB0CBCB5A6D19A96EB6C5654A49BB4
          0CDB0ED3A07FC8853BAD56A163158263CC20D28E434B04E76609C2AD769533E0
          46637570C7714FCFF70BF3CF3EDBB3F7B33DEFCF6BCFF37E9E47AC0DDC60FF13
          B9CC0BF8F8A4C0B614340D5292F6B9792A506531D1A1092A532988CDC0CB2F4A
          4C128E760D231E0B0C2B400E71B5685D02CD9F0ACC6648249181E73F643A7693
          B7BE6926CD84984BC29E5D92D9382CD174C008A2F49311B9EFC9D5C41208936A
          3CFED90260760EE9DF5EC5C8ED16BEF8413598114905F0ED94CC2BB5A5218F76
          8D22D81F92EB562FE38027473F86F8E88438253476AC5D03EEEC0799FCF76722
          B7E1D23590294EBFB25B3EABB62FFD9DA3FC383AA500CA474DFF9582DC4CEABC
          4E3E3826D8EB7D9CCC4C2BC313ED08E5C859B68DF1F1198EB59D63DF5E495D5B
          989F86A3D05890279A0ED79DAADAB96B47FA913F2978682507BD0EDE6F1214AF
          03E72A8C1AFB158217E1C0AB92436DBF73F9FA1FCCBCED50A17F7E5A1CA9F7CB
          3D2FEDE6E6E818F9AD665E285CCE1B8E24BE6E279B4A1600BD41156EF918815B
          269A82E35CDF1E67A53397E6C00984DFEF9FF4783CF6997FA6B10815901448AC
          58B47B79EDBC53CDA169C31889D4141AB368CA93549EA577DF4367676754CFE0
          E1C3F5F5D7EE5BA5CC2A25A343594DC28259B31A3B48A6661538C1E2227A3091
          DFC2D4D6D6AE110D0D0D24934959B27E23030303B8DD6E86868694E62DAA9BC1
          C12BB85C2EA583866AEAA5052F7CAFAEDB2C0C402C16FB65FD864DF7A7A559B9
          782944715109A17EA585C5F4F5F7DDD1A2C222FA427DE429F885F3DFDDB0D96C
          0F18806834FA6549E9C62A87C3413C11A7B7B797F2F2727A7A7A282B2B337473
          D966BABFED66ABC7432412D177D0926EB73F271A1B1B99989838989FFFE8A1E2
          D2528E3707D8E6ADE46CC7592A2A2BE868EFE0295DCFB4E3D9EA61C58AE58482
          4175DCCBEF666464BC6700C2E1F01697EB912EEFD3CF20D42F1A9F8C22D4EFD1
          33D31F9294FA5492916E47AA3F70E6EBAF18BA7A754B7676F639035053537397
          CFE77B332B2BEB1D65B5A836E3892E24BE10BE9EBF5424054C4C4DFDDDD2DADA
          FA7A7575F5F41D9F2ABB1A598B2DFF573AEB2F356EE9F3FF00D4B45CFD1CC765
          2E0000000049454E44AE426082}
      end>
    Left = 144
    Top = 24
  end
end
