unit Ucircuitos;

{$mode objfpc}{$H+}

interface

uses
  Forms, StdCtrls, laz.VirtualTrees, Classes,
   principal,Dialogs, Buttons, ExtCtrls;

type

  { TFrCircuitos }

  TFrCircuitos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CbFases: TComboBox;
    CbIsolacao: TComboBox;
    CbTensao: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckGroup1: TCheckGroup;
    CbMetodoInstalacao: TComboBox;
    CbTipoCircuito: TComboBox;
    CbCircNumero: TComboBox;
    CbQD: TComboBox;
    CbEsquema: TComboBox;
    CbForcaDiame: TComboBox;
    CbDiameEletro: TComboBox;
    CbCondPorFase: TComboBox;
    CbDisjuntor: TComboBox;
    CbTAmbiente: TComboBox;
    dfio: TEdit;
    dfio1: TEdit;
    EdDescricao: TEdit;
    EdDescricaoAD: TEdit;
    fct1: TEdit;
    Edit4: TEdit;
    fca: TEdit;
    Iprojeto: TEdit;
    Icorrigida: TEdit;
    Iprotecao: TEdit;
    ICc: TEdit;
    IdoFio: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    Pw: TEdit;
    fct: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    extensao: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Memo1: TMemo;
    Qtensao: TEdit;
    Label1: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Qtensao1: TEdit;
    Qtensao2: TEdit;
    Qtensao3: TEdit;
    Qtensao4: TEdit;
    Qtensao5: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CbEsquemaChange(Sender: TObject);
    procedure CbIsolacaoChange(Sender: TObject);
    procedure CbTipoCircuitoChange(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckGroup1Click(Sender: TObject);
    procedure CbCircNumeroChange(Sender: TObject);
    procedure CbDisjuntorChange(Sender: TObject);
    procedure CbTAmbienteChange(Sender: TObject);
    procedure IcorrigidaChange(Sender: TObject);
    procedure fctExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Atualiza;
    procedure GroupBox4Click(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  FrCircuitos: TFrCircuitos;
  Lista_circuitos : array[1..10] of integer;

implementation
uses Uler_dxf,UObjetos,Uclasse_base,sysutils;
{$R *.lfm}

{ TFrCircuitos }



procedure TFrCircuitos.FormCreate(Sender: TObject);
Begin
CbDiameEletro.ItemIndex:=1;
CbDisjuntor.ItemIndex:=0;
CbMetodoInstalacao.items.add('A-B1, Condutores isolados ou cabos unipolares em eletroduto de seção circular embutido em alvenaria');
CbMetodoInstalacao.items.add('B-B2, Cabo multipolar em eletroduto de seção circular embutido em alvenaria');
CbMetodoInstalacao.items.add('C-A1, Condutores isolados ou cabos unipolares em eletroduto de seção circular embutido em parede termicamente isolante');
CbMetodoInstalacao.items.add('D-A2, Cabo multipolar em eletroduto de seção circular embutido em parede termicamente isolante');
CbMetodoInstalacao.items.add('E-B1, Condutores isolados ou cabos unipolares em eletroduto aparente de seção circular sobre parede ou espaçado desta menos de 0,3 vez o diâmetro do eletroduto');
CbMetodoInstalacao.items.add('F-B2, Cabo multipolar em eletroduto aparente de seção circular sobre parede ou espaçado desta menos de 0,3 vez o diâmetro do eletroduto');
CbMetodoInstalacao.items.add('G-B1, Condutores isolados ou cabos unipolares em eletroduto aparente de seção não-circular sobre parede');
CbMetodoInstalacao.items.add('H-B2, Cabo multipolar em eletroduto aparente de seção não-circular sobre parede');



CbTipoCircuito.items.add('Alimentação');
CbTipoCircuito.items.add('Iluminação');
CbTipoCircuito.items.add('Força');
CbTipoCircuito.items.add('Sinalização e circuitos de controle');




CbEsquema.items.add('FN');
CbEsquema.items.add('FNT');
CbEsquema.items.add('FFNT');
CbEsquema.items.add('FFF');

CbFases.items.add('R');
CbFases.items.add('S');
CbFases.items.add('T');
cbTensao.Items.add('110');
cbTensao.Items.add('220');
cbTensao.Items.add('380');


CbCircNumero.ItemIndex:=1;
CbCircNumero.ItemIndex:=0;

end;

procedure TFrCircuitos.FormShow(Sender: TObject);
var
  f : integer;
  g ,h: integer;
  texto :string;
Begin
  h:=1;
  CbCircNumero.Clear;
  For f := 0 to lista.Count - 1 do
  Begin
   if ( minhaClasse(lista.items[f]).Objeto = 'TCircuito')
  then
  Begin
    g:=TCircuito(lista.items[f]).tag;
    CbCircNumero.Items.Add(inttostr(g));//+'-'+ TCircuito(lista.items[f]).descricaoAd);
    Lista_circuitos[h]:=f;//minhaClasse(lista.items[f]).Id_obj;
    h:=h+1;
   end;
   if minhaclasse(lista.items[f]).objeto = 'TCd'  then
  Begin
   texto:=TCd(lista.items[f]).tag.ToString;
   texto:='QCD'+texto;
   CbQD.items.add(texto);
  end;
   end;
  CbCircNumero.ItemIndex:=0;
  atualiza;
end;

procedure TFrCircuitos.Button2Click(Sender: TObject);
var
  indice : integer;

Begin
   indice:= Lista_circuitos[CbCircNumero.ItemIndex+1];
   // Carregar tela

   Tcircuito(Lista[indice]).DfioSel:=strtofloatdef(Dfio1.text,2.5);

   Tcircuito(Lista[indice]).FCt:=strtofloatdef(fct.text,1);
   Tcircuito(Lista[indice]).FCa:=strtofloatdef(fca.text,1);
   Tcircuito(Lista[indice]).Qtensao:=strtofloatdef(Qtensao.text,4);
   Tcircuito(Lista[indice]).dfio:=strtofloatdef(dfio.text,2.5);
   Tcircuito(Lista[indice]).Extensao:=strtofloatdef(extensao.text,0);
//   Tcircuito(Lista[indice]).Quadro:=CbQD.Text:='QCD'+inttostr(

   Tcircuito(Lista[indice]).descricao:=EdDescricao.text;
   Tcircuito(Lista[indice]).descricaoAD:=EdDescricaoAD.text;

  if CbIsolacao.ItemIndex=0 then  Tcircuito(Lista[indice]).Isolacao:=PVC;
  if CbIsolacao.ItemIndex=1 then Tcircuito(Lista[indice]).Isolacao:=EPR;
  if CbIsolacao.ItemIndex=2  then Tcircuito(Lista[indice]).Isolacao:=XLPE;

  if  CbMetodoInstalacao.ItemIndex=0 then Tcircuito(Lista[indice]).MetodoInst := A;
   if  CbMetodoInstalacao.ItemIndex=1 then Tcircuito(Lista[indice]).MetodoInst := B;
   if  CbMetodoInstalacao.ItemIndex=2 then Tcircuito(Lista[indice]).MetodoInst := C;
   if  CbMetodoInstalacao.ItemIndex=3 then Tcircuito(Lista[indice]).MetodoInst := D;
   if  CbMetodoInstalacao.ItemIndex=4 then Tcircuito(Lista[indice]).MetodoInst := E;
   if  CbMetodoInstalacao.ItemIndex=5 then Tcircuito(Lista[indice]).MetodoInst := F;
   if  CbMetodoInstalacao.ItemIndex=6 then Tcircuito(Lista[indice]).MetodoInst := G;
   if  CbMetodoInstalacao.ItemIndex=7 then Tcircuito(Lista[indice]).MetodoInst := H;

   if  cbTipoCircuito.ItemIndex=0 then Tcircuito(Lista[indice]).TipoAlimentacao := Alimentacao;
   if  cbTipoCircuito.ItemIndex=1 then Tcircuito(Lista[indice]).TipoAlimentacao := Iluminacao;
   if  cbTipoCircuito.ItemIndex=2 then Tcircuito(Lista[indice]).TipoAlimentacao := Forca;
   if  cbTipoCircuito.ItemIndex=3 then Tcircuito(Lista[indice]).TipoAlimentacao := Controle;



   if   CbTipoCircuito.ItemIndex=0 then Edit4.text:='2.5';
   if   CbTipoCircuito.ItemIndex=1 then Edit4.text:='1.5';
   if   CbTipoCircuito.ItemIndex=2 then Edit4.text:='2.5';
   if   CbTipoCircuito.ItemIndex=3 then Edit4.text:='0.5';


      if cbFases.itemindex=0 then Tcircuito(Lista[indice]).Fases:=R;
      if cbFases.itemindex=1 then Tcircuito(Lista[indice]).Fases:=S;
      if cbFases.itemindex=2 then Tcircuito(Lista[indice]).Fases:=T;


      if cbEsquema.ItemIndex=0 then Tcircuito(Lista[indice]).Esquema:=FN;
      if cbEsquema.ItemIndex=1 then Tcircuito(Lista[indice]).Esquema:=FNT;
      if cbEsquema.ItemIndex=2 then Tcircuito(Lista[indice]).Esquema:=FFFN;
      if cbEsquema.ItemIndex=3 then Tcircuito(Lista[indice]).Esquema:=FFF;


      if cbTensao.ItemIndex=0 then Tcircuito(Lista[indice]).tensao:=T110;
      if cbTensao.ItemIndex=1 then Tcircuito(Lista[indice]).tensao:=T220;
      if cbTensao.ItemIndex=2 then Tcircuito(Lista[indice]).tensao:=T380;


       Tcircuito(Lista[indice]).FCT:=strtofloatdef(fct.text,1);
       Tcircuito(Lista[indice]).FCa:=strtofloatdef(fca.text,1);


      Tcircuito(Lista[indice]).quadro:=cbqd.ItemIndex+1;




      if  CbDisjuntor.ItemIndex=0 then Tcircuito(Lista[indice]).Disjuntor := 2;
      if  CbDisjuntor.ItemIndex=1 then Tcircuito(Lista[indice]).Disjuntor := 4;
      if  CbDisjuntor.ItemIndex=2 then Tcircuito(Lista[indice]).Disjuntor := 6;
      if  CbDisjuntor.ItemIndex=3 then Tcircuito(Lista[indice]).Disjuntor := 10;
      if  CbDisjuntor.ItemIndex=4 then Tcircuito(Lista[indice]).Disjuntor := 16;
      if  CbDisjuntor.ItemIndex=5 then Tcircuito(Lista[indice]).Disjuntor := 20;
      if  CbDisjuntor.ItemIndex=6 then Tcircuito(Lista[indice]).Disjuntor := 25;
      if  CbDisjuntor.ItemIndex=7 then Tcircuito(Lista[indice]).Disjuntor := 32;
      if  CbDisjuntor.ItemIndex=8 then Tcircuito(Lista[indice]).Disjuntor := 40;
      if  CbDisjuntor.ItemIndex=9 then Tcircuito(Lista[indice]).Disjuntor := 50;
      if  CbDisjuntor.ItemIndex=10 then Tcircuito(Lista[indice]).Disjuntor := 63;


      if  CbTAmbiente.ItemIndex=0 then Tcircuito(Lista[indice]).TempAmbiente := 10;
      if  CbTAmbiente.ItemIndex=1 then Tcircuito(Lista[indice]).TempAmbiente := 15;
      if  CbTAmbiente.ItemIndex=2 then Tcircuito(Lista[indice]).TempAmbiente := 20;
      if  CbTAmbiente.ItemIndex=3 then Tcircuito(Lista[indice]).TempAmbiente := 25;
      if  CbTAmbiente.ItemIndex=4 then Tcircuito(Lista[indice]).TempAmbiente := 30;
      if  CbTAmbiente.ItemIndex=5 then Tcircuito(Lista[indice]).TempAmbiente := 35;
      if  CbTAmbiente.ItemIndex=6 then Tcircuito(Lista[indice]).TempAmbiente := 40;
      if  CbTAmbiente.ItemIndex=7 then Tcircuito(Lista[indice]).TempAmbiente := 45;
      if  CbTAmbiente.ItemIndex=8 then Tcircuito(Lista[indice]).TempAmbiente := 50;
      if  CbTAmbiente.ItemIndex=9 then Tcircuito(Lista[indice]).TempAmbiente := 55;
      if  CbTAmbiente.ItemIndex=10 then Tcircuito(Lista[indice]).TempAmbiente := 60;

       Atualiza;
end;

procedure TFrCircuitos.Button3Click(Sender: TObject);
Begin

end;

procedure TFrCircuitos.CbEsquemaChange(Sender: TObject);
var
  multi : integer;
  area : double;
Begin
           if cbEsquema.ItemIndex=0 then multi:=2;
           if cbEsquema.ItemIndex=1 then multi:=3;
           if cbEsquema.ItemIndex=2 then multi:=4;
           if cbEsquema.ItemIndex=3 then multi:=3;

     if dfio1.Text='1,5' then area:=7;
     if dfio1.Text='2,5' then area:=11.5;
     if dfio1.Text='4' then area:=13.9;
     if dfio1.Text='6' then area:=17.34;
     if dfio1.Text='10' then area:=29.20;



           area:= multi*area;

          qtensao1.Text:=floattostr(area);






end;

procedure TFrCircuitos.Button1Click(Sender: TObject);
var
  f,g, maisC,indice : integer;
 CircuitosTubo : Tstringlist;
 testo : string;
 encontrado : boolean;
Begin
memo1.clear;
maisc:=0;
  encontrado:=false;
   CircuitosTubo:=TStringList.Create;
   CircuitosTubo.Sorted:=True;
   CircuitosTubo.Duplicates:=dupIgnore;
   CircuitosTubo.Delimiter:=';';
  testo:=CbCircNumero.Text;
For f := 0 to lista.Count - 1 do
  Begin
   if minhaClasse(lista.items[f]).Ligado=false then continue;
  if ( minhaClasse(lista.items[f]).Objeto = 'TTubulacao')
  then
  Begin
  CircuitosTubo.Clear;
  CircuitosTubo.DelimitedText:=Ttubulacao(lista.items[f]).descricao;
  //verifico se ele tem o circuito procurado
  encontrado:=false;
  for g:=0 to CircuitosTubo.Count -1  do if CircuitosTubo[g]=testo  then encontrado:=true;
  if encontrado= true then
  Begin
  if CircuitosTubo.Count> maisc then
  Begin
  maisc:=CircuitosTubo.Count; // pega o numero de circuitos
  indice:=f;
  end;
  end
  end;
 fct1.Text:=inttostr(maisc);// devolve para a tela o número de tubo com mais circuito///
end;
   // agora vamos ver se podemos eliminar algum circuito baseado na norma
 CircuitosTubo.Clear;
  CircuitosTubo.DelimitedText:=Ttubulacao(lista.items[indice]).descricao;
  //verifico se ele tem o circuito procurado
  encontrado:=false;
   memo1.lines.add('Tubo com mais circutos paralelo ao circuito corrente');
  memo1.lines.add(Ttubulacao(lista.items[indice]).descricao);


   For f := 0 to lista.Count - 1 do
  Begin
   if minhaClasse(lista.items[f]).Ligado=false then continue;
  if  minhaClasse(lista.items[f]).Objeto = 'TCircuito'
  then
  Begin
    for g:=0 to CircuitosTubo.Count -1  do if  CircuitosTubo[g]=floattostr(TCircuito(lista.items[f]).tag) then
    Begin
     memo1.lines.add('Corrente de projeto');
       memo1.lines.add((formatfloat('0.00',TCircuito(lista.items[f]).Iprojeto))+' A');
   if  TCircuito(lista.items[f]).Iprojeto<(TCircuito(lista.items[f]).ifio*0.3) then
   memo1.lines.add('Circuito'+inttostr(TCircuito(lista.items[f]).tag)+ ' descartado do calculo do FCA porque corrente<30% da capacidade do fio');
  end;
 end;

     end;





end;

procedure TFrCircuitos.CbIsolacaoChange(Sender: TObject);
Begin
     CbTAmbienteChange(nil);
end;

procedure TFrCircuitos.CbTipoCircuitoChange(Sender: TObject);
Begin
     if   CbTipoCircuito.ItemIndex=0 then Edit4.text:='2.5';
     if   CbTipoCircuito.ItemIndex=1 then Edit4.text:='1.5';
     if   CbTipoCircuito.ItemIndex=2 then Edit4.text:='2.5';
     if   CbTipoCircuito.ItemIndex=3 then Edit4.text:='0.5';


end;

procedure TFrCircuitos.CheckBox1Change(Sender: TObject);
Begin
  if Checkbox1.Checked=true then
  Begin
  fct.Text:='1';
  fct.Enabled:=false;

  button2.Click;
  atualiza;
  end
  else
  Begin
   fct.Enabled:=true;
  end;
end;

procedure TFrCircuitos.CheckBox2Change(Sender: TObject);
Begin
    if Checkbox2.Checked=true then
  Begin
  fca.Text:='1';
  fca.Enabled:=false;

  button2.Click;
   atualiza;
  end
  else
  Begin
   fca.Enabled:=true;
  end;
end;

procedure TFrCircuitos.CheckGroup1Click(Sender: TObject);
Begin

end;

procedure TFrCircuitos.CbCircNumeroChange(Sender: TObject);


Begin
// frcircuitos.Button2.Click;
memo1.clear;
fct1.text:='';





atualiza;



end;

procedure TFrCircuitos.CbDisjuntorChange(Sender: TObject);
Begin

end;

procedure TFrCircuitos.CbTAmbienteChange(Sender: TObject);
Begin
if cbisolacao.Text='1-PVC - 70°C' then
Begin
 if  CbTAmbiente.Text='10' then fct.Text:='1,22';
 if  CbTAmbiente.Text='15' then fct.Text:='1,17';
 if  CbTAmbiente.Text='20' then fct.Text:='1,12';
 if  CbTAmbiente.Text='25' then fct.Text:='1,06';
 if  CbTAmbiente.Text='30' then fct.Text:='1';
 if  CbTAmbiente.Text='35' then fct.Text:='0,94';
 if  CbTAmbiente.Text='40' then fct.Text:='0,87';
 if  CbTAmbiente.Text='45' then fct.Text:='0,79';
 if  CbTAmbiente.Text='50' then fct.Text:='0,71';
 if  CbTAmbiente.Text='55' then fct.Text:='0,61';
 if  CbTAmbiente.Text='60' then fct.Text:='0,50';
end
else
Begin
 if  CbTAmbiente.Text='10' then fct.Text:='1,15';
 if  CbTAmbiente.Text='15' then fct.Text:='1,12';
 if  CbTAmbiente.Text='20' then fct.Text:='1,08';
 if  CbTAmbiente.Text='25' then fct.Text:='1,04';
 if  CbTAmbiente.Text='30' then fct.Text:='1';
 if  CbTAmbiente.Text='35' then fct.Text:='0,96';
 if  CbTAmbiente.Text='40' then fct.Text:='0,91';
 if  CbTAmbiente.Text='45' then fct.Text:='0,87';
 if  CbTAmbiente.Text='50' then fct.Text:='0,82';
 if  CbTAmbiente.Text='55' then fct.Text:='0,76';
 if  CbTAmbiente.Text='60' then fct.Text:='0,61';
 end;

   FrCircuitos.Button2Click(nil);
  atualiza;
end;

procedure TFrCircuitos.IcorrigidaChange(Sender: TObject);
Begin

end;

procedure TFrCircuitos.fctExit(Sender: TObject);
Begin
  FrCircuitos.Button2Click(nil);

end;

procedure TFrCircuitos.Atualiza;
var
  indice : integer;
Begin

// limpar tudo

  fct.text:='';
  fca.text:='';
  qtensao.text:='';
  dfio.text:='';
  extensao.text:='';
  CbIsolacao.text:='';
  CbTipoCircuito.text:='';
  CbMetodoInstalacao.text:='';
  EdDescricao.text:='';
  EdDescricaoAD.text:='';
  edit4.text:='';
  Icorrigida.text:='';


   // showmessage(inttostr(CbCircNumero.ItemIndex));
  indice:= Lista_circuitos[CbCircNumero.ItemIndex+1];
  if indice<=0  then exit;
  // Carregar tela
  fct.text:=floattostr(Tcircuito(Lista[indice]).FCt);
  fca.text:=floattostr(Tcircuito(Lista[indice]).FCa);
  Qtensao.text:=floattostr(Tcircuito(Lista[indice]).Qtensao);
  dfio.text:=floattostr(Tcircuito(Lista[indice]).dfio);
  extensao.text:=floattostr(Tcircuito(Lista[indice]).Extensao);
  CbQD.Text:='QCD'+inttostr(Tcircuito(Lista[indice]).Quadro);
  EdDescricao.text:=Tcircuito(Lista[indice]).descricao;
  EdDescricaoAD.text:=Tcircuito(Lista[indice]).descricaoAD;
  Iprojeto.Text:=floattostr(Tcircuito(Lista[indice]).Iprojeto);
  CbDisjuntor.Text:=floattostr(Tcircuito(Lista[indice]).Disjuntor);


  try
if (( Tcircuito(Lista[indice]).FCt<>0)and(Tcircuito(Lista[indice]).FCa<>0))
then Icorrigida.text:=floattostr(strtofloat(Iprojeto.text)/(strtofloat(fca.text)*strtofloat(fct.text)));
 Iprotecao.text:=floattostr(strtofloat(Iprojeto.text)*(strtofloat(fca.text)*strtofloat(fct.text)));

 // aa:=(strtofloat(Iprojeto.text)/(strtofloat(fca.text)*strtofloat(fct.text)));
 // bb:=(strtofloat(Iprojeto.text)*(strtofloat(fca.text)*strtofloat(fct.text)));











   if Tcircuito(Lista[indice]).Isolacao=PVC then CbIsolacao.ItemIndex:=0;
   if Tcircuito(Lista[indice]).Isolacao=EPR then CbIsolacao.ItemIndex:=1;
   if Tcircuito(Lista[indice]).Isolacao=XLPE then CbIsolacao.ItemIndex:=2;

   if  Tcircuito(Lista[indice]).MetodoInst = A then CbMetodoInstalacao.ItemIndex:=0;
   if  Tcircuito(Lista[indice]).MetodoInst = B then CbMetodoInstalacao.ItemIndex:=1;
   if  Tcircuito(Lista[indice]).MetodoInst = C then CbMetodoInstalacao.ItemIndex:=2;
   if  Tcircuito(Lista[indice]).MetodoInst = D then CbMetodoInstalacao.ItemIndex:=3;
   if  Tcircuito(Lista[indice]).MetodoInst = E then CbMetodoInstalacao.ItemIndex:=4;
   if  Tcircuito(Lista[indice]).MetodoInst = F then CbMetodoInstalacao.ItemIndex:=5;
   if  Tcircuito(Lista[indice]).MetodoInst = G then CbMetodoInstalacao.ItemIndex:=6;
   if  Tcircuito(Lista[indice]).MetodoInst = H then CbMetodoInstalacao.ItemIndex:=7;

   if  Tcircuito(Lista[indice]).TipoAlimentacao = Alimentacao then CbTipoCircuito.ItemIndex:=0;
   if  Tcircuito(Lista[indice]).TipoAlimentacao = Iluminacao then CbTipoCircuito.ItemIndex:=1;
   if  Tcircuito(Lista[indice]).TipoAlimentacao = Forca then CbTipoCircuito.ItemIndex:=2;
   if  Tcircuito(Lista[indice]).TipoAlimentacao = Controle then CbTipoCircuito.ItemIndex:=3;

   if   CbTipoCircuito.ItemIndex=0 then Edit4.text:='2.5';
   if   CbTipoCircuito.ItemIndex=1 then Edit4.text:='1.5';
   if   CbTipoCircuito.ItemIndex=2 then Edit4.text:='2.5';
   if   CbTipoCircuito.ItemIndex=3 then Edit4.text:='0.5';

   if Tcircuito(Lista[indice]).Fases=R then cbFases.itemindex:=0;
   if Tcircuito(Lista[indice]).Fases=S then cbFases.itemindex:=1;
   if Tcircuito(Lista[indice]).Fases=T then cbFases.itemindex:=2;
  finally


      // showmessage('Houve um erro');

  end;

  if Tcircuito(Lista[indice]).Esquema=FN then cbEsquema.ItemIndex:=0;
  if Tcircuito(Lista[indice]).Esquema=FNT then cbEsquema.ItemIndex:=1;
  if Tcircuito(Lista[indice]).Esquema=FFFN then cbEsquema.ItemIndex:=2;
  if Tcircuito(Lista[indice]).Esquema=FFF then cbEsquema.ItemIndex:=3;


  if Tcircuito(Lista[indice]).tensao=T110 then cbTensao.ItemIndex:=0;
  if Tcircuito(Lista[indice]).tensao=T220 then cbTensao.ItemIndex:=1;
  if Tcircuito(Lista[indice]).tensao=T380 then cbTensao.ItemIndex:=2;


   cbqd.ItemIndex:=Tcircuito(Lista[indice]).quadro-1;


  if Tcircuito(Lista[indice]).Disjuntor=2 then CbDisjuntor.ItemIndex:=0;
  if Tcircuito(Lista[indice]).Disjuntor=4 then CbDisjuntor.ItemIndex:=1;
  if Tcircuito(Lista[indice]).Disjuntor=6 then CbDisjuntor.ItemIndex:=2;
  if Tcircuito(Lista[indice]).Disjuntor=10 then CbDisjuntor.ItemIndex:=3;
  if Tcircuito(Lista[indice]).Disjuntor=16 then CbDisjuntor.ItemIndex:=4;
  if Tcircuito(Lista[indice]).Disjuntor=20 then CbDisjuntor.ItemIndex:=5;
  if Tcircuito(Lista[indice]).Disjuntor=25 then CbDisjuntor.ItemIndex:=6;
  if Tcircuito(Lista[indice]).Disjuntor=32 then CbDisjuntor.ItemIndex:=7;
  if Tcircuito(Lista[indice]).Disjuntor=40 then CbDisjuntor.ItemIndex:=8;
  if Tcircuito(Lista[indice]).Disjuntor=50 then CbDisjuntor.ItemIndex:=9;
  if Tcircuito(Lista[indice]).Disjuntor=63 then CbDisjuntor.ItemIndex:=10;
  if Tcircuito(Lista[indice]).TempAmbiente = 10 then CbTAmbiente.ItemIndex:=0;
  if Tcircuito(Lista[indice]).TempAmbiente = 15 then CbTAmbiente.ItemIndex:=1;
  if Tcircuito(Lista[indice]).TempAmbiente = 20 then CbTAmbiente.ItemIndex:=2;
  if Tcircuito(Lista[indice]).TempAmbiente = 25 then CbTAmbiente.ItemIndex:=3;
  if Tcircuito(Lista[indice]).TempAmbiente = 30 then CbTAmbiente.ItemIndex:=4;
  if Tcircuito(Lista[indice]).TempAmbiente = 35 then CbTAmbiente.ItemIndex:=5;
  if Tcircuito(Lista[indice]).TempAmbiente = 40 then CbTAmbiente.ItemIndex:=6;
  if Tcircuito(Lista[indice]).TempAmbiente = 45 then CbTAmbiente.ItemIndex:=7;
  if Tcircuito(Lista[indice]).TempAmbiente = 50 then CbTAmbiente.ItemIndex:=8;
  if Tcircuito(Lista[indice]).TempAmbiente = 55 then CbTAmbiente.ItemIndex:=9;
  if Tcircuito(Lista[indice]).TempAmbiente = 60 then CbTAmbiente.ItemIndex:=10;

    IdoFio.Text:= floattostr(Tcircuito(Lista[indice]).Ifio);
  Dfio1.text:=floattostr(Tcircuito(Lista[indice]).DfioSel);
    FrCircuitos.CbEsquemaChange(nil);

           if CbDiameEletro.ItemIndex=0 then  qtensao2.Text:='204';  // 1/2
           if CbDiameEletro.ItemIndex=1 then  qtensao2.Text:='283';  //3/4
           if CbDiameEletro.ItemIndex=2 then  qtensao2.Text:='491';  // 1
           if CbDiameEletro.ItemIndex=3 then  qtensao2.Text:='779';  // 1 1/4
           if CbDiameEletro.ItemIndex=4 then  qtensao2.Text:='1452'; // 1 1/2
           if CbDiameEletro.ItemIndex=5 then  qtensao2.Text:='2026'; // 2
           if CbDiameEletro.ItemIndex=6 then  qtensao2.Text:='3000'; // 2 1/2
           if CbDiameEletro.ItemIndex=7 then  qtensao2.Text:='4417'; // 3
           if CbDiameEletro.ItemIndex=8 then  qtensao2.Text:='8332'; // 4
            qtensao3.text:=floattostr(strtoint(qtensao2.text)*0.4);
            qtensao4.text:=floattostr(strtoint(qtensao2.text)*0.31);
            qtensao5.text:=floattostr(strtoint(qtensao2.text)*0.51);



           pw.text:= Tcircuito(Lista[indice]).Potencia_instalada.ToString;


end;

procedure TFrCircuitos.GroupBox4Click(Sender: TObject);
Begin

end;

procedure TFrCircuitos.Label27Click(Sender: TObject);
Begin

end;

procedure TFrCircuitos.SpeedButton1Click(Sender: TObject);
Begin
// Tcircuito(Lista[indice]).

FrPrincipal.CalCorrenteCir.Click;
Atualiza;
end;



end.
