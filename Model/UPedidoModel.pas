unit UPedidoModel;

interface

uses
  System.SysUtils, system.uitypes, messages, dialogs, variants, Data.DB;

type
  TItemPedido = class
  private
    FIdPed: Integer;
    FID: Integer;
    FTotalVenda: Currency;
    FQtde: Currency;
    FIdEmp: Integer;
    FCodProd: String;
    procedure SetQtde(const Value: Currency);
    procedure SetCodProd(const Value: String);

  public
    property ID : Integer read FID write FID;
    property IdEmp : Integer read FIdEmp write FIdEmp;
    property IdPed : Integer read FIdPed write FIdPed;
    property CodProd : String read FCodProd  write SetCodProd;
    property Qtde : Currency read FQtde write SetQtde;
    property TotalVenda : Currency read FTotalVenda write FTotalVenda;
  end;


  TPedido = class
  private
    FIdCli: String;
    FID: Integer;
    FStatus: String;
    FDiaVenda: String;
    FIdEmp: Integer;
    FTotalVenda: Currency;
    procedure SetCliente(const Value: String);
    procedure SetDiaVenda(const Value: String);

  public
    property ID : Integer read FID write FID;
    property IdEmp : Integer read FIdEmp write FIdEmp;
    property IdCli : String read FIdCli write SetCliente;
    property Status : String read FStatus write FStatus;
    property TotalVenda : Currency read FTotalVenda write FTotalVenda;
    property DiaVenda : String read FDiaVenda write SetDiaVenda;
  end;

implementation

{ TPedido }

uses UDados;

procedure TPedido.SetCliente(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR O CLIENTE')
  else
    begin
      str_sql := 'SELECT id from clientes '+
                 '  WHERE id_emp = '+wIdEmp.ToString+
                 '    AND id = '+Value+' ';
      DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
      if not DmDados.QExecutor.IsEmpty then
        FIdCli := Value
      else
        raise EArgumentException.Create('É NECESSÁRIO INFORMAR UM CLIENTE VÁLIDO');
    end;
end;

procedure TPedido.SetDiaVenda(const Value: String);
begin
  try
    StrToDate(Value);
  except
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR UMA DATA VÁLIDA');
  end;
  FDiaVenda := Value;
end;

{ TItemPedido }

procedure TItemPedido.SetCodProd(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR UM CÓDIGO VÁLIDO');
  FCodProd := Value;
end;

procedure TItemPedido.SetQtde(const Value: Currency);
begin
  if Value = 0 then
    raise EArgumentException.Create('QTDE PRECISA SER MAIOR DO QUE ZERO');
  FQtde := Value;
end;

end.
