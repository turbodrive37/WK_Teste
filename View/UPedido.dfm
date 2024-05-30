object FPedido: TFPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 505
  ClientWidth = 639
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
    Width = 639
    Height = 505
    ActivePage = TbPesq
    Align = alClient
    TabOrder = 0
    object TbPesq: TTabSheet
      Caption = 'Pesquisar'
      object PnRodape: TPanel
        Left = 0
        Top = 412
        Width = 631
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
        object PnExc: TPanel
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
          OnClick = PnExcClick
        end
      end
      object PnTopo: TPanel
        Left = 0
        Top = 0
        Width = 631
        Height = 94
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 4
          Top = 4
          Width = 72
          Height = 16
          Caption = 'ID do Pedido'
        end
        object Label2: TLabel
          Left = 305
          Top = 4
          Width = 36
          Height = 16
          Caption = 'Status'
        end
        object Label3: TLabel
          Left = 84
          Top = 4
          Width = 39
          Height = 16
          Caption = 'Cliente'
        end
        object EdNrPd: TEdit
          Left = 4
          Top = 25
          Width = 74
          Height = 24
          CharCase = ecUpperCase
          MaxLength = 8
          NumbersOnly = True
          TabOrder = 0
        end
        object CbStat: TComboBox
          Left = 305
          Top = 25
          Width = 145
          Height = 24
          Style = csDropDownList
          TabOrder = 2
          Items.Strings = (
            ''
            'Aberto'
            'Em pagamento'
            'Finalizado')
        end
        object BtnBusca: TBitBtn
          Left = 176
          Top = 55
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
          TabOrder = 3
          OnClick = BtnBuscaClick
        end
        object EdBusCli: TEdit
          Left = 84
          Top = 25
          Width = 215
          Height = 24
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 1
        end
      end
      object DgPed: TDBGrid
        Left = 0
        Top = 94
        Width = 631
        Height = 318
        Align = alClient
        DataSource = DmDados.DsPed
        DrawingStyle = gdsClassic
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DgPedDrawColumnCell
        OnKeyDown = DgPedKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'Nr Pedido'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idclient'
            Title.Caption = 'C'#243'd. Cliente'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'diavenda'
            Title.Caption = 'Data Venda'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = 'Status'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalvenda'
            Title.Caption = 'Total R$'
            Width = 109
            Visible = True
          end>
      end
    end
    object TbCad: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object LbId: TLabel
        Left = 9
        Top = 8
        Width = 55
        Height = 16
        Caption = 'Nr Pedido'
      end
      object Label4: TLabel
        Left = 93
        Top = 8
        Width = 39
        Height = 16
        Caption = 'Cliente'
      end
      object Label5: TLabel
        Left = 9
        Top = 68
        Width = 36
        Height = 16
        Caption = 'Status'
      end
      object Label11: TLabel
        Left = 173
        Top = 67
        Width = 84
        Height = 16
        Caption = 'Data da Venda'
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
      object EdCliente: TEdit
        Left = 205
        Top = 29
        Width = 280
        Height = 24
        CharCase = ecUpperCase
        MaxLength = 50
        ReadOnly = True
        TabOrder = 1
      end
      object CbStatCad: TComboBox
        Left = 9
        Top = 89
        Width = 145
        Height = 24
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          'Aberto'
          'Em pagamento'
          'Finalizado')
      end
      object mkdtvnd: TMaskEdit
        Left = 173
        Top = 89
        Width = 84
        Height = 24
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object PnRodape2: TPanel
        Left = 0
        Top = 420
        Width = 631
        Height = 54
        Align = alBottom
        TabOrder = 5
        object PnSair: TPanel
          Left = 509
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
      object GroupBox1: TGroupBox
        Left = 0
        Top = 119
        Width = 631
        Height = 301
        Align = alBottom
        Caption = 'Itens do Pedido'
        TabOrder = 4
        TabStop = True
        object Label6: TLabel
          Left = 5
          Top = 16
          Width = 105
          Height = 16
          Caption = 'C'#243'digo do Produto'
        end
        object Label7: TLabel
          Left = 173
          Top = 16
          Width = 32
          Height = 16
          Caption = 'QTDE'
        end
        object LbNome: TLabel
          Left = 9
          Top = 68
          Width = 504
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label8: TLabel
          Left = 240
          Top = 16
          Width = 72
          Height = 16
          Caption = 'Pre'#231'o Venda'
        end
        object Panel1: TPanel
          Left = 2
          Top = 265
          Width = 627
          Height = 34
          Align = alBottom
          TabOrder = 3
          object LbTot: TLabel
            Left = 470
            Top = 6
            Width = 121
            Height = 19
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label12: TLabel
            Left = 322
            Top = 5
            Width = 104
            Height = 19
            Caption = 'Total Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object PnExcit: TPanel
            Left = 129
            Top = 1
            Width = 121
            Height = 32
            Align = alLeft
            Caption = 'F3 - Excluir'
            Color = clMenuHighlight
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial Rounded MT Bold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            TabStop = True
            StyleElements = []
            OnClick = PnExcitClick
          end
          object PnAltIt: TPanel
            Left = 1
            Top = 1
            Width = 128
            Height = 32
            Align = alLeft
            Caption = 'F2 - Alterar'
            Color = clMenuHighlight
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial Rounded MT Bold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            StyleElements = []
            OnClick = PnAltItClick
          end
        end
        object EdCodPrd: TEdit
          Left = 5
          Top = 38
          Width = 105
          Height = 24
          MaxLength = 14
          NumbersOnly = True
          TabOrder = 0
          OnExit = EdCodPrdExit
        end
        object DgItPed: TDBGrid
          Left = 2
          Top = 145
          Width = 627
          Height = 120
          Align = alBottom
          DataSource = DmDados.DsItPed
          DrawingStyle = gdsClassic
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DgItPedDrawColumnCell
          OnKeyDown = DgItPedKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'cod_prod'
              Title.Caption = 'C'#243'digo do Produto'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 248
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtdevnd'
              Title.Caption = 'QTDE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prunit'
              Title.Caption = 'Pr. Venda'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'totalvenda'
              Title.Caption = 'Total'
              Width = 75
              Visible = True
            end>
        end
        object EdQtd: TEdit
          Left = 173
          Top = 38
          Width = 53
          Height = 24
          TabStop = False
          NumbersOnly = True
          TabOrder = 1
          Text = '0'
          OnExit = EdQtdExit
        end
        object PnIncIt: TPanel
          Left = 173
          Top = 99
          Width = 120
          Height = 40
          Caption = 'Confirmar Item'
          Color = clMenuHighlight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          StyleElements = []
          OnClick = PnIncItClick
        end
        object EdPrVnd: TEdit
          Left = 240
          Top = 38
          Width = 72
          Height = 24
          TabStop = False
          NumbersOnly = True
          TabOrder = 2
          Text = '0,00'
          OnExit = EdPrVndExit
        end
        object BtnProd: TBitBtn
          Left = 116
          Top = 37
          Width = 39
          Height = 25
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
            A4646464020202F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9898985C5C5C000000FFFFFF1C1C1CFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9898985C5C5C0000
            00FFFFFF1C1C1C282828FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7BFBFBFBF
            BFBFC3C3C3A0A0A0626262161616FFFFFF1C1C1C101010FFFFFFFFFFFFFFFFFF
            FFFFFFC7C7C77878787C7C7C7474747878787272726666660000000000003636
            36101010FFFFFFFFFFFFFFFFFFEFEFEFA8A8A82C2C2C000000545454ABABAB69
            6969FFFFFF181818000000B8B8B8080808FFFFFFFFFFFFFFFFFFF3F3F3545454
            0000002C2C2C848484D0D0D0C0C0C0D0D0D03A3A3A464646828282000000FFFF
            FFFFFFFFFFFFFFFFFFFFB8B8B8000000242424D8D8D8F0F0F0E4E4E4E4E4E4E6
            E6E6E0E0E0AEAEAE0000009C9C9CFFFFFFFFFFFFFFFFFFFFFFFF444444000000
            FFFFFFE0E0E0E4E4E4E4E4E4E4E4E4E2E2E2E4E4E4E0E0E0585858000000FFFF
            FFFFFFFFFFFFFFFFFFFF000000949494E8E8E8E8E8E8B8B8B8BCBCBCB2B2B2C8
            C8C8E4E4E8E4E4E4F6F6F6000000707070FFFFFFFFFFFFFFFFFF000000848484
            F2F2F2B8B8B8C0C0C0B0B0B0FFFFFFFFFFFFC4C498E4E4E8E8E8E80000008080
            80FFFFFFFFFFFFFFFFFF000000969696D8D8D8BABABAB0B0B0FFFFFFFFFFFFFF
            FFFFDDDDB5E2E2E6F6F6F6000000707070FFFFFFFFFFFFFFFFFF909090000000
            FFFFFFDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFD7D7ABF8F8FC5A5A5A000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF141414444444FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB0B0B0000000DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0404046A6A6AFFFFFFFFFFFFFFFFFFB9B959F3F3FB000000DBDBDBFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979790404047575759F9F9F50
            50581A1A1ADBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 6
          OnClick = BtnProdClick
        end
        object PnCncEd: TPanel
          Left = 307
          Top = 99
          Width = 120
          Height = 40
          Caption = 'Cancelar Edi'#231#227'o'
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial Rounded MT Bold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 7
          Visible = False
          StyleElements = []
          OnClick = PnCncEdClick
        end
      end
      object EdIdCli: TEdit
        Left = 93
        Top = 30
        Width = 61
        Height = 24
        NumbersOnly = True
        TabOrder = 6
        OnExit = EdIdCliExit
      end
      object BtnCli: TBitBtn
        Left = 158
        Top = 29
        Width = 39
        Height = 25
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
          A4646464020202F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF9898985C5C5C000000FFFFFF1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9898985C5C5C0000
          00FFFFFF1C1C1C282828FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7BFBFBFBF
          BFBFC3C3C3A0A0A0626262161616FFFFFF1C1C1C101010FFFFFFFFFFFFFFFFFF
          FFFFFFC7C7C77878787C7C7C7474747878787272726666660000000000003636
          36101010FFFFFFFFFFFFFFFFFFEFEFEFA8A8A82C2C2C000000545454ABABAB69
          6969FFFFFF181818000000B8B8B8080808FFFFFFFFFFFFFFFFFFF3F3F3545454
          0000002C2C2C848484D0D0D0C0C0C0D0D0D03A3A3A464646828282000000FFFF
          FFFFFFFFFFFFFFFFFFFFB8B8B8000000242424D8D8D8F0F0F0E4E4E4E4E4E4E6
          E6E6E0E0E0AEAEAE0000009C9C9CFFFFFFFFFFFFFFFFFFFFFFFF444444000000
          FFFFFFE0E0E0E4E4E4E4E4E4E4E4E4E2E2E2E4E4E4E0E0E0585858000000FFFF
          FFFFFFFFFFFFFFFFFFFF000000949494E8E8E8E8E8E8B8B8B8BCBCBCB2B2B2C8
          C8C8E4E4E8E4E4E4F6F6F6000000707070FFFFFFFFFFFFFFFFFF000000848484
          F2F2F2B8B8B8C0C0C0B0B0B0FFFFFFFFFFFFC4C498E4E4E8E8E8E80000008080
          80FFFFFFFFFFFFFFFFFF000000969696D8D8D8BABABAB0B0B0FFFFFFFFFFFFFF
          FFFFDDDDB5E2E2E6F6F6F6000000707070FFFFFFFFFFFFFFFFFF909090000000
          FFFFFFDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFD7D7ABF8F8FC5A5A5A000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF141414444444FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB0B0B0000000DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0404046A6A6AFFFFFFFFFFFFFFFFFFB9B959F3F3FB000000DBDBDBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979790404047575759F9F9F50
          50581A1A1ADBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 7
        OnClick = BtnCliClick
      end
    end
    object TabPesqReg: TTabSheet
      Caption = 'Buscar Registros'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 412
        Width = 631
        Height = 62
        Align = alBottom
        TabOrder = 0
        object PnPesq: TPanel
          Left = 1
          Top = 1
          Width = 152
          Height = 60
          Align = alLeft
          Caption = 'Selecionar'
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
          OnClick = PnPesqClick
        end
        object PnOutSch: TPanel
          Left = 478
          Top = 1
          Width = 152
          Height = 60
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
          TabOrder = 1
          StyleElements = []
          OnClick = PnOutSchClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 631
        Height = 65
        Align = alTop
        TabOrder = 1
        object Label13: TLabel
          Left = 5
          Top = 4
          Width = 33
          Height = 16
          Caption = 'Nome'
        end
        object BitBtn1: TBitBtn
          Left = 240
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
          OnClick = BitBtn1Click
        end
        object EdPesq: TEdit
          Left = 5
          Top = 25
          Width = 215
          Height = 24
          CharCase = ecUpperCase
          MaxLength = 50
          TabOrder = 0
        end
      end
      object DbgPesq: TDBGrid
        Left = 0
        Top = 65
        Width = 631
        Height = 347
        Align = alClient
        DataSource = DmDados.DsPesq
        DrawingStyle = gdsClassic
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DgPedDrawColumnCell
        OnKeyDown = DbgPesqKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'ID'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 367
            Visible = True
          end>
      end
    end
  end
end
