unit UProdutoModel;

interface

uses
  System.SysUtils, system.uitypes, messages, dialogs;

type
  TProduto = class
  private
    FValorVenda: Currency;
    FDescricao: String;
    FCodigo: String;
    FCurrency: Currency;
    FID: Integer;
    FIdEmp: Integer;

    procedure SetDescricao(const Value: String);
    procedure SetValorVenda(const Value: Currency);
    procedure SetCodigo(const Value: String);
  public
    property ID : Integer read FID write FID;
    property IdEmp : Integer read FIdEmp write FIdEmp;
    property Codigo : String read FCodigo write SetCodigo;
    property Descricao : String read FDescricao write SetDescricao;
    property ValorVenda : Currency read FValorVenda write SetValorVenda;
    property Estoque: Currency read FCurrency write FCurrency;
  end;

implementation

{ TProduto }

procedure TProduto.SetCodigo(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR O CÓDIGO DO PRODUTO')
  else
    begin
      try
        FCodigo := FormatFloat('00000000000000', Strtofloat(Value));
      except
        raise EArgumentException.Create('CÓDIGO DO PRODUTO INVÁLIDO')
      end;
    end;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR O NOME DO PRODUTO');
  FDescricao := Value;
end;

procedure TProduto.SetValorVenda(const Value: Currency);
begin
  if Value = 0 then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR UM VALOR VÁLIDO');
  FValorVenda := Value;
end;

end.
