unit UProdutoController;

interface

uses
  UProdutoModel, UDados, system.SysUtils, variants, system.uitypes,
  messages, dialogs, Data.DB;

type
  TProdutoController = class
  private

  public
    function GravarRegistro(oProduto : TProduto; out sErro : String) : boolean;
    function ExcluirRegistro(oProduto: TProduto; out sErro: String): boolean;

  end;

implementation

{ TProdutoController }

function TProdutoController.ExcluirRegistro(oProduto: TProduto;
  out sErro: String): boolean;
begin
  sErro := '';
  Result := false;
  if oProduto.Id > 0 then
    begin
      if MessageDlg('CONFIRMA A EXCLUSÃO DO PRODUTO '+#13+oProduto.Descricao+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Dmdados.FDConexao.StartTransaction;

            str_sql := 'DELETE FROM produto '+
                       '  WHERE id_emp = '+oProduto.IdEmp.ToString+' '+
                       '    AND id = '+oProduto.Id.ToString;
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

function TProdutoController.GravarRegistro(oProduto: TProduto;
  out sErro: String): boolean;
begin
  try
    sErro := '';
    Result := true;
    with oProduto do
      begin
        if ID = 0 then
          begin
            str_sql := 'SELECT id from produto '+
                       '  WHERE id_emp = '+wIdEmp.ToString+
                       '    AND codigo = '+quotedstr(Codigo)+' ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
            if DmDados.QExecutor.IsEmpty then
              begin
                str_sql := 'INSERT INTO produto '+
                           ' (id_emp, codigo, descricao, valorvenda, estoque) '+
                           ' VALUES '+
                           ' ('+wIdEmp.ToString+', '+quotedstr(Codigo)+', '+quotedstr(descricao)+', :valor, :estoq) ';
                DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ valorvenda, estoque ]));

                Dmdados.FDConexao.Commit;
              end
            else
              begin
                Result := false;
                sErro := 'CÓDIGO JÁ CADASTRADO';
              end;
          end
        else
          begin
            str_sql := 'SELECT id from produto '+
                       '  WHERE id_emp = '+wIdEmp.ToString+
                       '    AND id <> '+Id.ToString+
                       '    AND codigo = '+quotedstr(Codigo)+' ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
            if DmDados.QExecutor.IsEmpty then
              begin
                str_sql := 'UPDATE produto set codigo = '+quotedstr(Codigo)+', descricao = '+quotedstr(descricao)+', valorvenda =:valor, estoque =:estoq '+
                           ' WHERE id_emp = :idemp '+
                           '   AND id = :id ';
                DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ valorvenda, estoque, IdEmp, ID ]));

                Dmdados.FDConexao.Commit;
              end
            else
              begin
                Result := false;
                sErro := 'CÓDIGO PERTENCE A OUTRO PRODUTO';
              end;
          end;
      end;
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
