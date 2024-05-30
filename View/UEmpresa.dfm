object FEmpresa: TFEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Empresas'
  ClientHeight = 448
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 472
    Height = 448
    ActivePage = TbPesq
    Align = alClient
    TabOrder = 0
    object TbPesq: TTabSheet
      Caption = 'Pesquisar'
      object PnRodape: TPanel
        Left = 0
        Top = 355
        Width = 464
        Height = 62
        Align = alBottom
        TabOrder = 0
        object PnAdd: TPanel
          Left = 1
          Top = 1
          Width = 152
          Height = 60
          Align = alLeft
          Caption = 'F1 - Adicionar'
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
          OnClick = PnAddClick
        end
        object PnAlt: TPanel
          Left = 153
          Top = 1
          Width = 152
          Height = 60
          Align = alLeft
          Caption = 'F2 - Alterar'
          Color = clMenuHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          StyleElements = []
          OnClick = PnAltClick
        end
        object Panel2: TPanel
          Left = 305
          Top = 1
          Width = 152
          Height = 60
          Align = alLeft
          Caption = 'F3 - Excluir'
          Color = clMenuHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          StyleElements = []
          OnClick = Panel2Click
        end
      end
      object PnTopo: TPanel
        Left = 0
        Top = 0
        Width = 464
        Height = 57
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 4
          Top = 6
          Width = 151
          Height = 16
          Caption = 'Digite o nome da empresa'
        end
        object EdDesc: TEdit
          Left = 4
          Top = 25
          Width = 237
          Height = 24
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object BtnBusca: TBitBtn
          Left = 314
          Top = 23
          Width = 120
          Height = 28
          Caption = '&Filtrar'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A4A4A4006464640002020200F6F6F600FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00989898005C5C5C0000000000FF00FF001C1C1C00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00989898005C5C5C0000000000FF00FF001C1C1C0028282800FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00B7B7B700BFBFBF00BFBFBF00C3C3C300A0A0
            A0006262620016161600FF00FF001C1C1C0010101000FF00FF00FF00FF00FF00
            FF00FF00FF00C7C7C700787878007C7C7C007474740078787800727272006666
            660000000000000000003636360010101000FF00FF00FF00FF00FF00FF00EFEF
            EF00A8A8A8002C2C2C000000000054545400ABABAB0069696900FF00FF001818
            180000000000B8B8B80008080800FF00FF00FF00FF00FF00FF00F3F3F3005454
            5400000000002C2C2C0084848400D0D0D000C0C0C000D0D0D0003A3A3A004646
            46008282820000000000FF00FF00FF00FF00FF00FF00FF00FF00B8B8B8000000
            000024242400D8D8D800F0F0F000E4E4E400E4E4E400E6E6E600E0E0E000AEAE
            AE00000000009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00444444000000
            0000FF00FF00E0E0E000E4E4E400E4E4E400E4E4E400E2E2E200E4E4E400E0E0
            E0005858580000000000FF00FF00FF00FF00FF00FF00FF00FF00000000009494
            9400E8E8E800E8E8E800B8B8B800BCBCBC00B2B2B200C8C8C800E4E4E800E4E4
            E400F6F6F6000000000070707000FF00FF00FF00FF00FF00FF00000000008484
            8400F2F2F200B8B8B800C0C0C000B0B0B000FF00FF00FF00FF00C4C49800E4E4
            E800E8E8E8000000000080808000FF00FF00FF00FF00FF00FF00000000009696
            9600D8D8D800BABABA00B0B0B000FF00FF00FF00FF00FF00FF00DDDDB500E2E2
            E600F6F6F6000000000070707000FF00FF00FF00FF00FF00FF00909090000000
            0000FF00FF00DBDBDB00FF00FF00FF00FF00FF00FF00FF00FF00D7D7AB00F8F8
            FC005A5A5A0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001414
            140044444400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B0B0
            B00000000000DFDFDF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00040404006A6A6A00FF00FF00FF00FF00FF00FF00B9B95900F3F3FB000000
            0000DBDBDB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF007979790004040400757575009F9F9F00505058001A1A1A00DBDB
            DB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          TabOrder = 1
          OnClick = BtnBuscaClick
        end
      end
      object DgEmp: TDBGrid
        Left = 0
        Top = 57
        Width = 464
        Height = 298
        Align = alClient
        DataSource = DmDados.DsEmpresa
        DrawingStyle = gdsClassic
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DgEmpDrawColumnCell
        OnKeyDown = DgEmpKeyDown
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
            Width = 367
            Visible = True
          end>
      end
    end
    object TbCad: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      OnShow = TbCadShow
      object LbId: TLabel
        Left = 9
        Top = 8
        Width = 12
        Height = 16
        Caption = 'ID'
      end
      object Label3: TLabel
        Left = 112
        Top = 8
        Width = 28
        Height = 16
        Caption = 'CNPJ'
      end
      object Label4: TLabel
        Left = 9
        Top = 72
        Width = 73
        Height = 16
        Caption = 'Raz'#227'o Social'
      end
      object Label5: TLabel
        Left = 293
        Top = 8
        Width = 19
        Height = 16
        Caption = 'I.E.'
      end
      object Label6: TLabel
        Left = 9
        Top = 128
        Width = 53
        Height = 16
        Caption = 'Endere'#231'o'
      end
      object Label7: TLabel
        Left = 9
        Top = 184
        Width = 34
        Height = 16
        Caption = 'Bairro'
      end
      object Label8: TLabel
        Left = 325
        Top = 184
        Width = 22
        Height = 16
        Caption = 'CEP'
      end
      object Label9: TLabel
        Left = 9
        Top = 240
        Width = 39
        Height = 16
        Caption = 'Cidade'
      end
      object Label10: TLabel
        Left = 325
        Top = 240
        Width = 15
        Height = 16
        Caption = 'UF'
      end
      object Label11: TLabel
        Left = 325
        Top = 296
        Width = 50
        Height = 16
        Caption = 'Telefone'
      end
      object Label12: TLabel
        Left = 9
        Top = 296
        Width = 36
        Height = 16
        Caption = 'E-mail'
      end
      object EdId: TEdit
        Left = 9
        Top = 30
        Width = 73
        Height = 24
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
      object MkCnpj: TMaskEdit
        Left = 112
        Top = 30
        Width = 128
        Height = 24
        EditMask = '99.999.999/9999-99;0;_'
        MaxLength = 18
        TabOrder = 1
        Text = ''
      end
      object EdRazao: TEdit
        Left = 9
        Top = 94
        Width = 336
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object EdIe: TEdit
        Left = 293
        Top = 30
        Width = 136
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object Edlog: TEdit
        Left = 9
        Top = 150
        Width = 336
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object EdBairro: TEdit
        Left = 9
        Top = 206
        Width = 288
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object mkcep: TMaskEdit
        Left = 325
        Top = 206
        Width = 84
        Height = 24
        EditMask = '99.999-999;0;_'
        MaxLength = 10
        TabOrder = 6
        Text = ''
      end
      object edcidade: TEdit
        Left = 9
        Top = 262
        Width = 288
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 7
      end
      object eduf: TEdit
        Left = 325
        Top = 262
        Width = 32
        Height = 24
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 8
      end
      object mkfone: TMaskEdit
        Left = 325
        Top = 318
        Width = 104
        Height = 24
        EditMask = '(99)99999-9999;0;_'
        MaxLength = 14
        TabOrder = 10
        Text = ''
      end
      object edemail: TEdit
        Left = 9
        Top = 318
        Width = 288
        Height = 24
        CharCase = ecLowerCase
        TabOrder = 9
      end
      object PnRodape2: TPanel
        Left = 0
        Top = 363
        Width = 464
        Height = 54
        Align = alBottom
        TabOrder = 11
        object PnSair: TPanel
          Left = 342
          Top = 1
          Width = 121
          Height = 52
          Align = alRight
          Caption = 'Sair'
          Color = clMenuHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          TabStop = True
          StyleElements = []
          OnClick = PnSairClick
        end
        object PnSave: TPanel
          Left = 1
          Top = 1
          Width = 128
          Height = 52
          Align = alLeft
          Caption = '&Salvar'
          Color = clMenuHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          StyleElements = []
          OnClick = PnSaveClick
        end
      end
    end
  end
end
