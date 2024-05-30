unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.UITypes;

type
  TFMain = class(TForm)
    PnTitulo: TPanel;
    imgMenu: TImage;
    lbuser: TLabel;
    ImgSaida: TImage;
    LbEmp: TLabel;
    PnBotoes: TPanel;
    PnProd: TPanel;
    PnEmp: TPanel;
    PnPedidos: TPanel;
    Image1: TImage;
    PnOut: TPanel;
    PnExit: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EventoSair;
    procedure ImgSaidaClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PnEmpClick(Sender: TObject);
    procedure PnProdClick(Sender: TObject);
    procedure PnPedidosClick(Sender: TObject);
    procedure PnOutClick(Sender: TObject);
    procedure PnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fechar : boolean;
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses UInfEmp, UEmpresa, UDados, UProduto, UPedido;

procedure TFMain.EventoSair;
begin
  if MessageDlg('FINALIZAR APLICAÇÃO ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      fechar := true;
      Close;
      FInfEmp.Close;
    end;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If fechar = false Then
    Action := caNone;
end;

procedure TFMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    EventoSair;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  fechar := false;
end;

procedure TFMain.imgMenuClick(Sender: TObject);
begin
  if PnBotoes.Visible = false then
    PnBotoes.Visible := true
  else
    PnBotoes.Visible := false;
end;

procedure TFMain.ImgSaidaClick(Sender: TObject);
begin
  EventoSair;
end;

procedure TFMain.PnEmpClick(Sender: TObject);
begin
  DmDados.QEmpresas.Refresh;
  FEmpresa.Showmodal;
end;

procedure TFMain.PnExitClick(Sender: TObject);
begin
  EventoSair;
end;

procedure TFMain.PnOutClick(Sender: TObject);
begin
  if MessageDlg('Confirma Logout ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      fechar := true;
      Close;
      FInfEmp.Show;
    end;
end;

procedure TFMain.PnPedidosClick(Sender: TObject);
begin
  str_sql := 'SELECT * from pedido where id_emp = '+wIdEmp.ToString+' order by id ';
  DmDados.Executa_Query(nil, DmDados.QPedido, str_sql, null);

  FPedido.Showmodal;
end;

procedure TFMain.PnProdClick(Sender: TObject);
begin
  str_sql := 'SELECT * from produto where id_emp = '+wIdEmp.ToString+' order by id ';
  DmDados.Executa_Query(nil, DmDados.QProduto, str_sql, null);

  FProduto.Showmodal;
end;

end.
