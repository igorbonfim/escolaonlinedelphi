program Escola;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitAlunoSelecao in 'UnitAlunoSelecao.pas' {FrmAlunoSelecao},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmAlunoSelecao, FrmAlunoSelecao);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
