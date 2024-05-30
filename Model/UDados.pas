unit UDados;

interface

uses
  System.SysUtils, System.Classes, MaskUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, inifiles, variants, Vcl.StdCtrls,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Datasnap.DBClient;

type
  TDmDados = class(TDataModule)
    FDConexao: TFDConnection;
    QExecutor: TFDQuery;
    DsEmpresa: TDataSource;
    QEmpresas: TFDQuery;
    Mysql_Link: TFDPhysMySQLDriverLink;
    DsProd: TDataSource;
    QProduto: TFDQuery;
    DsPed: TDataSource;
    QPedido: TFDQuery;
    DsItPed: TDataSource;
    DsPesq: TDataSource;
    QPesq: TFDQuery;
    cdsItemPed: TClientDataSet;
    cdsItemPedqtdevnd: TFloatField;
    cdsItemPedcod_prod: TStringField;
    cdsItemPedprunit: TFloatField;
    cdsItemPedtotalvenda: TFloatField;
    cdsItemPeddescricao: TStringField;
    cdsItemPedid: TIntegerField;

    procedure LeINI;
    function Conectar : String;
    Procedure Executa_Query(NConexao : TFDConnection; MQuery : TFDQuery; SqlComb : string; parametros : variant);
    function ValidarLogin(slogin : string; iidfuncionario : integer) : boolean;
    function MascObj(TpM, VlObj : string) : string;
    function VerificaCNPJ(CNPJ: string): Boolean;
    function NextId(ATable : String; AAcr : Integer) : String;
    procedure LoadItens(AIdPed : String);
    function TotalPed : Double;
    procedure Listar(ASql : String; AObjQry : TFDQuery);
    procedure QProdutoAfterOpen(DataSet: TDataSet);
    procedure InsertItem(AId : Integer; ACodProd, ADescricao : String; AQtde, APrUnit, ATotVnd : Double);
    procedure cdsItemPedAfterOpen(DataSet: TDataSet);
    procedure QPedidoAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    Ip_Servidor, Database, Senha, Usuario : string;
  end;

var
  DmDados: TDmDados;
  str_sql, configini : string;
  wIdEmp : Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UPedido;

{$R *.dfm}

function tDmDados.MascObj(TpM, VlObj : string) : string;
begin
  Result := vlobj;
  if length(VlObj) > 0 then
    begin
      if tpm = 'CNPJ' then
        Result := FormatMaskText('99.999.999/9999-99;0', vlobj);
      if tpm = 'CPF' then
        Result := FormatMaskText('999.999.999-99;0', vlobj);
      if tpm = 'CEP' then
        Result := FormatMaskText('99.999-999;0', vlobj);
      if tpm = 'FONE' then
        begin
          if length(vlobj) = 10 then
            Result := FormatMaskText('(99)9999-9999;0', vlobj)
          else
            Result := FormatMaskText('(99)99999-9999;0', vlobj);
        end;
    end;
end;

function tDmDados.VerificaCNPJ(CNPJ: string): Boolean;
var
  CNPJCalc: string;
  SomaCNPJ, CNPJDigit: Integer;
  I: Byte;
begin
  try
    CNPJCalc:= Copy(CNPJ, 1, 12);
    SomaCNPJ:= 0;
    for I:= 1 to 4 do
      SomaCNPJ:= SomaCNPJ + StrToInt(Copy(CNPJCalc, I, 1)) * (6 - I);
    for I:= 1 to 8 do
      SomaCNPJ:= SomaCNPJ + StrToInt(Copy(CNPJCalc, I + 4, 1)) * (10 - I);
    CNPJDigit:= 11 - SomaCNPJ mod 11;
    if CNPJDigit in [10, 11] then
      CNPJCalc:= CNPJCalc + '0'
    else
      CNPJCalc:= CNPJCalc + IntToStr(CNPJDigit);
    SomaCNPJ:= 0;
    for I:= 1 to 5 do
      SomaCNPJ:= SomaCNPJ + StrToInt(Copy(CNPJCalc, I, 1)) * (7 - I);
    for I:= 1 to 8 do
      SomaCNPJ:= SomaCNPJ + StrToInt(Copy(CNPJCalc, I + 5, 1)) * (10 - I);
    CNPJDigit:= 11 - SomaCNPJ mod 11;
    if CNPJDigit in [10, 11] then
      CNPJCalc:= CNPJCalc + '0'
    else
      CNPJCalc:= CNPJCalc + IntToStr(CNPJDigit);
    Result:= (CNPJ = CNPJCalc);
  except
    Result:= False;
  end;
end;

Procedure tDmDados.Executa_Query(NConexao : TFDConnection; MQuery : TFDQuery; SqlComb : string; parametros : variant);
var
  i, j : integer;
begin
  With MQuery do
    begin
      Close;

      if Nconexao <> nil then
        MQuery.Connection := NConexao;

      Sql.clear;
      Sql.text := SqlComb;

      if not VarIsNull(parametros) then
        begin
          if VarIsArray(Parametros)  then
            begin
              i := VarArrayLowBound(Parametros, 1);
              j := VarArrayHighBound(Parametros, 1);
              while i <= j do
                begin
                  MQuery.Params[i].Value := Parametros[i];
                  Inc(i);
                end;
            end
          else
            MQuery.Params[0].Value := Parametros;
        end;

      if (Ansiuppercase(copy(sqlcomb, 1, 6)) = 'SELECT') or (Ansiuppercase(copy(sqlcomb, 1, 4)) = 'SHOW') then
        Open
      else
        Execute;
    end;
end;

function tDmDados.NextId(ATable : String; AAcr : Integer) : String;
begin
  str_sql := 'SELECT MAX(id) from '+ATable+' '+
             '  WHERE id_emp = '+wIdEmp.ToString;
  Executa_Query(nil, QExecutor, str_sql, null);
  if QExecutor.Fields[0].AsString <> '' then
    Result := IntToStr(QExecutor.Fields[0].AsInteger + AAcr)
  else
    Result := '1';
end;

procedure TDmDados.QPedidoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(QPedido.FieldByName('totalvenda')).DisplayFormat := '0.00';
end;

procedure TDmDados.QProdutoAfterOpen(DataSet: TDataSet);
begin
  TNumericField(QProduto.FieldByName('valorvenda')).DisplayFormat := '0.0000';
end;

function tDmDados.ValidarLogin(slogin : string; iidfuncionario : integer) : boolean;
begin
  Result := true;
  str_sql := 'select id from usuario where login = '+quotedstr(slogin)+' and id <>:idusu';
  Executa_Query(nil, QExecutor, str_sql, varArrayof([ iidfuncionario ]));
  if QExecutor.Fields[0].AsString <> '' then
    Result := false;
end;

procedure TDmDados.cdsItemPedAfterOpen(DataSet: TDataSet);
begin
  TNumericField(cdsItemPed.FieldByName('qtdevnd')).DisplayFormat := '0.0000';
  TNumericField(cdsItemPed.FieldByName('prunit')).DisplayFormat := '0.0000';
  TNumericField(cdsItemPed.FieldByName('totalvenda')).DisplayFormat := '0.00';
end;

procedure tDmDados.InsertItem(AId : Integer; ACodProd, ADescricao : String; AQtde, APrUnit, ATotVnd : Double);
begin
  With cdsItemped do
    begin
      Append;
      FieldByName('id').AsInteger        := Aid;
      FieldByName('cod_prod').AsString   := ACodProd;
      FieldByName('descricao').AsString  := ADescricao;
      FieldByName('qtdevnd').AsFloat     := AQtde;
      FieldByName('prunit').AsFloat      := APrUnit;
      FieldByName('totalvenda').AsFloat  := ATotVnd;
      Post;
    end;
end;

procedure tDmDados.LoadItens(AIdPed : String);
var
  id : integer;
begin
  cdsItemped.Active := False;
  cdsItemped.CreateDataSet;

  cdsItemped.Active := True;
  cdsItemped.EmptyDataSet;

  str_sql := 'SELECT itpd.*, p.descricao, p.valorvenda FROM itempedido itpd '+
             '  INNER JOIN produto p ON itpd.cod_prod = p.codigo '+
             '  WHERE itpd.id_emp = '+wIdEmp.ToString+' '+
             '    AND itpd.id_pedido = '+AIdPed+' ';
  Executa_Query(nil, QExecutor, str_sql, null);

  With QExecutor do
    begin
      First;
      if AIdPed = '0' then
        id := 1
      else
        id := FieldByName('id').AsInteger;
      while not Eof do
        begin
          if AIdPed <> '0' then
            id := FieldByName('id').AsInteger;

          InsertItem(id,
                     FieldByName('cod_prod').AsString,
                     FieldByName('descricao').AsString,
                     FieldByName('qtdevnd').AsFloat,
                     FieldByName('prunit').AsFloat,
                     FieldByName('totalvenda').AsFloat);
          inc(id);
          Next;
        end;
    end;

  FPedido.ItCount := cdsItemped.RecordCount;
end;

procedure tDmDados.Listar(ASql : String; AObjQry : TFDQuery);
begin
  Executa_Query(nil, AObjQry, ASql, null);
end;

function tDmDados.TotalPed : Double;
var
  vltot : Double;
begin
  vltot := 0;
  With cdsItemPed do
    begin
      Close;
      Open;
      First;
      while not EOF do
        begin
          vltot := vltot + FieldByName('totalvenda').AsFloat;

          Next;
        end;
      First;
    end;
  Result := vltot;
end;

procedure tDmDados.LeINI;
var
  ArqIni : TIniFile;
begin
  ArqIni := TIniFile.Create(configini);
  try
    Ip_Servidor := ArqIni.ReadString('BaseDados', 'Ip_Servidor', Ip_Servidor);
    Database    := ArqIni.ReadString('BaseDados', 'Database', DataBase);
    Senha       := ArqIni.ReadString('BaseDados', 'Senha', Senha);
    Usuario     := ArqIni.ReadString('BaseDados', 'Usuario', Usuario);
  finally
    ArqIni.Free;
  end;
end;

function TDmDados.Conectar : String;
begin
  Result := '';
  FdConexao.Connected := false;
  configini := ExtractFilePath(ParamStr(0))+ 'wktest.ini';

  if fileexists(configini) then
    begin
      Leini;

      try
        Mysql_Link.VendorLib := ExtractFilePath(ParamStr(0))+ 'libmysql.dll';

        with FDConexao do
          begin
            Params.Clear;
            LoginPrompt := false;
            DriverName :=  'MYSQL';
            Params.DriverID  :=  'MYSQL';
            Params.Database  :=  Database;
            Params.UserName  :=  Usuario;
            Params.Password  :=  Senha;
            Params.Add('server='+ Ip_Servidor);
            Connected := true;
          end;
        Result := 'Banco de Dados: '+database+'  |  IP: '+ip_servidor;
      Except
        on E:Exception do
          begin
            FDConexao.Connected := false;
            Result := 'FALHA NA CONEXÃO COM O BANCO DE DADOS: '  + #13#10 + E.Message;
          end;
      end;
    end
  else
    Result := 'ARQUIVO '+configini+' NÃO ENCONTRADO';
end;

end.
