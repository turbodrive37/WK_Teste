unit UEmpresaModel;

interface

uses
  System.SysUtils, system.uitypes, messages, dialogs;

type
  TEmpresaModel = class
  private
    FLogradouro: String;
    FCNPJ: String;
    FEmail: String;
    FBairro: String;
    FUF: String;
    FCEP: String;
    FID: Integer;
    FIE: String;
    FRazaoSocial: String;
    FCidade: String;
    FTelefone: String;
    procedure SetCNPJ(const Value: String);
    procedure SetRazaoSocial(const Value: String);
  public
    property ID : Integer read FID write FID;
    property RazaoSocial : String read FRazaoSocial write SetRazaoSocial;
    property CNPJ : String read FCNPJ write SetCNPJ;
    property IE : String read FIE write FIE;
    property Logradouro : String read FLogradouro write FLogradouro;
    property Bairro : String read FBairro write FBairro;
    property CEP : String read FCEP write FCEP;
    property Telefone : String read FTelefone write FTelefone;
    property Cidade : String read FCidade write FCidade;
    property UF : String read FUF write FUF;
    property Email : String read FEmail write FEmail;
  end;


implementation

{ TEmpresa }

procedure TEmpresaModel.SetCNPJ(const Value: String);
begin
  if Length(Value) <> 14 then
    raise EArgumentException.Create('CNPJ PRECISA TER 14 DÍGITOS');
  FCNPJ := Value;
end;

procedure TEmpresaModel.SetRazaoSocial(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR A RAZÃO SOCIAL');
  FRazaoSocial := Value;
end;

end.
