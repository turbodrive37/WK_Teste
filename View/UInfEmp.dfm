object FInfEmp: TFInfEmp
  Left = 197
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecionar Empresa'
  ClientHeight = 350
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object DgEmp: TDBGrid
    Left = 0
    Top = 0
    Width = 582
    Height = 262
    Align = alClient
    DataSource = DmDados.DsEmpresa
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razaosocial'
        Title.Caption = 'Raz'#227'o Social'
        Width = 436
        Visible = True
      end>
  end
  object StBar: TStatusBar
    Left = 0
    Top = 324
    Width = 582
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Panels = <
      item
        Width = 50
      end>
    UseSystemFont = False
    ExplicitTop = 231
  end
  object PnRodape: TPanel
    Left = 0
    Top = 262
    Width = 582
    Height = 62
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 256
    object PnAces: TPanel
      Left = 209
      Top = 1
      Width = 152
      Height = 60
      Align = alCustom
      Caption = 'Acessar'
      Color = clMenuHighlight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      OnClick = PnAcesClick
    end
  end
end
