program WkTest;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.UiTypes,
  windows,
  UInfEmp in 'View\UInfEmp.pas' {FInfEmp},
  UDados in 'Model\UDados.pas' {DmDados: TDataModule},
  ULogin in 'View\ULogin.pas' {FLogin},
  UMain in 'View\UMain.pas' {FMain},
  UEmpresa in 'View\UEmpresa.pas' {FEmpresa},
  UEmpresaModel in 'Model\UEmpresaModel.pas',
  UProduto in 'View\UProduto.pas' {FProduto},
  UProdutoModel in 'Model\UProdutoModel.pas',
  UPedido in 'View\UPedido.pas' {FPedido},
  UEmpresaController in 'Controller\UEmpresaController.pas',
  UProdutoController in 'Controller\UProdutoController.pas',
  UPedidoModel in 'Model\UPedidoModel.pas',
  UPedidoController in 'Controller\UPedidoController.pas';

{$R *.res}

const
  AppName = 'WK App';

begin
  CreateMutex(nil, True, AppName);
  if GetLastError = ERROR_ALREADY_EXISTS then
    MessageDlg('EXISTE OUTRA INSTÂNCIA DO '+AppName+' EM EXECUÇÃO.', mtInformation, [mbOK], 0)
  else
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TDmDados, DmDados);
      Application.CreateForm(TFInfEmp, FInfEmp);
      Application.CreateForm(TFLogin, FLogin);
      Application.CreateForm(TFMain, FMain);
      Application.CreateForm(TFEmpresa, FEmpresa);
      Application.CreateForm(TFProduto, FProduto);
      Application.CreateForm(TFPedido, FPedido);
      Application.Run;
    end;
end.
