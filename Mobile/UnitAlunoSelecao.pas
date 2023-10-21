unit UnitAlunoSelecao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmAlunoSelecao = class(TForm)
    rectToolBar: TRectangle;
    Label1: TLabel;
    lvAluno: TListView;
    procedure FormShow(Sender: TObject);
    procedure lvAlunoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure ListarAlunos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlunoSelecao: TFrmAlunoSelecao;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmAlunoSelecao.FormShow(Sender: TObject);
begin
  ListarAlunos;
end;

procedure TFrmAlunoSelecao.ListarAlunos;
var
  item: TListViewItem;
begin
  lvAluno.Items.Clear;
  item := lvAluno.Items.Add;
  item.Text := 'Igor Bonfim';

  item := lvAluno.Items.Add;
  item.Text := 'Marcela Cardoso';
end;

procedure TFrmAlunoSelecao.lvAlunoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if NOT Assigned(FrmPrincipal) then
    Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  FrmPrincipal.Show;
end;

end.
