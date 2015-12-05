object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calc'
  ClientHeight = 390
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBetType: TPanel
    Left = 0
    Top = 67
    Width = 347
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 323
    object Label5: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 45
      Height = 33
      Align = alLeft
      AutoSize = False
      Caption = 'Bet type'
      Layout = tlCenter
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 216
      Top = 3
      Width = 75
      Height = 33
      Align = alLeft
      Action = actModeSr
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 0
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 54
      Top = 3
      Width = 75
      Height = 33
      Align = alLeft
      Action = actModeQualifier
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxButton5: TcxButton
      AlignWithMargins = True
      Left = 135
      Top = 3
      Width = 75
      Height = 33
      Align = alLeft
      Action = actModeSnr
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 2
    end
  end
  object PanelInputs: TPanel
    Left = 0
    Top = 0
    Width = 347
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 323
    object Panel3: TPanel
      Left = 186
      Top = 0
      Width = 161
      Height = 67
      Align = alClient
      BevelOuter = bvNone
      Color = clInfoBk
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 137
      object Label1: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 145
        Height = 13
        Align = alTop
        Caption = 'Lay commission'
        ExplicitWidth = 73
      end
      object cxButton3: TcxButton
        AlignWithMargins = True
        Left = 49
        Top = 27
        Width = 35
        Height = 32
        Align = alLeft
        Action = actComm2
        Colors.Default = 7581696
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 1
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 8
      end
      object cxButton4: TcxButton
        AlignWithMargins = True
        Left = 90
        Top = 27
        Width = 35
        Height = 32
        Align = alLeft
        Action = actComm5
        Colors.Default = 572159
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 1
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 93
      end
      object cxButton11: TcxButton
        AlignWithMargins = True
        Left = 8
        Top = 27
        Width = 35
        Height = 32
        Align = alLeft
        Action = actComm0
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 1
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 31
      end
      object Panel1: TPanel
        Left = 136
        Top = 28
        Width = 185
        Height = 41
        Caption = 'Panel1'
        TabOrder = 3
      end
    end
    object Panel4: TPanel
      Left = 93
      Top = 0
      Width = 93
      Height = 67
      Align = alLeft
      BevelOuter = bvNone
      Color = 13552631
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 77
        Height = 13
        Align = alTop
        Caption = 'Lay odds'
        ExplicitWidth = 43
      end
      object editLayOdds: TcxSpinEdit
        AlignWithMargins = True
        Left = 8
        Top = 27
        Align = alClient
        ParentFont = False
        Properties.Increment = 0.100000000000000000
        Properties.LargeIncrement = 1.000000000000000000
        Properties.ValueType = vtFloat
        Properties.OnChange = editLayOddsPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Value = 1.900000000000000000
        Width = 77
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 93
      Height = 67
      Align = alLeft
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      TabOrder = 2
      object Label3: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 77
        Height = 13
        Align = alTop
        Caption = 'Back odds'
        ExplicitWidth = 48
      end
      object editBackOdds: TcxSpinEdit
        AlignWithMargins = True
        Left = 8
        Top = 27
        Align = alClient
        ParentFont = False
        Properties.Increment = 0.100000000000000000
        Properties.LargeIncrement = 1.000000000000000000
        Properties.ValueType = vtFloat
        Properties.OnChange = editBackOddsPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.ButtonStyle = btsDefault
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Value = 1.800000000000000000
        Width = 77
      end
    end
  end
  object PanelStake: TPanel
    Left = 0
    Top = 106
    Width = 347
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 323
    object Label4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 45
      Height = 32
      Align = alLeft
      AutoSize = False
      Caption = 'Stake'
      Layout = tlCenter
    end
    object cxButton6: TcxButton
      AlignWithMargins = True
      Left = 218
      Top = 3
      Width = 35
      Height = 32
      Align = alLeft
      Action = actStakeCustom
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 0
    end
    object cxButton7: TcxButton
      AlignWithMargins = True
      Left = 54
      Top = 3
      Width = 35
      Height = 32
      Align = alLeft
      Action = actStake5
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 1
    end
    object cxButton8: TcxButton
      AlignWithMargins = True
      Left = 95
      Top = 3
      Width = 35
      Height = 32
      Align = alLeft
      Action = actStake10
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 2
    end
    object cxButton9: TcxButton
      AlignWithMargins = True
      Left = 177
      Top = 3
      Width = 35
      Height = 32
      Align = alLeft
      Action = actStake50
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 3
    end
    object cxButton10: TcxButton
      AlignWithMargins = True
      Left = 136
      Top = 3
      Width = 35
      Height = 32
      Align = alLeft
      Action = actStake25
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.GroupIndex = 2
      TabOrder = 4
    end
    object editStake: TcxSpinEdit
      AlignWithMargins = True
      Left = 259
      Top = 3
      Align = alClient
      Enabled = False
      ParentFont = False
      Properties.Increment = 5.000000000000000000
      Properties.ValueType = vtFloat
      Properties.OnChange = editBackOddsPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.ButtonStyle = btsDefault
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Value = 100.000000000000000000
      ExplicitWidth = 61
      Width = 85
    end
  end
  object panelSummary: TPanel
    Left = 0
    Top = 362
    Width = 347
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Select a row'
    TabOrder = 3
    ExplicitWidth = 323
  end
  object Panel2: TPanel
    Left = 0
    Top = 144
    Width = 347
    Height = 218
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 44
    ExplicitTop = 176
    ExplicitWidth = 258
    ExplicitHeight = 197
    object Panel6: TPanel
      Left = 308
      Top = 0
      Width = 39
      Height = 218
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object cxButton12: TcxButton
        AlignWithMargins = True
        Left = 3
        Top = 75
        Width = 33
        Height = 30
        Align = alTop
        Action = actModeSr
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 2
        TabOrder = 0
        ExplicitWidth = 39
      end
      object cxButton13: TcxButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 33
        Height = 30
        Align = alTop
        Action = actModeQualifier
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 2
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 39
      end
      object cxButton14: TcxButton
        AlignWithMargins = True
        Left = 3
        Top = 39
        Width = 33
        Height = 30
        Align = alTop
        Action = actModeSnr
        LookAndFeel.NativeStyle = False
        SpeedButtonOptions.GroupIndex = 2
        TabOrder = 2
        ExplicitWidth = 39
      end
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 308
      Height = 218
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 132
      ExplicitTop = 200
      ExplicitWidth = 347
      object GridView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = True
        Navigator.Buttons.GotoBookmark.Visible = True
        Navigator.Buttons.Filter.Visible = True
        OnCellClick = GridViewCellClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragOpening = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Preview.AutoHeight = False
        Styles.Content = stContentNormal
        Styles.OnGetContentStyle = GridViewStylesGetContentStyle
        object colLayOdds: TcxGridColumn
          Caption = 'Lay odds'
          Styles.Header = stHeaderGrey
        end
        object colStake: TcxGridColumn
          Caption = 'Lay stake'
          Options.Editing = False
          Styles.Header = stHeader
        end
        object colRisk: TcxGridColumn
          Caption = 'Liability'
          Options.Editing = False
          Styles.Header = stHeaderGrey
        end
        object colProfitLoss: TcxGridColumn
          Caption = 'P / L'
          Styles.OnGetContentStyle = colProfitLoVssStylesGetContentStyle
          Styles.Header = stHeaderGrey
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 208
    Top = 152
    PixelsPerInch = 96
    object stContentNormal: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stContentGreen: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stContentRed: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13552631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stHeaderGrey: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clMedGray
    end
    object stHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stCenterRow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stCenterRed: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13552631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stCenterGreen: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object ActionList1: TActionList
    Left = 120
    Top = 148
    object actComm2: TAction
      Tag = 2
      Category = 'Comm'
      Caption = '2%'
      OnExecute = actComm2Execute
      OnUpdate = actComm2Update
    end
    object actComm5: TAction
      Tag = 5
      Category = 'Comm'
      Caption = '5%'
      OnExecute = actComm2Execute
      OnUpdate = actComm2Update
    end
    object actModeQualifier: TAction
      Category = 'Mode'
      Caption = 'Qualifier'
      OnExecute = actModeQualifierExecute
      OnUpdate = actModeQualifierUpdate
    end
    object actModeSnr: TAction
      Category = 'Mode'
      Caption = 'Free SNR'
      OnExecute = actModeQualifierExecute
      OnUpdate = actModeQualifierUpdate
    end
    object actModeSr: TAction
      Category = 'Mode'
      Caption = 'Free SR'
    end
    object actStake5: TAction
      Tag = 5
      Category = 'Stake'
      Caption = '5'
      OnExecute = actStake5Execute
      OnUpdate = actStake5Update
    end
    object actStake10: TAction
      Tag = 10
      Category = 'Stake'
      Caption = '10'
      OnExecute = actStake5Execute
      OnUpdate = actStake5Update
    end
    object actStake25: TAction
      Tag = 25
      Category = 'Stake'
      Caption = '25'
      OnExecute = actStake5Execute
      OnUpdate = actStake5Update
    end
    object actStake50: TAction
      Tag = 50
      Category = 'Stake'
      Caption = '50'
      OnExecute = actStake5Execute
      OnUpdate = actStake5Update
    end
    object actStakeCustom: TAction
      Category = 'Stake'
      Caption = 'My:'
      OnExecute = actStake5Execute
      OnUpdate = actStake5Update
    end
    object actComm0: TAction
      Category = 'Comm'
      Caption = '0%'
      OnExecute = actComm2Execute
      OnUpdate = actComm2Update
    end
  end
end
