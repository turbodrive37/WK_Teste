unit UEmpresaController;

interface

uses
  UEmpresaModel, UDados, system.SysUtils, variants, system.uitypes,
  messages, dialogs;

type
  TEmpresaController = class
  private

  public
    function GravarRegistro(oEmpresa : TEmpresaModel; out sErro : String) : boolean;
    function ExcluirRegistro(oEmpresa: TEmpresaModel; out sErro: String): boolean;

  end;

implementation

{ TEmpresaController }

function TEmpresaController.ExcluirRegistro(oEmpresa: TEmpresaModel;
  out sErro: String): boolean;
begin
  sErro := '';
  Result := false;
  if oEmpresa.Id > 0 then
    begin
      if MessageDlg('CONFIRMA A EXCLUSÃO DE TODOS OS DADOS DA EMPRESA '+#13+oEmpresa.RaZaoSocial+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Dmdados.FDConexao.StartTransaction;

            str_sql := 'DELETE FROM itempedido '+
                       '  WHERE id_emp = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM pedido '+
                       '  WHERE id_emp = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM produto '+
                       '  WHERE id_emp = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM clientes '+
                       '  WHERE id_emp = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM usuario '+
                       '  WHERE id_emp = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM empresas '+
                       '  WHERE id = '+oEmpresa.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
            Result := true;

            Dmdados.FDConexao.Commit;
          Except
            ON E : Exception do
              begin
                sErro := 'FALHA AO EXCLUIR REGISTRO: '+e.message;
                Result := false;
                Dmdados.FDConexao.Rollback;
              end;
          end;
        end;
    end;
end;

function TEmpresaController.GravarRegistro(oEmpresa: TEmpresaModel;
  out sErro: String): boolean;
var
  ultemp : String;
begin
  try
    sErro := '';
    with oEmpresa do
      begin
        if ID = 0 then
          begin
            str_sql := 'INSERT INTO empresas '+
                       ' (cnpj, razaosocial, ie, logradouro, bairro, cep, telefone, cidade, uf, email) '+
                       ' VALUES '+
                       ' ('+quotedstr(cnpj)+', '+quotedstr(razaosocial)+', '+quotedstr(ie)+', '+quotedstr(logradouro)+', '+
                       '   '+quotedstr(bairro)+', '+quotedstr(cep)+', '+quotedstr(telefone)+', '+quotedstr(cidade)+', '+quotedstr(uf)+', '+
                       '   '+quotedstr(email)+' )';

            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'SELECT MAX(id) AS ultid from empresas ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
            ultemp := DmDados.QExecutor.Fields[0].AsString;

            str_sql := 'INSERT INTO usuario '+
                       ' (id_emp, nome, login, senha) '+
                       '    VALUES '+
                       ' ('+ultemp+', ''SENSEI'', ''SENSEI'', ''1234'') ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
          end
        else
          begin
            str_sql := 'UPDATE empresas set cnpj = '+quotedstr(cnpj)+', razaosocial = '+quotedstr(razaosocial)+', ie = '+quotedstr(ie)+', logradouro = '+quotedstr(logradouro)+', bairro = '+quotedstr(bairro)+', '+
                       ' cep = '+quotedstr(cep)+', telefone = '+quotedstr(telefone)+', cidade = '+quotedstr(cidade)+', uf = '+quotedstr(uf)+', email = '+quotedstr(email)+' '+
                       ' WHERE id = :idemp ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ ID ]));
          end;
      end;

    result := true;

    Dmdados.FDConexao.Commit;
  except
    ON E : Exception do
      begin
        sErro := 'FALHA AO GRAVAR REGISTRO: '+e.message;
        Result := false;

        Dmdados.FDConexao.Rollback;
      end;
  end;
end;

end.
