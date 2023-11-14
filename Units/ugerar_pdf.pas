unit Ugerar_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, Spin, Grids, fpspreadsheetgrid, fpspreadsheetctrls, RTTIGrids,
  fpPDF, UObjetos;


  { TConfig }
  type
  TConfig = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LinhaPDF(objeto:Tlinha;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;Tamanho:integer;var Xpage:TPDFPage);
    procedure ArcoPDF(Objeto:Tarco;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;var Xpage:TPDFPage);
    procedure TextoPDF(objeto:Ttexto;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex:integer;var Xpage:TPDFPage);
    procedure CirculoPDF(Objeto:Tcirculo;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;var Xpage:TPDFPage);
    Procedure TubulacaoPDF(Objeto:TTubulacao;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex,xFontIndex2,espessura:integer;var Xpage:TPDFPage);
    procedure InterruptorPDF(Objeto:Tinterruptor;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex:integer;var Xpage:TPDFPage);
    procedure TomadaPDF(Objeto:Ttomada;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;lLineWidth,xfontindex:integer;var Xpage:TPDFPage);
    procedure IluminacaoPDF(Objeto:Tiluminacao;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex,xFontIndex2,lLineWidth:integer;var Xpage:TPDFPage);
  private

  public

  end;

var
  Config: TConfig;
  Desloc_X,Desloc_Y,Scale_X,Scale_Y : double;

implementation

{$R *.lfm}
uses principal,Uler_dxf, Uclasse_base,conver,fpcanvas, fpsutils;


 procedure TConfig.LinhaPDF(objeto:Tlinha;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;Tamanho:integer;var Xpage:TPDFPage);
 var
   a, b : ponto2d;
 Begin
      a.x:=(Objeto.Ax+Desloc_x)*Scale_X;
      a.y:=(objeto.Ay+Desloc_y)*Scale_Y;
      b.x:=(objeto.Bx+Desloc_x)*Scale_X;
      b.y:=(objeto.By+Desloc_y)*Scale_Y;
      xPage.DrawLine(round(a.x), round(a.y) ,round(b.x),round(b.y),Tamanho);
 end;

 procedure TConfig.arcoPDF(objeto:Tarco;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;var Xpage:TPDFPage);
 var
   a,b,cr : ponto2d;
    lPt1, lPt2, lPt3: TPDFCoord;
    raio : double;
  Begin
      raio:=Objeto.Raio;
      a.x:=Objeto.px+(Raio) * cos((Objeto.AnguloInicial) * PI/180);
      a.y:=Objeto.py+(Raio) * sin((Objeto.AnguloInicial) * PI/180);
      b.x:=Objeto.px+(Raio) * cos((Objeto.AnguloFinal+Objeto.AnguloInicial )  * PI/180);
      b.y:=Objeto.py+(Raio) * sin((Objeto.AnguloFinal+Objeto.AnguloInicial )  * PI/180);
      cr.x:=Objeto.LocX;
      cr.y:=Objeto.LocY;
      a.x:=(desloc_x+a.x)*Scale_X;
      a.y:=(desloc_y+a.y)*Scale_Y;
      b.x:=(desloc_x+b.x)*Scale_X;
      b.y:=(desloc_y+b.y)*Scale_Y;
      cr.x:=(desloc_x+cr.x)*Scale_X;
      cr.y:=(desloc_y+cr.y)*Scale_Y;
      lPt1 := PDFCoord(round(a.x),round(a.y));
      lPt2 := PDFCoord(round(cr.x),round(cr.y));
      lPt3 := PDFCoord(round(b.x),round((b.y)));
      Xpage.SetColor(clBlack, true);
      Xpage.SetPenStyle(ppsSolid);
      Xpage.MoveTo(lPt1);
      Xpage.CubicCurveTo(lPt1, lPt2, lPt3, 1);
  end;
 procedure TConfig.textoPDF(Objeto:TTexto;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex:integer;var Xpage:TPDFPage);
 var
    a : ponto2d;
    Tf : integer;
    Begin
       a.x:=((Objeto.Px+Desloc_x))*Scale_X;
       a.y:=((Objeto.Py+Desloc_y))*Scale_y;
      // frprincipal.cmdmemo.lines.add(Objeto.descricao);
       Tf:=round(Objeto.tamanho/0.15)*10;
       if tf<8 then tf:=8;
       xPage.SetFont(xFontIndex,tf);
       xPage.SetColor(clBlue, False);
       xPage.WriteText(a.x,a.y,(Objeto.descricao),round(Objeto.angulo));
    end;

  procedure TConfig.circuloPDF(Objeto:Tcirculo;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;var Xpage:TPDFPage);
    var
       a,b,c,d : ponto2d;
 Begin
      a.x:=((Objeto.Px+Desloc_x))*Scale_X;
      a.y:=((Objeto.Py+Desloc_y))*Scale_Y;
      b.x:=(Objeto.raio*20);
      b.y:=(Objeto.raio*20);
      c.x:=round(a.x-b.x);
      c.y:=round(a.y-b.y);
      d.x:=round(b.x+b.x);
      d.y:=round(b.y+b.y);
      xPage.SetColor(clBlue, true);
      xPage.SetColor($FFFFFF, false); // pastel white
      // desenhar a elipse   retangulo = left,top,right,bootom  se for quadrado sai um circulo
      xPage.DrawEllipse(c.x,c.y,d.x,d.y, 1, True, True); // d.x, d.y recebe o incremento a partir da posição c.x e c.y
 end;


Procedure TConfig.tubulacaoPDF(Objeto:TTubulacao;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex,xFontIndex2,espessura:integer;var Xpage:TPDFPage);
  var
     g,h,nc : integer;
    CircuitosTubo : TStringList;
    a,b,c : ponto2d;
    lpt1,lpt2,lpt3 : TPDFCoord;
    textof : string;

  Begin
       a.x:=(Objeto.ObjIni_X+Desloc_x)*Scale_X;
       a.y:=(Objeto.ObjIni_Y+Desloc_y)*Scale_Y;
       b.x:=(Objeto.ObjFin_X+Desloc_x)*Scale_X;
       b.y:=(Objeto.ObjFin_Y+Desloc_y)*Scale_Y;
       IF Objeto.Bezier=false then
       xPage.DrawLine(round(a.x), round(a.y) ,round(b.x),round(b.y), espessura);
       IF Objeto.Bezier=true then
       Begin
         Begin
        lPt1 := PDFCoord(round(a.x),round(a.y));
        a.x:=(Objeto.B_P_x1+Desloc_x)*Scale_X;
        a.y:=(Objeto.B_P_y1+Desloc_y)*Scale_Y;
        lPt2 := PDFCoord(round(a.x),round(a.y));
        lPt3 := PDFCoord(round(b.x),round(b.y));
        Xpage.SetColor(clBlack, true);
        Xpage.SetPenStyle(ppsSolid);
        Xpage.MoveTo(lPt1);
        Xpage.CubicCurveTo(lPt1, lPt2, lPt3, 1);
       end;
       end;
       // desenhar a fiação
       c.x:=round((a.x+b.x)/2); // calcula
       c.y:=round((a.y+b.y)/2); // meio da lina
       CircuitosTubo:=TStringList.Create;
       CircuitosTubo.Sorted:=True;
       CircuitosTubo.Duplicates:=dupIgnore;
       CircuitosTubo.Delimiter:=';';
       CircuitosTubo.DelimitedText:=Objeto.descricao;
       for g:=0 to CircuitosTubo.Count -1  do
       Begin
         // pegar indice do circuito
      for h:=0 to lista.count-1 do  if MinhaClasse(lista.items[h]).Tipo=33 then
                                    if Tcircuito(lista.items[h]).tag=strtoint(CircuitosTubo[g]) then
                                                                    Begin
                                                                    nc:=h;
                                                                    break;
                                                                    end;
   if  Tcircuito(lista.items[NC]).Esquema=FN  then textoF:='fn';
   if  Tcircuito(lista.items[NC]).Esquema=FNT  then textoF:='fnt';
   if  Tcircuito(lista.items[NC]).Esquema=FFFN  then textoF:='ffn';
   if  Tcircuito(lista.items[NC]).Esquema=FFF  then textoF:='fff';
       c.y:=c.y+2;
       xPage.SetFont(xFontIndex, 8);
       xPage.SetColor(clBlue, False);
       xPage.WriteText(c.x,c.y,Circuitostubo[g]);
       c.y:=c.y-4;
       xPage.SetFont(xFontIndex2, 8);
       xPage.SetColor(clBlue, False);
       xPage.WriteText(c.x,c.y,textoF);
       c.y:=c.y-3;
       xPage.SetFont(xFontIndex, 8);
       xPage.SetColor(clBlue, False);
       xPage.WriteText(c.x,c.y,'#'+floattostr(Tcircuito(lista.items[NC]).DfioSel));
       c.x:=c.x+7;
       c.y:=c.y+5;
       end;
         CircuitosTubo.free;
 end;


   procedure TConfig.interruptorPDF(Objeto:Tinterruptor;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex:integer;var Xpage:TPDFPage);
     var
       a,b,c,d : ponto2d;
     Begin
      a.x:=((Objeto.Px+Desloc_x))*Scale_X;
      a.y:=((Objeto.Py+Desloc_y))*Scale_Y;
      b.x:=(0.1*20);
      b.y:=(0.1*20);
      c.x:=round(a.x);
      c.y:=round(a.y);
      d.x:=round(b.x);
      d.y:=round(b.y);
      xPage.SetColor(clBlue, true);
      xPage.SetColor($FFFFFF, false); // pastel white
      // desenhar a tomada
      xPage.DrawEllipse(c.x,c.y,d.x,d.y, 1, True, True); // d.x, d.y recebe o incremento a partir da posição c.x e c.y
       //fonte padrão
        xPage.SetFont(xFontIndex, 10);
       xPage.SetColor(clred, False);
        xPage.WriteText(c.x+2,c.y+3,objeto.acionamento);
     end;

   procedure TConfig.tomadaPDF(Objeto:Ttomada;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;lLineWidth,xfontindex:integer;var Xpage:TPDFPage);
     var
       a,b,c,d,e : ponto2d;
     Begin
         a.x:=((Objeto.Px+Desloc_x))*Scale_X;
         a.y:=((Objeto.Py+Desloc_y))*Scale_Y;
         b.x:=(0.05*20);
         b.y:=(0.05*20);
         c.x:=round(a.x);
         c.y:=round(a.y);
         d.x:=round(b.x);
         d.y:=round(b.y);
         xPage.SetColor(clBlue, true);
         xPage.SetColor($FFFFFF, false); // pastel white
         // desenhar a tomada
        // xPage.DrawLine(c.x,c.y,c.x+2,c.y,lLineWidth);
         if  ((objeto.Angulo=0)or(objeto.angulo=360)) then
         Begin
          xPage.DrawLine(c.x,c.y,c.x+2,c.y,lLineWidth);
          xPage.DrawLine(c.x+2,c.y+1,c.x+2,c.y-1,lLineWidth);
          xPage.DrawLine(c.x+2,c.y+1,c.x+4,c.y,lLineWidth);
          xPage.DrawLine(c.x+4,c.y,c.x+2,c.y-1,lLineWidth);
         xPage.SetFont(xFontIndex, 10);
         xPage.SetColor(clred, False);
         xPage.WriteText(c.x+6,c.y,inttostr(objeto.potencia));

         end;
       if objeto.Angulo=90 then
         Begin
         xPage.DrawLine(c.x,c.y,c.x,c.y+2,lLineWidth);
         xPage.DrawLine(c.x-1,c.y+2,c.x+1,c.y+2,lLineWidth);
         xPage.DrawLine(c.x-1,c.y+2,c.x,c.y+4,lLineWidth);
        xPage.DrawLine(c.x,c.y+4,c.x+1,c.y+2,lLineWidth);
              xPage.SetFont(xFontIndex, 10);
         xPage.SetColor(clred, False);
         xPage.WriteText(c.x,c.y+6,inttostr(objeto.potencia));

        end;
         if  objeto.Angulo=180 then
         Begin
          xPage.DrawLine(c.x,c.y,c.x-2,c.y,lLineWidth);
          xPage.DrawLine(c.x-2,c.y+1,c.x-2,c.y-1,lLineWidth);
          xPage.DrawLine(c.x-2,c.y+1,c.x-4,c.y,lLineWidth);
          xPage.DrawLine(c.x-4,c.y,c.x-2,c.y-1,lLineWidth);
          xPage.SetFont(xFontIndex, 10);
         xPage.SetColor(clred, False);
         xPage.WriteText(c.x-6,c.y,inttostr(objeto.potencia));

         end;
         if  objeto.Angulo=270 then
         Begin
          xPage.DrawLine(c.x,c.y,c.x,c.y-2,lLineWidth);
         xPage.DrawLine(c.x-1,c.y-2,c.x+1,c.y-2,lLineWidth);

         xPage.DrawLine(c.x-1,c.y-2,c.x,c.y-4,lLineWidth);
        xPage.DrawLine(c.x,c.y-4,c.x+1,c.y-2,lLineWidth);

        xPage.SetFont(xFontIndex, 10);
           xPage.SetColor(clred, False);
           xPage.WriteText(c.x,c.y-6,inttostr(objeto.potencia));

         end;
          end;
 procedure TConfig.iluminacaoPDF(Objeto:Tiluminacao;Desloc_x,Desloc_y,Scale_X,Scale_Y:double;xFontIndex,xFontIndex2,lLineWidth:integer;var Xpage:TPDFPage);
   var
     a,b,c,d : ponto2d;
   Begin
 a.x:=((Objeto.Px-0.3+Desloc_x))*Scale_X;
      a.y:=((Objeto.Py-0.3+Desloc_y))*Scale_Y;
      b.x:=(0.6*20);
      b.y:=(0.6*20);
      c.x:=round(a.x);
      c.y:=round(a.y);
      d.x:=round(b.x);
      d.y:=round(b.y);
      xPage.SetColor(clBlue, true);
      xPage.SetColor($FFFFFF, false); // pastel white
      // desenhar a elipse   retangulo = left,top,right,bootom  se for quadrado sai um circulo
      xPage.DrawEllipse(c.x,c.y,d.x,d.y, 1, True, True); // d.x, d.y recebe o incremento a partir da posição c.x e c.y
      //fonte padrão
      //  xPage.SetFont(xFontIndex, 10);
      xPage.SetColor(clred, False);
      //  xPage.WriteText(c.x-round(abs(d.x)/4),c.y+round(d.y/2),'Fabricio');
      // a.x/a.y volta para o centro
      a.x:=(Objeto.Px+Desloc_x)*Scale_X;
      a.y:=(Objeto.Py+Desloc_y)*Scale_Y;
      b.x:=(0.3*20); //// meia circunsferência
      b.y:=(0.3*20); // meia circunsferência
      c.x:=round(a.x);
      c.y:=round(a.y);
      d.x:=round(b.x);
      d.y:=round(b.y);
      // desenhar as linhas intenas
      xPage.DrawLine(c.x-d.x, c.y ,c.x+d.x,c.y, lLineWidth);
      xPage.DrawLine(c.x, c.y ,c.x,c.y-d.y, lLineWidth);
      // potencia da lampada
      xPage.SetFont(xFontIndex, 10);
      xPage.WriteText(c.x-d.x+2, c.y+1,inttostr(Objeto.potencia));
      // acionamento da lampada
      xPage.SetFont(xFontIndex, 10);
      xPage.WriteText(c.x+1, c.y-d.y+3,Objeto.acionamento);
      // circuito da lampada
      xPage.SetFont(xFontIndex, 10);
      xPage.WriteText(c.x-d.x+2, c.y-d.y+3,inttostr(Objeto.circuito));
      // fonte de fio
      //  xPage.SetFont(xFontIndex2, 10);                                                        // ativar fonte diferente
      //  xPage.WriteText(c.x, c.y,'fnrt');
end;

procedure TConfig.Button1Click(Sender: TObject);
var
  xDoc: TPDFDocument;
  xSection: TPDFSection;
  xPage: TPDFPage;
  xFontIndex,xFontIndex2,f,h, lLineWidth,g,Blc_id: Integer;
   AOptions: TPDFOptions;
   aFileName,nome_do_bloco,TextoF: string;
   a, b,cr ,insert_point,insert_point_atributo,p_aux,p_aux2: ponto2d;
   c,d : tpoint;
   paper: TPDFPaper;
   CircuitosTubo : tstringlist;
   lPt1, lPt2, lPt3, lPt4: TPDFCoord;
   angulo,tamanho : double;
  NovoLinhaDXF: TLinha;
  NovoTexto: TTexto;
  NovoCirculo: TCirculo;

   Begin
  Desloc_x:=1;
  Desloc_Y:=1;
  Scale_X:=20;
  Scale_Y:=20;
  afilename:=frprincipal.SaveDialog1.FileName;
  AOptions:=[poCompressText, poCompressFonts];
  xDoc := TPDFDocument.Create(nil);
  try
   xDoc.PageLayout := lContinuous;
   xDoc.Options := AOptions;
   xDoc.StartDocument;
   xDoc.DefaultOrientation:=ppoPortrait;
 xFontIndex2 := xDoc.AddFont(ExtractFilePath(ParamStr(0))+'Eletrica.ttf', 'Untitled1'); // ativar fonte diferente
 xFontIndex := xDoc.AddFont('Helvetica');
 xSection := xDoc.Sections.AddSection;
 xPage := TPDFPage.Create(xDoc);
 Xpage.PaperType:=ptA4;
// ativar papel diferente
paper := Xpage.Paper;
 paper.H :=2380;
 paper.W := 3368;
Xpage.Paper:=paper;
Xpage.Orientation:=ppoPortrait;
// ativar papel grande}
xDoc.Pages.Add(xPage);
xSection.AddPage(xPage);
xPage.SetColor(clBlue, False);
lLineWidth := 0;
xPage.SetColor(clBlack, True);
xPage.SetPenStyle(ppsSolid, lLineWidth);
For f := 0 to lista.Count - 1 do
Begin
  if   Minhaclasse(lista.items[f]).Ligado=false                                       then   Continue;
  {*********************** Arco DXF **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 32)or(Minhaclasse(lista.items[f]).tipo = 4)) then   arcoPDF(Tarco(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,Xpage);
 {*********************** Linha DXF **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 3))                                          then   LinhaPDF( Tlinha(lista.items[f]) ,Desloc_x,Desloc_y,Scale_X,Scale_Y,0,Xpage);
 {*********************** Circulo **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 5 ))                                         then   circuloPDF(Tcirculo(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,Xpage);
 {*********************** TEXTO **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 6))                                          then   textoPDF(Ttexto(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,xFontIndex,Xpage);
 {*********************** Tomada **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 23))                                         then   tomadaPDF(Ttomada(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,lLineWidth,xfontindex,Xpage);
 {*********************** Interruptor **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 22))                                         then   InterruptorPDF(Tinterruptor(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,xfontindex,Xpage);
  {*********************** Tubulação **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 17))                                         then   tubulacaoPDF(TTubulacao(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,xFontIndex,xFontIndex2,lLineWidth,Xpage);
 {*********************** Iluminação **********************************}
 if ((Minhaclasse(lista.items[f]).tipo = 19))                                         then  iluminacaoPDF(TIluminacao(lista.items[f]),Desloc_x,Desloc_y,Scale_X,Scale_Y,xFontIndex,xFontIndex2,lLineWidth,Xpage);
end;
       NovoTexto:=TTexto.Create;
       NovoCirculo:= TCirculo.Create;

          xPage.SetFont(xFontIndex, 12);
       xPage.SetColor(clBlue, False);
       xPage.WriteText(4,4,'Por Fabricio Semonetti');



For f := 0 to blocos.Count - 1 do
  Begin
   if minhaclasse(blocos.items[f]).Ligado = False then Continue;
     if ((minhaclasse(blocos.items[f]).Tipo=42)) then
    Begin
       insert_point.x:=TBloco(blocos.items[f]).px;
       insert_point.y:=TBloco(blocos.items[f]).py;
       Nome_do_bloco:=TBloco(blocos.items[f]).Bloco;
       angulo:=TBloco(blocos.items[f]).Angulo;
       BLC_id:=TBloco(blocos.items[f]).Id_obj;
       // criar um objeto temporário para somar coordenas e detalhes
        For g := 0 to blocos.Count - 1 do
        Begin
          if minhaclasse(blocos.items[g]).Ligado = False then Continue;

          if  (TBloco(blocos.items[g]).Bloco=Nome_do_bloco)  then
          Begin
          //linha
           if (minhaclasse(blocos.items[g]).objeto = 'TLinha') then
           Begin
           NovoLinhaDXF:=Tlinha.Create;
           NovoLinhaDXF.ax:=TLinha(blocos.items[g]).Ax;
           NovoLinhaDXF.ay:=TLinha(blocos.items[g]).Ay;
           NovoLinhaDXF.bx:=TLinha(blocos.items[g]).Bx;
           NovoLinhaDXF.by:=TLinha(blocos.items[g]).By;
           NovoLinhaDXF.Ax:=NovoLinhaDXF.Ax+insert_point.x;
           NovoLinhaDXF.Ay:=NovoLinhaDXF.Ay+insert_point.y;
           NovoLinhaDXF.Bx:=NovoLinhaDXF.Bx+insert_point.x;
           NovoLinhaDXF.By:=NovoLinhaDXF.By+insert_point.y;
           LinhaPDF( NovoLinhaDXF ,Desloc_x,Desloc_y,Scale_X,Scale_Y,0,Xpage);
           NovoLinhaDXF.Destroy;
           end;
         //atributo
          if   ((minhaclasse(blocos.items[g]).objeto = 'TAtributo')and (BLC_id=TAtributo(blocos.items[g]).Pai)) then
            if (Tatributo(blocos.items[g]).tipo=43) then
             Begin
             insert_point_atributo.x:= TAtributo(blocos.items[g]).Px;
             insert_point_atributo.y:= TAtributo(blocos.items[g]).Py;
             NovoTexto.Px :=insert_point_atributo.x; //TAtributo(blocos.items[g]).Px+(  insert_point_atributo.x-insert_point.x);
             NovoTexto.Py:= insert_point_atributo.y;//TAtributo(blocos.items[g]).Py+ ( insert_point_atributo.y-insert_point.y);
             NovoTexto.angulo:= TAtributo(blocos.items[g]).angulo;
             NovoTexto.descricao:=TAtributo(blocos.items[g]).Valor;
             textoPDF(NovoTexto,Desloc_x,Desloc_y,Scale_X,Scale_Y,xFontIndex,Xpage);
            end;
            // texto
            if  ((minhaclasse(blocos.items[g]).objeto = 'TTexto')and true )  then
            if (Tatributo(blocos.items[g]).tipo=43) then  textoPDF(Ttexto(blocos.items[g]),Desloc_x,Desloc_y,Scale_X,Scale_Y,xFontIndex,Xpage);

            //circulo
            if ((Minhaclasse(blocos.items[g]).objeto = 'TCirculo')and (true )) then
                 Begin
                 NovoCirculo.Px:=insert_point.x+Tcirculo(blocos.items[g]).px;
                 NovoCirculo.Py:=insert_point.y+Tcirculo(blocos.items[g]).py;
                  NovoCirculo.Raio:=Tcirculo(blocos.items[g]).raio;
                     circuloPDF(NovoCirculo,Desloc_x,Desloc_y,Scale_X,Scale_Y,Xpage);
                end;
         end;
         end;
        end;
        end;
     xDoc.SaveToFile(aFileName);
  finally
    xDoc.Free;
  end;
    NovoTexto.Destroy;
    NovoCirculo.Destroy;
end;

procedure TConfig.Button2Click(Sender: TObject);
  var
     f: integer;
  Begin


end;

{ TConfig }


end.

{

program fpPDFsubset;

{$codepage utf8}

uses
  SysUtils, fpPDF;

const
  outputStr: array[0..3] of string = (
   'FNTR FNTR', 'FNTR  ', 'FNTR  ', 'FNTR');

procedure GeneratePDF(const AOptions: TPDFOptions; const aFileName: string);
var
  xDoc: TPDFDocument;
  xSection: TPDFSection;
  xPage: TPDFPage;
  xFontIndex, I,lLineWidth: Integer;
Begin
  xDoc := TPDFDocument.Create(nil);
  try
    xDoc.PageLayout := lContinuous;
    xDoc.Options := AOptions;
    xDoc.StartDocument;

    xFontIndex := xDoc.AddFont(ExtractFilePath(ParamStr(0))+'dejavu-lgc-ttf-2.5\Eletrica.ttf', 'Untitled1');

    xSection := xDoc.Sections.AddSection;
    xPage := TPDFPage.Create(xDoc);
    xDoc.Pages.Add(xPage);
    xSection.AddPage(xPage);

    xPage.SetFont(xFontIndex, 10);
    xPage.SetColor(clBlue, False);
    for I := Low(outputStr) to High(outputStr) do
      xPage.WriteText(10, 10+15*I,'FNTR fabricio semonetti');


    lLineWidth := 1;

  xPage.SetPenStyle(ppsSolid, lLineWidth);
  xPage.SetColor(clBlack, True);
  xPage.DrawLine(30, 170, 70, 170, lLineWidth);

  xPage.SetPenStyle(ppsDash, lLineWidth);
  xPage.SetColor(clBlack, True);
  xPage.DrawLine(30, 175, 70, 175, lLineWidth);

  xPage.SetPenStyle(ppsDot, lLineWidth);
  xPage.SetColor(clBlack, True);
  xPage.DrawLine(30, 180, 70, 180, lLineWidth);

  xPage.SetPenStyle(ppsDashDot, lLineWidth);
  xPage.SetColor(clBlack, True);
  xPage.DrawLine(30, 185, 70, 185, lLineWidth);

  xPage.SetPenStyle(ppsDashDotDot, lLineWidth);
  xPage.SetColor(clBlack, True);
  xPage.DrawLine(30, 190, 70, 190, lLineWidth);




    xDoc.SaveToFile(aFileName);
  finally
    xDoc.Free;
  end;
end;

Begin
  GeneratePDF([poCompressText, poCompressFonts], 'normal.pdf');
  GeneratePDF([poCompressText, poCompressFonts, poSubsetFont], 'subset.pdf');
end.



}
