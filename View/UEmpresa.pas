unit UEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UEmpresaModel, UEmpresaController,
  Vcl.Mask, System.UITypes;

type
  TFEmpresa = class(TForm)
    PageControl1: TPageControl;
    TbPesq: TTabSheet;
    TbCad: TTabSheet;
    PnRodape: TPanel;
    PnAdd: TPanel;
    PnAlt: TPanel;
    Panel2: TPanel;
    PnTopo: TPanel;
    EdDesc: TEdit;
    Label1: TLabel;
    DgEmp: TDBGrid;
    BtnBusca: TBitBtn;
    LbId: TLabel;
    EdId: TEdit;
    Label3: TLabel;
    MkCnpj: TMaskEdit;
    Label4: TLabel;
    EdRazao: TEdit;
    Label5: TLabel;
    EdIe: TEdit;
    Label6: TLabel;
    Edlog: TEdit;
    Label7: TLabel;
    EdBairro: TEdit;
    Label8: TLabel;
    mkcep: TMaskEdit;
    Label9: TLabel;
    edcidade: TEdit;
    Label10: TLabel;
    eduf: TEdit;
    Label11: TLabel;
    mkfone: TMaskEdit;
    Label12: TLabel;
    edemail: TEdit;
    PnRodape2: TPanel;
    PnSair: TPanel;
    PnSave: TPanel;
    procedure DgEmpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PnAddClick(Sender: TObject);
    procedure NewReg;
    procedure FormShow(Sender: TObject);
    procedure ShowScreen(AValue : Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnBuscaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TbCadShow(Sender: TObject);
    procedure PnSaveClick(Sender: TObject);
    procedure PnSairClick(Sender: TObject);
    procedure DgEmpKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AltReg(AId : Integer);
    procedure ExcReg(AId : Integer; ARaz : String);
    procedure PnAltClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mserro : String;
  end;

var
  FEmpresa: TFEmpresa;
  objEmp : TEmpresaModel;
  objEmpCont : TEmpresaController;

implementation

{$R *.dfm}

uses  UDados;

procedure TFEmpresa.ShowScreen(AValue : Boolean);
begin
  TbPesq.TabVisible := AValue;
  TbCad.TabVisible := Not AValue;
end;

procedure TFEmpresa.TbCadShow(Sender: TObject);
begin
  mkcnpj.SetFocus;
end;

procedure TFEmpresa.FormShow(Sender: TObject);
begin
  objEmp     := TEmpresaModel.Create;
  objEmpCont := TEmpresaController.Create;

  ShowScreen(True);
  EdDesc.SetFocus;
end;

procedure TFEmpresa.NewReg;
begin
  objEmp.Id := 0;
  LbId.Visible := false;
  EdId.Visible := false;

  Dmdados.FDConexao.StartTransaction;

  ShowScreen(False);
end;

procedure TFEmpresa.BtnBuscaClick(Sender: TObject);
var
  filtro : string;
begin
  filtro := '';
  if eddesc.text <> '' then
    filtro := ' where razaosocial like '+quotedstr('%'+eddesc.text+'%')+' ';

  str_sql := 'SELECT * FROM empresas '+filtro+' order by id';
  DmDados.Listar(str_sql, DmDados.QEmpresas);

  DgEmp.SetFocus;
end;

procedure TFEmpresa.DgEmpDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(DmDados.QEmpresas.RecNo) then
    if not (gdSelected in State) then
       begin
         DgEmp.Canvas.Brush.Color := clskyblue;
         DgEmp.Canvas.FillRect(Rect);
         DgEmp.DefaultDrawDataCell(Rect, Column.Field, State);
       end;
end;

procedure TFEmpresa.AltReg(AId : Integer);
begin
  With DmDados.QEmpresas do
    begin
      objEmp.Id       := FieldByName('id').AsInteger;

      lbid.Visible    := true;
      edid.Visible    := true;
      edid.Text       := FieldByName('id').AsString;
      mkcnpj.Text     := FieldByName('cnpj').AsString;
      edrazao.text    := FieldByName('razaosocial').AsString;
      edie.text       := FieldByName('ie').AsString;
      Edlog.text      := FieldByName('logradouro').AsString;
      EdBairro.text   := FieldByName('bairro').AsString;
      mkcep.text      := FieldByName('cep').AsString;
      mkfone.text     := FieldByName('telefone').AsString;
      edcidade.text   := FieldByName('cidade').AsString;
      eduf.text       := FieldByName('uf').AsString;
      edemail.text    := FieldByName('email').AsString;
    end;

  Dmdados.FDConexao.StartTransaction;

  ShowScreen(False);
end;

procedure TFEmpresa.ExcReg(AId : Integer; ARaz : String);
begin
  objEmp.Id := AId;
  objEmp.RazaoSocial := ARaz;
  if objEmpCont.ExcluirRegistro( objEmp, mserro ) = false then
    begin
      if mserro <> '' then
        messagedlg(mserro, mtwarning, [mbok], 0)
    end
  else
    begin
      DmDados.QEmpresas.Refresh;
      messagedlg('REGISTRO EXCLUÍDO COM SUCESSO', mtwarning, [mbok], 0);
    end;
end;

procedure TFEmpresa.PnAltClick(Sender: TObject);
begin
  if DmDados.QEmpresas.Fieldbyname('id').AsString <> '' then
    AltReg(DmDados.QEmpresas.Fieldbyname('id').AsInteger);
end;

procedure TFEmpresa.Panel2Click(Sender: TObject);
begin
  if DmDados.QEmpresas.Fieldbyname('id').AsString <> '' then
    ExcReg(DmDados.QEmpresas.Fieldbyname('id').AsInteger, DmDados.QEmpresas.Fieldbyname('razaosocial').AsString);
end;

procedure TFEmpresa.DgEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_F2) or (key = VK_RETURN) ) and
     (DmDados.QEmpresas.Fieldbyname('id').AsString <> '') then
    AltReg(DmDados.QEmpresas.Fieldbyname('id').AsInteger);
  if ((key = VK_F3) or (key = VK_DELETE)) and
     (DmDados.QEmpresas.Fieldbyname('id').AsString <> '') then
    ExcReg(DmDados.QEmpresas.Fieldbyname('id').AsInteger, DmDados.QEmpresas.Fieldbyname('razaosocial').AsString);
end;

procedure TFEmpresa.PnSaveClick(Sender: TObject);
begin
  with objEmp do
    begin
      RazaoSocial := edrazao.text;
      CNPJ        := mkcnpj.text;
      IE          := edie.text;
      Logradouro  := edlog.text;
      Bairro      := edbairro.text;
      CEP         := mkcep.text;
      Telefone    := mkfone.text;
      Cidade      := edcidade.text;
      UF          := eduf.text;
      Email       := edemail.text;
    end;

  if objEmpCont.GravarRegistro( objEmp, mserro ) = false then
    messagedlg(mserro, mtwarning, [mbok], 0)
  else
    begin
      messagedlg('REGISTRO GRAVADO COM SUCESSO', mtwarning, [mbok], 0);
      PnSairClick(nil);
    end;
end;

procedure TFEmpresa.PnAddClick(Sender: TObject);
begin
  NewReg;
end;

procedure TFEmpresa.PnSairClick(Sender: TObject);
var
  I : integer;
begin
  objEmp.Id := 0;

  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TEdit then
        TEdit(Components[i]).text := '';
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).text := '';
    end;

  Dmdados.FDConexao.RollBack;

  ShowScreen(True);
  BtnBuscaClick(Nil);
end;

procedure TFEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( objEmp );
  FreeAndNil( objEmpCont );
end;

procedure TFEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
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

end.

