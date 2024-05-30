unit UPedidoController;

interface

uses
  UPedidoModel, UDados, system.SysUtils, variants, system.uitypes,
  messages, dialogs;

type

  TItemPedidoController = class
  private

  public
    function ExcluirItem(oItemPedido: TItemPedido; out sErro: String): boolean;
  end;


  TPedidoController = class
  private

  public
    function GravarRegistro(oPedido : TPedido; out sErro : String) : boolean;
    function ExcluirRegistro(oPedido: TPedido; out sErro: String): boolean;
  end;

implementation

{ TPedidoController }

function TPedidoController.ExcluirRegistro(oPedido: TPedido;
  out sErro: String): boolean;
begin
  sErro := '';
  Result := false;
  if oPedido.Id > 0 then
    begin
      if MessageDlg('CONFIRMA O CANCELAMENTO DO PEDIDO '+#13+oPedido.Id.ToString+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            Dmdados.FDConexao.StartTransaction;

            str_sql := 'DELETE FROM itempedido '+
                       '  WHERE id_emp = '+oPedido.IdEmp.ToString+' '+
                       '    AND id_pedido = '+oPedido.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            str_sql := 'DELETE FROM pedido '+
                       '  WHERE id_emp = '+oPedido.IdEmp.ToString+' '+
                       '    AND id = '+oPedido.Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            Dmdados.FDConexao.Commit;

            Result := true;
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

function TPedidoController.GravarRegistro(oPedido: TPedido;
  out sErro: String): boolean;
var
  wIdPed : String;

  procedure GravaItens;
  begin
    With Dmdados.cdsItemPed do
      begin
        First;
        while not Eof do
          begin
            str_sql := 'INSERT INTO itempedido '+
                       ' (id_emp, id_pedido, cod_prod, qtdevnd, prunit, totalvenda) '+
                       ' VALUES '+
                       ' ('+wIdEmp.ToString+', '+wIdPed+', '+quotedstr(fieldbyname('cod_prod').Asstring)+', :qtde, :prunt, :totvnd) ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ fieldbyname('qtdevnd').AsFloat, fieldbyname('prunit').AsFloat, fieldbyname('totalvenda').AsFloat ]));

            Next;
          end;
      end;
  end;

begin
  try
    sErro := '';
    with oPedido do
      begin
        if ID = 0 then
          begin
            str_sql := 'INSERT INTO pedido '+
                       ' (id_emp, idclient, status, diavenda, totalvenda) '+
                       ' VALUES '+
                       ' ('+wIdEmp.ToString+', :idcli, '+quotedstr(Status)+', :diavenda, :totalvenda) ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ IdCli, diavenda, totalvenda ]));

            wIdPed := DmDados.NextId('pedido', 0);

            GravaItens;
          end
        else
          begin
            str_sql := 'UPDATE pedido set idclient =:idcli, status = '+quotedstr(Status)+', diavenda =:diavenda, totalvenda =:totalvnd '+
                       ' WHERE id_emp = :idemp '+
                       '   AND id = :id ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([IdCli, diavenda, totalvenda, IdEmp, ID ]));

            wIdPed := Id.ToString;

            str_sql := 'DELETE FROM itempedido '+
                     '  WHERE id_emp = '+IdEmp.ToString+' '+
                     '    AND id_pedido = '+Id.ToString;
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

            GravaItens;
          end;
      end;

    Dmdados.FDConexao.Commit;

    result := true;
  except
    ON E : Exception do
      begin
        sErro := 'FALHA AO GRAVAR REGISTRO: '+e.message;
        Result := false;
        Dmdados.FDConexao.Rollback;
      end;
  end;
end;

{ TItemPedidoController }

function TItemPedidoController.ExcluirItem(oItemPedido: TItemPedido;
  out sErro: String): boolean;
begin
  sErro := '';
  Result := false;
  if MessageDlg('CONFIRMA A REMOÇÃO DO ITEM '+#13+oItemPedido.CodProd+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if oItemPedido.IdPed > 0 then
        begin
          str_sql := 'DELETE FROM itempedido '+
                     '  WHERE id_emp = '+oItemPedido.IdEmp.ToString+
                     '    AND id_pedido = '+oItemPedido.IdPed.ToString+
                     '    AND id = '+oItemPedido.Id.ToString;
          DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
        end;

      With DmDados.cdsItemped do
        begin
          Locate('id', oItemPedido.Id, []);

          Delete;
        end;

      Result := true;
    end;
end;

end.
