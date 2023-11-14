unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, DBGrids,
  DBCtrls, RTTIGrids, Uler_dxf, Uobjetos, Uclasse_base, Classes, DB, SQLDB,
  SQLite3Conn,  PropEdits, ObjectInspector;

type

  { TFrBaseDados }

  TFrBaseDados = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    TIPropertyGrid1: TTIPropertyGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure RadioButton10Change(Sender: TObject);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure SQLite3Connection1AfterConnect(Sender: TObject);
    procedure TIPropertyGrid1Click(Sender: TObject);
    procedure TIPropertyGrid1EditorFilter(Sender: TObject;
      aEditor: TPropertyEditor; var aShow: boolean);
    procedure TIPropertyGrid1Enter(Sender: TObject);
    procedure TIPropertyGrid1Modified(Sender: TObject);
    procedure ZcAfterConnect(Sender: TObject);
  private

  public

  end;

var
  FrBaseDados: TFrBaseDados;
  PPGvalor, PPGnome: string;

implementation

var
  Selecionar_objeto: integer;
  tudo: boolean;

{$R *.lfm}

{ TFrBaseDados }

procedure TFrBaseDados.FormCreate(Sender: TObject);
begin

  if (screen.Width <> 1920) then
  begin
    Height := longint(Height) * longint(screen.Height) div 1080;
    Width := longint(Width) * longint(screen.Width) div 1920;
    scaleBy(screen.Width, 1920);
  end;

end;

procedure TFrBaseDados.ListBox1Click(Sender: TObject);
var
  SelTexto: string;
  f: integer;
begin
  TIPropertyGrid1.TIObject := nil;
  SelTexto := Listbox1.GetSelectedText;
  for f := 0 to lista.Count - 1 do
    if minhaClasse(lista.items[f]).Objeto = SelTexto then
    begin
      TIPropertyGrid1.TIObject := minhaclasse(lista.items[f]);
      exit;
    end;

  if TIPropertyGrid1.TIObject = nil then ShowMessage('Nada encotrado');

end;

procedure TFrBaseDados.RadioButton10Change(Sender: TObject);
begin
  tudo := False;
end;

procedure TFrBaseDados.RadioGroup1SelectionChanged(Sender: TObject);
var
  objetoAachar: string;
begin

end;

procedure TFrBaseDados.SQLite3Connection1AfterConnect(Sender: TObject);
begin

end;

procedure TFrBaseDados.TIPropertyGrid1Click(Sender: TObject);
begin

end;

procedure TFrBaseDados.TIPropertyGrid1EditorFilter(Sender: TObject;
  aEditor: TPropertyEditor; var aShow: boolean);
begin

end;

procedure TFrBaseDados.TIPropertyGrid1Enter(Sender: TObject);
begin
  PPGnome := TIPropertygrid1.GetActiveRow.Name;
  ShowMessage(TIPropertygrid1.GetActiveRow.Name);
end;

procedure TFrBaseDados.TIPropertyGrid1Modified(Sender: TObject);
var
  r: integer;
begin
  r := QuestionDlg('Aviso',
    'Esta alteração será global em todas as variáveis deste tipo ',
    mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');
  if r = mrYes then;
end;

procedure TFrBaseDados.ZcAfterConnect(Sender: TObject);
begin

end;

procedure TFrBaseDados.Button10Click(Sender: TObject);
begin
  {
  Zq.Active := False;
  Zq.Close;
  Zq.SQL.Clear;
  // Zq.SQL.ADD('select * from objetos where indice> :campo');
  Zq.SQL.ADD('select * from objetos where indice=:campo');

  //  Zq.ParamByName('campo').AsString := Edit2.Text;
  //showmessage(zq.sql.text);
  //edit1.Text:=zq.sql.text;
  Zq.Open;
  ShowMessage(zq.FieldByName('ax').AsString);
  }
end;

procedure TFrBaseDados.Button15Click(Sender: TObject);
begin
{  Zq.Active := False;
  Zq.Close;
  Zq.SQL.Clear;
  Zq.SQL.ADD(
    'insert into Tiluminacao (acionamento,acionamento_id,circuito,potencia,Px,Py) values (:acionamento,:acionamento_id,:circuito,:potencia,:Px,:Py)');
  Zq.ParamByName('acionamento').AsString := 'C';
  Zq.ParamByName('acionamento_id').AsInteger := 123;
  Zq.ParamByName('circuito').AsInteger := 123;
  Zq.ParamByName('potencia').AsInteger := 123;
  Zq.ParamByName('Px').AsFloat := 4.567;
  Zq.ParamByName('Py').AsFloat := 6.789;
  Zq.ExecSQL();
  Zq.Active := False;
  Zq.Close;}
end;

procedure TFrBaseDados.Button1Click(Sender: TObject);
begin
end;

end.
