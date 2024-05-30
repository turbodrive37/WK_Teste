unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, system.uitypes, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lemp: TLabel;
    edlogin: TEdit;
    edsenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edsenhaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edloginKeyPress(Sender: TObject; var Key: Char);
    procedure edsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure SimulaTab(var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses UDados, UInfEmp, UMain; //UMain,

procedure TFLogin.SimulaTab(var Key: Char);
begin
  Key := #0;
  perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFLogin.edloginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SimulaTab(Key);
end;

procedure TFLogin.edsenhaExit(Sender: TObject);
begin
  if (trim(edlogin.text) <> '') and (trim(edsenha.text) <> '') then
    begin
      edlogin.SetFocus;
      str_sql := 'SELECT id FROM usuario '+
                 '  WHERE login = '+quotedstr( edlogin.text )+' '+
                 '    AND senha = '+quotedstr( edsenha.text )+' '+
                 '    AND id_emp = '+wIdEmp.ToString+' ';
      DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

      if DmDados.QExecutor.fields[0].asstring <> '' then
        begin
          FMain.lbuser.caption := 'Olá, '+edlogin.text+'   ';
          FMain.PnBotoes.Visible := false;
          FLogin.Close;
          FMain.showmodal;
        end
      else
        messagedlg('USUÁRIO OU SENHA INVÁLIDOS', mtwarning, [mbok], 0);
    end;
end;

procedure TFLogin.edsenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( CharInSet( Key, ['0'..'9', #8, #13] ) ) then
    key := #0;
  if Key = #13 then
    SimulaTab(Key);
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edlogin.clear;
  edsenha.clear;
end;

procedure TFLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then
    begin
      Close;
      FInfEmp.Close;
    end;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  edlogin.SetFocus;
  FInfEmp.Hide;
end;

end.
