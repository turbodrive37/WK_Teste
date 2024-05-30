unit UProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UProdutoModel, UProdutoController,
  System.UITypes, Vcl.DBCtrls, Vcl.ExtDlgs, Vcl.Imaging.jpeg, PNGImage;

type
  TFProduto = class(TForm)
    PageControl1: TPageControl;
    TbPesq: TTabSheet;
    TbCad: TTabSheet;
    PnRodape: TPanel;
    PnAdd: TPanel;
    PnAlt: TPanel;
    PnExc: TPanel;
    PnTopo: TPanel;
    EdDesc: TEdit;
    Label1: TLabel;
    DgPrd: TDBGrid;
    BtnBusca: TBitBtn;
    LbId: TLabel;
    EdId: TEdit;
    Label5: TLabel;
    EdCodigo: TEdit;
    Label4: TLabel;
    EdDescricao: TEdit;
    Label2: TLabel;
    EdValor: TEdit;
    Label3: TLabel;
    EdEst: TEdit;
    PnRodape2: TPanel;
    PnSair: TPanel;
    PnSave: TPanel;
    procedure DgPrdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PnAddClick(Sender: TObject);
    procedure NewReg;
    procedure ShowScreen(AValue : Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PnSairClick(Sender: TObject);
    procedure EdValorExit(Sender: TObject);
    procedure PnSaveClick(Sender: TObject);
    procedure PnAltClick(Sender: TObject);
    procedure AltReg(AId : Integer);
    procedure DgPrdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PnExcClick(Sender: TObject);
    procedure ExcReg(AId : Integer; ANome : String);
  private
    { Private declarations }
  public
    { Public declarations }
    mserro : String;
  end;

var
  FProduto: TFProduto;
  objPrd : TProduto;
  objPrdCont : TProdutoController;

implementation

{$R *.dfm}

uses UDados;

procedure TFProduto.ShowScreen(AValue : Boolean);
begin
  TbPesq.TabVisible := AValue;
  TbCad.TabVisible := Not AValue;
end;

procedure TFProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) and (TbPesq.TabVisible) then
    NewReg;
  if key = 13 then
    perform(WM_NEXTDLGCTL, 0, 0);

  if key = VK_ESCAPE then
    begin
      if TbCad.TabVisible then
        PnSairClick(nil)
      else
        Close;
    end;
end;

procedure TFProduto.FormShow(Sender: TObject);
begin
  objPrd     := TProduto.Create;
  objPrdCont := TProdutoController.Create;

  ShowScreen(True);
  EdDesc.SetFocus;
end;

procedure TFProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( objPrd );
  FreeAndNil( objPrdCont );
end;

procedure TFProduto.NewReg;
begin
  ObjPrd.Id := 0;
  EdId.Text := DmDados.NextId('produto', 1);

  Dmdados.FDConexao.StartTransaction;

  ShowScreen(False);
  EdCodigo.SetFocus;
end;

procedure TFProduto.BtnBuscaClick(Sender: TObject);
var
  filtro : string;
begin
  filtro := '';
  if eddesc.text <> '' then
    filtro := ' AND descricao like '+quotedstr('%'+eddesc.text+'%')+' ';

  str_sql := 'SELECT * FROM produto '+
             '  WHERE id_emp = '+wIdEmp.toString + filtro +
             ' order by id ';

  DmDados.Listar(str_sql, DmDados.QProduto);

  DgPrd.SetFocus;
end;

procedure TFProduto.DgPrdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(DmDados.QProduto.RecNo) then
    if not (gdSelected in State) then
       begin
         DgPrd.Canvas.Brush.Color := clskyblue;
         DgPrd.Canvas.FillRect(Rect);
         DgPrd.DefaultDrawDataCell(Rect, Column.Field, State);
       end;
end;

procedure TFProduto.EdValorExit(Sender: TObject);
begin
  try
    TEdit(Sender).text := trim(format('%5.4f',[strtofloat(TEdit(Sender).text)]))
  except
    TEdit(Sender).text := '0,0000';
  end;
end;

procedure TFProduto.PnAddClick(Sender: TObject);
begin
  NewReg;
end;

procedure TFProduto.AltReg(AId : Integer);
begin
  With DmDados.QProduto do
    begin
      objPrd.Id         := FieldByName('id').AsInteger;
      objPrd.IdEmp      := wIdEmp;

      edid.Text         := FieldByName('id').AsString;
      edcodigo.Text     := FieldByName('codigo').AsString;
      eddescricao.text  := FieldByName('descricao').AsString;
      edvalor.text      := trim(format('%5.4f',[FieldByName('valorvenda').AsFloat]));
      edest.text        := trim(format('%5.4f',[FieldByName('estoque').AsFloat]));
    end;

  Dmdados.FDConexao.StartTransaction;

  ShowScreen(False);
end;

procedure TFProduto.ExcReg(AId : Integer; ANome : String);
begin
  objPrd.Id := AId;
  objPrd.IdEmp := wIdEmp;
  objPrd.Descricao := ANome;

  if objPrdCont.ExcluirRegistro( objPrd, mserro ) = false then
    begin
      if mserro <> '' then
        messagedlg(mserro, mtwarning, [mbok], 0)
    end
  else
    begin
      DmDados.QProduto.Refresh;
      messagedlg('REGISTRO EXCLUÍDO COM SUCESSO', mtwarning, [mbok], 0);
    end;
end;

procedure TFProduto.PnAltClick(Sender: TObject);
begin
  if DmDados.QProduto.Fieldbyname('id').AsString <> '' then
    AltReg(DmDados.QProduto.Fieldbyname('id').AsInteger);
end;

procedure TFProduto.PnExcClick(Sender: TObject);
begin
  if DmDados.QProduto.Fieldbyname('id').AsString <> '' then
    ExcReg(DmDados.QProduto.Fieldbyname('id').AsInteger, DmDados.QProduto.Fieldbyname('descricao').AsString);
end;

procedure TFProduto.DgPrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_F2) and (DmDados.QProduto.Fieldbyname('id').AsString <> '') then
    AltReg(DmDados.QProduto.Fieldbyname('id').AsInteger);
  if (key = VK_F3) and (DmDados.QProduto.Fieldbyname('id').AsString <> '') then
    ExcReg(DmDados.QProduto.Fieldbyname('id').AsInteger, DmDados.QProduto.Fieldbyname('descricao').AsString);
end;

procedure TFProduto.PnSairClick(Sender: TObject);
var
  i : integer;
begin
  objPrd.Id := 0;

  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TEdit then
        TEdit(Components[i]).text := '';
    end;
  EdValor.text := '0,0000';
  EdEst.text := '0,0000';

  Dmdados.FDConexao.Rollback;

  ShowScreen(True);
  BtnBuscaClick(Nil);
end;

procedure TFProduto.PnSaveClick(Sender: TObject);
begin
  with objPrd do
    begin
      IdEmp         := wIdEmp;
      Codigo        := EdCodigo.text;
      Descricao     := EdDescricao.text;
      ValorVenda    := StrtoFloat(EdValor.text);
      Estoque       := StrtoFloat(EdEst.text);
    end;

  if objPrdCont.GravarRegistro( objPrd, mserro ) = false then
    messagedlg(mserro, mtwarning, [mbok], 0)
  else
    begin
      messagedlg('REGISTRO GRAVADO COM SUCESSO', mtwarning, [mbok], 0);
      PnSairClick(nil);
    end;
end;

end.
