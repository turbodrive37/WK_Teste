unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UPedidoModel, UPedidoController,
  Vcl.Mask, System.UITypes;

type
  TFPedido = class(TForm)
    PageControl1: TPageControl;
    TbPesq: TTabSheet;
    TbCad: TTabSheet;
    PnRodape: TPanel;
    PnAdd: TPanel;
    PnAlt: TPanel;
    PnExc: TPanel;
    PnTopo: TPanel;
    EdNrPd: TEdit;
    Label1: TLabel;
    DgPed: TDBGrid;
    Label2: TLabel;
    CbStat: TComboBox;
    BtnBusca: TBitBtn;
    LbId: TLabel;
    EdId: TEdit;
    Label4: TLabel;
    EdCliente: TEdit;
    Label3: TLabel;
    EdBusCli: TEdit;
    Label5: TLabel;
    CbStatCad: TComboBox;
    Label11: TLabel;
    mkdtvnd: TMaskEdit;
    PnRodape2: TPanel;
    PnSair: TPanel;
    PnSave: TPanel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    PnExcit: TPanel;
    PnAltIt: TPanel;
    Label6: TLabel;
    EdCodPrd: TEdit;
    DgItPed: TDBGrid;
    Label7: TLabel;
    EdQtd: TEdit;
    LbNome: TLabel;
    PnIncIt: TPanel;
    Label8: TLabel;
    LbTot: TLabel;
    Label12: TLabel;
    EdIdCli: TEdit;
    BtnCli: TBitBtn;
    TabPesqReg: TTabSheet;
    Panel2: TPanel;
    PnPesq: TPanel;
    Panel4: TPanel;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    EdPesq: TEdit;
    DbgPesq: TDBGrid;
    EdPrVnd: TEdit;
    BtnProd: TBitBtn;
    PnOutSch: TPanel;
    PnCncEd: TPanel;
    procedure DgPedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PnAddClick(Sender: TObject);
    procedure NewReg;
    procedure ShowScreen(AValue : Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdCodPrdExit(Sender: TObject);
    procedure PnSairClick(Sender: TObject);
    procedure EdQtdExit(Sender: TObject);
    procedure DgItPedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PnIncItClick(Sender: TObject);
    procedure BuscaIt(ACodPrd : String);
    procedure LimpaCampos(ANivel : Integer);
    procedure PnAltItClick(Sender: TObject);
    procedure DgPedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DgItPedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PnExcitClick(Sender: TObject);
    procedure AltRegIt(AId : Integer);
    procedure ExcRegIt(AId : Integer; ACodProd : String);
    procedure PnAltClick(Sender: TObject);
    procedure PnExcClick(Sender: TObject);
    procedure AltReg(AId : Integer);
    procedure ExcReg(AId : Integer);
    procedure PnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PnPesqClick(Sender: TObject);
    procedure BtnCliClick(Sender: TObject);
    procedure ShowSearch(AValue : Boolean);
    procedure BtnProdClick(Sender: TObject);
    procedure EdIdCliExit(Sender: TObject);
    procedure BuscaCli(AIdCli : String);
    procedure PnOutSchClick(Sender: TObject);
    procedure EdPrVndExit(Sender: TObject);
    procedure PnCncEdClick(Sender: TObject);
    procedure DbgPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    mserro, nmpesq : string;
    ItCount : Integer;
  end;

var
  FPedido: TFPedido;
  objPed : TPedido;
  objItemPed : TItemPedido;
  objPedCont : TPedidoController;
  objItemPedCont : TItemPedidoController;

implementation

{$R *.dfm}

uses UDados;

procedure TFPedido.ShowScreen(AValue : Boolean);
begin
  TbPesq.TabVisible := AValue;
  TbCad.TabVisible := Not AValue;
end;

procedure TFPedido.ShowSearch(AValue : Boolean);
begin
  DmDados.QPesq.Close;
  EdPesq.clear;
  TabPesqReg.TabVisible := AValue;
  TbCad.TabVisible := Not AValue;
end;

procedure TFPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( objPed );
  FreeAndNil( objItemPed );
  FreeAndNil( objPedCont );
  FreeAndNil( objItemPedCont );
end;

procedure TFPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) and (TbPesq.TabVisible) then
    NewReg;
  if key = 13 then
    perform(WM_NEXTDLGCTL, 0, 0);

  if key = VK_ESCAPE then
    begin
      if TabPesqReg.TabVisible then
        ShowSearch(False)
      else
        begin
          if TbCad.TabVisible then
            PnSairClick(nil)
          else
            Close;
        end;
    end;
end;

procedure TFPedido.FormShow(Sender: TObject);
begin
  objPed          := TPedido.Create;
  objItemPed      := TItemPedido.Create;
  objPedCont      := TPedidoController.Create;
  objItemPedCont  := TItemPedidoController.Create;

  TabPesqReg.TabVisible := False;
  ShowScreen(True);
end;

procedure TFPedido.NewReg;
begin
  ObjPed.Id := 0;
  objItemPed.Id := 0;

  EdId.Visible := false;

  DmDados.LoadItens('0');
  cbstatcad.ItemIndex := 0;
  mkdtvnd.Text        := Datetostr(Date);

  Dmdados.FDConexao.StartTransaction;

  ShowScreen(False);
  EdIdCli.SetFocus;
end;

procedure TFPedido.PnOutSchClick(Sender: TObject);
begin
  ShowSearch(False);
end;

procedure TFPedido.PnAddClick(Sender: TObject);
begin
  NewReg;
end;

procedure TFPedido.PnPesqClick(Sender: TObject);
begin
  if (DmDados.QPesq.Active) and (DmDados.QPesq.Fieldbyname('id').AsString <> '') then
    begin
      if nmpesq = 'clientes' then
        begin
          EdIdCli.text := DmDados.QPesq.Fieldbyname('id').AsString;
          BuscaCli(EdIdCli.text);
        end
      else
        begin
          edCodprd.text := DmDados.QPesq.Fieldbyname('codigo').AsString;
          BuscaIt(edCodprd.text);
        end;

      ShowSearch(False);
    end;
end;

procedure TFPedido.BitBtn1Click(Sender: TObject);
var
  filtro : string;
begin
  filtro := '';
  if edpesq.text <> '' then
    begin
      if nmpesq = 'clientes' then
        filtro := filtro + ' AND nome like '+quotedstr('%'+edpesq.text+'%')+' '
      else
        filtro := filtro + ' AND descricao like '+quotedstr('%'+edpesq.text+'%')+' ';
    end;
  if nmpesq = 'clientes' then
    str_sql := 'SELECT id, nome FROM '
  else
    str_sql := 'SELECT codigo as id, descricao as nome, codigo FROM ';
  str_sql := str_sql + nmpesq +
             '  WHERE id_emp = '+wIdEmp.toString + filtro +
             ' order by id ';
  DmDados.Listar(str_sql, DmDados.QPesq);

  DbgPesq.SetFocus;
end;

procedure TFPedido.BtnBuscaClick(Sender: TObject);
var
  filtro : string;
begin
  filtro := '';
  if ednrpd.text <> '' then
    filtro := ' AND id = '+ednrpd.text+' ';
  if edbuscli.text <> '' then
    filtro := filtro + ' AND cliente like '+quotedstr('%'+edbuscli.text+'%')+' ';
  if cbstat.itemindex > -1  then
    filtro := filtro + ' AND status = '+Quotedstr(cbstat.text)+' ';

  str_sql := 'SELECT * FROM pedido '+
             '  WHERE id_emp = '+wIdEmp.toString + filtro +
             ' order by id ';
  DmDados.Listar(str_sql, DmDados.QPedido);

  DgPed.SetFocus;
  cbstat.itemindex := -1;
end;

procedure TFPedido.BtnCliClick(Sender: TObject);
begin
  nmpesq := 'clientes';
  ShowSearch(True);
end;

procedure TFPedido.BtnProdClick(Sender: TObject);
begin
  nmpesq := 'produto';
  ShowSearch(True);
end;

procedure TFPedido.DbgPesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PnPesqClick(nil);
end;

procedure TFPedido.DgItPedDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(DmDados.cdsItemped.RecNo) then
    if not (gdSelected in State) then
       begin
         DgItPed.Canvas.Brush.Color := clskyblue;
         DgItPed.Canvas.FillRect(Rect);
         DgItPed.DefaultDrawDataCell(Rect, Column.Field, State);
       end;
end;

procedure TFPedido.BuscaIt(ACodPrd : String);
begin
  str_sql := 'SELECT descricao, valorvenda from produto '+
             '  WHERE id_emp = '+wIdEmp.ToString+' '+
             '    AND codigo = '+Quotedstr(ACodPrd)+' ';
  DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
  if DmDados.QExecutor.Fieldbyname('descricao').AsString <> '' then
    begin
      LbNome.caption := DmDados.QExecutor.Fieldbyname('descricao').AsString;
      EdPrVnd.text := trim(format('%5.4f',[DmDados.QExecutor.Fieldbyname('valorvenda').AsFloat]));
    end
  else
    begin
      LbNome.caption := '';
      EdPrVnd.text := '0,00';
    end;
end;

procedure TFPedido.BuscaCli(AIdCli : String);
begin
  str_sql := 'SELECT nome from clientes '+
             '  WHERE id_emp = '+wIdEmp.ToString+' '+
             '    AND id = '+Quotedstr(AIdCli)+' ';
  DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
  if DmDados.QExecutor.Fieldbyname('nome').AsString <> '' then
    edcliente.text := DmDados.QExecutor.Fieldbyname('nome').AsString
  else
    edcliente.Text := '';
end;

procedure TFPedido.AltReg(AId : Integer);
begin
  With DmDados.QPedido do
    begin
      objPed.Id           := FieldByName('id').AsInteger;
      objItemPed.Id       := 0;

      EdId.Text           := FieldByName('id').AsString;
      EdId.Visible        := True;
      DmDados.LoadItens(EdId.Text);

      EdIdCli.Text        := FieldByName('idclient').AsString;
      BuscaCli(EdIdCli.text);

      CbStatCad.ItemIndex := CbStatCad.items.IndexOf(FieldByName('status').AsString);
      mkdtvnd.Text        := FieldByName('diavenda').AsString;
    end;

  Dmdados.FDConexao.StartTransaction;

  LbTot.caption       := trim(format('%5.4f',[dmDados.TotalPed]));
  ShowScreen(False);

  EdIdCli.SetFocus;
end;

procedure TFPedido.ExcReg(AId : Integer);
begin
  objPed.Id     := AId;
  objPed.IdEmp  := wIdEmp;

  if objPedCont.ExcluirRegistro( objPed, mserro ) = false then
    begin
      if mserro <> '' then
        messagedlg(mserro, mtwarning, [mbok], 0)
    end
  else
    begin
      DmDados.QPedido.Refresh;
      messagedlg('REGISTRO EXCLUÍDO COM SUCESSO', mtwarning, [mbok], 0);
    end;
end;

procedure TFPedido.PnAltClick(Sender: TObject);
begin
  if DmDados.QPedido.Fieldbyname('id').AsString <> '' then
    AltReg(DmDados.QPedido.Fieldbyname('id').AsInteger);
end;

procedure TFPedido.PnExcClick(Sender: TObject);
begin
  if DmDados.QPedido.Fieldbyname('id').AsString <> '' then
    ExcReg(DmDados.QPedido.Fieldbyname('id').AsInteger);
end;

procedure TFPedido.DgPedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_F2) or (key = VK_RETURN) ) and
     (DmDados.QPedido.Fieldbyname('id').AsString <> '') then
    AltReg(DmDados.QPedido.Fieldbyname('id').AsInteger);
  if ((key = VK_F3) or (key = VK_DELETE)) and
     (DmDados.QPedido.Fieldbyname('id').AsString <> '') then
    ExcReg(DmDados.QPedido.Fieldbyname('id').AsInteger);
end;

procedure TFPedido.AltRegIt(AId : Integer);
begin
  With DmDados.cdsItemped do
    begin
      objItemPed.Id         := FieldByName('id').AsInteger;
      objItemPed.IdEmp      := wIdEmp;

      edCodprd.Text          := FieldByName('cod_prod').AsString;
      BuscaIt(edCodprd.Text);
      edqtd.Text             := FieldByName('qtdevnd').AsString;
      edPrVnd.Text           := trim(format('%5.4f',[FieldByName('prunit').AsFloat]));
    end;

  PnCncEd.Visible        := true;
  edCodprd.Readonly      := true;
  btnProd.Enabled        := false;
  edqtd.SetFocus;
end;

procedure TFPedido.ExcRegIt(AId : Integer; ACodProd : String);
begin
  objItemPed.Id       := AId;
  objItemPed.IdEmp    := wIdEmp;
  objItemPed.IdPed    := ObjPed.Id;
  objItemPed.CodProd  := ACodProd;

  if objItemPedCont.ExcluirItem( objItemPed, mserro ) = false then
    begin
      if mserro <> '' then
        messagedlg(mserro, mtwarning, [mbok], 0)
    end
  else
    begin
      LbTot.caption := trim(format('%5.4f',[dmDados.TotalPed]));
      LimpaCampos(1);
      messagedlg('REGISTRO EXCLUÍDO COM SUCESSO', mtwarning, [mbok], 0);
    end;
end;

procedure TFPedido.DgItPedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_F2) or (key = VK_RETURN) ) and
     (DmDados.cdsItemped.Fieldbyname('id').AsString <> '') then
    AltRegIt(DmDados.cdsItemped.Fieldbyname('id').AsInteger);
  if ((key = VK_F3) or (key = VK_DELETE)) and
     (DmDados.cdsItemped.Fieldbyname('id').AsString <> '') then
    ExcRegIt(DmDados.cdsItemped.Fieldbyname('id').AsInteger,
             DmDados.cdsItemped.FieldByName('cod_prod').AsString);
end;

procedure TFPedido.DgPedDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(DmDados.QPedido.RecNo) then
    if not (gdSelected in State) then
       begin
         DgPed.Canvas.Brush.Color := clskyblue;
         DgPed.Canvas.FillRect(Rect);
         DgPed.DefaultDrawDataCell(Rect, Column.Field, State);
       end;
end;


procedure TFPedido.EdCodPrdExit(Sender: TObject);
begin
  if (edCodprd.text <> '') and (edCodprd.Readonly = false) then
    begin
      edCodprd.text := formatfloat('00000000000000', strtofloat(edCodprd.text));
      BuscaIt(edCodprd.text);
    end;
end;

procedure TFPedido.EdIdCliExit(Sender: TObject);
begin
  if EdIdCli.text <> '' then
    BuscaCli(EdIdCli.text);
end;

procedure TFPedido.EdPrVndExit(Sender: TObject);
begin
  try
    TEdit(Sender).text := trim(format('%5.4f',[strtofloat(TEdit(Sender).text)]))
  except
    TEdit(Sender).text := '0,0000';
  end;
end;

procedure TFPedido.EdQtdExit(Sender: TObject);
begin
  try
    Strtoint(EdQtd.Text);
  Except
    EdQtd.Text := '0';
  end;
end;

procedure TFPedido.LimpaCampos(ANivel : Integer);
var
  i : Integer;
begin
  objItemPed.Id := 0;

  if ANivel >= 1 then
    begin
      EdCodPrd.Clear;
      LbNome.Caption      := '';
      EdPrVnd.text        := '0,00';
      EdQtd.Text          := '0';
      EdCodprd.Readonly   := false;
      btnProd.Enabled     := true;
      PnCncEd.Visible     := false;
    end;

  if ANivel = 2 then
    begin
      for i := 0 to ComponentCount - 1 do
        begin
          if Components[i] is TEdit then
            TEdit(Components[i]).text := '';
          if Components[i] is TMaskEdit then
            TMaskEdit(Components[i]).text := '';
        end;

      CbStatCad.itemindex := -1;
      EdQtd.Text := '0';

      ShowScreen(True);
      BtnBuscaClick(Nil);

      Dmdados.FDConexao.Rollback;
    end;
end;


procedure TFPedido.PnIncItClick(Sender: TObject);
begin
  if (LbNome.caption <> '') and
     (Strtofloat(EdQtd.Text) > 0) and
     (StrtoFloat(EdPrVnd.text) > 0) then
    begin
      if objItemPed.Id = 0 then
        begin
          Inc(ItCount);

          dmDados.InsertItem(ItCount,
                             EdCodPrd.text,
                             LbNome.caption,
                             Strtofloat(EdQtd.Text),
                             StrtoFloat(EdPrVnd.text),
                             StrtoFloat(EdQtd.text) * StrtoFloat(EdPrVnd.text)
                            );
        end
      else
        begin
          With DmDados.cdsItemped do
            begin
              Locate('id', objItemPed.Id, []);
              Edit;
              FieldByName('qtdevnd').AsFloat     := Strtofloat(EdQtd.Text);
              FieldByName('prunit').AsFloat      := StrtoFloat(EdPrVnd.text);
              FieldByName('totalvenda').AsFloat  := StrtoFloat(EdQtd.text) * StrtoFloat(EdPrVnd.text);
              Post;
            end;
        end;

      LimpaCampos(1);
      EdCodPrd.Setfocus;
      LbTot.caption := trim(format('%5.4f',[dmDados.TotalPed]));

      messagedlg('REGISTRO GRAVADO COM SUCESSO', mtwarning, [mbok], 0);
    end
  else
    begin
      EdCodPrd.Setfocus;

      messagedlg('É NECESSÁRIO INFORMAR UM ITEM E UMA QTDE VÁLIDA', mtwarning, [mbok], 0);
    end;
end;


procedure TFPedido.PnAltItClick(Sender: TObject);
begin
  if (DmDados.cdsItemped.Fieldbyname('id').AsString <> '') then
    AltRegIt(DmDados.cdsItemped.Fieldbyname('id').AsInteger);
end;

procedure TFPedido.PnCncEdClick(Sender: TObject);
begin
  LimpaCampos(1);
end;

procedure TFPedido.PnExcitClick(Sender: TObject);
begin
  if (DmDados.cdsItemped.Fieldbyname('id').AsString <> '') then
    ExcRegIt(DmDados.cdsItemped.Fieldbyname('id').AsInteger,
             DmDados.cdsItemped.FieldByName('cod_prod').AsString);
end;

procedure TFPedido.PnSairClick(Sender: TObject);
begin
  LimpaCampos(2);
end;

procedure TFPedido.PnSaveClick(Sender: TObject);
begin
  with objPed do
    begin
      IdEmp         := wIdEmp;
      IdCli         := EdIdCli.text;
      Status        := CbStatCad.text;
      DiaVenda      := mkdtvnd.Text;
      TotalVenda    := Strtofloat(lbtot.caption);
    end;

  if objPedCont.GravarRegistro( objPed, mserro ) = false then
    messagedlg(mserro, mtwarning, [mbok], 0)
  else
    begin
      messagedlg('REGISTRO GRAVADO COM SUCESSO', mtwarning, [mbok], 0);
      LimpaCampos(2);
    end;
end;

end.
