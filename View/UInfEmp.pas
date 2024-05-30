unit UInfEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, IniFiles, Buttons, system.uitypes, Data.DB,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFInfEmp = class(TForm)
    DgEmp: TDBGrid;
    StBar: TStatusBar;
    PnRodape: TPanel;
    PnAces: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PnAcesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInfEmp: TFInfEmp;


implementation

{$R *.dfm}

uses UDados, ULogin, UMain;

procedure TFInfEmp.FormShow(Sender: TObject);
begin
  With DmDados do
    begin
      stbar.Panels[0].text := Conectar;
      if FDConexao.Connected then
        begin
          PnAces.Enabled := true;
          PnAces.Color := clMenuHighlight;
          QEmpresas.Open;
        end
      else
        begin
          PnAces.Enabled := False;
          PnAces.Color := clGray;
        end;
    end;

  DgEmp.setfocus;
end;

procedure TFInfEmp.PnAcesClick(Sender: TObject);
begin
  wIdEmp := DmDados.QEmpresas.Fieldbyname('id').AsInteger;
  FMain.lbemp.caption := '  '+DmDados.QEmpresas.Fieldbyname('razaosocial').AsString +
                        ' ('+DmDados.MascObj('CNPJ', DmDados.QEmpresas.Fieldbyname('cnpj').AsString) +')';

  FLogin.Show;
end;

procedure TFInfEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFInfEmp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    perform(WM_NEXTDLGCTL,0,0);
  if key = VK_ESCAPE then
    Application.Terminate;
end;

end.
