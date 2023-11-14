unit Ulayers;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Spin, {ColorGrd,} StdCtrls,UObjetos, Buttons,Uler_dxf,Uclasse_base;

type

  { TDefLayersForm }

  TDefLayersForm = class(TForm)
    Novo: TBitBtn;
    PenColorButton: TColorButton;
    LayersList: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TransparentChk: TCheckBox;
    OKBtn: TBitBtn;
    NameEdt: TEdit;
    PenSizeEdt: TSpinEdit;
    ActiveLayerCBox: TComboBox;
    Label5: TLabel;
    ActiveChk: TCheckBox;
    VisibleChk: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LayersListClick(Sender: TObject);
    procedure LayersListDblClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure PenColorButtonClick(Sender: TObject);
  private
    { Private declarations }
    fCurrLayer: Integer;

    procedure SetCurrLayer(L: Integer);
    procedure SaveCurrLayer;
  public
    { Public declarations }
  end;

var
  DefLayersForm: TDefLayersForm;
  LayerCorrente : integer;
implementation

{$R *.lfm}



procedure TDefLayersForm.SaveCurrLayer;
Begin

end;

procedure TDefLayersForm.SetCurrLayer(L: Integer);
Begin

end;

procedure TDefLayersForm.LayersListClick(Sender: TObject);
var
   i : integer;
   nomeLayer : string;
Begin
//LayersList.ItemIndex;
nomeLayer:=Layerslist.Items[LayersList.ItemIndex];
//showmessage(NomeLayer);
  For i:=1 To lista.count - 1 do
  if minhaclasse(lista.items[i]).tipo = 38 then
  if tlayer(lista.items[i]).Nome=nomeLayer then
  Begin
   LayerCorrente:=i;
    PenColorButton.ButtonColor:=tlayer(lista.items[i]).cor;
    TransparentChk.Checked:=tlayer(lista.items[i]).transparente;
    NameEdt.Text:=tlayer(lista.items[i]).Nome ;
    PenSizeEdt.Value:=round(tlayer(lista.items[i]).espessura);
//    ActiveLayerCBox: TComboBox;
    ActiveChk.Checked:=tlayer(lista.items[i]).ativo;
    VisibleChk.checked:=tlayer(lista.items[i]).visivel;
    exit;
end;



end;

procedure TDefLayersForm.LayersListDblClick(Sender: TObject);
Begin

end;

procedure TDefLayersForm.NovoClick(Sender: TObject);
var
   NovoLayer : Tlayer;
    i : integer;
Begin
For i:=1 To lista.count - 1 do
  if minhaclasse(lista.items[i]).tipo = 38 then  if tlayer(lista.items[i]).Nome=NameEdt.Text then
  Begin
   showmessage('Está camada já existe!');
  exit;
  end;
   NovoLayer:=Tlayer.Create;
   NovoLayer.cor:=PenColorButton.ButtonColor;
   NovoLayer.transparente:= TransparentChk.Checked;
   NovoLayer.Nome:=NameEdt.Text;
   NovoLayer.espessura:=PenSizeEdt.Value;
   NovoLayer.ativo:=ActiveChk.Checked;
   NovoLayer.visivel:= VisibleChk.checked;
   Total:=Total+1;
   NovoLayer.Id_obj:=total;
   NovoLAyer.Tipo:=38;
   Layerslist.AddItem(nameEdt.text,nil);
   lista.add(NovoLayer);

   Layerslist.Clear;
   ActiveLayerCBox.Clear;
For i:=1 To lista.count - 1 do   if minhaclasse(lista.items[i]).tipo = 38 then
Begin
LayersList.AddItem( tlayer(lista.items[i]).Nome,nil);
ActiveLayerCBox.AddItem( tlayer(lista.items[i]).Nome,nil);
end;

end;

procedure TDefLayersForm.FormCreate(Sender: TObject);
Begin

end;

procedure TDefLayersForm.FormShow(Sender: TObject);
var
   i : integer;

Begin
Layerslist.Clear;
ActiveLayerCBox.Clear;
For i:=1 To lista.count - 1 do   if minhaclasse(lista.items[i]).tipo = 38 then
Begin
LayersList.AddItem( tlayer(lista.items[i]).Nome,nil);
ActiveLayerCBox.AddItem( tlayer(lista.items[i]).Nome,nil);
end;
LayersList.ItemIndex:=0;
LayersListClick(nil);

end;

procedure TDefLayersForm.OKBtnClick(Sender: TObject);
var
   i : integer;
   nomeLayer : string;
Begin
//LayersList.ItemIndex;
if LayersList.ItemIndex<0 then exit;
nomeLayer:=Layerslist.Items[LayersList.ItemIndex];
//showmessage(NomeLayer);
if (lista.count - 1)<1 then exit;
  For i:=1 To lista.count - 1 do
  if minhaclasse(lista.items[i]).tipo = 38 then
  if tlayer(lista.items[i]).Nome=nomeLayer then
  Begin
    LayerCorrente:=i;
   tlayer(lista.items[i]).cor:=PenColorButton.ButtonColor;
   tlayer(lista.items[i]).transparente:= TransparentChk.Checked;
   tlayer(lista.items[i]).Nome:=NameEdt.Text;
   tlayer(lista.items[i]).espessura:=PenSizeEdt.Value;
//    ActiveLayerCBox: TComboBox;
    tlayer(lista.items[i]).ativo:=ActiveChk.Checked;
   tlayer(lista.items[i]).visivel:= VisibleChk.checked;
   exit;
end;



end;

procedure TDefLayersForm.PenColorButtonClick(Sender: TObject);
Begin
     tlayer(lista.items[LayerCorrente]).cor:=PenColorButton.Color;

end;

end.
// showmessage(IntToStr(GetKeyState(VK_SHIFT) and $8000));
  {
   if (GetKeyState(VK_SHIFT) And $80) <> 0 then
    Label1.Caption := 'It works!';
  }

