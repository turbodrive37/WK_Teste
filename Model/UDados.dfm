object DmDados: TDmDados
  OldCreateOrder = False
  Height = 338
  Width = 408
  object FDConexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=root'
      'Database=basewk'
      'DriverID=MYSQL')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object QExecutor: TFDQuery
    Connection = FDConexao
    Left = 64
    Top = 72
  end
  object DsEmpresa: TDataSource
    DataSet = QEmpresas
    Left = 16
    Top = 152
  end
  object QEmpresas: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from empresas order by id')
    Left = 16
    Top = 216
  end
  object Mysql_Link: TFDPhysMySQLDriverLink
    DriverID = 'MYSQL'
    VendorLib = 'libmysql.dll'
    Left = 184
    Top = 24
  end
  object DsProd: TDataSource
    DataSet = QProduto
    Left = 88
    Top = 152
  end
  object QProduto: TFDQuery
    AfterOpen = QProdutoAfterOpen
    Connection = FDConexao
    SQL.Strings = (
      'select * from produto order by id')
    Left = 88
    Top = 216
  end
  object DsPed: TDataSource
    DataSet = QPedido
    Left = 259
    Top = 154
  end
  object QPedido: TFDQuery
    AfterOpen = QPedidoAfterOpen
    Connection = FDConexao
    SQL.Strings = (
      'select * from pedido order by id')
    Left = 259
    Top = 218
  end
  object DsItPed: TDataSource
    DataSet = cdsItemPed
    Left = 331
    Top = 154
  end
  object DsPesq: TDataSource
    DataSet = QPesq
    Left = 163
    Top = 155
  end
  object QPesq: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select id, nome from clientes')
    Left = 163
    Top = 218
  end
  object cdsItemPed: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'cod_prod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'qtdevnd'
        DataType = ftFloat
      end
      item
        Name = 'prunit'
        DataType = ftFloat
      end
      item
        Name = 'totalvenda'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsItemPedAfterOpen
    Left = 328
    Top = 216
    object cdsItemPedid: TIntegerField
      FieldName = 'id'
    end
    object cdsItemPedcod_prod: TStringField
      FieldName = 'cod_prod'
    end
    object cdsItemPeddescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsItemPedqtdevnd: TFloatField
      FieldName = 'qtdevnd'
    end
    object cdsItemPedprunit: TFloatField
      FieldName = 'prunit'
    end
    object cdsItemPedtotalvenda: TFloatField
      FieldName = 'totalvenda'
    end
  end
end
