unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.ImageList, FMX.ImgList, FMX.Calendar, FMX.Layouts,
  FMX.ListBox;

type
  TFrmPrincipal = class(TForm)
    rectAbas: TRectangle;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    rectToolBar: TRectangle;
    Image1: TImage;
    Rectangle1: TRectangle;
    Image2: TImage;
    Rectangle2: TRectangle;
    Image3: TImage;
    Rectangle3: TRectangle;
    Image4: TImage;
    lvSocial: TListView;
    imgList: TImageList;
    Image5: TImage;
    lvBoletim: TListView;
    Calendar1: TCalendar;
    Rectangle4: TRectangle;
    lblDia: TLabel;
    lvCalendario: TListView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Label1: TLabel;
    Image6: TImage;
    Line1: TLine;
    ListBoxItem2: TListBoxItem;
    Label2: TLabel;
    Image7: TImage;
    Line2: TLine;
    ListBoxItem3: TListBoxItem;
    Label3: TLabel;
    Image8: TImage;
    Line3: TLine;
    procedure img1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Calendar1DateSelected(Sender: TObject);
  private
    procedure MudarAba(img: TImage);
    procedure AddMensagem(id_mensagem: integer; nome, dt, mensagem: string;
      qtd_likes, qtd_comentarios: integer);
    procedure ListarMensagens;
    procedure AddBoletim(disciplina: string; nota: double; faltas: integer);
    procedure ListarBoletim;
    procedure ListarCalendario(dt: TDate);
    procedure AddCalendario(descricao, hora: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.AddMensagem(id_mensagem: integer;
                                    nome, dt, mensagem: string;
                                    qtd_likes, qtd_comentarios: integer);
var
  item: TListViewItem;
begin
  item := lvSocial.Items.Add;
  item.Tag := id_mensagem;

  TListItemText(item.Objects.FindDrawable('txtNome')).Text := nome;
  TListItemText(item.Objects.FindDrawable('txtMensagem')).Text := mensagem;
  TListItemText(item.Objects.FindDrawable('txtData')).Text := dt;
  TListItemText(item.Objects.FindDrawable('txtLike')).Text := FormatFloat('#,##', qtd_likes);
  TListItemText(item.Objects.FindDrawable('txtComentario')).Text := FormatFloat('#,##', qtd_comentarios);

  with imgList.Source do
  begin
    TListItemImage(item.Objects.FindDrawable('imgBall')).Bitmap := Items[0].MultiResBitmap.ItemByScale(1, true, true).Bitmap;
    TListItemImage(item.Objects.FindDrawable('imgLike')).Bitmap := Items[1].MultiResBitmap.ItemByScale(1, true, true).Bitmap;
    TListItemImage(item.Objects.FindDrawable('imgComment')).Bitmap := Items[2].MultiResBitmap.ItemByScale(1, true, true).Bitmap;
  end;
end;

procedure TFrmPrincipal.AddBoletim(disciplina: string;
                                   nota: double;
                                   faltas: integer);
var
  item: TListViewItem;
begin
  item := lvBoletim.Items.Add;

  TListItemText(item.Objects.FindDrawable('txtDisciplina')).Text := disciplina;
  TListItemText(item.Objects.FindDrawable('txtNota1')).Text := 'Notas';
  TListItemText(item.Objects.FindDrawable('txtNota2')).Text := FormatFloat('0.0', nota);
  TListItemText(item.Objects.FindDrawable('txtFalta1')).Text := 'Faltas';
  TListItemText(item.Objects.FindDrawable('txtFalta2')).Text := faltas.ToString;
end;

procedure TFrmPrincipal.AddCalendario(descricao, hora: string);
var
  item: TListViewItem;
begin
  lvCalendario.Items.Clear;
  item := lvCalendario.Items.Add;

  TListItemText(item.Objects.FindDrawable('txtDescricao')).Text := descricao;
  TListItemText(item.Objects.FindDrawable('txtHora')).Text := hora;
end;

procedure TFrmPrincipal.ListarMensagens;
begin
  AddMensagem(0, 'Igor Pereira', '19/10/2023', 'Isso � um teste de mensagem', 20, 10);
  AddMensagem(0, 'Marcela Cardoso', '19/10/2023', 'Isso � um teste de mensagem', 2800, 1034);
  AddMensagem(0, 'Pedro Igor', '19/10/2023', 'Isso � um teste de mensagem', 20, 10);
  AddMensagem(0, 'Igor Pereira', '19/10/2023', 'Isso � um teste de mensagem', 20, 10);
  AddMensagem(0, 'Igor Pereira', '19/10/2023', 'Isso � um teste de mensagem', 20, 10);
end;

procedure TFrmPrincipal.ListarBoletim;
begin
  AddBoletim('Matem�tica', 10, 1);
  AddBoletim('F�sica', 9.2, 3);
  AddBoletim('Qu�mica', 8.9, 0);
  AddBoletim('Biologia', 9.5, 2);
  AddBoletim('Portugu�s', 10, 2);
end;

procedure TFrmPrincipal.ListarCalendario(dt: TDate);
begin
  lblDia.Text := 'Atividades de ' + FormatDateTime('dd/mm', dt);

  lvCalendario.Items.Clear;
  AddCalendario('Reuni�o de pais e mestres', '10:00');
  AddCalendario('Reuni�o de pais e mestres', '10:00');
  AddCalendario('Reuni�o de pais e mestres', '10:00');
  AddCalendario('Reuni�o de pais e mestres', '10:00');
end;

procedure TFrmPrincipal.Calendar1DateSelected(Sender: TObject);
begin
  ListarCalendario(Calendar1.Date);
end;

procedure TFrmPrincipal.MudarAba(img: TImage);
begin
  img1.Opacity := 0.5;
  img2.Opacity := 0.5;
  img3.Opacity := 0.5;
  img4.Opacity := 0.5;

  img.Opacity := 1;
  TabControl1.GotoVisibleTab(img.Tag);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  MudarAba(img1);

  ListarMensagens;
  ListarBoletim;
  ListarCalendario(Calendar1.Date);
end;

procedure TFrmPrincipal.img1Click(Sender: TObject);
begin
  MudarAba(TImage(Sender));
end;

end.
