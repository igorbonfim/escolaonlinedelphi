unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    edtCPF: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Rectangle1: TRectangle;
    btnAcessar: TSpeedButton;
    Label3: TLabel;
    procedure btnAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UnitAlunoSelecao;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
  if NOT Assigned(FrmAlunoSelecao) then
    Application.CreateForm(TfrmAlunoSelecao, FrmAlunoSelecao);

  FrmAlunoSelecao.Show;
end;

end.
