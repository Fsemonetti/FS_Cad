unit principal;

{$IFDEF FPC}
//  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFnDEF FPC}
  WinTypes, WinProcs,
{$ELSE}
  LCLIntf, LCLType,
{$ENDIF}
  SysUtils, Classes, Graphics, Controls, Math, Forms, Dialogs, StdCtrls,
  ExtCtrls, Menus, Buttons, ComCtrls, LazHelpHTML, ButtonPanel, RTTIGrids,
  laz.VirtualTrees, Uler_dxf, Types, conver, Ugerar_pdf, UObjetos, typinfo,
  variants, process, unit5, Uclasse_base, Usalva_dxf, Ulayers, Contnrs,DateUtils,
  Uplanilhas;

const
  crLinie = 1;
  crHand = 2;
  crKreis = 3;
  crRechteck = 4;
  crEimer = 5;
  crSpray = 6;
  crFreihand = 7;
  crText = 8;
  crPipette = 9;
  crSchere = 10;
  crRndRect = 11;
  crRadiergummi = 12;



type




  { TFrPrincipal }
  TFrPrincipal = class(TForm)
        arvore: TTreeView;
        Bevel1: TBevel;
        Bevel2: TBevel;
        Bevel3: TBevel;
        Bevel4: TBevel;
    BtApaga: TSpeedButton;
    BtMoveDesenho: TSpeedButton;
    BtMover: TSpeedButton;
    Btprevia: TSpeedButton;
    Btredesenha: TSpeedButton;
    BtSelecionaAREA: TSpeedButton;
    btCaminhos: TSpeedButton;
    BtCancela: TSpeedButton;
    BtCD: TSpeedButton;
    BtCentroQuadrante: TSpeedButton;
    BtCXP: TSpeedButton;
    BtInterDuasRetas: TSpeedButton;
    BtInterruptor: TSpeedButton;
    BtLampada: TSpeedButton;
    BtLigacoes: TSpeedButton;
    BtLigarEletrodutos: TSpeedButton;
    BtCrLinha: TSpeedButton;
    btpontoextremo: TSpeedButton;
    BtPontoMeio: TSpeedButton;
    BtRepeteComando: TSpeedButton;
    BtTexto: TSpeedButton;
    BtTomada: TSpeedButton;
    BtTuboArco: TSpeedButton;
    BtTuboBezier: TSpeedButton;
    BtTuboReto: TSpeedButton;
    BtZjanela: TSpeedButton;
    Btzmais: TSpeedButton;
    Btzmenos: TSpeedButton;
    Btztudo: TSpeedButton;
    Button1: TButton;
    cmdEdit: TEdit;
    cmdMemoHistorico: TMemo;
    Detalhes: TTabSheet;
    Ccircuitos: TMenuItem;
    Cfiacao: TMenuItem;
    cmdMemo: TMemo;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    ListaPro: TTIPropertyGrid;
    ListaProDet: TTIPropertyGrid;
    MemoCidades: TMemo;
    MemoRodovias: TMemo;
    MenuItem1: TMenuItem;
    GerarCircuitos: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    LerProjeto: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    CalQuedaTensao: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    CalCorrenteCir: TMenuItem;
    CalcCorrenteTomIlu: TMenuItem;
    MainMenu1: TMainMenu;
    ExportarDXF: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    LimparConteudo: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    ExportarPDF: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    GravarProjeto: TMenuItem;
    LimparFiacao: TMenuItem;
    MenuItem7: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Process1: TProcess;
    Selecionar: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    Mselecao: TPopupMenu;
    Separator1: TMenuItem;
    BtGerarDiagrama: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtMoverArco: TSpeedButton;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    TreeImages: TImageList;
    Panel1: TPanel;
    Sair1: TMenuItem;
    Arquivos1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Adiciona1: TMenuItem;
    Propriedades: TTabSheet;
    Projeto: TTabSheet;
    TabSheet1: TTabSheet;
    Compos: TTabSheet;
    Edicao: TTabSheet;
    Visualizar1: TMenuItem;
    Toolbars1: TMenuItem;
    N1: TMenuItem;
    Importar1: TMenuItem;
    N2: TMenuItem;
    ImportarDXF: TMenuItem;
    Comando1: TMenuItem;
    Visualizar2: TMenuItem;
    Preciso: TMenuItem;
    Elementos1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    Plt1: TMenuItem;
    Local1: TMenuItem;
    Cancela: TMenuItem;
    Ferramentas1: TMenuItem;
    workplace: TPaintBox;
    procedure Bevel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtCrLinhaClick(Sender: TObject);
    procedure BtGerarDiagramaClick(Sender: TObject);
    procedure BtMoverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CoolBar1Change(Sender: TObject);
    procedure estatistica;
    procedure btCamadaClick(Sender: TObject);
    procedure BtLigarEletrodutosClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function acha(xp, yp: longint; QualTipo: integer): boolean;
    procedure cmdEditKeyPress(Sender: TObject; var Key: char);
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure CfiacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LimparClick(Sender: TObject);
    procedure LimparFiacaoClick(Sender: TObject);
    procedure ListaProEnter(Sender: TObject);
    procedure ListaProExit(Sender: TObject);
    procedure ListaProModified(Sender: TObject);
    procedure GerarCircuitosClick(Sender: TObject);
    procedure LerProjetoClick(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure CalQuedaTensaoClick(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure CalCorrenteCirClick(Sender: TObject);
    procedure ExportarDXFClick(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure LimparConteudoClick(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure ExportarPDFClick(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure CalcCorrenteTomIluClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure GravarProjetoClick(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FORM1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure FORM1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure Redesenha1Click(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure LerDxf1Click(Sender: TObject);
    procedure ComandosTela(Sender: TObject);
    procedure BtApagaClick(Sender: TObject);
    procedure SelecionarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtMoverArcoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToolbarButton973Click(Sender: TObject);
    procedure Adiciona1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CancelaClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure arvoreClick(Sender: TObject);
    procedure arvoreEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure WorkPlaceMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure FormCreate(Sender: TObject);
    //procedimentos para desenhar os objetos
    procedure desenha_luminaria(PrObjeto: TObject; selecao: boolean);
    procedure desenha_interruptor(PrObjeto: TObject; selecao: boolean);
    procedure desenha_tomada(PrObjeto: TObject; selecao: boolean);
    procedure desenha_tubo(PrObjeto: TObject; selecao: boolean);
    procedure desenha_CD(PrObjeto: TObject; tipo: byte; selecao: boolean);
    procedure desenha_CXP(PrObjeto: TObject; tipo: byte; selecao: boolean);
    procedure desenha_Linha(PrObjeto: TObject; selecao: boolean);
    // procedimentos para desenhos genericos
    procedure AngleTextOut(CV: TCanvas; const sText: string;
      x, y, angle, altura: integer);
    procedure Desenha_Linha_Na_TelaR(a, b: ponto2d; cor: tcolor);
    procedure Desenha_Linha_Na_TelaW(a, b: tpoint; cor: tcolor);
    procedure desenha_blip(ponto: ponto2d; cor: tcolor);
    procedure desenha_blip_solido(ponto: ponto2d; cor: integer);
    procedure desenha_texto(ponto: ponto2d; Altura, angulo: double;
      Texto: string; cor: integer; nomefonte: string);
    procedure desenha_arc(pa: ponto2d; Raio, A_i, A_f: double;
      cor: integer; estilo: integer;indice:integer);
    procedure desenha_circle(Ponto: ponto2d; Raio: double; cor: integer);
    procedure WorkPlaceMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    function EmCimaDoBlip(ponto: ponto2d): boolean;
    procedure bezier;
    procedure CcircuitosClick(Sender: TObject);   // gerar arquivo de caminhos
    procedure ListaFiosCircuito(tubo, circ: integer);
    function Calc_queda(objeto: integer): double;
    procedure ListComponentProperties(Component: TComponent; Strings: TStrings);
    function PegaValorNaLista(numero: integer; Campo: string): variant;
    function PegaValorNaListaBloco(numero: integer; Campo: string): variant;
    function BotaValorNaLista(numero: integer; NomeProp: string;Campo: variant): boolean;
    function Busca_por_Tubulacao(comeco, final: integer; var ind, ind2: integer): boolean;
    procedure Salva_circuito(Sender: TObject);
    function EntraIndice(valor: integer): integer;
    function EntraIndiceB(valor: integer): integer;
    Function Insere_Bloco(Objeto_id:integer;Nome:string;px,py:double;angulo:integer;Construir:boolean):boolean;
    procedure ExecComando(comando:string);
    procedure Mensagem(texto:string;destino:byte);
    procedure Testee(var Lista : TObjectList);
    procedure ObjetosDentroDaAreaSElecionada(JrCleft,JrRight:ponto2d);
      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPrincipal: TFrPrincipal;
  { Variaveis de estado }
  primeiro_canto: boolean;
  desenhando: boolean;
  //B_util: boolean;
  MPT, MCT, MCI, MAI: boolean;
  Mg: boolean;
  MostraIndice: boolean;
  vx, vax, vy, vay, vr: boolean;
  p_ponto, s_ponto, t_ponto: boolean;
  dxf, um, inter: boolean;
  primeiro_ponto, Segundo_ponto, Terceiro_Ponto: boolean;
  Acap_ponto1, Acap_ponto2, luminaria_central: boolean;
  fio_encontrado: boolean;
  BentrouTexto: boolean;
  RepeteComando: boolean;
  Desenha_bezier: boolean;
  Ponto_requisitado : boolean;
   { variaveis inteiras }
  ObjetoCorrenteNoGrid: integer;
  utimo_objeto_selecionado: integer;
  ContaLocais: integer;
  lx, ly, plx, ply: integer;
  B1, b2, b3, b4: integer;
  barra_atual: integer;
  indice_um, indice_dois: integer;
  comando_Ativo, ultimo_comando: integer;
  p_fx, p_fy, ig: integer;
  Mlocais: array [1..40] of integer;
  luminaria_central_id: integer;
  Passou: integer;
  Id_Obj_Sel: integer;
  { variaveis de texto }
  u_comando: string;
  EntradaTexto: string;
  PPGnome: string;
  { variaveis de tipo definido }
  Objeto_primeiro: entidade;
  captura1, captura2: entidade;
  { Pontos 2D }
  cap_ponto1, cap_ponto2,Primeiro_ponto_capturado,Segundo_ponto_capturado: ponto2d;
  blip_centro: ponto2d;
  last_mouseup: ponto2d;
  PtsR: array[0..3] of ponto2d;
  Canto_inferior_esquerdo,Canto_Superior_direito :ponto2d;
  JrCleft,JrRight : ponto2d;
   ponto_entrado : ponto2d;
  // vamos ver
  Pts: array[0..3] of TPoint;
  tambor: array[1..4] of ponto2d;
  Layers: TStringList;
  Dx,Dy: double;
implementation

uses  Uroteamento, Utabelas, Ucircuitos;

{$IFnDEF FPC}
  {$R *.lfm}

{$ELSE}
  {$R *.lfm}
{$ENDIF}
{$R CURSORS.RES}
procedure TFrPrincipal.Mensagem(texto:string;destino:byte);
Begin
  if destino=1 then   statusbar1.Panels.Items[1].Text:=texto;
  if destino=2 then   cmdmemo.Lines.add(texto);
end;
procedure TFrPrincipal.Testee(var Lista : TObjectList);
Begin
  //teste
end;

function TFrPrincipal.Busca_por_Tubulacao(comeco, final: integer; var ind, ind2: integer): boolean;
var
  f, ObjetoTipo: integer;

Begin
  ObjetoTipo := 0;
  for f := 0 to lista.Count - 1 do
  Begin
    Result := False;
    ObjetoTipo := MinhaClasse(lista.items[f]).Tipo;
    if ((ObjetoTipo = Tubulacao)) then
      if ((comeco = Ttubulacao(lista.items[f]).ObjIni) and
        (final = Ttubulacao(lista.items[f]).ObjFin) or
        (comeco = Ttubulacao(lista.items[f]).ObjFin) and
        (final = Ttubulacao(lista.items[f]).ObjIni)) then
      Begin
        ind := MinhaClasse(lista.items[f]).Id_obj;
        ind2 := f;
        Result := True;
        exit;
      end;
 if ((ObjetoTipo = Arco)) then
      if ((comeco = Tarco(lista.items[f]).ObjIni) and
        (final = Tarco(lista.items[f]).ObjFin) or (comeco =
        Tarco(lista.items[f]).ObjFin) and (final = Tarco(lista.items[f]).ObjIni)) then
      Begin
        ind := MinhaClasse(lista.items[f]).Id_obj;
        Result := True;
        ind2 := f;
        exit;
      end;
  end;
end;



Function TFrPrincipal.Insere_Bloco(Objeto_id:integer;Nome:string;px,py:double;angulo:integer;Construir:boolean):boolean;
var
  f,g : integer;
  p_aux,p_aux2,temponto,pivo : Ponto2d;
  p1 : tpoint;
  localizado : boolean;
  campo : string;
  colocar : string;
Begin
  result:=true;
  localizado:=false;
  // aqui começa a diversão
   {**********************************************************************************}
    for f := blocos.Count - 1 downto 0 do
  Begin
     if minhaclasse(blocos.items[f]).Ligado = False then Continue;
     if ( (minhaclasse(blocos.items[f]).objeto = 'TBloco') and (minhaclasse(blocos.items[f]).Tipo=42) and (minhaclasse(blocos.items[f]).Bloco=Nome)) then
       Begin
        Temponto.x := Px;
        Temponto.y := Py;
        pivo:=Temponto;
        p1 := ToScreen(Temponto);
       localizado:=true;
       //  frprincipal.desenha_blip_solido(Temponto,clblue);
          for g := 0 to blocos.Count - 1 do
        Begin
          if minhaclasse(blocos.items[g]).Ligado = False then Continue;
          if  upcase(TBloco(blocos.items[g]).Bloco)=upcase(Nome) then
          Begin

          if minhaclasse(blocos.items[g]).objeto = 'TLinha' then
            Begin
             p_aux.x := TLinha(blocos.items[g]).ax;
             p_aux.y := TLinha(blocos.items[g]).Ay;
             if angulo<>0 then p_aux:=Rotate2DEmTorno(p_aux,pivo, angulo);//rotate2d(p_aux, angulo);
             p_aux.x :=p_aux.x+Temponto.x;
             p_aux.y :=p_aux.y+Temponto.y;
             p_aux2.x := TLinha(blocos.items[g]).bx;
             p_aux2.y := TLinha(blocos.items[g]).by;
             if angulo<>0 then p_aux2:=Rotate2DEmTorno(p_aux,pivo, angulo);//rotate2d(p_aux2, angulo);
             p_aux2.x :=p_aux2.x+Temponto.x;
             p_aux2.y :=p_aux2.y+Temponto.y;
             Desenha_Linha_Na_TelaR(p_aux,p_aux2,clred);
            end;
          if (minhaclasse(blocos.items[g]).objeto = 'TAtributo') then
             Begin
             p_aux.x := TAtributo(blocos.items[g]).px;
             p_aux.y := TAtributo(blocos.items[g]).py;
             if angulo<>0 then p_aux:=rotate2d(p_aux, angulo);
             p_aux.x :=p_aux.x+Temponto.x;
             p_aux.y :=p_aux.y+Temponto.y;
             frprincipal.workplace.Font.Name := 'arial';
             FrPrincipal.desenha_blip_solido(p_aux, clgreen);
             campo:=TAtributo(blocos.items[g]).Campo;
             colocar:=floattostr(PegaValorNaLista(objeto_id,Campo));
             if upcase(campo)='ACIONAMENTO' then colocar:=chr(strtoint(colocar));
            desenha_texto(p_aux, TAtributo(blocos.items[g]).tamanho,0,colocar, clred, 'arial');
             end;
   if (Minhaclasse(blocos.items[g]).objeto = 'TCirculo') then
                 Begin
                    p_aux.x := Tcirculo(blocos.items[g]).Px;
                    p_aux.y := Tcirculo(blocos.items[g]).Py;
                    if angulo<>0 then p_aux:=rotate2d(p_aux, angulo);
                    p_aux.x :=p_aux.x+Temponto.x;
                    p_aux.y :=p_aux.y+Temponto.y;
                    desenha_circle(p_aux, Tcirculo(blocos.items[g]).Raio, clwhite);
                    FrPrincipal.desenha_blip_solido(p_aux, clgreen);
                 end;
          end;
         end;
         exit; // se achou e desenhou sai fora
     end;
     end;
    result:=false;
//if CheckBox1.Checked=true then if localizado=false then cmdmemo.Lines.Add('O bloco de nome '+Nome + ' não foi encontrado');
end;



function TFrPrincipal.EntraIndice(valor: integer): integer;
var
  i: integer;
Begin
  Result := -1;
  for i := lista.Count - 1 downto 0 do if MinhaClasse(lista.items[i]).Id_obj = valor then
    Begin
      Result := i;
    end;
end;
 
function TFrPrincipal.EntraIndiceB(valor: integer): integer;
var
  i: integer;
Begin
  Result := -1;
  for i := blocos.Count - 1 downto 0 do if MinhaClasse(blocos.items[i]).Id_obj = valor then
    Begin
      Result := i;
    end;
end;
procedure TFrPrincipal.Salva_circuito(Sender: TObject);
var
  f: integer;
  generico: TObject;
  arquivo: textfile;
  nome : string;
Begin
  //Assignfile(arquivo, 'objetos.txt');
  Assignfile(arquivo, Tsavedialog(Sender).FileName);
  rewrite(arquivo);
  writeln(arquivo,'Arquivo de projeto do EED');
  for f := 0 to lista.Count - 1 do
  Begin
    generico := TComponent(lista.items[f]);
    if MinhaClasse(lista.items[f]).Ligado then
      MinhaClasse(lista.items[f]).GravarEmArquivo(arquivo, generico);
   end;
  closefile(arquivo);
nome:= Tsavedialog(Sender).FileName;

  // troca a extensão para gravar os blocos...

 nome:=Tsavedialog(Sender).FileName;
 nome:=leftstr(nome,length(nome)-3);
 nome:=nome+'blc';
  Assignfile(arquivo,nome);
  rewrite(arquivo);
  for f := 0 to blocos.Count - 1 do
  Begin
    generico := TComponent(blocos.items[f]);
    if MinhaClasse(blocos.items[f]).Ligado then
      MinhaClasse(blocos.items[f]).GravarEmArquivo(arquivo, generico);
   end;

  closefile(arquivo);


  cmdmemo.Clear;



  cmdmemo.Lines.add('Circuito salvo');

end;

function TFrPrincipal.PegaValorNaLista(numero: integer; Campo: string): variant;
var
  i: integer;
Begin
  Result := -1;
  for i := lista.Count - 1 downto 0 do
    if MinhaClasse(lista.items[i]).Id_obj = numero then
    Begin
      try
      Result := GetPropValue(lista.items[i], campo);
      exit;
      except
      result:=0;
      exit;
      end;
    end;
end;

function TFrPrincipal.PegaValorNaListaBloco(numero: integer; Campo: string): variant;
var
  i: integer;
Begin
  Result := -1;
  for i := blocos.Count - 1 downto 0 do
    if MinhaClasse(blocos.items[i]).Id_obj = numero then
    Begin
      Result := GetPropValue(blocos.items[i], campo);
      exit;
    end;
end;
function TFrPrincipal.BotaValorNaLista(numero: integer; NomeProp: string;
  Campo: variant): boolean;

var
  i: integer;
Begin
  Result := False;
  for i := lista.Count - 1 downto 0 do
    if MinhaClasse(lista.items[i]).Id_obj = numero then
    Begin
      SetPropValue(lista.items[i], NomeProp, campo);
      BotaValorNaLista := True;
      exit;
    end;
end;

function TFrPrincipal.Calc_queda(objeto: integer): double;
var
  i, ci, xi: integer;
  texto, a, b: string;
  registro: entidade;
  locais: textfile;
  encontrou: boolean;
  pigual: byte;
  extensao, power, diametroFio: double;
  asd: longint;
  qt: double;
  ultimo_registro: boolean;
  ObjIni, Tubo, CircObjIni: integer;
Begin
  Result := 0;
  qt := 0;
  ultimo_registro := False;
  encontrou := False;
  texto := IntToStr(objeto);
  assignfile(Locais, 'caminhosTubo.txt');
  reset(Locais);
  while (not (EOF(locais)) and (encontrou = False)) do    // primeiro while
  Begin
    readln(locais, a);
    pigual := pos('=', a, 1);
    b := copy(a, 1, pigual - 1);
    if b = texto then  encontrou := True;
  end;
  if encontrou = False then
  Begin
    cmdmemo.Font.Color := clred;
    cmdmemo.Lines.add(
      'Ocorreu um erro, não foi encontrado caminho relacionado, nmo objeto de id_obj =' +
      texto);
    Result := -1;
    cmdmemo.Font.Color := clblack;
    closefile(locais);
    exit;
  end;

  // Neste ponto encontrou o objeto ou da uma mensagem avisando que não foi encontrado
  ObjIni := StrToInt(texto);
  CircObjIni := pegavalornalista(ObjIni, 'circuito');

  while not EOF(locais) or (ultimo_registro = True) do       // segundo while
  Begin
    pigual := pos('=', a, 1); // pega a posição do caracter '='
    B := Copy(a, pigual + 1, length(a));
    // endereço do tubo copy apos a posição do = até o final
    Tubo := StrToInt(b); // numero do tibo id_obj
    if copy(a, 1, pigual - 1) <> texto then
      // verifica se terminou, se sim, fecha o arquivo e cai fora
    Begin
      closefile(Locais);
      cmdmemo.Lines.add('Queda do circuito ' + IntToStr(CircObjIni) +
        ' no objeto ' + IntToStr(objeto) + ' é =' +
        FloatToStrF(qt, ffFixed, 6, 2) + '%');
      // incluir o valor da queda de tensão no objeto final
      registro.bx := QT;
     // Altera(registro);
      Result := QT;
      exit;
    end;

    // comprimento da tubulação
    extensao := Ttubulacao(lista.items[EntraIndice(tubo)]).Comprimento;

    // ObjIni objeto onde está sendo calculado a queda de tensão
    // CircObjIni circuito ao qual pertence o objeto em questão
    for i := 0 to lista.Count - 1 do // percorre todos os objetos
    Begin
      if MinhaClasse(lista.Items[i]).Tipo = 29 then // se o objeto for um fio
      Begin
        if TFio(lista.Items[i]).Tubo = Tubo then // se o tubo for o mesmo
        Begin
          Ci := PegaValorNaLista(TFio(lista.Items[i]).ObjetoInicial, 'circuito');
          // pega circuito do objeto
          if (cI = CircObjIni) then
          Begin
            // CircObjIni contem o circuito
            // usar esse para gera o diametro do fio
            power := PegaValorNaLista(TFio(lista.Items[i]).ObjetoInicial, 'potencia');
            diametroFio := PegaValorNaLista(TFio(lista.Items[i]).ObjetoInicial,
              'circuito');
            for xi := 1 to lista.Count - 1 do
              if MinhaClasse(lista.Items[xi]).Tipo = 33 then
                if Tcircuito(lista.Items[xi]).tag = diametrofio then
                  diametrofio := Tcircuito(lista.Items[xi]).DfioSel;
            qt := qt + QuedaTensao(extensao, 220, power / 220, diametroFio, 1, 1);
            // cmdmemo.lines.add(floattostr(diametroFio));
          end;
        end;
      end;
    end; // end do for
    if ultimo_registro = True then
    Begin
      closefile(Locais);
      cmdmemo.Lines.add('Queda do circuito ' + IntToStr(CircObjIni) +
        ' no objeto ' + IntToStr(objeto) + ' é=' +
        FloatToStrF(qt, ffFixed, 8, 2) + '%');
      // incluir o valor da queda de tensão no objeto final
      registro.bx := QT;
     // Altera(registro);
      Result := QT;
      exit;
    end;
    readln(locais, a);
    if EOF(locais) = True then ultimo_registro := True;
  end; // END DO segundo  WHILE
  cmdmemo.Lines.add('Queda trensão to do circuito 2 no fio é=' + floattostr(qt));
  // incluir o valor da queda de tensão no objeto final
  registro.bx := QT;
 // Altera(registro);
  closefile(Locais);

end;

procedure TFrPrincipal.ListaFiosCircuito(tubo, circ: integer);
var
  I: integer;
  Power, circuito: integer;
  encontrou: boolean;
Begin
  encontrou := False;

  cmdmemo.Lines.add('Objetos que usam o circuito ' + IntToStr(circ) +
    ' que passam no tubo ' + IntToStr(tubo));
  for i := 0 to lista.Count - 1 do
  Begin
    if MinhaClasse(lista.Items[i]).tipo = 29 then // se o tipo é um fio
      if (TFio(lista.Items[i]).Tubo = tubo) then // se o fio está no tubo em questão
      Begin
        encontrou := True;
        Power := PegaValorNaLista(TFio(lista.Items[i]).ObjetoInicial, 'potencia');
        circuito := PegaValorNaLista(TFio(lista.Items[i]).ObjetoInicial, 'circuito');
        if circuito = circ then
        Begin
          cmdmemo.Lines.add(
            IntToStr(TFio(lista.Items[i]).ObjetoInicial) + '/' +
            circuito.ToString + '/' + power.ToString);
          encontrou := True;
        end
        else
        if circ = -1 then
        Begin
          cmdmemo.Lines.add(IntToStr(TFio(lista.Items[i]).ObjetoInicial) +
            '/' + circuito.ToString + '/' + power.ToString);
          encontrou := True;
        end;
      end;
  end;
  if encontrou = False then  cmdmemo.Lines.add('Não foi encontrado neste tubo');
end;

function TFrPrincipal.acha(xp, yp: longint; QualTipo: integer): boolean;
var
  distancia: double;
  p1, p2, pt: tpoint;
  temponto,p_aux,p_aux2: ponto2d;
  a, b: ponto2d;
  TipoObjeto, f,g: integer;
  nome_bloco : string;
Begin
  cmdmemo.Lines.add('Procurando...');
  acha := False;
  pt.x := xp;
  pt.y := yp;
  last_MouseUp := Toworld(pt);
  for f := lista.Count - 1 downto 0 do
  Begin

    if MinhaClasse(lista.items[f]).Ligado = False then continue;

    TipoObjeto := MinhaClasse(lista.items[f]).Tipo;
    Id_Obj_Sel := MinhaClasse(lista.items[f]).Id_obj;


    if (TipoObjeto = Ponto_iluminacao) then
    Begin
      Temponto.x := TIluminacao(lista.items[f]).Px;
      Temponto.y := TIluminacao(lista.items[f]).Py;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 8) then
      Begin
        desenha_blip_solido(temponto, 15);
        ObjetoSelecionado := Tlinha(lista.items[f]).Id_obj;
        ListaPro.TIObject := TIluminacao(lista.items[f]);
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        cmdmemo.Lines.add('Encontrado ponto de iluminação');
        Result := True;
      //  edit1.Text := floattostr(TIluminacao(lista.items[f]).px);
     //   edit2.Text := floattostr(TIluminacao(lista.items[f]).py);
        desenha_luminaria(lista.items[f], True);
        exit;
      end;
    end;    // ponto de iluminação
    if (TipoObjeto = interruptor) then
    Begin
      Temponto.x := TInterruptor(lista.items[f]).Px;
      Temponto.y := TInterruptor(lista.items[f]).Py;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 10) then
      Begin
        last_MouseUp := Temponto;
        desenha_blip_solido(temponto, 15);
        FrPrincipal.desenha_interruptor(TObject(lista.items[f]), True);
        ObjetoSelecionado := Tlinha(lista.items[f]).Id_obj;
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        ListaPro.TIObject := TInterruptor(lista.items[f]);
     //   edit1.Text := floattostr(TInterruptor(lista.items[f]).px);
     //   edit2.Text := floattostr(TInterruptor(lista.items[f]).py);
        cmdmemo.Lines.add('Encontrado Interruptor');
        desenha_interruptor(lista.items[f], True);
        Result := True;
        exit;
      end;
    end; // interruptor
    if (TipoObjeto = tomada) then
    Begin
      Temponto.x := Ttomada(lista.items[f]).Px;
      Temponto.y := Ttomada(lista.items[f]).Py;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 10) then
      Begin
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := Ttomada(lista.items[f]);
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        desenha_blip_solido(temponto, 15);
        Result := True;
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
    //    edit1.Text := floattostr(Ttomada(lista.items[f]).px);
    //    edit2.Text := floattostr(Ttomada(lista.items[f]).py);
        desenha_tomada(lista.items[f], True);
        cmdmemo.Lines.add('Encontrado Tomada');
        exit;
      end;
    end;// tomada
    if (TipoObjeto = CxPassagem) then
    Begin
      Temponto.x := TCxp(lista.items[f]).Px;
      Temponto.y := TCxp(lista.items[f]).Py;
      p1 := ToScreen(Temponto);

      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 10) then
      Begin
        // showmessage('Encontrei caixa de passagem ');
        desenha_blip_solido(temponto, 15);
        FrPrincipal.desenha_CXP(lista.items[f], 0, True);
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := TCxp(lista.items[f]);
        Result := True;
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
   //     edit1.Text := floattostr(TCxp(lista.items[f]).px);
   //     edit2.Text := floattostr(TCxp(lista.items[f]).py);
        desenha_cxp(lista.items[f], 1, True);
        cmdmemo.Lines.add('Encontrado Caixa de passagem');
        exit;
      end;
    end;// caixa de passagem
    if (TipoObjeto = CaixaDisjuntores) then
    Begin
      Temponto.x := TCd(lista.items[f]).Px;
      Temponto.y := TCd(lista.items[f]).Py;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 10) then
      Begin
        // showmessage('Encontrei tomada ');
        desenha_blip_solido(temponto, 15);
        FrPrincipal.desenha_CD(lista.items[f], 0, True);
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := TCd(lista.items[f]);
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        Result := True;
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
 //       edit1.Text := floattostr(TCd(lista.items[f]).px);
   //     edit2.Text := floattostr(TCd(lista.items[f]).py);
        cmdmemo.Lines.add('Encontrado caixa de disjuntores');
        exit;
      end;
    end;   // caixa de disjuntores
    // tubulação em arco
   { if ((TipoObjeto = Arco)) then
    Begin
      Temponto.x := util.ax;
      Temponto.y := util.ay;
      p1 := ToScreen(Temponto);
      a.x := util.ax;
      a.y := util.ay;
      p1.x := xp;
      p1.y := yp;
      b := toworld(p1);
      if (d_dois_pontos(util.ax, util.ay, b.x, b.y) < util.Raio) then
      Begin
        Dist_ponto_seg_arc(a, b, util.raio, util.AnguloInicial, util.AnguloFinal);
        desenha_arc(temponto, util.Raio, util.AnguloInicial, util.AnguloFinal, clblack, 0);
        cmdmemo.lines.add('Encontrado  arco');
        exit;
      end;
    end;
    }

    // texto
    if (TipoObjeto = texto) then
    Begin
      Temponto.x := Ttexto(lista.items[f]).Px;
      Temponto.y := Ttexto(lista.items[f]).Py;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 8) then
      Begin
        desenha_blip_solido(temponto, 15);
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := Ttexto(lista.items[f]);
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).id_obj;
        Result := True;
        cmdmemo.Lines.add('Encontrado texto');
        exit;
      end;
    end;

    // arco
    if ((TipoObjeto = arco) or (TipoObjeto = arcodxf)) then
    Begin
      Temponto.x := TArco(lista.items[f]).locx;
      Temponto.y := TArco(lista.items[f]).LocY;
      p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 8) then
      Begin
        desenha_blip_solido(temponto, 15);
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := TArco(lista.items[f]);
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        Temponto.x := TArco(lista.items[f]).px;
        Temponto.y := TArco(lista.items[f]).pY;
        desenha_arc(temponto, TArco(lista.items[f]).Raio, TArco(
          lista.items[f]).AnguloInicial, TArco(lista.items[f]).AnguloFinal, clwhite, 0,minhaclasse(lista.items[f]).Id_obj);
        Result := True;
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        cmdmemo.Lines.add('Encontrado arco ou arco dxf');
        exit;
      end;
    end;
    //tlinha
    if TipoObjeto = linha_dxf then
    Begin
      a.x := Tlinha(lista.items[f]).ax;
      a.y := Tlinha(lista.items[f]).ay;
      b.x := Tlinha(lista.items[f]).bx;
      b.y := Tlinha(lista.items[f]).by;
      p1 := toscreen(a);
      p2 := toscreen(b);
      distancia := DistanciaSretaAoPonto(p1, p2, pt);
      if distancia <= 2 then
      Begin
        if p1.x = p2.x then pt.x := p1.x;
        if p1.y = p2.y then pt.y := p1.y;
        // se ela é inclinada ferrou
        desenha_linha(lista.items[f], True);
        Tlinha(lista.items[f]).Selecionado:=true;
        ObjetoSelecionado := Tlinha(lista.items[f]).Id_obj;
        ListaPro.TIObject := TLinha(lista.items[f]);
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        Result := True;
        Linha1 := Linha2;
        Linha2 := tlinha(lista.items[f]);
        cmdmemo.Lines.add('Encontrado linha DXf');
        desenha_linha(lista.items[f], True);
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        exit;
      end;
    end;// do objeto linha
    if TipoObjeto = tubulacao then
    Begin
      a.x := TTubulacao(lista.items[f]).ObjIni_X;
      a.y := TTubulacao(lista.items[f]).ObjIni_Y;
      b.x := TTubulacao(lista.items[f]).ObjFin_X;
      b.y := TTubulacao(lista.items[f]).ObjFin_Y;
      p1 := toscreen(a);
      p2 := toscreen(b);
      distancia := DistanciaSretaAoPonto(p1, p2, pt);
      if distancia <= 2 then
      Begin
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        desenha_linha(lista.items[f], True);
        ObjetoSelecionado := Tlinha(lista.items[f]).Id_obj;
        ListaPro.TIObject := TTubulacao(lista.items[f]);
        Result := True;
        cmdmemo.Lines.add('Encontrado Tubulação');
        exit;
      end;
    end;// do objeto tubulação

    if TipoObjeto = circulo then
    Begin
      Temponto.x := Tcirculo(lista.items[f]).Px;
      Temponto.y := TCirculo(lista.items[f]).py;
      p1 := ToScreen(Temponto);
      // cmdmemo.lines.add(floattostr(d_dois_pontos(p1.x, p1.y, xp, yp)));
      //   cmdmemo.lines.add( 'Px='+floattostr(Temponto.x));
      //   cmdmemo.lines.add('Py='+floattostr(Temponto.y));


      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 8) then
      Begin
        MinhaClasse(lista.items[f]).Selecionado := Selecionar.Checked;
        desenha_blip_solido(temponto, 15);
        ObjetoSelecionado := minhaclasse(lista.items[f]).Id_obj;
        ListaPro.TIObject := Tcirculo(lista.items[f]);
        ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        Result := True;
        cmdmemo.Lines.add('Encontrado circunferencia');
        exit;
      end;
    end;// do objeto cirscunferencia

  end; //do for princiapl

    {**********************************************************************************}
    // achar bloco
    {**********************************************************************************}
    for f := blocos.Count - 1 downto 0 do
  Begin
     if minhaclasse(blocos.items[f]).Ligado = False then Continue;
     if ( (minhaclasse(blocos.items[f]).objeto = 'TBloco') and (minhaclasse(blocos.items[f]).Tipo=42) ) then
       Begin
        Temponto.x := TBloco(blocos.items[f]).Px;
       Temponto.y := TBloco(blocos.items[f]).Py;
       p1 := ToScreen(Temponto);
      if (d_dois_pontos(p1.x, p1.y, xp, yp) < 8) then
      Begin
         frprincipal.desenha_blip_solido(Temponto,clblue);
         cmdmemo.lines.Add(TBloco(blocos.items[f]).Bloco);


           if entraindiceb(TBloco(blocos.items[f]).Id_obj)>-1 then

           ListaPro.TIObject := Tbloco(blocos.items[entraindiceb(TBloco(blocos.items[f]).Id_obj)]);

         cmdmemo.lines.Add('Bloco id='+inttostr(TBloco(blocos.items[f]).Id_obj));
//         cmdmemo.lines.Add(TBloco(blocos.items[f]).Bloco);

          Nome_bloco:=TBloco(blocos.items[f]).Bloco;
          for g := 0 to blocos.Count - 1 do
        Begin
          if minhaclasse(blocos.items[g]).Ligado = False then Continue;
          if  TBloco(blocos.items[g]).Bloco=Nome_bloco then
          Begin
          if minhaclasse(blocos.items[g]).objeto = 'TLinha' then
            Begin
             p_aux.x := TLinha(blocos.items[g]).ax+Temponto.x;
             p_aux.y := TLinha(blocos.items[g]).Ay+Temponto.y;
             p_aux2.x := TLinha(blocos.items[g]).bx+Temponto.x;
             p_aux2.y := TLinha(blocos.items[g]).by+Temponto.y;
            Desenha_Linha_Na_TelaR(p_aux,p_aux2,clred);
            end;

            if minhaclasse(blocos.items[g]).objeto = 'TCirculo' then
            Begin
             p_aux.x := TCirculo(blocos.items[g]).px+Temponto.x;
             p_aux.y := TCirculo(blocos.items[g]).py+Temponto.y;
             desenha_circle(p_aux,TCirculo(blocos.items[g]).raio,clred);
            end;


          if ((minhaclasse(blocos.items[g]).objeto = 'TAtributo')and (TAtributo(blocos.items[g]).Pai=TBloco(blocos.items[f]).Id_obj))then
             Begin
              p_aux.x := TAtributo(blocos.items[g]).Px+Temponto.x;
              p_aux.y := TAtributo(blocos.items[g]).Py+Temponto.y;
              frprincipal.workplace.Font.Name := 'arial';
              FrPrincipal.desenha_blip_solido(p_aux, clgreen);
            //  tamanho:=TAtributo(blocos.items[g]).tamanho;
                cmdmemo.lines.Add('Bloco atributo='+(tatributo(blocos.items[g]).campo));
                cmdmemo.lines.Add('Bloco valor atributo='+(Tatributo(blocos.items[g]).valor));
                desenha_texto(p_aux, TAtributo(blocos.items[g]).tamanho, TAtributo(
               blocos.items[g]).angulo, TAtributo(blocos.items[g]).valor, clred, 'arial');
             end;
          end;
         end;
         exit;
        end;
       end;
     end;




















  Cmdmemo.Lines.Add('Nada Foi encontrado');
end;

procedure TFrPrincipal.estatistica;
var
  f, CFio, CTubo, CCircuito, CLampada, CInterruptor, CTomada, CCd,
  CCxp, CLinhaDXF, CArco, CCirculo, CTexto, CArcoS, CLAyer,CBloco,CBlocoDef,catributo: integer;

Begin
// parte dos blocos
  CBloco:=0;
  CFio := 0;
  CTubo := 0;
  CLampada := 0;
  CInterruptor := 0;
  CTomada := 0;
  CCd := 0;
  CCxp := 0;
  CLinhaDXF := 0;
  CArco := 0;
  CCirculo := 0;
  CTexto := 0;
  CArcoS := 0;
  CCircuito := 0;
  CLayer := 0;
  catributo:=0;
  CBlocoDef:=0;
  cmdmemo.Lines.add('Estatisticas dos blocos');
   for f := blocos.Count - 1 downto 0 do
  Begin
    if (minhaclasse(blocos.items[f]).tipo = 40) then CBlocoDef:=CBlocoDef+1;
    if (minhaclasse(blocos.items[f]).tipo = 42)then CBloco := CBloco + 1;
    if minhaclasse(blocos.items[f]).objeto = 'TLinha'      then CLinhaDXF := CLinhaDXF + 1;
    if minhaclasse(blocos.items[f]).objeto = 'Tarco'       then CArco := CArco + 1;
    if minhaclasse(blocos.items[f]).objeto = 'TCirculo'    then CCirculo := CCirculo + 1;
    if minhaclasse(blocos.items[f]).objeto = 'TTexto'      then CTexto := CTexto + 1;
    if minhaclasse(blocos.items[f]).objeto = 'TAtributo'  then Catributo := Catributo + 1;
   end;
  cmdmemo.Lines.add('CLinhaDXF=' + IntToStr(CLinhaDXF));
  cmdmemo.Lines.add('CArco=' + IntToStr(CArco));
  cmdmemo.Lines.add('CCirculo=' + IntToStr(CCirculo));
  cmdmemo.Lines.add('CTexto=' + IntToStr(CTexto));
  cmdmemo.Lines.add('CBloco definidos=' + IntToStr(CBlocoDef));
  cmdmemo.Lines.add('CBloco inseridos =' + IntToStr(CBloco));
  cmdmemo.Lines.add('CAtributo=' + IntToStr(CAtributo));
  cmdmemo.Lines.add('Total=' + IntToStr( clinhadxf + carco + ccirculo +
    ctexto +Cbloco+Catributo));

     cmdmemo.Lines.add('Total de items  blocos gravados='+inttostr(blocos.Count-1));

     cmdmemo.Lines.add('Estatisticas da lista');


// parte da lista
  CBloco:=0;
  CFio := 0;
  CTubo := 0;
  CLampada := 0;
  CInterruptor := 0;
  CTomada := 0;
  CCd := 0;
  CCxp := 0;
  CLinhaDXF := 0;
  CArco := 0;
  CCirculo := 0;
  CTexto := 0;
  CArcoS := 0;
  CCircuito := 0;
  CLayer := 0;
  catributo:=0;

  for f := lista.Count - 1 downto 0 do
  Begin
    if minhaclasse(lista.items[f]).tipo = 40              then CBloco := CBloco + 1;
    if minhaclasse(lista.items[f]).objeto = 'TFio'        then CFio := CFio + 1;
    if minhaclasse(lista.items[f]).objeto = 'TTubulacao'  then CTubo := CTubo + 1;
    if minhaclasse(lista.items[f]).objeto = 'TIluminacao' then CLampada := CLampada + 1;
    if minhaclasse(lista.items[f]).objeto = 'TInterruptor'then CInterruptor := CInterruptor + 1;
    if minhaclasse(lista.items[f]).objeto = 'TTomada'     then CTomada := CTomada + 1;
    if minhaclasse(lista.items[f]).objeto = 'TCd'         then CCd := CCd + 1;
    if minhaclasse(lista.items[f]).objeto = 'TCxp'        then CCxp := CCxp + 1;
    if minhaclasse(lista.items[f]).objeto = 'TLinha'      then CLinhaDXF := CLinhaDXF + 1;
    if minhaclasse(lista.items[f]).objeto = 'Tarco'       then CArco := CArco + 1;
    if minhaclasse(lista.items[f]).objeto = 'TCirculo'    then CCirculo := CCirculo + 1;
    if minhaclasse(lista.items[f]).objeto = 'TTexto'      then CTexto := CTexto + 1;
    if minhaclasse(lista.items[f]).objeto = 'TArcoS'      then CArcoS := CArcoS + 1;
    if minhaclasse(lista.items[f]).objeto = 'TCircuito'   then CCircuito := CCircuito + 1;
    if minhaclasse(lista.items[f]).objeto = 'TLayer'      then CLayer := CLayer + 1;
    if minhaclasse(lista.items[f]).objeto = 'TAtributo'  then Catributo := Catributo + 1;
   end;

  cmdmemo.Lines.add('Fio=' + IntToStr(CFio));
  cmdmemo.Lines.add('CTubo=' + IntToStr(CTubo));
  cmdmemo.Lines.add('CLampada=' + IntToStr(CLampada));
  cmdmemo.Lines.add('CInterruptor=' + IntToStr(CInterruptor));
  cmdmemo.Lines.add('CTomada=' + IntToStr(CTomada));
  cmdmemo.Lines.add('CCd=' + IntToStr(CCd));
  cmdmemo.Lines.add('CCxp=' + IntToStr(CCxp));
  cmdmemo.Lines.add('CLinhaDXF=' + IntToStr(CLinhaDXF));
  cmdmemo.Lines.add('CArco=' + IntToStr(CArco));
  cmdmemo.Lines.add('CCirculo=' + IntToStr(CCirculo));
  cmdmemo.Lines.add('CTexto=' + IntToStr(CTexto));
  cmdmemo.Lines.add('CArcoS=' + IntToStr(CArcoS));
  cmdmemo.Lines.add('CCircuito=' + IntToStr(CCircuito));
  cmdmemo.Lines.add('CLayer=' + IntToStr(CLayer));
  cmdmemo.Lines.add('CBloco=' + IntToStr(CBloco));
  cmdmemo.Lines.add('CAtributo=' + IntToStr(CAtributo));


  cmdmemo.Lines.add('Total=' + IntToStr(cfio + ctubo + clampada +
    cinterruptor + ctomada + ccd + ccxp + clinhadxf + carco + ccirculo +
    ctexto + carcos + Clayer+Cbloco+Catributo));
  cmdmemo.Lines.add('Variável  de referência Total=' + IntToStr(total));

 { Cbloco:=0;
  for f := Blocos.Count - 1 downto 0 do
  Begin
 if minhaclasse(blocos[f]).Tipo=40  then inc(Cbloco);
 cmdmemo.Lines.add(' blocos tipo ='+minhaclasse(blocos[f]).objeto+'='+minhaclasse(blocos[f]).Bloco);

  end;
  cmdmemo.Lines.add('Total de items  blocos ='+inttostr(Cbloco));

  cmdmemo.Lines.add('Total de items  blocos gravados='+inttostr(blocos.Count-1));
    }
end;

procedure TFrPrincipal.BtCrLinhaClick(Sender: TObject);
var
  NovoLinhaDXF: Tlinha;

Begin
  NovoLinhaDXF := TLinha.Create;
  total := total + 1;
  NovoLinhaDXF.Id_obj := total;
  NovoLinhaDXF.Tipo := 3;
  NovoLinhaDXF.ligado := True;
  NovoLinhaDXF.Ax := Cap_ponto1.x;
  NovoLinhaDXF.Ay := Cap_ponto1.y;
  NovoLinhaDXF.Bx := Cap_ponto2.x;
  NovoLinhaDXF.By := Cap_ponto2.y;
  NovoLinhaDXF.Angulo := 0;
  NovoLinhaDXF.Objeto := 'TLinha';
  lista.add(NovoLinhaDXF);
  Desenha_Linha_Na_TelaR(Cap_ponto1, Cap_ponto2, clwhite);
end;

procedure TFrPrincipal.BtGerarDiagramaClick(Sender: TObject);
var
  f : integer;
  a,b : double;
  novotexto : Ttexto;
  chave : char;
Begin
   DX:=15; DY:=30;

  for f:=1 to lista.Count-1 do
  Begin
  if Minhaclasse(lista.items[f]).Objeto='TCircuito' then
  Begin
  //carrega_Dxf('C:\Programas\EED\BLOCOS\LinhaQD.dxf', true);
   carrega_Dxf('C:\Programas\EED\BLOCOS\TesteQuadro.dxf');
    NovoTexto := TTexto.Create;
    total:=total+1;
    NovoTexto.Id_obj :=total;
    NovoTexto.Tipo := 6;
    NovoTexto.Px := dx+1.1;
    NovoTexto.Py := dy;
    NovoTexto.angulo := 0;
    Novotexto.tamanho := 0.09;
    NovoTexto.descricao := inttostr(TCircuito(lista.items[f]).Disjuntor)+'A';
    NovoTexto.ligado := True;
    NovoTexto.objeto := 'TTexto';
    NovoTexto.Bloco := '';
    NovoTexto.pai :=0;
    NovoTexto.LayerName :='0';
    NovoTexto.Selecionado:=false;
   lista.add(Novotexto);


    NovoTexto := TTexto.Create;
    total:=total+1;
    NovoTexto.Id_obj :=total;
    NovoTexto.Tipo := 6;
    NovoTexto.Px := dx+2.1;
    NovoTexto.Py := dy+0.05;
    NovoTexto.angulo := 0;
    Novotexto.tamanho := 0.09;
    NovoTexto.descricao := TCircuito(lista.items[f]).descricao+' #'+floattostr(TCircuito(lista.items[f]).DfioSel) +'mm' ;
    NovoTexto.ligado := True;
    NovoTexto.objeto := 'TTexto';
    NovoTexto.Bloco := '';
    NovoTexto.pai :=0;
    NovoTexto.LayerName :='0';
    NovoTexto.Selecionado:=false;
   lista.add(Novotexto);


    
    NovoTexto := TTexto.Create;
    total:=total+1;
    NovoTexto.Id_obj :=total;
    NovoTexto.Tipo := 6;
    NovoTexto.Px := dx+2.1;
    NovoTexto.Py := dy-0.15;
    NovoTexto.angulo := 0;
    Novotexto.tamanho := 0.09;
    NovoTexto.descricao := TCircuito(lista.items[f]).descricaoAD;
    NovoTexto.ligado := True;
    NovoTexto.objeto := 'TTexto';
    NovoTexto.Bloco := '';
    NovoTexto.pai :=0;
    NovoTexto.LayerName :='0';
    NovoTexto.Selecionado:=false;
   lista.add(Novotexto);

   Dy:=DY-0.5;
  end;
end;
   frprincipal.Redesenha1Click(nil);
end;

procedure TFrPrincipal.BtMoverClick(Sender: TObject);
Begin
  comando_ativo:=mover;
  ExecComando('limpar');
  Mensagem('Aguardando o ponto inicial  para mover >',2);
End;

procedure TFrPrincipal.Button1Click(Sender: TObject);
var
  ts: TTextStyle;
  r : Trect;
  const
  S = 'This is a sample text, I think, is it not?';
Begin
  ponto_requisitado:=true;
  // exemplo
  ts := Canvas.TextStyle;
  ts.Alignment := taCenter;
  ts.Layout := tlCenter;
  workplace.Canvas.TextRect(Rect(10, 10, 490, 390), 0, 0, 'My text', ts);
  //exemplo
   r := Rect(100, 100,150,200);
  DrawText(Canvas.Handle,PChar(S),Length(S),r,DT_LEFT or DT_WORDBREAK or DT_CALCRECT);
  DrawText(Canvas.Handle,PChar(S),Length(S),r,DT_LEFT or DT_WORDBREAK);
  //





  end;


procedure TFrPrincipal.CoolBar1Change(Sender: TObject);
Begin

end;

procedure TFrPrincipal.BitBtn1Click(Sender: TObject);
var
  pi: ponto2d;
  pt: tpoint;

Begin
{  Tambor[1].x := tambor[2].x;
  Tambor[1].y := tambor[2].y;
  Tambor[2].x := tambor[3].x;
  Tambor[2].y := tambor[3].y;
  Tambor[3].x := tambor[4].x;
  Tambor[3].y := tambor[4].y;
  PI.x := strtofloatdef(edit1.Text, 0);
  PI.y := strtofloatdef(edit2.Text, 0);
  PT := toscreen(pi);
  tambor[4].x := pi.x;
  tambor[4].y := pi.y;
  frprincipal.desenha_blip_solido(pi,15);
 // FORM1MouseUp(self, mbleft, teste, pt.x, pt.y);
  cmdmemo.Lines.add('Entrado coordenadas x=' + floattostr(pi.x) +
    '  y=' + floattostr(pi.y));}
   if  Bevel1.style=bsraised then  Bevel1.style:=bsLowered
                           else  Bevel1.style:=bsraised;
end;

procedure TFrPrincipal.BitBtn2Click(Sender: TObject);
begin
 //   if  Bevel2.style=bsraised then  Bevel2.style:=bsLowered
           //                else  Bevel2.style:=bsraised;
end;

procedure TFrPrincipal.BitBtn3Click(Sender: TObject);
begin
   // if  Bevel3.style=bsraised then  Bevel3.style:=bsLowered
     //                      else  Bevel3.style:=bsraised;
end;

procedure TFrPrincipal.BitBtn4Click(Sender: TObject);
begin
  //  if  Bevel4.style=bsraised then  Bevel4.style:=bsLowered
     //                      else  Bevel4.style:=bsraised;
end;

procedure TFrPrincipal.BitBtn5Click(Sender: TObject);
begin
   // if  Bevel5.style=bsraised then  Bevel5.style:=bsLowered
         //                  else  Bevel5.style:=bsraised;
end;

procedure TFrPrincipal.Bevel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFrPrincipal.ExecComando(comando:string);
var
   teclado: tshiftstate;
  a, b, f: integer;
  texto,parteA,parteB: string;
  NovoLinhaDXF: tlinha;
  desloca: double;
  ValorInteiro: integer;
  ValorTexto: string;
  ValorDouble: double;
  generico : tcomponent;

Begin
  valorTexto := '';
  valorinteiro := 0;
  valordouble := 0;
     cmdMemo.Lines.add(comando);
    // combobox1.AddItem(comando,self);
  //   combobox1.Text:=comando;

     if uppercase(comando) = 'SELTODOS' then
     Begin
     for f := 0 to lista.Count - 1 do  minhaclasse(lista.items[f]).Selecionado := true;
     for f := 0 to blocos.Count - 1 do  minhaclasse(blocos.items[f]).Selecionado := true;
     redesenha1click(nil);
     end;

    if uppercase(comando) = 'AZUL' then
    Begin
    // cap_ponto1.x:=strtofloat(edit1.text);
  //   cap_ponto1.y:=strtofloat(edit2.text);
    end;
    if uppercase(comando) = 'VERMELHO' then
    Begin
 //    cap_ponto2.x:=strtofloat(edit1.text);
//     cap_ponto2.y:=strtofloat(edit2.text);
    end;




  if uppercase(comando) = 'TIRASEL' then
  Begin
  for f := 0 to lista.Count - 1 do  minhaclasse(lista.Items[f]).Selecionado := false;
  for f := 0 to blocos.Count - 1 do  minhaclasse(blocos.items[f]).Selecionado := false;
  redesenha1click(nil);
  end;

  if uppercase(comando) = 'MOVER' then
  Begin
         for f := 0 to lista.Count - 1 do if minhaclasse(lista[f]).Selecionado = True then
       Begin
       // minhaclasse(lista[f]).Selecionado:=false;
        if    minhaclasse(lista.items[f]).Tipo=3  then   Tlinha(lista.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);
        if    minhaclasse(lista.items[f]).Tipo=6  then   TTexto(lista.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);
        if    minhaclasse(lista.items[f]).Tipo=5  then TCirculo(lista.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);  ;
        if    minhaclasse(lista.items[f]).Tipo=32 then   Tarco(lista.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);
      end;
    for f := 0 to blocos.Count - 1 do if minhaclasse(blocos[f]).Selecionado = True then
       Begin
      //  minhaclasse(lista[f]).Selecionado:=false;

         if ((minhaclasse(blocos.items[f]).objeto = 'TBloco') and (minhaclasse(blocos.items[f]).Tipo=42)) then
    Begin
      TBloco(blocos.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);
       end;

        if  (minhaclasse(blocos.items[f]).objeto = 'TAtributo') then
        if  TAtributo(blocos.items[f]).Tipo=43 then
        Begin
          TAtributo(blocos.items[f]).DeslocarPara(cap_ponto2.x-cap_ponto1.x,cap_ponto2.y-cap_ponto1.y);
       end;
  end;
    redesenha1click(nil);
 end;

If uppercase(comando) = 'APAGA_LAYER' then
   Begin
     texto := inputbox('Qual layer a ser apagado ', '', '');
     for f := 0 to lista.Count - 1 do
     if uppercase(minhaclasse(lista.items[f]).LayerName)=uppercase(texto) then minhaclasse(lista.items[f]).Ligado:=false;
     for f := 0 to blocos.Count - 1 do
     if uppercase(minhaclasse(blocos.items[f]).LayerName)=uppercase(texto) then minhaclasse(blocos.items[f]).Ligado:=false;
   end;

if uppercase(comando) = 'LISTAR' then
    Begin
     a:=0;
      for f := 0 to Blocos.Count - 1 do
      Begin
      generico := TComponent(blocos.items[f]);
     // minhaclasse( Blocos[f]).ListarObjeto(frprincipal.cmdMemo,generico); // aqui sai


  cmdMemo.lines.add( inttostr(f)+' '+ Tbloco(Blocos[f]).Bloco+ '><'+ inttostr(Tbloco(Blocos[f]).tipo) +' '+inttostr(minhaclasse(Blocos[f]).Id_obj));
//      +' '+inttostr( Tbloco(Blocos[f]).Id_obj) );
 if  (minhaclasse(Blocos[f]).tipo=3) then  cmdMemo.lines.add('Pai='+inttostr( Tlinha(Blocos[f]).Pai));
  if  minhaclasse(Blocos[f]).tipo=43 then  cmdMemo.lines.add('Pai='+inttostr( TAtributo(Blocos[f]).Pai));

 {    if  Tbloco(Blocos[f]).Bloco='MeuBloco' then

        Begin
        minhaclasse( Blocos[f]).ListarObjeto(frprincipal.cmdMemo,generico);
         a:=a+1;
      end;}


    end;
{      cmdMemo.lines.add('Total de blocos='+inttostr(a));}
      exit;
    end;

    a:=0;
    if uppercase(comando) = 'BLOCOS' then
    Begin
  //    texto := inputbox('Qual bloco a ser listado ', '', '');
      for f := 0 to Blocos.Count - 1 do
      Begin
        if Tbloco(blocos.items[f]).tipo=40 then
        Begin
       //cmdMemo.lines.add(Tbloco(Blocos[f]).Bloco+ '><'+inttostr(Tbloco(Blocos[f]).Id_obj ));

            end;
      end;
       //cmdMemo.lines.add('fORAM LISTADOS '+inttostr(A)+ ' OBJETOS');
    end;



     if pos(':', comando) > 0 then
    Begin

      ValorTexto := copy(comando, pos(':', comando) + 1, length(
        comando) - pos(':', comando));
      comando := copy(comando, 0, pos(':', comando) - 1);
      ValorInteiro := strtointdef(valortexto, 0);
      ValorDouble := strtofloatdef(valortexto, 0);
      cmdmemo.Lines.add(ValorTexto);
      // comando:=
    end;
      if uppercase(comando) = 'LISTARSEL' then
    Begin

      for f := 0 to lista.Count - 1 do if minhaclasse(lista[f]).Selecionado = True then
          cmdmemo.Lines.add(minhaclasse(lista[f]).Objeto);

    end;
   if uppercase(comando) = 'DESLOCAR' then
    Begin
      texto := inputbox('Distancia a ser deslocada ', '', '');
      desloca := StrTofloatdef(texto, 0);
      for f := 0 to lista.Count - 1 do
      Begin
        if Minhaclasse(lista.items[f]).Ligado = False then Continue;
        {*********************** Linha DXF **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 3)) then   // linha dxf
        Begin
          TLinha(lista.items[f]).Ax := TLinha(lista.items[f]).Ax + Desloca;
          TLinha(lista.items[f]).Ay := TLinha(lista.items[f]).Ay + Desloca;
          TLinha(lista.items[f]).Bx := TLinha(lista.items[f]).Bx + Desloca;
          TLinha(lista.items[f]).By := TLinha(lista.items[f]).By + Desloca;
        end;
        {*********************** Tubulação **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 17)) then     // tubulação
        Begin
          TTubulacao(lista.items[f]).ObjIni_X := TTubulacao(lista.items[f]).ObjIni_X + Desloca;
          TTubulacao(lista.items[f]).ObjIni_Y := TTubulacao(lista.items[f]).ObjIni_Y + Desloca;
          TTubulacao(lista.items[f]).ObjFin_X := TTubulacao(lista.items[f]).ObjFin_X + Desloca;
          TTubulacao(lista.items[f]).ObjFin_Y := TTubulacao(lista.items[f]).ObjFin_y + Desloca;

        end;
        {*********************** Iluminação **********************************}

        if ((Minhaclasse(lista.items[f]).tipo = 19)) then  // iluminação
        Begin
          TIluminacao(lista.items[f]).Px := TIluminacao(lista.items[f]).Px + desloca;
          TIluminacao(lista.items[f]).Py := TIluminacao(lista.items[f]).Py + desloca;

        end;
        {*********************** TEXTO **********************************}

        if ((Minhaclasse(lista.items[f]).tipo = 6)) then  // iluminação
        Begin
          Ttexto(lista.items[f]).Px := Ttexto(lista.items[f]).Px + desloca;
          Ttexto(lista.items[f]).Py := Ttexto(lista.items[f]).Py + desloca;
        end;
        {*********************** Tomada **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 23)) then  // tomada
        Begin
          Ttomada(lista.items[f]).Px := Ttomada(lista.items[f]).Px + desloca;
          Ttomada(lista.items[f]).Py := Ttomada(lista.items[f]).Py + desloca;
        end;
        {*********************** CD **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 27)) then  // tomada
        Begin
          TCD(lista.items[f]).Px := TCD(lista.items[f]).Px + desloca;
          TCD(lista.items[f]).Py := TCD(lista.items[f]).Py + desloca;
        end;
        {*********************** Interruptor **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 22)) then  // interruptor
        Begin
          TInterruptor(lista.items[f]).Px := TInterruptor(lista.items[f]).Px + desloca;
          TInterruptor(lista.items[f]).Py := TInterruptor(lista.items[f]).Py + desloca;
        end;

        {*********************** Tubo torto **********************************}
        if ((Minhaclasse(lista.items[f]).tipo = 4)) then  // interruptor
        Begin
          Tarco(lista.items[f]).Px := Tarco(lista.items[f]).Px + desloca;
          Tarco(lista.items[f]).Py := Tarco(lista.items[f]).Py + desloca;
        end;
      end;
    end;  // fim do deslocar




    if uppercase(comando) = 'LINHA' then
    Begin
      NovoLinhaDXF := TLinha.Create;
      total := total + 1;
      NovoLinhaDXF.Id_obj := total;
      NovoLinhaDXF.Tipo := 3;
      NovoLinhaDXF.ligado := True;
      NovoLinhaDXF.Ax := tambor[1].x;
      NovoLinhaDXF.Ay := tambor[1].y;
      NovoLinhaDXF.Bx := tambor[2].x;
      NovoLinhaDXF.By := tambor[2].y;
      NovoLinhaDXF.Objeto := 'TLinha';
      NovoLinhaDXF.Angulo := 0;
      lista.add(NovoLinhaDXF);
      Desenha_Linha_Na_TelaR(tambor[1], tambor[2], clwhite);
    end;
    if uppercase(comando) = 'TAMBOR' then
    Begin
      cmdmemo.Lines.add('Tambor[1] coordenadas x=' + floattostr(tambor[1].x) +
        '  y=' + floattostr(tambor[1].y));
      cmdmemo.Lines.add('Tambor[2] coordenadas x=' + floattostr(tambor[2].x) +
        '  y=' + floattostr(tambor[2].y));
      cmdmemo.Lines.add('Tambor[3] coordenadas x=' + floattostr(tambor[3].x) +
        '  y=' + floattostr(tambor[3].y));
      cmdmemo.Lines.add('Tambor[4] coordenadas x=' + floattostr(tambor[4].x) +
        '  y=' + floattostr(tambor[4].y));
    end;
    if uppercase(comando) = 'LIMPAR' then  cmdMemo.Clear;
    if uppercase(comando) = 'IMPDXF' then  LerDxf1Click(nil);
    if uppercase(comando) = 'CC' then  CcircuitosClick(nil);
    if uppercase(comando) = 'CF' then  CfiacaoClick(nil);
    if uppercase(comando) = 'QT' then
    Begin
      texto :=
        inputbox('Objeto para calcular a queda de tensão=', '', '');
      a := StrToInt(texto);
      Calc_queda(a); // ver depois
    end;

    if uppercase(comando) = 'LOCALIZAR' then
    Begin
      texto := inputbox('Indice do Objeto para Localizar', '', '');
        if texto='' then exit;
      a := StrToInt(texto);

      // ver depois
      if  EntraIndice(a)>-1 then
      ListaPro.TIObject := TComponent(Lista.Items[EntraIndice(a)])
      else     cmdmemo.Lines.add('Objeto com indice '+texto+' não encontrado');
      //  ListaPro.TIObject := TComponent(Lista.Items[a]);
    end;

     if uppercase(comando) = 'LOCALIZARB' then
    Begin
      texto := inputbox('Indice do Bloco para Localizar', '', '');
      a := StrToInt(texto);

       if  EntraIndiceB(a)>-1 then
      ListaPro.TIObject := TComponent(blocos.Items[EntraIndiceB(a)])
      else     cmdmemo.Lines.add('Bloco com indice '+texto+' não encontrado');



      // ver depois
     // ListaPro.TIObject := TComponent(Blocos.Items[a]);
      //  ListaPro.TIObject := TComponent(Lista.Items[a]);
    end;


    if uppercase(comando) = 'APAGA' then
    Begin
      texto := inputbox('Indice do Objeto para Apagar', '', '');
      a := StrToInt(texto);
      // ver depois
      for f := 0 to lista.Count - 1 do if minhaclasse(lista[f]).Id_obj = a then
          lista.Remove(minhaclasse(lista[f]));

    end;


    if uppercase(comando) = 'TELA' then
    Begin
      cmdMemo.Lines.add('Escala X=' + floattostr(scalex));
      cmdMemo.Lines.add('Escala Y=' + floattostr(scaley));
      cmdMemo.Lines.add('Menor x=' + floattostr(Dmenorx));
      cmdMemo.Lines.add('Menor y=' + floattostr(Dmenory));
      cmdMemo.Lines.add('Maior x=' + floattostr(Dmaiorx));
      cmdMemo.Lines.add('Maior y=' + floattostr(Dmaiory));
    end;


    if uppercase(comando) = 'SETTELA' then
    Begin
      MDmenorx := Canto_inferior_esquerdo.x;
      MDmenory := Canto_inferior_esquerdo.y;
      MDmaiorx := Canto_superior_direito.x;
      MDmaiory := Canto_superior_direito.y;
    end;

    if uppercase(comando) = 'DBZ' then
    Begin
      desenha_blip_solido(ptsr[0], 1);
      desenha_blip_solido(ptsr[1], 1);
      desenha_blip_solido(ptsr[2], 1);
      desenha_blip_solido(ptsr[3], 1);
      pts[0] := toscreen(ptsr[0]);
      pts[1] := toscreen(ptsr[1]);
      pts[2] := toscreen(ptsr[2]);
      pts[3] := toscreen(ptsr[3]);
      workplace.canvas.PolyBezier(pts, False, True);

    end;




    //if uppercase(comando) = 'BD' then  FrBaseDados.Show;
    if uppercase(comando) = 'INDICE' then
    Begin
      texto := inputbox('Indice do objeto ', '', '');

      ListaPro.TIObject := TComponent(Lista.Items[StrToInt(texto)]);

    end;




    //if uppercase(comando) = 'BD' then  FrBaseDados.Show;
    if uppercase(comando) = 'SC' then  Salva_circuito(self);
    if uppercase(comando) = 'LF' then
    Begin
      texto :=
        inputbox('Tubulação para listar os fios - ', '', '');
      a := StrToInt(texto);
      texto :=
        inputbox('Circuito desejado ou -1 para todos', '', '');
      b := StrToInt(texto);
      frprincipal.ListaFiosCircuito(a, b);
    end;
    if uppercase(comando) = 'ES' then  estatistica;

    if uppercase(comando) = 'MI' then  MostraIndice := not MostraIndice;
    if uppercase(comando) = 'MPT' then  MPT := not mpt;
    if uppercase(comando) = 'MCT' then  MCt := not mct;
    if uppercase(comando) = 'MCI' then  mci := not mci;
    if uppercase(comando) = 'MAI' then  mai := not mai;
    if uppercase(comando) = 'MG' then
    Begin
      MG := not mg;
      cmdMemo.Lines.Add('Mg mudado para ' + booltostr(mg, False));
    end;

    if uppercase(comando) = 'AJUDA' then
    Begin
      cmdMemo.Lines.Add('ListarSel');
      cmdMemo.Lines.Add('Deslocar');
      cmdMemo.Lines.Add('Limpar');
      cmdMemo.Lines.Add('Carregar');
      cmdMemo.Lines.Add('ImpDxf');
      cmdMemo.Lines.Add('Guardar');
      cmdMemo.Lines.Add('Tela mostra parametros');
      cmdMemo.Lines.Add('SetTela seta parametros atuais');
      cmdMemo.Lines.Add('Localizar objeto pelo indice');
      cmdMemo.Lines.Add('LF lista fios no tubo para um circuito escolhido');
      cmdMemo.Lines.Add('Cc criar circuitos');
      cmdMemo.Lines.Add('Cf criar fiação');
      cmdMemo.Lines.Add(
        'MI Mostra indice dos objetos-Propriedades da tela');
      cmdMemo.Lines.Add(
        'MPT Mostra potência das tomadas-Propriedades da tela');
      cmdMemo.Lines.Add(
        'MCT Mostra Circuito das tomadas-Propriedades da tela');
      cmdMemo.Lines.Add(
        'MCI Mostra Circuitos dos interruptores-Propriedades da tela');
      cmdMemo.Lines.Add(
        'MAI Mostra acionamento dos interruptores-Propriedades da tela');
      cmdMemo.Lines.Add(
        'QT calcula queda de tensão do ob até cd');
      cmdMemo.Lines.Add('BD Mostra tela BD');
      cmdMemo.Lines.Add('SC Salva Circuito');
      cmdMemo.Lines.Add('Es estatistica');
      cmdMemo.Lines.Add(
        '? seguido nome da variável e depois = seta o valor');
    end;
    if uppercase(LeftStr(comando, 2)) = 'C:' then
    Begin
      ShowMessage('Entrou coordenada');
    end;
    if ((valortexto = '') and (valorinteiro = 0) and (valordouble = 0)) then
      comando := '';

    a:=pos(',',cmdedit.text);
    if a>0 then
   Begin
    decimalSeparator:='.';
    partea:=LeftStr(cmdedit.text,a-1);
    parteb:= RightStr(cmdedit.text,length(cmdedit.text)-a);
    val(partea,ponto_entrado.x,a);
     val(parteb,ponto_entrado.y,b);
       if ((a<>0)or(b<>0)) then mensagem('Erro na conversão',2)
      else
      Begin
    if ((ponto_requisitado=true)) then
        Begin
         SetCursorPos(toscreen(ponto_entrado).x,toscreen(ponto_entrado).y);
         workplace.onmouseup(CmdEdit,Mbleft,teclado,toscreen(ponto_entrado).x,toscreen(ponto_entrado).y);
       //  toscreen(ponto_entrado);
         ponto_requisitado:=false;
        end;
      end;
   // mensagem(floattostr( ponto_entrado.x),2);
   // mensagem(floattostr( ponto_entrado.y),2);
    decimalSeparator:=',';
   end;




    cmdedit.text:='';
end;

procedure TFrPrincipal.cmdEditKeyPress(Sender: TObject; var Key: char);

Begin

  if Key = #13 then  ExecComando(cmdEdit.Text);
  //cmdEdit.Text:='';


end;

procedure TFrPrincipal.FormClick(Sender: TObject);
begin

end;

procedure TFrPrincipal.FormKeyPress(Sender: TObject; var Key: char);

begin

end;

procedure TFrPrincipal.ObjetosDentroDaAreaSElecionada(JrCleft,JrRight:ponto2d);
var
   ff : longint;
   cos,cbs : integer;
begin
  cos:=0; cbs:=0;
   for ff:=1 to lista.count - 1 do
       Begin
          if Minhaclasse(lista.items[ff]).tipo = linha_dxf then
          if Tlinha(lista.items[ff]).Inside(JrCleft,JrRight)=true then
            Begin
            Tlinha(lista.items[ff]).Selecionado:=true;
            cos:=cos+1;
          //  cmdmemo.Lines.Add('linha');
            end;

            if Minhaclasse(lista.items[ff]).tipo = texto then
          if Ttexto(lista.items[ff]).Inside(JrCleft,JrRight)=true then
            Begin
            Ttexto(lista.items[ff]).Selecionado:=true;
                          cos:=cos+1;
        //    cmdmemo.Lines.Add('texto');
            end;

            if Minhaclasse(lista.items[ff]).tipo = ArcoDxf then
          if tarco(lista.items[ff]).Inside(JrCleft,JrRight)=true then
            Begin
            tarco(lista.items[ff]).Selecionado:=true;
                          cos:=cos+1;
       //     cmdmemo.Lines.Add('arco');
            end;
                         if Minhaclasse(lista.items[ff]).tipo = circulo then
          if tcirculo(lista.items[ff]).Inside(JrCleft,JrRight)=true then
            Begin
            tcirculo(lista.items[ff]).Selecionado:=true;
                          cos:=cos+1;
      //      cmdmemo.Lines.Add('circulo');
            end;
        end;
           cmdmemo.lines.Add('Objetos selecionados='+inttostr(cos)+ ' de '+inttostr(lista.count-1));

            for ff:=1 to blocos.count - 1 do
            Begin

             if minhaclasse(blocos.Items[ff]).tipo=42 then
                Begin
                  if  Tbloco(blocos.Items[ff]).Inside(JrCleft,JrRight)=true then
                      Begin
                      Tbloco(blocos.Items[ff]).Selecionado:=true ;
                      cbs:=cbs+1;
                      end;
                end;
              if minhaclasse(blocos.Items[ff]).tipo=43 then
                Begin
                  if  Tatributo(blocos.Items[ff]).Inside(JrCleft,JrRight)=true then
                      Begin
                      Tatributo(blocos.Items[ff]).Selecionado:=true ;
                      //cbs:=cbs+1;
                      end;
                end;
             end;
           cmdmemo.lines.Add('blocos selecionados='+inttostr(cbs)+ ' de '+inttostr(blocos.count-1));
end;

{*************************************************************************************MOUSE MOVE*****************************************************************************************************************************}
procedure TFrPrincipal.FORM1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  px, py, P_bez_a, P_bez_b, p_aux: ponto2d;
  trocaa, trocab: double;
  temponto: tpoint;
  encontrada: boolean;
  lcEntidade, tempX: entidade;
  TipoObj: integer;



  procedure ligar_eletrodutos;

  Begin

    TipoObj := Minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Tipo;

    if ((comando_ativo = CoLigarEletrodutos) and (luminaria_central = True) and
      ((TipoObj = interruptor) or (TipoObj = tomada))) then
    Begin
      tempx := Limpar_entidade;
      tempx.ObjetoInicial := luminaria_central_id;
      tempx.ObjetoFinal := objetoselecionado;//Minhaclasse(objetoselecionado).Id_obj;
      tempx.bx := PegaValorNaLista(luminaria_central_id, 'Px');
      tempx.by := PegaValorNaLista(luminaria_central_id, 'Py');
      tempx.cx := PegaValorNaLista(
        Minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj, 'Px');
      tempx.cy := PegaValorNaLista(
        Minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj, 'Py');
      tempx.Apagado := False;
      tempx.TIPO := 17;
      tempx.LAYER := 1;
      adiciona(tempx, True, False, '');
      px.x := tempx.bx;
      px.y := tempx.by;
      py.x := tempx.cx;
      py.y := tempx.cy;

      desenha_linha_Na_telaR(px, py, clwhite);
    end;

    if ((comando_ativo = CoLigarEletrodutos) and (luminaria_central = False) and
      (TipoObj = Ponto_iluminacao)) then
    Begin
      luminaria_central_id :=
        Tiluminacao(lista.items[EntraIndice(objetoselecionado)]).Id_obj;
      luminaria_central := True;
    end;
  end; // end do ligar eletrodutos




  procedure entrar_texto;
  var
    textos: ttexto;
    ponto: ponto2d;
    point: tpoint;
  Begin
    if (comando_ativo = texto) and (bentroutexto = True) then
    Begin
      textos := ttexto.Create;
      workplace.Canvas.Font.Color := clred;
      workplace.Canvas.font.Height := 25;
      workplace.Canvas.TextOut(x, y, EntradaTexto);
      point.x := x;
      point.y := y;
      ultimo_comando := comando_ativo;
      comando_Ativo := nenhum;
      bentroutexto := False;
      textos.descricao := EntradaTexto;
      ponto := toworld(point);
      textos.Px := ponto.x;
      textos.Py := ponto.y;
      textos.Ligado := True;
      textos.tipo := 6;
      total := total + 1;
      textos.tamanho := 0.15;
      textos.Id_obj := total;
      lista.Add(textos);
      ListaPro.TIObject := Ttexto(textos);
    end;
  end;// end da entrada de texto

  procedure ZoomBox;
  var
    ff : integer;
    cos,cbs: integer;
    ponto_util : tpoint;
   Begin
     cos:=0;
     cbs:=0;
    // segundo ponto do retangulo para zoom
    if ((button = mbleft) and ((comando_ativo = Zoom_janela) or (comando_ativo = 39)) and
      (primeiro_canto)) then
    Begin
      desenhando := False;
      primeiro_canto := False;
      if comando_ativo = Zoom_janela then
      Begin
        Temponto.x := plx;
        Temponto.y := ply;
        px := ToWorld(Temponto);
        Temponto.x := lx;
        Temponto.y := ly;
        py := ToWorld(Temponto);
        Pmaiorx := Dmaiorx;
        Pmenorx := Dmenorx;
        Pmenory := Dmenory;
        pmaiory := Dmaiory;
        if px.x > py.x then
        Begin
          Dmenorx := py.x;
          Dmaiorx := px.x;
        end
        else
        Begin
          Dmenorx := px.x;
          Dmaiorx := py.x;
        end;
        if px.y > py.y then
        Begin
          Dmenory := py.y;
          Dmaiory := px.y;
        end
        else
        Begin
          Dmenory := px.y;
          Dmaiory := py.y;
        end;
      end;
      if comando_ativo = Zoom_janela then
      Begin
         JrCleft.x:=Dmenorx;
         JrCleft.y:=Dmenory;
         JrRight.x:=Dmaiorx;
         JrRight.y:=Dmaiory;
         ReduceToRect(JrCleft,JrRight);
         Dmenorx:=JrCleft.x;
         Dmenory:=JrCleft.y;
         Dmaiorx:=JrRight.x;
         Dmaiory:=JrRight.y;
        // cmdmemo.Lines.Add('plx=' + floattostr(JrCleft.x));
        // cmdmemo.Lines.Add('ply=' + floattostr(JrCleft.y));
        // cmdmemo.Lines.Add('lx=' + floattostr(JrRight.x));
        // cmdmemo.Lines.Add('ly=' + floattostr(JrRight.y));
         SetWindowAndViewPort(Dmenorx, Dmaiorx, Dmenory, Dmaiory, TMenorx,
          Tmaiorx, Tmenory, TmaiorY);

      end;


      if comando_ativo = 39 then
      Begin
        JrCleft:=toworld(point(plx,ply));
        JrRight:=toworld(point(lx,ly));
        ReduceToRect(JrCleft,JrRight);
       // cmdmemo.Lines.Add('plx=' + floattostr(JrCleft.x));
       // cmdmemo.Lines.Add('ply=' + floattostr(JrCleft.y));
       // cmdmemo.Lines.Add('lx=' + floattostr(JrRight.x));
       // cmdmemo.Lines.Add('ly=' + floattostr(JrRight.y));
        ObjetosDentroDaAreaSElecionada(JrCleft,JrRight);
        end;
      desenhando := False;
      if comando_ativo <> ultimo_comando then comando_ativo := ultimo_comando
      else
        comando_Ativo := nenhum;;
      Redesenha1Click(nil);
    end; // fim do segundo canto
     // primeiro ponto do retangulo do zoom
    if ((button = mbleft) and ((comando_ativo = Zoom_janela) or (comando_ativo = 39)) and
      (desenhando = False)) then
    Begin
      primeiro_canto := True;
      desenhando := True;
    //  workplace.Canvas.rectangle(x, y, x, Y);
      plx := x;
      ply := y;
      ponto_util.x:=x;
      ponto_util.Y:=y;;
      Primeiro_ponto_capturado:=ToWorld(ponto_util);
      lx:=x;
      ly:=y;
     end;
  end;// fim da caixa do zoom
    procedure pan_desenho;
  Begin
    // ponto final para deslocamento do move desenho
    if ( (button = mbleft) and ( (comando_ativo = move_desenho)or(comando_ativo =mover)) and (primeiro_canto)) then
    Begin
      desenhando := False;
      primeiro_canto := False;
      if (comando_ativo = move_desenho) then
      Begin
      Gbpanx := Gbpanx - (plx - x);
      Gbpany := Gbpany + (ply - y);
      end;
      Temponto.x :=x;
      Temponto.Y:=y;;
      cap_ponto2:=ToWorld(Temponto);
      ExecComando('mover');
      FrPrincipal.Redesenha1Click(nil);
      if ultimo_comando <> Comando_Ativo then comando_ativo := ultimo_comando
      else
        comando_ativo := nenhum;
    end;
    // primeiro ponto do move desenho
    if ((button = mbleft) and ((comando_ativo = move_desenho)or(comando_ativo = mover)) and
      (desenhando = False)) then
    Begin
      primeiro_canto := True;
      desenhando := True;
      workplace.Canvas.MoveTo(x, y);
      Temponto.x :=x;
      Temponto.Y:=y;;
      cap_ponto1:=ToWorld(Temponto);
      plx := x;
      ply := y;
    end;
  end;

  procedure coloca_lampada;
  var
    tempy: entidade;
  Begin
    tempy := Limpar_entidade;
    // armazena ponto de iluminção
    if (comando_ativo = ponto_iluminacao) and (button = mbleft) then
    Begin
      tempy.ax := blip_centro.x;
      tempy.ay := blip_centro.y;


      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);

      if d_dois_pontos(temponto.x, temponto.y, blip_centro.x, blip_centro.y) > 0.15 then
      Begin
        tempy.ax := p_aux.x;
        tempy.ay := p_aux.y;

      end;

      tempy.raio := 0.3;
      tempy.TIPO := 19;
      tempy.Apagado := False;
      tempy.LAYER := 1;
      adiciona(tempy, True, False, '');
      redesenha1click(nil);
      ultimo_comando := comando_ativo;
      comando_Ativo := 0;
      Blip_centro.x := tempy.ax;
      Blip_centro.y := tempy.ay;
    end;
  end;


  procedure coloca_interruptor;
  var
    tempx: entidade;
  Begin
    if (comando_ativo = interruptor) and (button = mbleft) and
      (encontrada = True) and (minhaclasse(lista.items[EntraIndice(objetoselecionado)]).tipo = linha_dxf) then
    Begin
      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);
      tempx.raio := 0.1;
      tempx.TIPO := interruptor;
      tempx.Apagado := False;
      tempx.LAYER := 1;
      tempx.angulorotacao := 0;
      // linha é horizontal
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).By then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay > Blip_centro.y then
        Begin
          tempx.angulorotacao := 270;
          p_aux.y := p_aux.y - 0.05;
        end
        else // abaixo
        Begin
          tempx.angulorotacao := 90;
          p_aux.y := p_aux.y + 0.05;
        end;
      // linha é vertical
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).Bx then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax > Blip_centro.x then
        Begin
          p_aux.x := p_aux.x - 0.05;
          tempx.angulorotacao := 180;
        end
        else // esquerda
        Begin
          p_aux.x := p_aux.x + 0.05;
          tempx.angulorotacao := 0;
        end;
      tempx.ax := p_aux.x;
      tempx.ay := p_aux.y;
      adiciona(tempx, True, False, '');
      redesenha1click(nil);
      ultimo_comando := comando_ativo;
      comando_Ativo := 0;
      if repeteComando = True then BtTomada.click;
    end;
  end;

  procedure coloca_tomada;
  var
    temp: entidade;
  Begin
    if (comando_ativo = tomada) and (button = mbleft) and (encontrada = True) and
      (MinhaClasse(lista.items[EntraIndice(objetoselecionado)]).tipo = Linha_dxf) then
    Begin
      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);
      temp.angulorotacao := 0;
      // linha é horizontal
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).By then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay > Blip_centro.y then
        Begin
          temp.angulorotacao := 270;
          p_aux.y := p_aux.y + 0.05;
        end
        else // abaixo
        Begin
          temp.angulorotacao := 90;
          p_aux.y := p_aux.y - 0.05;
        end;
      // linha é vertical
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).Bx then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax > Blip_centro.x then
        Begin
          p_aux.x := p_aux.x + 0.05;
          temp.angulorotacao := 180;
        end
        else // esquerda
        Begin
          p_aux.x := p_aux.x - 0.05;
          temp.angulorotacao := 0;
        end;
      temp.TIPO := 23;
      temp.Apagado := False;
      temp.LAYER := 1;
      temp.ax := p_aux.x;
      temp.ay := p_aux.y;

      adiciona(temp, True, False, '');
      FrPrincipal.desenha_blip(p_aux, 15);
      ultimo_comando := comando_ativo;
      comando_Ativo := 0;
      if repeteComando = True then BtTomada.click;
      frprincipal.Redesenha1Click(nil);
    end;
  end;

  procedure coloca_CD;
  var
    temp: entidade;
  Begin
    if (comando_ativo = CaixaDisjuntores) and (button = mbleft) and
      (encontrada = True) and (MinhaClasse(lista.items[EntraIndice(objetoselecionado)]).tipo = Linha_dxf) then
    Begin
      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);
      temp.TIPO := 27;
      temp.Apagado := False;
      temp.LAYER := 1;
      // linha é horizontal
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).By then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay > Blip_centro.y then
        Begin
          temp.angulorotacao := 270;
          p_aux.y := p_aux.y + 0.05;
        end
        else // abaixo
        Begin
          temp.angulorotacao := 90;
          p_aux.y := p_aux.y - 0.05;
        end;
      // linha é vertical
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).Bx then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax > Blip_centro.x then
        Begin
          p_aux.x := p_aux.x + 0.05;
          temp.angulorotacao := 180;
        end
        else // esquerda
        Begin
          p_aux.x := p_aux.x - 0.05;
          temp.angulorotacao := 0;
        end;
      temp.ax := p_aux.x;
      temp.ay := p_aux.y;
      adiciona(temp, True, False, '');
      FrPrincipal.desenha_blip(p_aux, 15);
      ultimo_comando := comando_ativo;
      comando_Ativo := 0;
      redesenha1click(nil);
      encontrada := False;
      if repeteComando = True then BtTomada.click;
    end;
  end;

  procedure coloca_CXP;
  var
    temp: entidade;
  Begin
    if (comando_ativo = CxPassagem) and (button = mbleft) and
      (encontrada = True) and (MinhaClasse(lista.items[EntraIndice(objetoselecionado)]).tipo = Linha_dxf) then
    Begin
      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);
      temp.TIPO := 30;
      temp.Apagado := False;
      temp.LAYER := 1;
      // linha é horizontal
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).By then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay > Blip_centro.y then
        Begin
          temp.angulorotacao := 270;
          p_aux.y := p_aux.y + 0.05;
        end
        else // abaixo
        Begin
          temp.angulorotacao := 90;
          p_aux.y := p_aux.y - 0.05;
        end;
      // linha é vertical
      if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ax =
        Tlinha(lista.items[EntraIndice(objetoselecionado)]).Bx then
        if Tlinha(lista.items[EntraIndice(objetoselecionado)]).Ay > Blip_centro.y then
        Begin
          p_aux.x := p_aux.x + 0.05;
          temp.angulorotacao := 180;
        end
        else // esquerda
        Begin
          p_aux.x := p_aux.x - 0.05;
          temp.angulorotacao := 0;
        end;
      temp.ax := p_aux.x;
      temp.ay := p_aux.y;
      adiciona(temp, True, False, '');
      FrPrincipal.desenha_blip(p_aux, 15);
      ultimo_comando := comando_ativo;
      comando_Ativo := 0;
      encontrada := False;
      redesenha1click(nil);
      if repeteComando = True then BtTomada.click;
    end;
  end;

  procedure coloca_tubulacao_reta_manual;
  var
    temp: entidade;
  Begin

    TipoObj := minhaClasse(lista.items[EntraIndice(objetoselecionado)]).Tipo;
    // tubulação reta   segundo ponto
    if ((button = mbleft) and (comando_ativo = tubulacaoReta) and
      (primeiro_canto) and ((TipoObj = 27) or (TipoObj = 22) or
      (TipoObj = 23) or (TipoObj = 19) or (TipoObj = 30))) then
    Begin
      desenhando := False;
      primeiro_canto := False;
      Temponto.x := x;
      Temponto.y := y;
      p_aux := ToWorld(Temponto);
      Temponto.x := plx;
      Temponto.y := ply;
      temp.ObjetoInicial := objeto_primeiro.Indice;
      temp.ObjetoFinal := minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj;
      temp.bx := PegaValorNaLista(objeto_primeiro.Indice, 'Px');
      temp.by := PegaValorNaLista(objeto_primeiro.Indice, 'Py');
      temp.cx := PegaValorNaLista(minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj, 'Px');
      temp.cy := PegaValorNaLista(minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj, 'Py');
      temp.Apagado := False;
      temp.TIPO := 17;
      temp.LAYER := 1;
      adiciona(temp, True, False, '');
      ultimo_comando := nenhum;
      comando_ativo := nenhum;
      primeiro_canto := False;
      cmdmemo.Lines.Add('Segundo ponto encontrado');
      cmdmemo.Lines.Add('Comando concluido');
    end;
    // tubulação reta primeiro ponto
    if ((button = mbleft) and (comando_ativo = tubulacaoReta) and
      ((TipoObj = 27) or (TipoObj = 22) or (TipoObj = 23) or (TipoObj = 19) or
      (TipoObj = 30))) and (desenhando = False) then
    Begin
      primeiro_canto := True;
      desenhando := True;
      workplace.Canvas.MoveTo(x, y);
      plx := x;
      ply := y;
      objeto_primeiro.INDICE :=
        minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj;
      cmdmemo.Lines.Add('Primeiro ponto encontrado');
      cmdmemo.Lines.Add('Aguardando, Segundo ponto, ');

    end;
  end;

  procedure coloca_tubulacao_arco;
  var
    a, b, c: ponto2d;

  Begin
    if (comando_ativo = tubulacao) and (button = mbleft) and encontrada then
      if ((TipoObj = interruptor) or (TipoObj = tomada) or
        (TipoObj = Ponto_iluminacao) or (TipoObj = CaixaDisjuntores)) then
        //  FrPrincipal.mostra_texto('estive dento do tubo', '');
        if ((primeiro_ponto = True) and (segundo_ponto = True)) then
        Begin

          objeto_primeiro.ObjetoFinal := objetoselecionado;

          px.x := PegaValorNaLista(objeto_primeiro.ObjetoInicial, 'Px');
          px.y := PegaValorNaLista(objeto_primeiro.ObjetoInicial, 'Py');
          temponto := toscreen(px);
          a.x := temponto.x;
          a.y := temponto.y;


          px.x := PegaValorNaLista(objetoselecionado, 'Px');
          px.y := PegaValorNaLista(objetoselecionado, 'Py');
          temponto := toscreen(px);
          c.x := temponto.x;
          c.y := temponto.y;

          b.x := round(objeto_primeiro.ax);
          b.y := round(objeto_primeiro.ay);

          primeiro_ponto := False;
          segundo_ponto := False;
          ultimo_comando := comando_ativo;
          comando_Ativo := 0;
          desenhando := False;
          workplace.Canvas.Pen.Width := 5;
          if Sentido(a.x, a.y, b.x, b.y, c.x, c.y) < 0 then
          Begin
            trocaA := a.x;
            trocab := a.y;
            a.x := c.x;
            a.y := c.y;
            c.x := trocaA;
            c.y := trocab;
          end;
          // raio,ai,af : double;
          acha_circulo(a.x, a.y, b.x, b.y, c.x, c.y, lcEntidade);
          //yo
          //objeto_temp:=lCEntidade;
          lcEntidade.ObjetoInicial := objeto_primeiro.ObjetoInicial;
          lcEntidade.ObjetoFinal := objeto_primeiro.ObjetoFinal;
          adiciona(lcEntidade, True, False, '');
          FrPrincipal.Redesenha1Click(nil);
          workplace.Canvas.pen.mode := pmcopy;
          cmdmemo.Lines.Add('Comando encerrado');
          primeiro_ponto := False;
          segundo_ponto := False;
          terceiro_ponto := False;

        end;
    // aqui pega o ponto intermediário
    if ((primeiro_Ponto = True) and (comando_ativo = tubulacao) and
      (segundo_ponto = False)) then
    Begin
      plx := x;
      ply := y;
      objeto_primeiro.ax := plx;
      objeto_primeiro.ay := ply;
      workplace.Canvas.pen.Width := 7;
      workplace.Canvas.MoveTo(x, y);
      workplace.Canvas.LineTo(x, y);
      workplace.Canvas.pen.Width := 1;
      primeiro_ponto := True;
      Segundo_ponto := True;
      workplace.Canvas.moveto(round(a.x), round(a.y));
      workplace.Canvas.lineto(round(b.x), round(b.y));
      workplace.Canvas.pen.mode := pmxor;
      cmdmemo.Lines.Add(' Ponto intermediário encontrado');

    end;

    // aqui pega o primeiro ponto
    if ((TipoObj = interruptor) or (TipoObj = tomada) or
      (TipoObj = Ponto_iluminacao) or (TipoObj = CaixaDisjuntores)) then
      if ((primeiro_Ponto = False) and (comando_ativo = tubulacao) and encontrada) then
      Begin
        cmdmemo.Lines.Add('Primeiro Ponto encontrado');
        cmdmemo.Lines.Add('Aguardando Segundo ponto');
        desenhando := True;
        primeiro_ponto := True;
        workplace.Canvas.MoveTo(x, y);
        plx := x;
        ply := y;
        objeto_primeiro.ObjetoInicial :=
          minhaclasse(lista.items[EntraIndice(objetoselecionado)]).Id_obj;
      end;
  end;

  procedure linha_bezier;

  Begin
    if (comando_ativo = BtBezier) then
    Begin
      TipoObj := minhaClasse(lista.items[EntraIndice(objetoselecionado)]).Tipo;

      if TipoObj = 17 then
      Begin
        Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).Bezier:=true;
        px.x := Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).ObjIni_X;
        px.y := Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).ObjIni_Y;
        py.x := Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).ObjFin_X;
        py.y := Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).ObjFin_Y;

        temponto := toscreen(px);
        desenha_blip_solido(px, 15);
        PTS[0] := point(temponto.x, temponto.y);
        temponto := toscreen(py);
        desenha_blip_solido(py, 15);
        pts[3] := point(temponto.x, temponto.y);

        if px.x > py.x then  P_bez_a.x := py.x + (px.x - py.x) / 2
        else
          P_bez_a.x := px.x + (py.x - px.x) / 2;


        if px.y > py.y then  P_bez_a.y := py.y + (px.y - py.y) / 2
        else
          P_bez_a.y := px.y + (py.y - px.y) / 2;



        Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_x1:= P_bez_a.x;
        Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_y1:= P_bez_a.y;
        Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_x2:= P_bez_a.x;
        Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_Y2:= P_bez_a.y;

        temponto := toscreen(P_bez_a);
        pts[1] := point(temponto.x, temponto.y);

        if px.x > py.x then  P_bez_b.x := py.x + 2 * (px.x - py.x) / 2
        else
          P_bez_b.x := px.x + 2 * (py.x - px.x) / 2;

        if px.y > py.y then  P_bez_b.y := py.y + 2 * (px.y - py.y) / 2
        else
          P_bez_b.y := px.y + 2 * (py.y - px.y) / 2;

        temponto := toscreen(P_bez_b);
        pts[2] := pts[1];
        //point(temponto.x,temponto.y);
        desenha_blip_solido(P_bez_a, 15);
        desenha_blip_solido(P_bez_a, 15);
      workplace.Canvas.PolyBezier(pts, False, False);

      end;
      ultimo_comando := comando_ativo;
      //comando_ativo:=nenhum;

    end;

  end;
  //*************************     procedimento principal ***********************************************************************************************************************************************************//
Begin // inicio da função principal
  lcEntidade := limpar_entidade;
  encontrada := False;
  workplace.Canvas.pen.mode := pmcopy;
  if ((button = mbleft) and (fio_encontrado = False)) then
  Begin
    encontrada := acha(x, y, 0);
  end;

  //  if encontrada = false then exit;

  temponto.x := x;
  temponto.y := y;
  px := toworld(temponto);

  if tobject(sender).ClassName='TEdit' then
    Begin

    if TEdit(sender).Name='CmdEdit' then  px:=ponto_entrado;

    end;
  //  ObjetoSelecionado contem o número do objeto selecionado
  //  TipoObj comtem o tipo do objeto selecionado
  TipoObj := minhaClasse(lista.items[EntraIndice(objetoselecionado)]).Tipo;

  if ((comando_ativo = Zoom_janela) or (comando_Ativo = 39)) then  ZoomBox;
  if ((comando_ativo = move_desenho)or(comando_ativo = mover)) then  pan_desenho;
  if comando_ativo = tubulacaoReta then  coloca_tubulacao_reta_manual;
  if comando_ativo <> CoLigarEletrodutos then  luminaria_central := False;
  if comando_ativo = CoLigarEletrodutos then  ligar_eletrodutos;
  if comando_ativo = CaixaDisjuntores then  coloca_CD;
  if comando_ativo = texto then  entrar_texto;
  if comando_ativo = ponto_iluminacao then  coloca_lampada;
  if comando_Ativo = interruptor then  coloca_interruptor;
  if comando_Ativo = tomada then  coloca_tomada;
  if comando_ativo = CxPassagem then  coloca_CXP;
  if comando_ativo = tubulacao then coloca_tubulacao_arco;
  if comando_ativo = BtBezier then linha_bezier;


end;
//fim do procedimento;


procedure TFrPrincipal.FORM1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: integer);
var
  px: ponto2d;
  temponto: tpoint;
  shift_true: boolean;

Begin
  // string padrão
  // '                                                             Comando: '
  Temponto.x := x;
  Temponto.y := y;
  px := ToWorld(Temponto);
  statusbar1.Panels[0].Text :=
    '  ' + floattostr(int(px.x * 100) / 100) + '|'+ floattostr(int(px.y * 100) / 100);// + '   Xt=' + inttostr(x) + '   Yt= ' + inttostr(y);
  workplace.Canvas.pen.mode := pmxor;
  workplace.Canvas.pen.color := clwhite;


   {************************ angulo do arco *******************************}
  if (ssShift in shift) then
  Begin
  if comando_ativo=MoverArco then
  if MinhaClasse(lista.items[entraindice(objetoselecionado)]).Tipo=4 then
  Begin
  showmessage('vamos mover um arco');
  end;
  end;

   {************************ Linha Bezier *******************************}
  if ((ssShift in shift)and (MinhaClasse(lista.items[entraindice(objetoselecionado)]).Tipo=17) and (comando_Ativo=BtBezier))then
  Begin
    shift_true := True;
    workplace.canvas.pen.mode := pmxor;
    workplace.canvas.pen.color := clwhite;
    pts[2].x := ly;
    pts[2].y := lx;
    pts[1] := pts[2];
    workplace.Canvas.PolyBezier(pts, False, False);
    pts[2].x := y;
    pts[2].y := x;
    pts[1] := pts[2];
    workplace.Canvas.PolyBezier(pts, False, False);
    lx := x;
    ly := y;
    ptsR[0] := Toworld(Pts[0]);
    ptsR[1] := Toworld(Pts[1]);
    ptsR[2] := Toworld(Pts[2]);
    ptsR[3] := Toworld(Pts[3]);
    cmdmemo.lines.add(floattostr(ptsr[2].x));
    cmdmemo.lines.add(floattostr(ptsr[2].y));
    Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_x1:=ptsR[1].x;
    Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_y1:=ptsR[1].y;
    Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_x2:=ptsR[1].x;
    Ttubulacao(lista.items[EntraIndice(objetoselecionado)]).B_P_y2:=ptsR[1].y;
     cmdmemo.lines.add(inttostr(EntraIndice(objetoselecionado)));
    exit;
  end;
  (******** Faz o retangulo Dinamico do zoom ********)
  if (((comando_Ativo = Zoom_janela) or (comando_Ativo = 39)) and (desenhando)) then
  Begin
    workplace.Canvas.Line(plx,ply,plx,ly);
    workplace.Canvas.Line(plx,ly,lx,ly);
    workplace.Canvas.Line(plx,ply,lx,ply);
    workplace.Canvas.Line(lx,ply,lx,ly);

    workplace.Canvas.Line(plx,ply,plx,y);
    workplace.Canvas.Line(plx,y,x,y);
    workplace.Canvas.Line(plx,ply,x,ply);
    workplace.Canvas.Line(x,ply,x,y);




  end;

  (********** Efeito da Linha Elastica da tubulaçao reta e move desenho *************)
  if (((comando_Ativo = tubulacaoReta) or (comando_Ativo = tubulacao) or
    (comando_Ativo = move_desenho) or (comando_Ativo = mover)) and (desenhando)) then
  Begin
    workplace.Canvas.moveTo(plx, ply);
    workplace.Canvas.LineTo(lx, ly);
    workplace.canvas.pen.color:=clwhite;
    workplace.Canvas.moveTo(plx, ply);
    workplace.Canvas.LineTo(x, y);
  end;

  if comando_ativo <> nenhum then
    if EmCimaDoBlip(px) then
      ShowMessage('Estou em cima');
  lx := x;
  ly := y;
end;
Procedure TFrPrincipal.CcircuitosClick(Sender: TObject);   // gerar arquivo de caminhos
var
  f, g, h, l: integer;
  codigos: array[1..1000] of integer;
  p_aux, p_Aux2: ponto2d;
  texto: string;
  Caminhos: textfile;
  oCD, ObjetoTipo, IdLocal: integer;
Begin
  workplace.Canvas.Pen.mode := pmcopy;
  Ccircuitos.Checked := not Ccircuitos.Checked;
  MemoCidades.Clear;
  MemoRodovias.Clear;
  //Criar os arquivos necessários para a rotina do menor caminho  realizar as buscar
  h := 0;
  for f := 1 to 1000 do codigos[f] := -1;
  ContaLocais := 0;
  h := 0;
  // gerar locais  aqui tomadas,interruptores,caixa de passagem e CD
  for f := lista.Count - 1 downto 0 do
  Begin
    ObjetoTipo := Minhaclasse(lista.items[f]).tipo;
    if Minhaclasse(lista.items[f]).Ligado = False then continue;

    if ((ObjetoTipo = Ponto_iluminacao) or (ObjetoTipo = interruptor) or
      (ObjetoTipo = tomada) or (ObjetoTipo = CaixaDisjuntores) or
      (ObjetoTipo = CxPassagem)) then
    Begin
      Inc(contaLocais);
      IdLocal := Minhaclasse(lista.items[f]).Id_obj;
      if ObjetoTipo = CaixaDisjuntores then
        oCD := contaLocais;
      memocidades.Lines.Add(
        IntToStr(contaLocais) + ' ' + IntToStr(IdLocal));
      codigos[contaLocais] := IdLocal;
    end;
  end;
  // gerar ligações entre os locais
  for L := 1 to lista.Count - 1 do
  Begin
    ObjetoTipo := Minhaclasse(lista.items[L]).tipo;
    // if  Minhaclasse(lista.items[f]).Ligado=false then continue;
    if ((ObjetoTipo = tubulacao) or (ObjetoTipo = arco)) then
      // somente as tubulações são caminhos, cada tubo um caminho.
    Begin
      h := h + 1;
      //trocar os caminhos por indices antes de gravar
      if objetotipo = tubulacao then
        for f := 1 to contalocais do
          if codigos[f] = Ttubulacao(lista.items[L]).ObjIni then
          Begin
            texto := '';
            texto := IntToStr(f);
            break;
          end;
      if objetotipo = arco then
        for f := 1 to contalocais do
          if codigos[f] = Tarco(lista.items[L]).ObjIni then
          Begin
            texto := '';
            texto := IntToStr(f);
            break;
          end;
      if objetotipo = tubulacao then
        for g := 1 to contalocais do
          if codigos[g] = Ttubulacao(lista.items[L]).ObjFin then
          Begin
            memoRodovias.Lines.add(IntToStr(f) + ' ' + IntToStr(g) + ' 1');
            texto := '';
            texto := IntToStr(g);
            break;
          end;
      if objetotipo = arco then
        for g := 1 to contalocais do
          if codigos[g] = Tarco(lista.items[L]).ObjFin then
          Begin
            memoRodovias.Lines.add(IntToStr(f) + ' ' + IntToStr(g) + ' 1');
            texto := '';
            texto := IntToStr(g);
            break;
          end;
      p_aux.x := Ttubulacao(lista.items[L]).ObjIni_X;
      p_aux.y := Ttubulacao(lista.items[L]).ObjIni_Y;
      p_aux2.x := Ttubulacao(lista.items[L]).ObjFin_X;
      p_aux2.y := Ttubulacao(lista.items[L]).ObjFin_Y;

      if ObjetoTipo = tubulacao then desenha_linha_na_telar(p_aux, p_aux2, clred);

      if ObjetoTipo = arco then
      Begin
        p_aux.x := Tarco(lista.items[L]).Px;
        p_aux.y := Tarco(lista.items[L]).Py;
        desenha_arc(p_aux, Tarco(lista.items[L]).Raio,
          Tarco(lista.items[L]).AnguloInicial, Tarco(lista.items[L]).AnguloFinal, clred, 0,minhaclasse(lista.items[l]).Id_obj);
      end;
    end;
  end;
   //Gerou ligações entre os locais
  MemoCidades.Lines.SaveToFile('cidades.txt');
  MemoRodovias.Lines.SaveToFile('Rodovias.txt');
  // Calcula o caminho de cada objeto até o CD
  assignfile(caminhos, 'caminhos.txt');
  rewrite(caminhos);
  for f := 1 to contalocais do
    with tRede.Ler('cidades.txt', 'rodovias.txt', oCD, f) do
    Begin
      EncontrarCaminho(caminhos);
      Liberar;
    end;
  closefile(caminhos);
  cmdMemo.Lines.add('Caminhos  Gerados');
 // apagar rodovias e cidades
end;




procedure TFrPrincipal.SelecionarClick(Sender: TObject);
var
  f: integer;
Begin
  if selecionar.Checked = True then
    cmdmemo.Lines.Add('Limpo lista de objetos selecionados');
  if selecionar.Checked = True then  for f := 1 to lista.Count - 1 do
      minhaclasse(lista[f]).Selecionado := False;
  selecionar.Checked := not selecionar.Checked;
end;

procedure TFrPrincipal.SpeedButton1Click(Sender: TObject);
Begin
  if dmenorx<dmaiorx then
  Begin
     Ttela(lista.items[0]).Ax:=dmenorx;
     Ttela(lista.items[0]).Bx:=dmaiorx;
  end
  else
  Begin
    Ttela(lista.items[0]).Bx:=dmenorx;
    Ttela(lista.items[0]).Ax:=dmaiorx;
  end;


  if dmenory<dmaiory then
  Begin
     Ttela(lista.items[0]).Ay:=dmenory;
     Ttela(lista.items[0]).By:=dmaiory;
  end
  else
  Begin
    Ttela(lista.items[0]).By:=dmenory;
    Ttela(lista.items[0]).Ay:=dmaiory;
  end;

   MDmenorx := Ttela(lista.items[0]).Ax;
    MDmenory := Ttela(lista.items[0]).Ay;
    MDmaiorx := Ttela(lista.items[0]).Bx;
    MDmaiory := Ttela(lista.items[0]).By;



   SetWindowAndViewPort(Dmenorx, Dmaiorx,Dmenory, Dmaiory, TMenorx,
      Tmaiorx, Tmenory, TmaiorY);


 ComandosTela(frprincipal.Btztudo);

end;

procedure TFrPrincipal.BtMoverArcoClick(Sender: TObject);
Begin
   ComandosTela(frprincipal.BtMoverArco);
end;

procedure TFrPrincipal.SpeedButton5Click(Sender: TObject);
begin

end;

procedure TFrPrincipal.ToggleBox1Change(Sender: TObject);
begin
end;

procedure TFrPrincipal.bezier;

Begin
  {
  a.x := objeto_temp.bx;
  a.y := objeto_temp.by;
  desenha_blip(a, 10);

  D := ToScreen(a);
  Pontos[1].x := d.x;
  Pontos[1].y := d.y;

  b.x := objeto_temp.cx;
  b.y := objeto_temp.cy;
  desenha_blip(b, 11);
  D := ToScreen(b);
  Pontos[4].x := d.x;
  Pontos[4].y := d.y;
   c.x := (a.x + b.x) / 2;
  c.y := (a.y + b.y) / 2;
  desenha_blip(c, 12);
  a.x := (a.x + c.x) / 2;
  a.y := (a.y + c.y) / 2;
  desenha_blip(a, 13);
  D := ToScreen(a);
  Pontos[2].x := d.x;
  Pontos[2].y := d.y;
    b.x := (b.x + c.x) / 2;
  b.y := (b.y + c.y) / 2;
  desenha_blip(b, 14);
  D := ToScreen(b);
  Pontos[3].x := d.x;
  Pontos[3].y := d.y;
   }
end;


procedure TFrPrincipal.Desenha_Linha_Na_TelaR(a, b: ponto2d; cor: tcolor);
var
  CorAnterior: integer;
Begin
  CorAnterior := FrPrincipal.workplace.canvas.Pen.Color;
  FrPrincipal.workplace.canvas.Pen.Color := Cor;
  FrPrincipal.workplace.canvas.moveto(toscreen(a));
  FrPrincipal.workplace.canvas.lineto(toscreen(b));
  FrPrincipal.workplace.canvas.Pen.Color := CorAnterior;

end;

procedure TFrPrincipal.Desenha_Linha_Na_TelaW(a, b: tpoint; cor: tcolor);
var
  CorAnterior: integer;
Begin
  CorAnterior := FrPrincipal.workplace.canvas.Pen.Color;
  FrPrincipal.workplace.canvas.Pen.Color := Cor;
  FrPrincipal.workplace.canvas.moveto(a);
  FrPrincipal.workplace.canvas.lineto(b);
  FrPrincipal.workplace.canvas.Pen.Color := CorAnterior;

end;

function TFrPrincipal.EmCimaDoBlip(ponto: ponto2d): boolean;
var
  p1, p2, p3, p4: tpoint;
  distancia: double;
Begin
  Result := False;
  p1 := ToScreen(ponto);
  p2 := ToScreen(cap_Ponto1);
  p3 := ToScreen(cap_Ponto2);
  p4 := ToScreen(Blip_centro);

  distancia := d_dois_pontos(p1.x, p1.y, p2.x, p2.y);
  if round(distancia) < 3 then
  Begin
    desenha_blip(cap_Ponto1, 10);
    Acap_ponto1 := True;
  end
  else
  if Acap_ponto1 = True then
  Begin
    desenha_blip(cap_Ponto1, 15);
    Acap_ponto1 := False;
  end;
  distancia := d_dois_pontos(p1.x, p1.y, p3.x, p3.y);
  if round(distancia) < 3 then
  Begin
    desenha_blip(cap_Ponto2, 10);
    Acap_ponto2 := True;
  end
  else
  if Acap_ponto2 = True then
  Begin
    desenha_blip(cap_Ponto2, 15);
    Acap_ponto2 := False;
  end;

  distancia := d_dois_pontos(p1.x, p1.y, p4.x, p4.y);
end;

procedure TFrPrincipal.desenha_luminaria(PrObjeto: TObject; selecao: boolean);
var
  ponto_aux, ponto: ponto2d;
  a: tpoint;
Begin
  FrPrincipal.WorkPlace.canvas.pen.color := clwhite;
  FrPrincipal.workplace.canvas.Pen.Style := pssolid;


  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
  Begin
    FrPrincipal.workplace.canvas.Pen.Style := psdot;
    FrPrincipal.WorkPlace.canvas.pen.color := clred;
  end;

  ponto.x := Tiluminacao(PrObjeto).Px;
  ponto.y := Tiluminacao(PrObjeto).Py;

  ponto_aux.x := Tiluminacao(PrObjeto).Px;
  ponto_aux.y := Tiluminacao(PrObjeto).Py;

 if   insere_bloco(Tiluminacao(PrObjeto).Id_obj,'FS_Lampada',ponto.x,ponto.y,0,false)=true then  exit;


 desenha_circle(ponto_aux, 0.3, FrPrincipal.WorkPlace.canvas.pen.color);




  a := toscreen(ponto_aux);
  ponto_aux.x := ponto_aux.x + 0.05;
  ponto_aux.y := ponto_aux.y - 0.25;
  FrPrincipal.WorkPlace.canvas.MoveTo(a.x, a.y);


  // showmessage( chr(Tiluminacao(objeto).acionamento));
  FrPrincipal.desenha_texto(ponto_aux, 0.13, 0, Tiluminacao(PrObjeto).acionamento,
    15, 'arial');
  ponto_aux.x := ponto_aux.x - 0.25;
  FrPrincipal.desenha_texto(ponto_aux, 0.13,
    0, IntToStr(Tiluminacao(PrObjeto).circuito), 15, 'arial');
  ponto_aux.x := ponto_aux.x;
  ponto_aux.y := ponto_aux.y + 0.25;
  FrPrincipal.desenha_texto(ponto_aux, 0.13, 0,
    Tiluminacao(PrObjeto).potencia.ToString, 15, 'arial');


  ponto_aux.x := Tiluminacao(PrObjeto).Px;
  ponto_aux.y := Tiluminacao(PrObjeto).Py;


  a := toscreen(ponto_aux);
  FrPrincipal.WorkPlace.canvas.MoveTo(a.x, a.y);
  ponto_aux.x := ponto.x;
  ponto_aux.y := ponto.y - 0.3;
  a := toscreen(ponto_aux);
  FrPrincipal.WorkPlace.canvas.LineTo(a.x, a.y);

  ponto_aux.x := ponto.x - 0.3;
  ponto_aux.y := ponto.y;
  a := toscreen(ponto_aux);
  FrPrincipal.WorkPlace.canvas.MoveTo(a.x, a.y);
  ponto_aux.x := ponto.x + 0.3;
  ponto_aux.y := ponto.y;
  a := toscreen(ponto_aux);
  FrPrincipal.WorkPlace.canvas.lineTo(a.x, a.y);
  desenha_linha_na_telar(ponto, ponto_aux, clwhite);
  desenha_blip(ponto, 15);

  if MostraIndice = True then
  Begin
    ponto_aux.y := ponto_aux.y + 0.1;
    FrPrincipal.desenha_texto(ponto_aux, 0.13, 0,
      IntToStr(Tiluminacao(PrObjeto).Id_obj), 15, 'arial');

  end;
  FrPrincipal.workplace.canvas.Pen.Style := pssolid;
end;

procedure TFrPrincipal.desenha_interruptor(PrObjeto: TObject; selecao: boolean);
var
  ponto_aux: ponto2d;
  a: tpoint;


Begin

  //indice := Tinterruptor(PrObjeto).Id_obj;

  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;
  FrPrincipal.workplace.canvas.pen.Mode := pmcopy;
  FrPrincipal.workplace.canvas.pen.Width := 1;
  ponto_aux.x := Tinterruptor(PrObjeto).px;
  ponto_aux.y := Tinterruptor(PrObjeto).py;

  if  insere_bloco( Tinterruptor(PrObjeto).Id_obj,'FS_interruptor',ponto_aux.x,ponto_aux.y,round(Tinterruptor(PrObjeto).Angulo),false)=true then   exit;
  a := toscreen(ponto_aux);
  FrPrincipal.workplace.Canvas.MoveTo(a.x, a.y);
  FrPrincipal.desenha_circle(ponto_Aux, 0.1, clwhite);
  FrPrincipal.desenha_blip(ponto_aux, 15);
  if MostraIndice = True then
  Begin
    ponto_aux.y := ponto_aux.y + 0.125;
    FrPrincipal.desenha_texto(ponto_aux, 0.13, 0,
      IntToStr(Tinterruptor(PrObjeto).Id_obj), 15, 'arial');
    ponto_aux.y := ponto_aux.y - 0.125;
  end;

  if MAI = True then
  Begin
    ponto_aux.y := ponto_aux.y + 0.125;
    FrPrincipal.desenha_texto(ponto_aux, 0.13, 0,
      (Tinterruptor(PrObjeto).acionamento), 15, 'arial');
    ponto_aux.y := ponto_aux.y - 0.125;

  end;
  if MCI = True then
  Begin
    ponto_aux.y := ponto_aux.y + 0.125;
    ponto_aux.x := ponto_aux.x - 0.13;
    FrPrincipal.desenha_texto(ponto_aux, 0.13,
      0, IntToStr(Tinterruptor(PrObjeto).circuito), 15, 'arial');
    ponto_aux.y := ponto_aux.y - 0.125;
  end;


  FrPrincipal.workplace.canvas.Pen.Style := pssolid;
end;

procedure TFrPrincipal.desenha_tomada(PrObjeto: TObject; selecao: boolean);
var
  CCompos: array[1..8] of ponto2d;
  a: tpoint;
  f, g, angulo: integer;
  P_aux: ponto2d;
Begin

  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then

    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;




  P_Aux.x := ttomada(PrObjeto).px;
  P_Aux.y := ttomada(PrObjeto).py;
 
  angulo := round(ttomada(PrObjeto).Angulo);


if   insere_bloco(ttomada(PrObjeto).Id_obj,'FS_Tomada',P_Aux.x,P_Aux.y,angulo,false)=true then    exit;
  //Desenha o bloco desenhar para posiçoa 0 graus considerar  apontando para esquerda o pont
  CCompos[1].x := 0;
  CCompos[1].y := 0;

  CCompos[2].x := 0.1;
  CCompos[2].y := 0;

  CCompos[3].x := 0.1;
  CCompos[3].y := 0.1;

  CCompos[4].x := 0.1;
  CCompos[4].y := -0.1;


  CCompos[5].x := 0.1;
  CCompos[5].y := 0.1;

  CCompos[6].x := 0.2;
  CCompos[6].y := 0;

  CCompos[7].x := 0.2;
  CCompos[7].y := 0;
  CCompos[8].x := 0.1;
  CCompos[8].y := -0.1;



  if angulo <> 0 then
  Begin
    for f := 1 to 8 do
      CCompos[f] := rotate2d(CCompos[f], angulo);
  end;

  // desloca o bloco para a posição que ele deve ser inserido
  for f := 1 to 8 do
  Begin
    CCompos[f].x := CCompos[f].x + P_Aux.x;
    CCompos[f].y := CCompos[f].y + P_Aux.y;
  end;
  FrPrincipal.workplace.canvas.pen.Mode := pmcopy;
  FrPrincipal.workplace.canvas.pen.Width := 1;
  a := toscreen(P_aux);
  FrPrincipal.workplace.Canvas.MoveTo(a.x, a.y);
  g := 0;
  for f := 1 to 4 do
  Begin
    g := g + 2;
    Desenha_Linha_Na_Telar(CCompos[g - 1], CCompos[g], clwhite);
  end;
  FrPrincipal.desenha_blip(P_aux, 15);
  P_Aux.x := CCompos[6].x;
  P_Aux.y := CCompos[6].y;
  FrPrincipal.workplace.canvas.Pen.Style := pssolid;

  if MCT = True then
  Begin
    FrPrincipal.desenha_texto(p_aux, 0.10, 0, IntToStr(
      ttomada(PrObjeto).circuito), 10, 'arial');
  end;
  if MostraIndice = True then
  Begin
    FrPrincipal.desenha_texto(p_aux, 0.10, 0, IntToStr(
      ttomada(PrObjeto).Id_obj), 10, 'arial');
  end;

  if MPT = True then
  Begin
    FrPrincipal.desenha_texto(p_aux, 0.10, 0, IntToStr(
      ttomada(PrObjeto).POtencia), 10, 'arial');
  end;

end;


procedure TFrPrincipal.desenha_tubo(PrObjeto: TObject; selecao: boolean);
var
  Pra, Prb: ponto2d;
  Circuito_tubo, textoF: string;
  CircuitosTubo: TStringList;
  g, h, NC: integer;
Begin

  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;


  Circuito_tubo := Ttubulacao(PrObjeto).descricao;




  Pra.X := Ttubulacao(PrObjeto).ObjIni_X;
  Pra.Y := Ttubulacao(PrObjeto).ObjIni_Y;
  Prb.X := Ttubulacao(PrObjeto).ObjFin_X;
  Prb.Y := Ttubulacao(PrObjeto).ObjFin_Y;



   if Ttubulacao(PrObjeto).Bezier=false then desenha_linha_na_telar(pra, prb, clwhite);


     if Ttubulacao(PrObjeto).Bezier=true then
     Begin
       pts[0]:=toscreen(pra);
       pts[3]:=toscreen(prb);
       pra.x:=Ttubulacao(PrObjeto).B_P_x1;;
       pra.y:=Ttubulacao(PrObjeto).B_P_y1;
       pts[1]:=toscreen(pra);
       pts[2]:=pts[1];
       workplace.canvas.PolyBezier(pts, False, True);
      end;



  if MostraIndice = True then
  Begin
    Pra.x := (Pra.x + Prb.x) / 2;
    Pra.y := (Pra.y + Prb.y) / 2;
    FrPrincipal.desenha_texto(Pra, 0.10, 0, IntToStr(Ttubulacao(PrObjeto).Id_obj),
      10, 'arial');

  end;

  Pra.x := (Pra.x + Prb.x) / 2;
  Pra.y := (Pra.y + Prb.y) / 2;

  prb := pra;



  //     'fntr'


  CircuitosTubo := TStringList.Create;
  CircuitosTubo.Sorted := True;
  CircuitosTubo.Duplicates := dupIgnore;
  CircuitosTubo.Delimiter := ';';
  CircuitosTubo.DelimitedText := Ttubulacao(PrObjeto).descricao;

  for g := 0 to CircuitosTubo.Count - 1 do
  Begin
    Circuito_tubo := CircuitosTubo[g];
    // pegar indice do circuito
    for h := 0 to lista.Count - 1 do if MinhaClasse(lista.items[h]).Tipo = 33 then
        if Tcircuito(lista.items[h]).tag = StrToInt(CircuitosTubo[g]) then
        Begin
          nc := h;
          break;
        end;
    if Tcircuito(lista.items[NC]).Esquema = FN then textoF := 'fn';
    if Tcircuito(lista.items[NC]).Esquema = FNT then textoF := 'fnt';
    if Tcircuito(lista.items[NC]).Esquema = FFFN then textoF := 'ffn';
    if Tcircuito(lista.items[NC]).Esquema = FFF then textoF := 'fff';
    pra.y := pra.y + 0.10;
    FrPrincipal.desenha_texto(Pra, 0.08, 0, Circuito_tubo, 10, 'Untitled1');
    pra.y := pra.y - 0.17;
    FrPrincipal.desenha_texto(Pra, 0.09, 0, textoF, 10, 'Untitled1');
    pra.y := pra.y - 0.15;
    FrPrincipal.desenha_texto(Pra, 0.08,
      0, '#' + floattostr(Tcircuito(lista.items[NC]).DfioSel), 10, 'Untitled1');
    pra.x := pra.x + 0.28;
    pra.y := pra.y + 0.25;

  end;



  pra.x := pra.x - 0.2;

     pra.y:=prb.y;
  desenha_linha_na_telar(prb, pra, clteal);




  FrPrincipal.workplace.canvas.Pen.Style := pssolid;
  CircuitosTubo.Free;
end;

procedure TFrPrincipal.desenha_Linha(PrObjeto: TObject; selecao: boolean);
var
  a, b: ponto2d;
Begin
  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;

  if minhaclasse(PrObjeto).Objeto = 'TLinha' then
  Begin
    a.x := Tlinha(PrObjeto).Ax;
    a.y := Tlinha(PrObjeto).Ay;
    b.x := Tlinha(PrObjeto).Bx;
    b.y := Tlinha(PrObjeto).By;
    Desenha_Linha_Na_TelaR(a, b, clwhite);
    exit;
  end;
  if minhaclasse(PrObjeto).Objeto = 'TTubulacao' then
  Begin
    a.x := TTubulacao(PrObjeto).Ax;
    a.y := TTubulacao(PrObjeto).Ay;
    b.x := TTubulacao(PrObjeto).Bx;
    b.y := TTubulacao(PrObjeto).By;
    Desenha_Linha_Na_TelaR(a, b, clwhite);
    exit;
  end;

end;


procedure TFrPrincipal.desenha_CD(PrObjeto: TObject; tipo: byte; selecao: boolean);
var
  CCompos: array[1..18] of ponto2d;
  a: tpoint;
  f, g, angulo: integer;
  pontoo: ponto2d;
Begin
  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;
  pontoo.x := Tcd(PrObjeto).Px;
  pontoo.y := Tcd(PrObjeto).Py;
  //resto do bloco
  CCompos[1].x := -0.15;
  CCompos[1].y := 0;
  CCompos[2].x := 0.15;
  CCompos[2].y := 0;
  CCompos[3].x := -0.15;
  CCompos[3].y := 0.1;
  CCompos[4].x := 0.15;
  CCompos[4].y := 0.1;
  CCompos[5].x := -0.15;
  CCompos[5].y := 0.0;
  CCompos[6].x := -0.150;
  CCompos[6].y := 0.1;
  CCompos[7].x := 0.15;
  CCompos[7].y := 0;
  CCompos[8].x := 0.15;
  CCompos[8].y := 0.1;
  CCompos[9].x := -0.15;
  CCompos[9].y := 0.0;
  CCompos[10].x := 0.15;
  CCompos[10].y := 0.1;
  // 1 direita
  // 2 esquerda
  // 3 cima
  // 4 baixo
  if tipo <> 3 then
  Begin
    if tipo = 1 then
      angulo := -90;
    if tipo = 2 then
      angulo := 90;
    if tipo = 4 then
      angulo := 180;
    for f := 1 to 18 do
      CCompos[f] := rotate2d(CCompos[f], angulo);
  end;
  for f := 1 to 10 do
  Begin
    CCompos[f].x := CCompos[f].x + pontoo.x;
    CCompos[f].y := CCompos[f].y + pontoo.y;
  end;
  FrPrincipal.workplace.canvas.pen.Mode := pmcopy;
  FrPrincipal.workplace.canvas.pen.Width := 1;
  a := toscreen(pontoo);
  FrPrincipal.workplace.Canvas.MoveTo(a.x, a.y);
  g := 0;
  for f := 1 to 5 do
  Begin
    g := g + 2;
    Desenha_Linha_Na_TelaR(CCompos[g - 1], CCompos[g], clwhite);
  end;
  if MostraIndice = True then
  Begin
    FrPrincipal.desenha_texto(pontoo, 0.10, 0,
      IntToStr(Tcd(PrObjeto).Id_obj), 15, 'arial');
  end;
  FrPrincipal.desenha_blip(pontoo, 15);
  FrPrincipal.workplace.canvas.Pen.Style := pssolid;
end;

procedure TFrPrincipal.desenha_CXP(PrObjeto: TObject; tipo: byte; selecao: boolean);
var
  CCompos: array[1..18] of ponto2d;
  a: tpoint;
  f, g, angulo: integer;
  pontoo: ponto2d;
Begin
  pontoo.x := Tcxp(PrObjeto).Px;
  pontoo.y := Tcxp(PrObjeto).Py;


  if ((minhaclasse(PrObjeto).Selecionado = True) or (selecao = True)) then
    FrPrincipal.workplace.canvas.Pen.Style := psdot
  else
    FrPrincipal.workplace.canvas.Pen.Style := pssolid;

  workplace.canvas.pen.color := clred;
  //resto do bloco
  CCompos[1].x := -0.05;
  CCompos[1].y := 0;
  CCompos[2].x := 0.05;
  CCompos[2].y := 0;

  CCompos[3].x := -0.05;
  CCompos[3].y := 0.05;
  CCompos[4].x := 0.05;
  CCompos[4].y := 0.05;




  cCompos[5].x := -0.05;
  CCompos[5].y := 0.0;
  CCompos[6].x := -0.05;
  CCompos[6].y := 0.05;

  CCompos[7].x := 0.05;
  CCompos[7].y := 0;
  CCompos[8].x := 0.05;
  CCompos[8].y := 0.05;


  CCompos[9].x := -0.05;
  CCompos[9].y := 0.0;
  CCompos[10].x := 0.05;
  cCompos[10].y := 0.05;



  // 1 direita
  // 2 esquerda
  // 3 cima
  // 4 baixo

  if tipo <> 3 then
  Begin
    if tipo = 1 then
      angulo := -90;
    if tipo = 2 then
      angulo := 90;
    if tipo = 4 then
      angulo := 180;
    for f := 1 to 18 do
      CCompos[f] := rotate2d(CCompos[f], angulo);
  end;

  for f := 1 to 8 do
  Begin
    CCompos[f].x := CCompos[f].x + pontoo.x;
    CCompos[f].y := CCompos[f].y + pontoo.y;
  end;
  FrPrincipal.workplace.canvas.pen.Mode := pmcopy;
  FrPrincipal.workplace.canvas.pen.Width := 1;
  a := toscreen(pontoo);
  FrPrincipal.workplace.Canvas.MoveTo(a.x, a.y);
  g := 0;
  for f := 1 to 5 do
  Begin
    g := g + 2;
    Desenha_Linha_Na_TelaR(CCompos[g - 1], CCompos[g], clwhite);
  end;
  FrPrincipal.desenha_blip(pontoo, 15);
  if MostraIndice = True then
  Begin
    FrPrincipal.desenha_texto(pontoo, 0.10, 0,
      IntToStr(Tcxp(PrObjeto).Id_obj), 15, 'arial');
  end;

  FrPrincipal.workplace.canvas.Pen.Style := pssolid;
end;




procedure TFrPrincipal.WorkPlaceMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
Begin
  //BtCancelaClick(self);
  Btzmenos.Click;
end;



procedure TFrPrincipal.AngleTextOut(CV: TCanvas; const sText: string;
  x, y, angle, altura: integer);
var
  LogFont: TLogFont;
  SaveFont: TFont;
Begin
  SaveFont := TFont.Create;
  SaveFont.Assign(CV.Font);
  GetObject(SaveFont.Handle, sizeof(TLogFont), @LogFont);
  with LogFont do
  Begin
    //   lfFaceName:='Small Fonts';
    lfEscapement := angle * 10;
    lfPitchAndFamily := FIXED_PITCH or FF_DONTCARE;
    lfOutPrecision := out_tt_precis;
    lfQuality := proof_quality;
    lfHeight := altura * 2;
  end; {with}
  CV.Font.Handle := CreateFontIndirect(LogFont);
  SetBkMode(CV.Handle, TRANSPARENT);
  CV.TextOut(x, y, sText);
  CV.Font.Assign(SaveFont);
  SaveFont.Free;
end;

procedure TFrPrincipal.WorkPlaceMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
Begin
  Btzmais.Click;
end;




procedure TFrPrincipal.desenha_blip(ponto: ponto2d; cor: tcolor);
var
  a: tpoint;
Begin
  if cor <> 10 then
  Begin
    workplace.Canvas.pen.mode := pmcopy;
    workplace.Canvas.pen.color := cor;
    a := ToScreen(ponto);
    //   workplace.canvas.pen.Style:=psdot;
    workplace.Canvas.frame(a.x - 6, a.y - 6, a.x + 6, a.y + 6);
    workplace.Canvas.pen.color := clwhite;
  end
  else
  Begin
    //      workplace.canvas.pen.Style:=psdot;
    workplace.Canvas.pen.mode := pmcopy;
    workplace.Canvas.pen.color := clblack;
    a := ToScreen(ponto);
    FrPrincipal.WorkPlace.Canvas.moveto(a.x, a.y);
    FrPrincipal.WorkPlace.Canvas.AngleArc(a.x, a.y, 8, 0, 360);
    workplace.Canvas.pen.color := clwhite;
  end;
  workplace.canvas.pen.Style := pssolid;
end;

procedure TFrPrincipal.desenha_blip_solido(ponto: ponto2d; cor: integer);
var
  a: tpoint;
  old: tcolor;
Begin
  workplace.Canvas.pen.mode := pmcopy;
  workplace.Canvas.pen.color := cor;
  old := workplace.Canvas.Brush.Color;
  workplace.Canvas.Brush.Color := cor;
  a := ToScreen(ponto);
  workplace.canvas.FillRect(a.x - 3, a.y - 3, a.x + 3, a.y + 3);
  workplace.Canvas.pen.color := clwhite;
  workplace.Canvas.Brush.Color := old;
end;



procedure TFrPrincipal.desenha_arc(pa: ponto2d; Raio, A_i, A_f: double;
  cor: integer; estilo: integer;indice:integer);
var
  a, b, c: tpoint;
  comprimento: integer;
  qw, er: longint;
  temponto: ponto2d;
Begin
  temponto.x := 0;
  temponto.y := 0;
  workplace.Canvas.pen.mode := pmcopy;
  workplace.Canvas.pen.color := cor;
  if estilo = 0 then workplace.Canvas.pen.Style := psdot;
  a := ToScreen(pa);
  b := ToScreen(temponto);
  temponto.x := 0;
  temponto.y := raio;
  c := ToScreen(temponto);
  comprimento := round(d_dois_pontos(b.x, b.y, c.x, c.y));
  if (A_i >= 0) and (A_i <= 90) then
  Begin
    qw := round(comprimento * cos(degtorad(A_i)));
    er := round(comprimento * sin(degtorad(A_i)));
    workplace.Canvas.MoveTo(a.x + qw, a.y - er);
  end;
  if (A_i > 90) and (A_i < 180) then
  Begin
    qw := round(comprimento * cos(degtorad(A_i)));
    er := round(comprimento * sin(degtorad(A_i)));
    workplace.Canvas.MoveTo(a.x + qw, a.y - er);
  end;
  if (A_i >= 180) and (A_i < 270) then
  Begin
    qw := round(comprimento * cos(degtorad(A_i)));
    er := round(comprimento * sin(degtorad(A_i)));
    workplace.Canvas.MoveTo(a.x + qw, a.y - er);
  end;
  if (A_i >= 270) and (A_i < 360) then
  Begin
    qw := round(comprimento * cos(degtorad(A_i)));
    er := round(comprimento * sin(degtorad(A_i)));
    workplace.Canvas.MoveTo(a.x + qw, a.y - er);
  end;
  workplace.Canvas.AngleArc(a.x, a.y, comprimento, A_i, a_f);
  workplace.Canvas.pen.color := clwhite;
  if estilo = 0 then workplace.Canvas.pen.Style := pssolid;
end;

procedure TFrPrincipal.desenha_circle(Ponto: ponto2d; Raio: double; cor: integer);
var
  a, b, c: tpoint;
  comprimento: integer;
  Temponto: ponto2d;

Begin
  setbkmode(workplace.canvas.handle, transparent);
  workplace.Canvas.pen.mode := pmcopy;
  workplace.Canvas.pen.color := clwhite;
 { if selecao = True then
  Begin
    workplace.Canvas.pen.color := clred;
    workplace.Canvas.pen.style := psdot;
  end;}
  a := ToScreen(Ponto);
  Temponto.x := 0;
  Temponto.y := 0;
  b := ToScreen(Temponto);
  Temponto.x := 0;
  Temponto.y := raio;
  c := ToSCreen(Temponto);
  comprimento := round(d_dois_pontos(b.x, b.y, c.x, c.y));
  workplace.Canvas.moveto(a.x + comprimento, a.y);
  workplace.Canvas.AngleArc(a.x, a.y, comprimento, 0, 360);
  workplace.Canvas.Ellipse(a.x - comprimento, a.y - comprimento, a.x + comprimento,
    a.y + comprimento);
end;

procedure TFrPrincipal.desenha_texto(ponto: ponto2d; Altura, angulo: double;
  Texto: string; cor: integer; nomefonte: string);
var
  a, b, c: tpoint;
  Putil: double;
  tamanho: integer;
  anterior,NaTela,w,h: integer;
  Temponto: ponto2d;
  ts : ttextstyle;
Begin
  setbkmode(handle, transparent);
  workplace.Canvas.font.Name :=nomefonte;//'Arial';// nomefonte;// 'Untitled1';
  workplace.Canvas.font.Color := clwhite;
  workplace.Canvas.Brush.Style := bsClear;
    if cor < 0 then
    workplace.Canvas.pen.mode := pmxor
  else
    workplace.Canvas.pen.mode := pmcopy;


  Temponto.x := 0;
  Temponto.y := 0;
  b := ToScreen(Temponto);
  Temponto.x := 0;
  Temponto.y := Altura;
  c := ToScreen(Temponto);
  Putil := d_dois_pontos(b.x, b.y, c.x, c.y);
  Tamanho := round(Putil);
   //mensagem(inttostr(tamanho));

 // if Tamanho > 4 then
 // troquei height por size
    workplace.Canvas.font.height :=round(tamanho*1.5);// round(Tamanho * 2)
   // mensagem(inttostr(workplace.Canvas.font.Height),2);
 // else
 //   workplace.Canvas.font.Height := 4;

  //workplace.Canvas.font.Name := 'Untitled1';
{  if Tamanho <= 4 then
  Begin
    workplace.Canvas.font.Name := 'Small Fonts';
    workplace.Canvas.font.Height := 4;
  end;}

   {
   ts := workplace.Canvas.TextStyle;
   ts.Alignment := taCenter;
   ts.Layout := tlTop;
   workplace.Canvas.TextStyle:=ts;
   workplace.Canvas.GetTextSize(Texto , w, h);


   // First calculate the text size then draw it
TextBox := Rect(0, currentPos.Y, Width, High(Integer));
DrawText(ACanvas.Handle, PChar(Text), Length(Text),
  TextBox, DT_WORDBREAK or DT_INTERNAL or DT_CALCRECT);

DrawText(ACanvas.Handle, PChar(Text), Length(Text),
  TextBox, DT_WORDBREAK or DT_INTERNAL);


   }




   a:=toscreen(ponto);

   if angulo <> 0 then
  Begin
    anterior := workplace.Canvas.Font.Orientation;
    workplace.Canvas.Font.Orientation := round(angulo * 10);
    workplace.Canvas.textout(a.x, a.y - workplace.Canvas.font.Height, texto);
    workplace.Canvas.Font.Orientation := anterior;
  end
  else
    workplace.Canvas.textout(a.x, a.y - round(0.82*workplace.Canvas.font.Height), texto);


 // workplace.Canvas.Brush.Style := bsSolid;
end;



procedure TFrPrincipal.FormCreate(Sender: TObject);
var
  NovoTela: TTela;
  i: integer;
  NovoDimensionamento : TDimensionamento;
Begin
  Mg := False;
  MostraIndice := False;
  scaled := True;
{if (screen.Width <> 1920) then
  Begin
    Height := longint(Height) * longint(screen.Height) div 1080;
    Width := longint(Width) * longint(screen.Width) div 1920;
    scaleBy(screen.Width, 1920);
  end;}
  total:=0;


  // FrPrincipal.ComboBoax.Height:=FrPrincipal.grade.DefaultRowHeight;
  screen.cursors[crLinie] := LoadCursor(HINSTANCE, makeintresource(133));
  screen.cursors[crHand] := LoadCursor(HINSTANCE, makeintresource(131));
  screen.cursors[crKreis] := LoadCursor(HINSTANCE, makeintresource(103));
  screen.cursors[crRechteck] := LoadCursor(HINSTANCE, makeintresource(6));
  screen.cursors[crRndRect] := LoadCursor(HINSTANCE, makeintresource(8));
  screen.cursors[crEimer] := LoadCursor(HINSTANCE, makeintresource(12));
  screen.cursors[crSpray] := LoadCursor(HINSTANCE, makeintresource(2));
  screen.cursors[crFreihand] := LoadCursor(HINSTANCE, makeintresource(1));
  screen.cursors[crText] := LoadCursor(HINSTANCE, makeintresource(104));
  screen.cursors[crPipette] := LoadCursor(HINSTANCE, makeintresource(110));
  screen.cursors[crSchere] := LoadCursor(HINSTANCE, makeintresource(3));
  screen.cursors[crRadiergummi] := LoadCursor(HINSTANCE, makeintresource(4));
  screen.cursors[crText] := LoadCursor(HINSTANCE, makeintresource(104));
  FrPrincipal.workplace.cursor := crLinie;




   {  shape2.cursor := crHand;
     shape3.cursor := crKreis;
     shape4.cursor := crRechteck;
     shape5.cursor := crRndRect;
     shape6.cursor := crEimer;
     shape7.cursor := crSpray;
     shape8.cursor := crFreihand;
     shape9.cursor := crText;
     shape10.cursor := crRadiergummi;
     shape11.cursor := crSchere;
     shape12.cursor := crPipette;    }
  bentrouTExto := False;
  keypreview := True;
  primeiro_canto := False;
  dis_cap := 4;
  inter := False;
  dxf := True;
 { p1.x := 0;
  p2.x := 0;
  p3.x := 0;
  p1.y := 0;
  p2.y := 0;
  p3.y := 0;}
  p_ponto := False;
  s_ponto := False;
  t_ponto := False;
  barra_atual := 0;
  Comando_Ativo := 0;
  passou := 0;
  primeiro_ponto := False;
  segundo_ponto := False;

  DMenorx := 0;
  Dmaiorx := 15;
  Dmenory := 0;
  DmaiorY := 10;
  TMenorx := 10;
  Tmaiorx := workplace.Width - 10;
  Tmenory := workplace.Height - 10;
  TmaiorY := 10;
  SetWindowAndViewPort(0, 15, 0, 10, TMenorx, Tmaiorx, Tmenory, TmaiorY);
  NovoTela := Ttela.Create;
  NovoTela.Ax := 0;
  NovoTela.Ay := 0;
  NovoTela.Bx := 30;
  NovoTela.By := 10;
  NovoTela.Objeto := 'TTela';
  NovoTela.Ligado := True;
  NovoTela.Ultima_Letra_Interruptor := 'a';
  NovoTela.Ultima_potencia_Tomada := 150;
  NovoTela.Ultimo_Circuito_Usado_interruptor := 1;
  NovoTela.Ultimo_Circuito_Usado_tomada := 2;
  lista.add(NovoTela);
  NovoDimensionamento:=TDimensionamento.create;
  NovoDimensionamento.Adotar_Maior_Disjuntor_Da_Faixa:=true;
  NovoDimensionamento.Capacidade_Minima_Do_Disjuntor:=5;
  NovoDimensionamento.Ignorar_Fator_De_Agrupamento:=true;
  NovoDimensionamento.Permitir_Forca_E_Iluminacao_Mesmo_Condutor:=true;
  NovoDimensionamento.Permitir_LAmpada_Sem_Interruptor:=True;
  NovoDimensionamento.Permitir_Retor_Secao_Difente:=true;
  NovoDimensionamento.Tolerancia_De_Corrente:=1;
  NovoDimensionamento.Queda_De_Tensao_Admissivel:=4;
 lista.add(NovoDimensionamento);










  decimalSeparator := ',';


  Layers := TStringList.Create;
  Layers.Sorted := True;
  Layers.Duplicates := dupIgnore;
  Canto_inferior_esquerdo.x:=1E20;
  Canto_inferior_esquerdo.y:=1E20;
  Canto_Superior_direito.x:=-1E20;
  Canto_Superior_direito.y:=-1E20;


end;

procedure TFrPrincipal.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
Begin
  ShowMessage('Voce teclou ' + IntToStr(key));
end;

procedure TFrPrincipal.Sair1Click(Sender: TObject);
Begin

 {

 InHalt := True;
  apaga_dxf;
  b := lista.Count - 1;
  if b>0 then for f := b downto 0 do lista.Remove(lista.items[f]);
  }
  frprincipal.Close;

end;

procedure TFrPrincipal.Redesenha1Click(Sender: TObject);
var
  temponto, p_aux, P_aux2,insert_point: ponto2d;
  f,g: integer;
  tamanho,angulo : double;
  nome_do_bloco,texto : string;
  antes : TDateTime;
Begin
    antes:=now;
  //frPrincipal.cmdMemo.Lines.Add(timetostr(now));
  //workplace.canvas.Clear;
  workplace.Canvas.pen.mode := pmcopy;
  workplace.Canvas.pen.color := clwhite;
  workplace.canvas.Brush.Color := clgray;
  // workplace.canvas.Rectangle(0,0,workplace.Width,workplace.Height);
  temponto.x := cap_ponto1.x;
  temponto.y := cap_ponto1.y;
  desenha_blip(temponto, clred);
  temponto.x := cap_ponto2.x;
  temponto.y := cap_ponto2.y;
  desenha_blip(temponto, clblue);
  p_aux.x := captura1.ax;
  p_aux.y := captura1.ay;
  p_aux2.x := captura1.bx;
  p_aux2.y := captura1.by;
  // desenha_linha_na_telaR(p_aux,p_aux2,clgray);
  desenha_blip(Blip_centro, clyellow);
  p_aux.x := captura2.ax;
  p_aux.y := captura2.ay;
  p_aux2.x := captura2.bx;
  p_aux2.y := captura2.by;
  // desenha_linha_na_telar(p_aux,p_aux2,clgray);
  workplace.Canvas.pen.Width := 1;
  workplace.Repaint;

For f := 0 to lista.Count - 1 do
Begin

    if Minhaclasse(lista.items[f]).Ligado = False then Continue;

     { #todo : Mostar fiação em tubo em forma de arco }

    if ((Minhaclasse(lista.items[f]).tipo = 4) or
      (Minhaclasse(lista.items[f]).tipo = 32)) then
    Begin
      p_aux.x := TArco(lista.items[f]).Px;
      p_aux.y := TArco(lista.items[f]).Py;
      desenha_arc(p_aux, TArco(lista.items[f]).Raio,
        TArco(lista.items[f]).AnguloInicial, TArco(lista.items[f]).AnguloFinal,
        clwhite, 15,minhaclasse(lista.items[f]).Id_obj);
      p_aux.x := TArco(lista.items[f]).locx;
      p_aux.y := TArco(lista.items[f]).LocY;
      FrPrincipal.desenha_blip_solido(p_aux, clpurple);
    end;

    if Minhaclasse(lista.items[f]).tipo = tubulacao then
      FrPrincipal.desenha_tubo(lista.items[f], False);

    if Minhaclasse(lista.items[f]).tipo = Ponto_iluminacao then
      FrPrincipal.desenha_luminaria(Tiluminacao(lista.items[f]), False);


    if Minhaclasse(lista.items[f]).tipo = linha_dxf then
    Begin


{     TesteDesenhoLinha(frPrincipal.workplace.Canvas, lista.items[f]);}

      p_aux.x := TLinha(lista.items[f]).Ax;
      p_aux.y := TLinha(lista.items[f]).Ay;
      p_aux2.x := TLinha(lista.items[f]).Bx;
      p_aux2.y := TLinha(lista.items[f]).By;
      desenha_linha(lista.items[f], TLinha(lista.items[f]).Selecionado);


      //   if (p_aux.y>6.08) and  (p_aux.y<6.1) then showmessage(inttostr(f));
      //      desenha_linha_na_telar(p_aux,p_aux2);
    end;

    if Minhaclasse(lista.items[f]).tipo = 6 then
    Begin
      p_aux.x := Ttexto(lista.items[f]).Px;
      p_aux.y := Ttexto(lista.items[f]).Py;
      frprincipal.workplace.Font.Name := 'arial';
     // FrPrincipal.desenha_blip_solido(p_aux, clgreen);
      desenha_texto(p_aux, Ttexto(lista.items[f]).tamanho, Ttexto(
        lista.items[f]).angulo, Ttexto(lista.items[f]).descricao, clwhite, 'arial');
    end;

    // *********** Desenha Circulo ****************** //
    if (Minhaclasse(lista.items[f]).tipo = 5) then
    Begin
      p_aux.x := Tcirculo(lista.items[f]).Px;
      p_aux.y := Tcirculo(lista.items[f]).Py;
      desenha_circle(p_aux, Tcirculo(lista.items[f]).Raio, clwhite);
      FrPrincipal.desenha_blip_solido(p_aux, clred);
    end;
    if Minhaclasse(lista.items[f]).tipo = interruptor then
    Begin
      p_aux.x := Tinterruptor(lista.items[f]).Px;
      p_aux.y := Tinterruptor(lista.items[f]).Py;
      FrPrincipal.desenha_interruptor(TObject(lista.items[f]), False);
      FrPrincipal.desenha_blip(p_aux, 15);
    end;
    if Minhaclasse(lista.items[f]).tipo = tomada then
    Begin
      p_aux.x := Ttomada(lista.items[f]).Px;
      p_aux.y := Ttomada(lista.items[f]).Py;
      FrPrincipal.desenha_tomada(lista.items[f], False);
    end;
    if Minhaclasse(lista.items[f]).tipo = CaixaDisjuntores then
    Begin
      p_aux.x := TCd(lista.items[f]).Px;
      p_aux.y := Tcd(lista.items[f]).Py;
      FrPrincipal.desenha_CD(lista.items[f], 0, False);
    end;
    if Minhaclasse(lista.items[f]).tipo = CxPassagem then
    Begin
      FrPrincipal.desenha_CXP(lista.items[f], 0, False);
    end;
End;   // for da lista

  For f := 0 to blocos.Count - 1 do
  Begin
   if minhaclasse(blocos.items[f]).Ligado = False then Continue;
    if ((minhaclasse(blocos.items[f]).Tipo=42)) then
       Begin
        insert_point.x:=TBloco(blocos.items[f]).px;
        insert_point.y:=TBloco(blocos.items[f]).py;
     //   frprincipal.desenha_blip(insert_point,clred);
        Nome_do_bloco:=TBloco(blocos.items[f]).Bloco;
        angulo:=TBloco(blocos.items[f]).Angulo;
      //  mensagem(floattostr(angulo));

        For g := 0 to blocos.Count - 1 do
        Begin
          if minhaclasse(blocos.items[g]).Ligado = False then Continue;
           if  TBloco(blocos.items[g]).Bloco=Nome_do_bloco then
                Begin
                              if minhaclasse(blocos.items[g]).objeto = 'TLinha' then
                                 Begin
                                      p_aux.x := TLinha(blocos.items[g]).ax+insert_point.x;
                                      p_aux.y := TLinha(blocos.items[g]).Ay+insert_point.y;
                    if angulo<>0 then p_aux:=Rotate2DEmTorno(p_aux,insert_point, angulo);;
                                      p_aux2.x := TLinha(blocos.items[g]).bx+insert_point.x;
                                      p_aux2.y := TLinha(blocos.items[g]).by+insert_point.y;
                    if angulo<>0 then p_aux2:=Rotate2DEmTorno(p_aux2,insert_point, angulo);
                                      Desenha_Linha_Na_TelaR(p_aux,p_aux2,clwhite);
                                 end;
                              if  ((minhaclasse(blocos.items[g]).objeto = 'TAtributo')and (Tatributo(blocos.items[g]).tipo=43) )then
                                 Begin
                                    p_aux.x := TAtributo(blocos.items[g]).Px{+insert_point.x};
                                    p_aux.y := TAtributo(blocos.items[g]).Py{+insert_point.y};
                                    if angulo<>0 then p_aux:=rotate2d(p_aux, angulo);
                                    frprincipal.workplace.Font.Name := 'arial';
                                //    FrPrincipal.desenha_blip_solido(p_aux, clgreen);
                                    tamanho:=TAtributo(blocos.items[g]).tamanho;
                                    angulo:= TAtributo(blocos.items[g]).angulo;
                                    texto:=TAtributo(blocos.items[g]).Valor;
                                    desenha_texto(p_aux,tamanho,angulo,texto , clwhite, 'arial');
                                    texto:=inttostr(TAtributo(blocos.items[g]).pai);
                                  end;
                if (Minhaclasse(blocos.items[g]).objeto = 'TCirculo') then
                               Begin
                                  p_aux.x := Tcirculo(blocos.items[g]).Px+insert_point.x;
                                  p_aux.y := Tcirculo(blocos.items[g]).Py+insert_point.y;
                                  tamanho:=Tcirculo(blocos.items[g]).raio;
                                 if angulo<>0 then p_aux:=Rotate2DEmTorno(p_aux,insert_point, angulo);
                                 desenha_circle(p_aux, tamanho, clwhite);

                              //   p_aux.x := Tcirculo(blocos.items[g]).Px+insert_point.x;
                              //    p_aux.y := Tcirculo(blocos.items[g]).Py+insert_point.y;
                              //   p_aux.x:=p_aux.x+insert_point.x;
                              //    p_aux.y:=p_aux.y+insert_point.y;
                               //   desenha_circle(p_aux, tamanho, clwhite);
                              //    FrPrincipal.desenha_blip_solido(p_aux, clred);


                                   { p_aux.x := TCirculo(blocos.items[g]).px+insert_point.x;
                                   p_aux.y := TCirculo(blocos.items[g]).py+insert_point.y;
                                   desenha_circle(p_aux,TCirculo(blocos.items[g]).raio,clred);}




                               end;

                 end;// insercao das entidade linha,texto, circulo
        end;// busca entidades dos blocos
       end;// inserir bloco
    end; //For dos blocos
  FrPrincipal.desenha_blip_solido(Cap_ponto1, ClRed);
  FrPrincipal.desenha_blip_solido(Cap_ponto2, Clblue);
  FrPrincipal.desenha_blip_solido(Blip_centro, clyellow);
 //   frPrincipal.cmdMemo.Lines.Add(timetostr(now));
   frprincipal.cmdmemo.lines.add(floattostr(MilliSecondsBetween(Now,antes)));
end;

procedure TFrPrincipal.FormClose(Sender: TObject);
var
  f: integer;
Begin
   lista.Free;
   Blocos.Free;
end;

procedure TFrPrincipal.LerDxf1Click(Sender: TObject);
var
  i: integer;

Begin
  opendialog1.FilterIndex := 2;
  ExecComando('limpar');
  cmdMemo.lines.add('Selecione o ponto onde o desenho vai ser inserido');

   // texto '3.4,5.6';

   //Cap_ponto1.x:=strtofloat(inputbox('Coordenada X da Inserção','',''));
  // Cap_ponto1.y:=strtofloat(inputbox('Coordenada Y da Inserção','',''));

  if (opendialog1.Execute)  then
  Begin
    FrPrincipal.Caption := 'Carregando .............';
    FrPrincipal.Enabled := False;
   if sender=ImportarDXF then carrega_Dxf(opendialog1.filename);
   Redesenha1Click(nil);
    FrPrincipal.Enabled := True;
   frprincipal.Btztudo.Click;
    DefLayersForm.LayersList.Clear;
   for i := 0 to lista.Count - 1 do
    Begin
      if upcase(minhaclasse(lista.items[i]).Objeto) = upcase('TLayer') then
      Begin
        if DefLayersForm.LayersList.Items.IndexOf(TLayer(lista.items[i]).nome) < 0 then
        Begin
          DefLayersForm.LayersList.Items.Add(TLayer(lista.items[i]).nome);
          DefLayersForm.ActiveLayerCBox.Items.Add(TLayer(lista.items[i]).nome);
        end;
      end;
    end;
    FrPrincipal.Caption := 'FS_Cad ' + opendialog1.filename;

  end;

{ for i := 0 to arvore.Items.Count - 1 do  if (upcase(arvore.Items.Item[i].Text) = upcase('Objetos')) then temp := arvore.Items.Item[i];
  for i := 0 to lista.Count - 1 do arvore.Items.AddChild(temp, IntToStr(i)+'<>'+MinhaClasse(lista.items[i]).Objeto).MakeVisible;}

  frprincipal.ToolButton2.Click;

end;

procedure TFrPrincipal.ComandosTela(Sender: TObject);

Begin
 // Comando_Ativo := nenhum;


   if Sender = BtMoverArco then
   Begin
    comando_ativo := 44;
    ultimo_comando := comando_Ativo;
    exit;

   end;

    if Sender = BtSelecionaAREA then
  Begin
    comando_ativo := 39;
    ultimo_comando := comando_Ativo;
    ponto_requisitado:=true;
    frprincipal.StatusBar1.Panels[1].Text:='Entre o ponto solicitado';
    exit;
  end;

  if Sender = BtTuboBezier then
  Begin
    comando_ativo := BtBezier;
    ultimo_comando := comando_Ativo;
    exit;
  end;
  if Sender = BtCaminhos then
  Begin
    ultimo_comando := comando_Ativo;
    exit;
  end;
  if Sender = BtTomada then
  Begin
    //  Mselecao.PopUp((Sender as TspeedButton).Left, frprincipal.PageControl1.Height);
    comando_ativo := Tomada;
    ponto_requisitado:=true;
    frprincipal.StatusBar1.Panels[1].Text:='Entre o ponto solicitado';
  end;
  if Sender = BtLampada then
  Begin
    // Mselecao.PopUp((Sender as TspeedButton).Left, frprincipal.PageControl1.Height);
    comando_ativo := Ponto_iluminacao;
    ponto_requisitado:=true;
    frprincipal.StatusBar1.Panels[1].Text:='Entre o ponto solicitado';
      end;
  if Sender = Btredesenha then  Redesenha1Click(self);
  if Sender = BtInterruptor then
  Begin
    // Mselecao.PopUp((Sender as TspeedButton).Left, frprincipal.PageControl1.Height);
   comando_ativo := interruptor;
   ponto_requisitado:=true;
   frprincipal.StatusBar1.Panels[1].Text:='Entre o ponto solicitado';

  end;
  if Sender = BtTuboReto then
  Begin
    comando_ativo := tubulacaoReta;
    cmdmemo.Lines.add('Colocando tubo reto');
    cmdmemo.Lines.add('Aguardando primeiro objeto');
  end;
  if Sender = BtCancela then
  Begin
    luminaria_central := False;
    fio_encontrado := False;
    ultimo_comando := Comando_ativo;
    Comando_ativo := 0;
    exit;
  end;
  if ((Sender = BtZjanela) or (Sender = BtSelecionaAREA)) then
  Begin
   mensagem('Entre o primeiro ponto',1);
    ultimo_comando := comando_ativo;
    comando_ativo := Zoom_janela;
    primeiro_ponto := False;
    segundo_ponto := False;
    terceiro_ponto := False;
    desenhando := False;
  end;
  if Sender = Btzmenos then
  Begin
    scaley := scaley + (scaley / 10);
    scalex := scalex + (scalex / 10);
    Redesenha1Click(nil);
    exit;
  end;
  if Sender = Btzmais then
  Begin
    scaley := scaley - (scaley / 10);
    scalex := scalex - (scalex / 10);
    Redesenha1Click(nil);
    exit;
  end;
  if Sender = Btztudo then
  Begin
    Gbpanx := 0;
    Gbpany := 0;
    dmenorx := Mdmenorx;
    dmaiorx := Mdmaiorx;
    dmaiory := Mdmaiory;
    dmenory := Mdmenory;
    SetWindowAndViewPort(Dmenorx, Dmaiorx,
      Dmenory, Dmaiory, TMenorx,
      Tmaiorx, Tmenory, TmaiorY);
    Redesenha1Click(nil);
    exit;
  end;
  if Sender = Btprevia then
  Begin
    dmenorx := pmenorx;
    dmaiorx := pmaiorx;
    dmaiory := pmaiory;
    dmenory := pmenory;
    SetWindowAndViewPort(Dmenorx, Dmaiorx,
      Dmenory, Dmaiory, TMenorx,
      Tmaiorx, Tmenory, TmaiorY);
    Redesenha1Click(nil);
    exit;
  end;
  if Sender = BtRepeteComando then
  Begin
    RepeteComando := not RepeteComando;
    if repeteComando = True then
      BtRepeteComando.Hint := 'Repete Comando Ligado'
    else
      BtRepeteComando.Hint := 'Repete Comando Desligado';
  end;
  if Sender = BtCaminhos then
  Begin
    ultimo_comando := comando_Ativo;
    exit;
  end;
  if Sender = BtMoveDesenho then
  Begin
    ultimo_comando := comando_ativo;
    comando_ativo := move_desenho;
  end;

  if Sender = BtCD then
  Begin

    //  Mselecao.PopUp((Sender as TspeedButton).Left, frprincipal.PageControl1.Height);
    comando_ativo := CaixaDisjuntores;
    ultimo_comando := comando_Ativo;
  end;
  if Sender = BtCXP then
  Begin
    //  Mselecao.PopUp((Sender as TspeedButton).Left, frprincipal.PageControl1.Height);

    comando_ativo := CxPassagem;
    ultimo_comando := comando_Ativo;
  end;
  if Sender = BtInterDuasRetas then
  Begin
    ToolbarButton973Click(nil);
    exit;
  end;
  if (Sender = BtPontoMeio) then
  Begin
    if ((MinhaClasse(lista.items[EntraIndice(objetoselecionado)]).Objeto =
      'TLinha')) then
    Begin
      cap_ponto2 := cap_ponto1;
      Cap_ponto1.x := Tlinha(listapro.TIObject).Ponto_do_meio.x;
      Cap_ponto1.y := Tlinha(listapro.TIObject).Ponto_do_meio.y;
   //   ultimo_comando := comando_ativo;
   //   comando_ativo := nenhum;
      FrPrincipal.desenha_blip_solido(Cap_ponto1, ClRed);
      FrPrincipal.desenha_blip_solido(Cap_ponto2, Clblue);
    end;
  end;
  if (Sender = btpontoextremo) then
  Begin
    if ((MinhaClasse(lista.items[EntraIndice(objetoselecionado)]).Objeto =
      'TLinha')) then
    Begin
      cap_ponto2 := cap_ponto1;
      Cap_ponto1.x :=
        Tlinha(listapro.TIObject).PontoExtremo(Last_MouseUp).x;
      Cap_ponto1.y :=
        Tlinha(listapro.TIObject).PontoExtremo(Last_MouseUp).y;
  //    ultimo_comando := comando_ativo;
  //    comando_ativo := nenhum;
      FrPrincipal.desenha_blip_solido(Cap_ponto1, ClRed);
      FrPrincipal.desenha_blip_solido(Cap_ponto2, Clblue);
    end;
  end;
  if Sender = btligareletrodutos then
  Begin
    ultimo_comando := comando_Ativo;
    Comando_ativo := CoLigarEletrodutos;
  end;

  if Sender = BtTuboARco then
  Begin
    ultimo_comando := comando_Ativo;
    comando_ativo := tubulacao;
    primeiro_Ponto := False;
    segundo_ponto := False;
    Terceiro_ponto := False;
    cmdmemo.Lines.add('Colocando tubo arco');
    cmdmemo.Lines.add('Aguardando primeiro objeto');

  end;
  if (Sender = BtTexto) and not (BentrouTexto) then
  Begin
    comando_ativo := texto;
    EntradaTexto := inputbox('Entre o texto e depois clique para inseri-lo', '', '');
    BentrouTexto := True;

  end;
  if Sender = BtCentroQuadrante then
  Begin
    comando_ativo := centro_retangulo;
    Blip_centro.x := (cap_ponto2.x + cap_ponto1.x) / 2;
    Blip_centro.y := (cap_ponto2.y + cap_ponto1.y) / 2;
    desenha_blip(Blip_centro, clyellow);
    ultimo_Comando := comando_ativo;
    comando_ativo := nenhum;
  end;
end;

procedure TFrPrincipal.BtApagaClick(Sender: TObject);

var
  a, f,h,pai: integer;
  selecionado : boolean;
Begin
 // a := Id_Obj_Sel;
  for f := lista.Count - 1 downto 0 do if minhaclasse(lista.items[f]).Selecionado = true then
      minhaclasse(lista.items[f]).Ligado := False;
   for f := blocos.Count - 1 downto 0 do if minhaclasse(blocos.items[f]).tipo = 42 then

  Begin
    selecionado:=Tbloco(blocos.items[f]).Selecionado;
      if selecionado=true then
  Begin
      minhaclasse(blocos.items[f]).Ligado := False;
      pai:=Tbloco(blocos.items[f]).Id_obj;
      // procurar pelos atributos dos blocos
        for h := blocos.Count - 1 downto 0 do
         if minhaclasse(blocos.items[h]).tipo = 43 then
         if tatributo(blocos.Items[h]).Pai=pai then tatributo(blocos.items[h]).Ligado:=false;
     // cmdmemo.lines.add(booltostr(minhaclasse(blocos.items[f]).Ligado));
  end;
  end;





frprincipal.Redesenha1Click(nil);
end;



procedure TFrPrincipal.ToolbarButton973Click(Sender: TObject);
var
  f1, f2, f3, f4, f5, f6: double;
  ix, iy: double;
Begin

  captura1.ax := linha1.Ax;
  captura1.ay := linha1.Ay;
  captura1.bx := linha1.Bx;
  captura1.by := linha1.By;

  captura2.ax := linha2.Ax;
  captura2.ay := linha2.Ay;
  captura2.bx := linha2.Bx;
  captura2.by := linha2.By;



  acha_equacao_da_linha(captura1.ax, captura1.ay, captura1.bx, captura1.by, f1, f2, f3);
  acha_equacao_da_linha(captura2.ax, captura2.ay, captura2.bx, captura2.by, f4, f5, f6);
  intersecao(f1, f2, f3, f4, f5, f6, Ix, iy);
  cap_ponto2 := cap_ponto1;
  Cap_ponto1.x := Ix;
  Cap_ponto1.y := Iy;
  ultimo_comando := comando_ativo;
  comando_ativo := nenhum;
  FrPrincipal.desenha_blip_solido(Cap_ponto1, ClRed);
  FrPrincipal.desenha_blip_solido(Cap_ponto2, Clblue);
end;

function p_str(p: ponto2d): string;
var
  a, b: string;
Begin
  str(p.x: 3: 3, a);
  str(p.y: 3: 3, b);
  p_str := '(' + a + ' , ' + b + ')';
end;

procedure TFrPrincipal.Adiciona1Click(Sender: TObject);
Begin
  comando_ativo := ultimo_comando;
end;

procedure TFrPrincipal.PopupMenu1Popup(Sender: TObject);
Begin
  comando_ativo := ultimo_comando;
 end;

procedure TFrPrincipal.CancelaClick(Sender: TObject);
Begin
  ultimo_comando := comando_ativo;
  COMANDO_ATIVO := NENHUM;
  //lbComando_Ativo.Caption := 'Nenhum';
  fio_encontrado := False;
  primeiro_ponto := False;
  segundo_ponto := False;
  desenhando := False;

end;

procedure TFrPrincipal.ToolButton1Click(Sender: TObject);
var
  temp: ttreenode;
  a, f: integer;
  NovoCircuito: Tcircuito;
Begin
  arvore.FullExpand;
  exit;
   {   temp:=arvore.Items.Add(Nil, 'Circuitos' );
      temp.ImageIndex :=0;
      temp.SelectedIndex :=1;
      temp.StateIndex :=2;
    }

  a := 0;
  for f := 0 to lista.Count - 1 do if Minhaclasse(lista.items[f]).tipo = Circuito then
      a := a + 1;



  if arvore.SelectionVisible then
  Begin
    temp := arvore.Selected;
    if temp.Text = 'Circuitos' then
    Begin
  {    a := StrToInt(parametros.values['CC']);
      a := a + 1;
       parametros.Values['CC'] := IntToStr(a);}
      a := a + 1;
      // arvore.Items.AddChild(temp, 'Circuito ' + IntToStr(a)).MakeVisible;
      arvore.Items.AddChild(temp, IntToStr(a)).MakeVisible;
      NovoCircuito := Tcircuito.Create;
      Total := total + 1;
      NovoCircuito.tag := a;
      NovoCircuito.Id_obj := total;
      NovoCircuito.Objeto := 'TCircuito';
      NovoCircuito.Ligado := True;
      NovoCircuito.FCA := 1;
      NovoCircuito.FCT := 1;
      NovoCircuito.TipoAlimentacao := Forca;
      NovoCircuito.Tensao := T220;
      NovoCircuito.Esquema := FN;
      NovoCircuito.tipo := 33;
      NovoCircuito.descricaoAD := 'Circuito ' + IntToStr(a);
      NovoCircuito.descricao := 'Circuito ' + IntToStr(a);
      NovoCircuito.Dfio := 1.5;
      NovoCircuito.Qtensao := 0;
      NovoCircuito.TempAmbiente := 30;
      NovoCircuito.Extensao := 0;
      NovoCircuito.Iprojeto := 0;
      lista.add(NovoCircuito);
      Listapro.TIObject := Tcircuito(NovoCircuito);
    end;

  end;
end;

procedure TFrPrincipal.arvoreClick(Sender: TObject);
var
  No: ttreenode;
  f: integer;
  r: integer;
Begin
  No := arvore.Selected;



  if copy(no.Text, 1, 15) = 'Configurações' then
    listapro.TIObject := TTela(lista.items[0]);

   if copy(no.Text, 1, 15) = 'Dimensionamento' then
    listapro.TIObject := TTela(lista.items[1]);
  if no.parent = nil then exit;

  //if no.HasAsParent(no)=false then exit ;
  //  if arvore.Selected.
  //   .HasChildren=false then exit;

    {

 var NoRaiz:TTreeNode;
Begin
  if TreeView.Selected = nil then
    Exit;
  NoRaiz := TreeView.Selected;
  While NoRaiz.Parent <> nil do
    NoRaiz := NoRaiz.Parent;
end;


  showmessage(arvore.Selected.Parent.Text);
     }

  if arvore.Selected.Parent.Text = 'Objetos' then
  Begin
  {  r := StrToInt(no.Text);
    for f := lista.Count - 1 downto 0 do
      if minhaclasse(lista.items[f]).tipo = 33 then
        if Tcircuito(lista.items[f]).tag = r then
        Begin
          listapro.TIObject := minhaclasse(lista.items[f]);
          ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        end;}
  end;


  if arvore.Selected.Parent.Text = 'Circuitos' then
  Begin
    r := StrToInt(no.Text);
    for f := lista.Count - 1 downto 0 do
      if minhaclasse(lista.items[f]).tipo = 33 then
        if Tcircuito(lista.items[f]).tag = r then
        Begin
          listapro.TIObject := minhaclasse(lista.items[f]);
          ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        end;
  end;



  if arvore.Selected.Parent.Text = 'Camadas' then
  Begin
    //   r:=strtoint(no.text);
    for f := lista.Count - 1 downto 0 do
      if minhaclasse(lista.items[f]).tipo = 38 then
        if TLayer(lista.items[f]).nome = no.Text then
        Begin
          listapro.TIObject := minhaclasse(lista.items[f]);
          ObjetoCorrenteNoGrid := minhaclasse(lista.items[f]).Id_obj;
        end;
  end;

   if arvore.Selected.Parent.Text = 'Blocos' then
  Begin
    //   r:=strtoint(no.text);
    for f := Blocos.Count - 1 downto 0 do
      if minhaclasse(Blocos.items[f]).tipo = 40 then
        if Tbloco(blocos.items[f]).bloco = no.Text then
        Begin
          listapro.TIObject := minhaclasse(Blocos.items[f]);
          ObjetoCorrenteNoGrid := minhaclasse(Blocos.items[f]).Id_obj;
        end;
  end;

end;

procedure TFrPrincipal.arvoreEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: boolean);
Begin
  exit;
end;

procedure TFrPrincipal.ToolButton2Click(Sender: TObject);
var
  temp: ttreenode;
  f, r: integer;
Begin

   arvore.FullCollapse;
   exit;
   if arvore.SelectionVisible then
  Begin
    temp := arvore.Selected;
    if copy(temp.Text, 1, 9) = 'Circuito ' then
    Begin
      // showmessage(inttostr(lista.count));
      for f := 0 to lista.Count - 1 do
        if (minhaclasse(lista.items[f]).objeto = 'TCircuito') then
          if (minhaclasse(lista.items[f]).DescricaoAD = temp.Text) then
          Begin
            r :=
              QuestionDlg('Aviso',
              'Deseja apagar realmente o circuito, não poderá ser desfeito!',
              mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');
            if r = mrYes then  listapro.TIObject := nil;
            //  showmessage(inttostr(f));
            if r = mrYes then
              lista.remove(lista.items[f]);
            if r = mrYes then
              arvore.Items.Delete(temp);
            exit;
          end;
    end;
  end;
end;

procedure TFrPrincipal.Button2Click(Sender: TObject);
Begin
{
  desenha_bezier := not desenha_bezier;
  if desenha_bezier then Button2.Caption := 'True'
  else
    Button2.Caption := 'False';
 }
  //FrPrincipal.CbCircuitos.Items.Delete(FrPrincipal.CbCircuitos.Items.IndexOf(FrPrincipal.Cbcircuitos.Text));
end;

procedure TFrPrincipal.BtLigarEletrodutosClick(Sender: TObject);
Begin
  // ligar eletrodutos....
end;

procedure TFrPrincipal.btCamadaClick(Sender: TObject);
var
  texto: string;
  a, b: integer;
Begin
  texto := inputbox('Entre o tubo', '', '');
  a := StrtoIntDEF(texto, 1);
  texto := inputbox('Entre o circuito', '', '');
  b := StrtoIntDEF(texto, 1);
  Frprincipal.ListaFiosCircuito(a, b);
end;

procedure TFrPrincipal.CfiacaoClick(Sender: TObject);
var
  ind, Obini, Obfin, ind2: integer;
  p_aux, p_aux2: ponto2d;
  texto, a, b: string;
  temp: entidade;
  locais, objetos, Tubos: textfile;
  encontrou: boolean;
  pigual: byte;
  f, c: integer;

  procedure um_caminho;
  Begin
    // metodologia nova
    assignfile(Locais, 'caminhos.txt');
    reset(Locais);
    encontrou := False;
    while (not (EOF(locais)) and (encontrou = False)) do
    Begin
      readln(locais, a); // pegar o primeiro objeto
      pigual := pos('=', a, 1);
      b := copy(a, 1, pigual - 1);
      if b = texto then   // texto tem o nome do tubo que o objeto passa
      Begin
        encontrou := True;
        obini := StrtoIntDEF(copy(a, 1, pigual - 1), 1);
      end;
    end;
    while not (EOF(locais)) do
    Begin
      readln(locais, a);  // inclui
      if copy(a, 1, pigual - 1) <> texto then
      Begin
        closefile(Locais);
        exit;
      end;
      pigual := pos('=', a, 1);
      B := Copy(a, pigual + 1, length(a));
      obfin := StrtoIntDEF(b, 1);
      if Busca_por_tubulacao(obini, obfin, ind, ind2) = True then
      Begin
        // localiza na lista
        writeln(tubos, texto + '=' + IntToStr(ind));
        cmdmemo.Lines.Add(texto + '=' + IntToStr(ind) + ' --' + IntToStr(ind2));
        p_aux.x := Ttubulacao(lista.items[ind2]).ObjIni_X;
        p_aux.y := Ttubulacao(lista.items[ind2]).ObjIni_Y;
        p_aux2.x := Ttubulacao(lista.items[ind2]).ObjFin_X;
        p_aux2.y := Ttubulacao(lista.items[ind2]).ObjFin_Y;
        if Minhaclasse(lista.items[ind2]).tipo = tubulacao then

        Begin
          desenha_linha_na_telar(p_aux, p_aux2, clblack);
          cmdmemo.Lines.add('entrou');
        end;

        if Minhaclasse(lista.items[ind2]).tipo = arco then
        Begin
          p_aux.x := Tarco(lista.items[ind2]).Px;
          p_aux.y := Tarco(lista.items[ind2]).Py;
          desenha_arc(p_aux, Tarco(lista.items[ind2]).Raio, Tarco(
            lista.items[ind2]).AnguloInicial,
            Tarco(lista.items[ind2]).AnguloFinal, clblack, 15,minhaclasse(lista.items[ind2]).Id_obj);
        end;
        // inicio do processo para adicionar o fio
        temp.TIPO := 29; // tipo fio
        temp.circuito := 0;
        temp.ay := 0;
        temp.bx := 0;
        temp.by := 0;
        temp.cx := 0;  // indice do tubo
        temp.cy := 0;
        temp.Tubulacao := ind;
        temp.ObjetoInicial := StrtoIntDEF(texto, 1); // origem  objeto que começou o fio
        temp.raio := 0;
        temp.Potencia := 0;
        temp.Apagado := False;
        temp.AnguloInicial := 0;
        temp.AnguloFinal := 0;
        temp.texto := '';
        temp.layer := 1;
        Adiciona(temp, True, False, '');
      end;
      obini := obfin;
    end;
    closefile(Locais);
   // fechar_arquivo(locais,'caminhos.txt');
  end;

Begin
  workplace.canvas.pen.mode := pmcopy;
  Cfiacao.Checked := not Cfiacao.Checked;
  c := lista.Count - 1;
  for f := c downto 0 do
  Begin
    if minhaclasse(lista.items[f]).tipo = fio then lista.Remove(lista.items[f]);
  end;
  assignfile(tubos, 'CaminhosTubo.txt');
  rewrite(tubos);
  assignfile(objetos, 'cidades.txt');
  reset(objetos);
  while not (EOF(objetos)) do
  Begin
    readln(objetos, texto);
    pigual := pos(' ', texto, 1);
    b := copy(texto, pigual + 1, length(texto));
    texto := trim(b);
    //showmessage(' OK ');
    cmdmemo.Lines.Clear;
    um_caminho;
  end;
  closefile(objetos);
  closefile(tubos);
  cmdMemo.Lines.add('Fiação criada');
end;

procedure TFrPrincipal.FormShow(Sender: TObject);
Begin
  workplace.Width := panel1.Left;
  Left:=0;
  Top:=0;
  Frprincipal.WindowState:=wsmaximized;;
end;

procedure TFrPrincipal.Image2Click(Sender: TObject);
begin
  if  Bevel2.style=bsraised then  Bevel2.style:=bsLowered
                           else  Bevel2.style:=bsraised;
end;

procedure TFrPrincipal.Image3Click(Sender: TObject);
begin
  if  Bevel3.style=bsraised then  Bevel3.style:=bsLowered
                           else  Bevel3.style:=bsraised;
end;

procedure TFrPrincipal.Image4Click(Sender: TObject);
begin
  if  Bevel4.style=bsraised then  Bevel4.style:=bsLowered
                           else  Bevel4.style:=bsraised;
end;

procedure TFrPrincipal.Label1Click(Sender: TObject);
begin
  cmdmemo.Visible:=false;
  label1.visible:=false;
  label2.visible:=true;
  cmdmemohistorico.Visible:=true;
end;

procedure TFrPrincipal.Label2Click(Sender: TObject);
begin
  cmdmemo.Visible:=true;
  label1.visible:=true;
  label2.visible:=false;

  cmdmemohistorico.Visible:=false;
end;

procedure TFrPrincipal.LimparClick(Sender: TObject);
Begin
  cmdmemo.Clear;
//  edit1.Text := '';
//  edit2.Text := '';

end;

procedure TFrPrincipal.LimparFiacaoClick(Sender: TObject);
var
  f: integer;
Begin
  for f := 1 to lista.Count - 1 do
  Begin
    if minhaclasse(lista.items[f]).Objeto = 'TFio' then
      minhaclasse(lista[f]).Ligado := False;
    if minhaclasse(lista.items[f]).Objeto = 'TTubulacao' then
      minhaclasse(lista[f]).descricaoAD := '';

  end;

end;

procedure TFrPrincipal.ListaProEnter(Sender: TObject);
Begin
  PPGnome := ListaPro.GetActiveRow.Name;

  if minhaclasse(ListaPro.TIObject).Objeto='TTomada' then
    Begin



    end;
  // showmessage(PPGNome);
end;

procedure TFrPrincipal.ListaProExit(Sender: TObject);
Begin
  ListaPro.SaveOnChangeTIObject := True;
end;

procedure TFrPrincipal.ListaProModified(Sender: TObject);
var
  f, r: integer;
  valorL, tipoob: variant;
Begin
   if mg = True then
  Begin
    r := QuestionDlg('Aviso',
      'Ocorrera a mudança deste valor em todos os objetos deste tipo!!! ',
      mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');
    if r = mrYes then
    Begin
      valorL := PegaValorNaLista(ObjetoCorrenteNoGrid, PPGnome);
      tipoob := PegaValorNaLista(ObjetoCorrenteNoGrid, 'Tipo');
      for f := lista.Count - 1 downto 0 do
        if (minhaclasse(lista.items[f]).Tipo = tipoob) then
        Begin
          SetPropValue(lista.items[f], PPGnome, valorL);
        end;
    end;
  end;


  if minhaclasse(listapro.TIObject).Objeto = 'TTela' then
  Begin
    MDmenorx := Ttela(lista.items[0]).Ax;
    MDmenory := Ttela(lista.items[0]).Ay;
    MDmaiorx := Ttela(lista.items[0]).Bx;
    MDmaiory := Ttela(lista.items[0]).By;
    MPT := Ttela(lista.items[0]).MPT;
    MCT := Ttela(lista.items[0]).MCT;
    MCI := Ttela(lista.items[0]).MCI;
    MAI := Ttela(lista.items[0]).MAI;
    MostraIndice := Ttela(lista.items[0]).MI;
    frprincipal.Btztudo.Click;
    end;



end;

procedure TFrPrincipal.GerarCircuitosClick(Sender: TObject);
var
  f, i, g: integer;
  circS: TStringList;
  MaiorCirc: integer;
  NovoCircuito: TCircuito;
  temp: ttreenode;
  existe: boolean;
Begin
   GerarCircuitos.Checked := True;
  MaiorCirc := -1;
  circs := TStringList.Create;
  circs.Sorted := True;
  circs.Duplicates := dupIgnore;
  circs.Delimiter := ';';

  // posicionar a arvore no nó correto
  for i := 0 to arvore.Items.Count - 1 do
    if (arvore.Items.Item[i].Text = 'Circuitos') then
      temp := arvore.Items.Item[i];

  for f := 1 to lista.Count - 1 do
  Begin

    if MinhaClasse(lista[f]).Ligado = False then continue;
    if MinhaClasse(lista[f]).Objeto = 'TTomada' then
    Begin
      circs.Add(IntToStr(TTomada(lista[f]).circuito));
      //  circs.Values[inttostr(TIluminacao(lista[f]).circuito)]:='0';
      // If (( TTomada(lista[f]).circuito)>MaiorCirc) then MaiorCirc:=TTomada(lista[f]).circuito;
    end;
    if MinhaClasse(lista[f]).Objeto = 'TIluminacao' then
    Begin
      circs.Add(IntToStr(TIluminacao(lista[f]).circuito));
      //  circs.Values[inttostr(TIluminacao(lista[f]).circuito)]:='1';
      //    If  TIluminacao(lista[f]).circuito >MaiorCirc then MaiorCirc:=Tiluminacao(lista[f]).circuito;
    end;
  end;
  cmdmemo.lines.add('Número de Circuitos =' + IntToStr(Circs.Count));
  for f := 0 to Circs.Count - 1 do
  Begin
    //showmessage(Circs[f]);
    // Criar Circuitos
    // verificar se o circuito não existe antes de adicionar
    existe := False;
    for g := 1 to lista.Count - 1 do if MinhaClasse(lista[g]).Objeto = 'TCircuito' then
      Begin
        if StrToInt(circs[f]) = TCircuito(lista[g]).tag then
        Begin
          Existe := True;
          //   showmessage(circs[f]+'='+inttostr(TCircuito(lista[g]).tag));
        end;
      end;
    if existe = False then
    Begin
      NovoCircuito := Tcircuito.Create;
      Total := total + 1;
      Inc(MaiorCirc);
      NovoCircuito.tag := StrToInt(circs[f]);
      NovoCircuito.Id_obj := total;
      NovoCircuito.Objeto := 'TCircuito';
      NovoCircuito.Ligado := True;
      NovoCircuito.FCA := 1;
      NovoCircuito.FCT := 1;
      NovoCircuito.TipoAlimentacao := Forca;
      NovoCircuito.Tensao := T220;
      NovoCircuito.Esquema := FN;
      NovoCircuito.tipo := 33;
      NovoCircuito.descricaoAD := 'Circuito ' + circs[f];
      NovoCircuito.descricao := 'Circuito ' + circs[f];
      NovoCircuito.Dfio := 1.5;
      NovoCircuito.Qtensao := 0;
      NovoCircuito.TempAmbiente := 30;
      NovoCircuito.Extensao := 0;
      NovoCircuito.Iprojeto := 0;
      NovoCircuito.Qtensao := 4;
      lista.add(NovoCircuito);
      arvore.Items.AddChild(temp, circs[f]).MakeVisible;
    end;

  end;
  Circs.Destroy;
end;

procedure TFrPrincipal.LerProjetoClick(Sender: TObject);
var
  arquivo: textfile;
  ObjetoTipo: string;
  NovoFio: TFio;
  NovoTubo: TTubulacao;
  NovaLampada: TIluminacao;
  NovoInterruptor: TInterruptor;
  NovoTomada: TTomada;
  NovoCd: TCd;
  NovoCxp: TCxp;
  NovoLinhaDXF: TLinha;
  NovoArco: Tarco;
  NovoCirculo: TCirculo;
  NovoTexto: TTexto;
  NovoArcoS: TArcoS;
  NovoCircuito: TCircuito;
  NovoLayer: TLayer;
  F, G: integer;
  NomeProp: string;
  Valor: string;
  Tipo: string;
  PropValor: variant;
  temp: Ttreenode;
  i: integer;
  nomearquivo : string;
  NovoBloco : TBloco;
NovoAtributo:  TAtributo;
temp1 : Ttreenode;
Begin
  opendialog1.FilterIndex := 1;
  if not opendialog1.Execute then exit;

  f := QuestionDlg('Aviso', 'Todos os dados serão apagados, confirma? ',
    mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');
  if f <> mrYes then exit;

  //frprincipal.MenuItem26Click(LerProjeto);


  // leitura dos objetos..............
  total := 0;
  FrPrincipal.Caption := 'FS_Cad ' + opendialog1.FileName;
  //  assignfile(arquivo, 'objetos.txt');
  assignfile(arquivo, opendialog1.FileName);
  reset(arquivo);
  readln(arquivo,ObjetoTipo);
  if ObjetoTipo<>'Arquivo de projeto do EED' then
    Begin
      showmessage('Formato de arquivo não reconhecido');
      closefile(arquivo);
      exit;
    end;
  while not EOF(arquivo) do
  Begin
    readln(arquivo, ObjetoTipo);
    total := total + 1;
    if objetoTipo = 'TFio' then NovoFio := Tfio.Create;
    if objetoTipo = 'TTubulacao' then NovoTubo := TTubulacao.Create;
    if objetoTipo = 'TIluminacao' then NovaLampada := TIluminacao.Create;
    if objetoTipo = 'TInterruptor' then NovoInterruptor := TInterruptor.Create;
    if objetoTipo = 'TTomada' then NovoTomada := TTomada.Create;
    if objetoTipo = 'TCd' then NovoCd := TCd.Create;
    if objetoTipo = 'TCxp' then NovoCxp := TCxp.Create;
    if objetoTipo = 'TLinha' then NovoLinhaDXF := TLinha.Create;
    if objetoTipo = 'Tarco' then NovoArco := Tarco.Create;
    if objetoTipo = 'TCirculo' then NovoCirculo := TCirculo.Create;
    if objetoTipo = 'TTexto' then NovoTexto := TTexto.Create;
    if objetoTipo = 'TArcoS' then NovoArcoS := TArcoS.Create;
    if objetoTipo = 'TCircuito' then NovoCircuito := TCircuito.Create;
    if upcase(objetoTipo) = upcase('TLayer') then  NovoLayer := TLayer.Create;
    // substituir este for por um while com end of de objeto...
    // evitar falatar ou ter de mais propriedades e dar erro
    readln(arquivo, valor);
    g := StrToInt(valor);
    //if   ObjetoTipo<>'TLinha' then   cmdmemo.lines.add(ObjetoTipo);
    for f := 1 to G do
    Begin
      readln(arquivo, NomeProp);
      readln(arquivo, tipo);
      readln(arquivo, Valor);
      if NomeProp = 'Id_obj' then  if StrToInt(Valor) > total then
          total := StrToInt(Valor);
      if tipo = 'tkInteger' then Propvalor := strtointdef(valor, 0);
      if tipo = 'tkFloat' then Propvalor := strtofloatdef(valor, 0);
      if tipo = 'tkAString' then Propvalor := valor;
      if tipo = 'tkbool' then Propvalor := strtobooldef(valor, True);
      if tipo = 'tkChar' then Propvalor := valor;
      if tipo = 'tkEnumeration' then Propvalor := valor;
      if objetoTipo = 'TFio' then SetPropValue(NovoFio, NomeProp, Propvalor);
      if objetoTipo = 'TTubulacao' then SetPropValue(NovoTubo, NomeProp, Propvalor);
      if objetoTipo = 'TIluminacao' then SetPropValue(NovaLampada, NomeProp, Propvalor);
      if objetoTipo = 'TInterruptor' then
        SetPropValue(NovoInterruptor, NomeProp, Propvalor);
      if objetoTipo = 'TTomada' then SetPropValue(NovoTomada, NomeProp, Propvalor);
      if objetoTipo = 'TCd' then SetPropValue(NovoCd, NomeProp, Propvalor);
      if objetoTipo = 'TCxp' then SetPropValue(NovoCxp, NomeProp, Propvalor);
      if objetoTipo = 'TLinha' then SetPropValue(NovoLinhaDXF, NomeProp, Propvalor);
      if objetoTipo = 'Tarco' then SetPropValue(NovoArco, NomeProp, Propvalor);
      if objetoTipo = 'TCirculo' then SetPropValue(NovoCirculo, NomeProp, Propvalor);
      if objetoTipo = 'TTexto' then SetPropValue(NovoTexto, NomeProp, Propvalor);
      if objetoTipo = 'TArcoS' then SetPropValue(NovoArcoS, NomeProp, Propvalor);
      if objetoTipo = 'TTela' then
        SetPropValue(Ttela(lista.items[0]), NomeProp, Propvalor);
      if objetoTipo = 'TCircuito' then  SetPropValue(NovoCircuito, NomeProp, Propvalor);
      if upcase(objetoTipo) = upcase('TLayer') then
        SetPropValue(NovoLayer, NomeProp, Propvalor);
    end;
    if objetoTipo = 'TFio' then lista.add(NovoFio);
    if objetoTipo = 'TTubulacao' then lista.add(NovoTubo);
    if objetoTipo = 'TIluminacao' then lista.add(NovaLampada);
    if objetoTipo = 'TInterruptor' then lista.add(NovoInterruptor);
    if objetoTipo = 'TTomada' then lista.add(NovoTomada);
    if objetoTipo = 'TCd' then lista.add(NovoCd);
    if objetoTipo = 'TCxp' then lista.add(NovoCxp);
    if objetoTipo = 'TLinha' then lista.add(NovoLinhaDXF);
    if objetoTipo = 'Tarco' then lista.add(NovoArco);
    if objetoTipo = 'TCirculo' then lista.add(NovoCirculo);
    if objetoTipo = 'TTexto' then lista.add(NovoTexto);
    if objetoTipo = 'TArcoS' then lista.add(NovoArcoS);
    if objetoTipo = 'TCircuito' then lista.add(NovoCircuito);
    if upcase(objetoTipo) = upcase('TLayer') then lista.add(NovoLayer);
     // atualizar objetos que realizem calculos ... devido a ordem de entrada dos valores poder ser diferente.
    if objetoTipo = 'Tarco' then NovoArco.atualiza;
    // se não for ttela
   end;// end do while
   closefile(arquivo);
  // temino de ler o arquivo
    // leitura dos blocos..............
 nomearquivo:=opendialog1.FileName;
 nomearquivo:=leftstr(nomearquivo,length(nomearquivo)-3);
 nomearquivo:=nomearquivo+'blc';
  if  FileExists(nomearquivo) then
  Begin
  assignfile(arquivo, nomearquivo);
   reset(arquivo);
  while not EOF(arquivo) do
  Begin
    readln(arquivo, ObjetoTipo);
    total := total + 1;
    if objetoTipo = 'TLinha' then NovoLinhaDXF := TLinha.Create;
    if objetoTipo = 'Tarco' then NovoArco := Tarco.Create;
    if objetoTipo = 'TCirculo' then NovoCirculo := TCirculo.Create;
    if objetoTipo = 'TTexto' then NovoTexto := TTexto.Create;
    if objetoTipo = 'TArcoS' then NovoArcoS := TArcoS.Create;
    if objetoTipo = 'TBloco' then NovoBloco := TBloco.Create;
    if objetoTipo = 'TAtributo' then NovoAtributo := TAtributo.Create;
     readln(arquivo, valor);
    g := StrToInt(valor);
    //if   ObjetoTipo<>'TLinha' then   cmdmemo.lines.add(ObjetoTipo);
    for f := 1 to G do
    Begin
      readln(arquivo, NomeProp);
      readln(arquivo, tipo);
      readln(arquivo, Valor);
      if NomeProp = 'Id_obj' then  if StrToInt(Valor) > total then  total := StrToInt(Valor);
      if tipo = 'tkInteger' then Propvalor := strtointdef(valor, 0);
      if tipo = 'tkFloat' then Propvalor := strtofloatdef(valor, 0);
      if tipo = 'tkAString' then Propvalor := valor;
      if tipo = 'tkbool' then Propvalor := strtobooldef(valor, True);
      if tipo = 'tkChar' then Propvalor := valor;
      if tipo = 'tkEnumeration' then Propvalor := valor;
      if objetoTipo = 'TLinha' then SetPropValue(NovoLinhaDXF, NomeProp, Propvalor);
      if objetoTipo = 'Tarco' then SetPropValue(NovoArco, NomeProp, Propvalor);
      if objetoTipo = 'TCirculo' then SetPropValue(NovoCirculo, NomeProp, Propvalor);
      if objetoTipo = 'TTexto' then SetPropValue(NovoTexto, NomeProp, Propvalor);
      if objetoTipo = 'TArcoS' then SetPropValue(NovoArcoS, NomeProp, Propvalor);
      if objetoTipo = 'TBloco' then SetPropValue(NovoBloco, NomeProp, Propvalor);
      if objetoTipo = 'TAtributo' then SetPropValue(NovoAtributo, NomeProp, Propvalor);
   end;
    if objetoTipo = 'TLinha' then blocos.add(NovoLinhaDXF);
    if objetoTipo = 'Tarco' then blocos.add(NovoArco);
    if objetoTipo = 'TCirculo' then blocos.add(NovoCirculo);
    if objetoTipo = 'TTexto' then blocos.add(NovoTexto);
    if objetoTipo = 'TArcoS' then blocos.add(NovoArcoS);
    if objetoTipo = 'TBloco' then blocos.add(NovoBloco);
    if objetoTipo = 'TAtributo' then blocos.add(NovoAtributo);

   end;// end do while
   closefile(arquivo);
  // temino de ler o arquivo
  end;
 //Coloca na lista sem duplicados
 For f := 0 to lista.Count - 1 do
 Begin
    if upcase(minhaclasse(lista.items[f]).Objeto) = upcase('TLayer') then
    Begin
     lista_de_layers.Add(upcase(tlayer(lista.items[f]).nome));
    end;
  end;
//limpa a arvore
 for f := 0 to frprincipal.arvore.Items.Count - 1 do
if (frprincipal.arvore.Items.Item[f].Text = 'Camadas') then
    Begin
      temp1 := frprincipal.arvore.Items.Item[f];
      temp1.Selected := True;
      while temp1.HasChildren do frprincipal.arvore.Items.Delete(temp1.GetLastChild);
      break;
    end;
  // adiciona os layers
  for f := 0 to Lista_de_layers.Count - 1 do
 Begin
        frprincipal.arvore.Items.AddChild(temp1, Lista_de_layers[f]).MakeVisible;
    end;


  //Coloca na lista sem duplicados
 For f := 0 to Blocos.Count - 1 do
 Begin
    if upcase(minhaclasse(blocos.items[f]).Objeto) = upcase('Tbloco') then
    Begin
     lista_de_blocos.Add(upcase(tlayer(blocos.items[f]).bloco));
    end;
  end;
 //limpa a arvore
 for f := 0 to frprincipal.arvore.Items.Count - 1 do
if (frprincipal.arvore.Items.Item[f].Text = 'Blocos') then
    Begin
      temp1 := frprincipal.arvore.Items.Item[f];
      temp1.Selected := True;
      while temp1.HasChildren do frprincipal.arvore.Items.Delete(temp1.GetLastChild);
      break;
    end;
 // adiciona os layers
  for f := 0 to Lista_de_blocos.Count - 1 do
 Begin
         frprincipal.arvore.Items.AddChild(temp1, Lista_de_blocos[f]).MakeVisible;
    end;

    
  for i := 0 to arvore.Items.Count - 1 do
    if (arvore.Items.Item[i].Text = 'Circuitos') then
      temp := arvore.Items.Item[i];

  for i := 0 to lista.Count - 1 do
  Begin
    if minhaclasse(lista.items[i]).Objeto = 'TCircuito' then
    Begin
      arvore.Items.AddChild(temp, IntToStr(Tcircuito(lista.items[i]).tag)).MakeVisible;
    end;
  end;


  // carregar limite dos desenhos
  MDmenorx := TTela(lista.items[0]).Ax;
  MDmenory := TTela(lista.items[0]).Ay;
  MDmaiorx := TTela(lista.items[0]).Bx;
  MDmaiory := TTela(lista.items[0]).By;
   Gbpanx := 0;
  Gbpany := 0;
  dmenorx := Mdmenorx;
  dmaiorx := Mdmaiorx;
  dmaiory := Mdmaiory;
  dmenory := Mdmenory;
  Canto_inferior_Esquerdo.x:=Mdmenorx;
  Canto_inferior_Esquerdo.y:=Mdmenory;
  Canto_Superior_Direito.x:=Mdmaiorx;
  Canto_Superior_Direito.y:=Mdmaiory;

  SetWindowAndViewPort(Dmenorx, Dmaiorx,Dmenory, Dmaiory, TMenorx,Tmaiorx,Tmenory, TmaiorY);

  frprincipal.Redesenha1Click(nil);
  frprincipal.Redesenha1Click(nil);


end;

procedure TFrPrincipal.MenuItem12Click(Sender: TObject);
var
Temponto : tpoint;
Begin
  Temponto := Mouse.CursorPos;
  temponto := workplace.ScreenToClient(temponto);
  cap_ponto2:=ToWorld(Temponto);
end;

procedure TFrPrincipal.MenuItem13Click(Sender: TObject);
Begin
  btpontoextremo.Click;
end;

procedure TFrPrincipal.MenuItem14Click(Sender: TObject);
Begin
  btpontomeio.Click;
end;

procedure TFrPrincipal.MenuItem15Click(Sender: TObject);
Begin
  BtCentroQuadrante.Click;
end;

procedure TFrPrincipal.CalQuedaTensaoClick(Sender: TObject);
var
  f, g: integer;
  indiceTubo, indiceObjeto, circuito: integer;
  circuitosTubo: TStringList;
  texto, texto2: string;


Begin
  CalQuedaTensao.Checked := not CalQuedaTensao.Checked;
  CircuitosTubo := TStringList.Create;
  CircuitosTubo.Sorted := True;
  CircuitosTubo.Duplicates := dupIgnore;
  CircuitosTubo.Delimiter := ';';
  for f := 0 to lista.Count - 1 do
    if ((minhaClasse(lista.items[f]).Objeto = 'TTubulacao') or
      (minhaClasse(lista.items[f]).Objeto = 'Tarco')) then
    Begin
      if minhaClasse(lista.items[f]).Objeto = 'TTubulacao' then
      Begin
        Ttubulacao(lista.items[f]).descricao := '';
        Ttubulacao(lista.items[f]).descricaoAD := '';
      end;
      if minhaClasse(lista.items[f]).Objeto = 'Tarco' then
      Begin
        Tarco(lista.items[f]).descricao := '';
        Tarco(lista.items[f]).descricaoAD := '';
      end;
    end;
  for f := 0 to lista.Count - 1 do

  Begin
    if minhaClasse(lista.items[f]).Objeto = 'TTomada' then
      TTomada(lista.items[f]).QuedaTensao :=
        Calc_queda(MinhaClasse(lista.items[f]).Id_obj);
    if minhaClasse(lista.items[f]).Objeto = 'TIluminacao' then
      TIluminacao(lista.items[f]).QuedaTensao :=
        Calc_queda(MinhaClasse(lista.items[f]).Id_obj);

  end;

  for f := 0 to lista.Count - 1 do
    if minhaClasse(lista.items[f]).Objeto = 'TFio' then
    Begin
      indiceTubo := Tfio(lista.items[f]).Tubo;
      indiceObjeto := Tfio(lista.items[f]).ObjetoInicial;
      circuito := PegaValorNaLista(indiceObjeto, 'circuito');
      for g := 0 to lista.Count - 1 do
        if minhaClasse(lista.items[g]).Id_obj = indiceTubo then
        Begin
          if Ttubulacao(lista.items[g]).descricao = '' then
            Ttubulacao(lista.items[g]).descricao := IntToStr(circuito)
          else
            Ttubulacao(lista.items[g]).descricao :=
              Ttubulacao(lista.items[g]).descricao + ';' + IntToStr(circuito);
          if Ttubulacao(lista.items[g]).descricaoAD = '' then
            Ttubulacao(lista.items[g]).descricaoAD := IntToStr(indiceObjeto)
          else
            Ttubulacao(lista.items[g]).descricaoAD :=
              Ttubulacao(lista.items[g]).descricaoAD + ';' + IntToStr(indiceObjeto);
        end;
    end;

  // ordenar os circuitos e retirar as duplicatas
  for f := 0 to lista.Count - 1 do
    if ((minhaClasse(lista.items[f]).Objeto = 'TTubulacao') or
      (minhaClasse(lista.items[f]).Objeto = 'Tarco')) then
    Begin
      texto := Ttubulacao(lista.items[f]).descricao;
      CircuitosTubo.DelimitedText := texto;
      Ttubulacao(lista.items[f]).descricao := '';
      texto2 := '';
      for g := 0 to CircuitosTubo.Count - 1 do if texto2 = '' then
          texto2 := CircuitosTubo[g]
        else
          Texto2 := Texto2 + ';' + CircuitosTubo[g];
      Ttubulacao(lista.items[f]).descricao := texto2;
    end;
  CircuitosTubo.Free;

  for g := 0 to lista.Count - 1 do
    if ((minhaClasse(lista.items[g]).Objeto = 'TTomada') or
      (minhaClasse(lista.items[g]).Objeto = 'TIluminacao')) then
    Begin
  //    q1 := TTomada(lista.items[g]).QuedaTensao;
      for f := 0 to lista.Count - 1 do
        if minhaClasse(lista.items[f]).Objeto = 'TCircuito' then
        Begin
          if TCircuito(lista.items[f]).tag = TTomada(lista.items[g]).circuito then
          Begin

            if TTomada(lista.items[g]).QuedaTensao > TCircuito(
              lista.items[f]).Qtensao then
              TCircuito(lista.items[f]).Qtensao := TTomada(lista.items[g]).QuedaTensao;
          end;
          if TCircuito(lista.items[f]).tag = TIluminacao(
            lista.items[g]).circuito then
          Begin

            if TIluminacao(lista.items[g]).QuedaTensao > TCircuito(
              lista.items[f]).Qtensao then TCircuito(lista.items[f]).Qtensao :=
                TIluminacao(lista.items[g]).QuedaTensao;
          end;
        end;

    end;

end;// fim do procedimento




procedure TFrPrincipal.MenuItem18Click(Sender: TObject);
Begin
  MostraIndice := not MostraIndice;
  menuitem18.Checked := MostraIndice;
end;

procedure TFrPrincipal.MenuItem19Click(Sender: TObject);
Begin
  MCt := not MCt;
  menuitem19.Checked := MCt;
end;

procedure TFrPrincipal.MenuItem20Click(Sender: TObject);
Begin
  Mpt := not Mpt;
  menuitem20.Checked := Mpt;
end;

procedure TFrPrincipal.MenuItem21Click(Sender: TObject);
Begin
  MCi := not MCi;
  menuitem21.Checked := MCi;
end;

procedure TFrPrincipal.MenuItem22Click(Sender: TObject);
Begin
  Mai := not Mai;
  menuitem22.Checked := Mai;
end;

procedure TFrPrincipal.MenuItem23Click(Sender: TObject);
var
  a: string;
Begin
  a := inputbox('entre as coordenas, separadas por ";", use ponto decimal', 'xx.xx;yy.yy', '');
end;

procedure TFrPrincipal.CalCorrenteCirClick(Sender: TObject);
var
  a, bb, ddofio,Vt: double;
  b, f, h, j, pw: integer;

Begin
  // a:=strtofloat(inputbox('Corrente','',''));
  // b:=strtoint(inputbox('Modo','4','4'));
  //form6.Show;
  // 7 e o pior caso
  // showmessage(floattostr(tabela36(a,b,1,1)));

  CalCorrenteCir.Checked := not CalCorrenteCir.Checked;
  for h := 0 to lista.Count - 1 do
    if (minhaClasse(lista.items[h]).Objeto = 'TCircuito') then
    Begin
      pw := 0;
      a := 0;
      b := minhaClasse(lista.items[h]).tag;
      for f := 0 to lista.Count - 1 do
        if ((minhaClasse(lista.items[f]).Objeto = 'TTomada') or
          (minhaClasse(lista.items[f]).Objeto = 'TIluminacao')) then
        Begin
          if TTomada(lista.items[f]).circuito = b then
            a := a + TTomada(lista.items[f]).Ip;
          if TIluminacao(lista.items[f]).circuito = b then
            a := a + TIluminacao(lista.items[f]).Ip;
          if TTomada(lista.items[f]).circuito = b then
            pw := pw + TTomada(lista.items[f]).potencia;
          if TIluminacao(lista.items[f]).circuito = b then
            pw := pw + TIluminacao(lista.items[f]).potencia;
        end;

      cmdMemo.Lines.Add('Circuito ' + IntToStr(b) +' Tem a corrente total de projeto ' + floattostrf(a,ffFixed,6,2) + 'A');
      Vt:=(a / (Tcircuito(lista.items[h]).FCA *Tcircuito(lista.items[h]).FCT));
      cmdMemo.Lines.Add('Circuito ' + IntToStr(b) +' Tem a corrente total corrigida ' + floattostrf(Vt,ffFixed,6,2) + 'A');
      cmdMemo.Lines.Add('Circuito ' + IntToStr(b) + ' Usar fiação de ' + floattostr(tabela36(a, 5, bb))+'mm2');
      cmdMemo.Lines.Add('Circuito ' + IntToStr(b) + ' Corrente máxima no cabo ' + floattostr(bb)+'A');
      //a:=a/(Tcircuito(lista.items[h]).FCA*Tcircuito(lista.items[h]).FCT);

      TCircuito(lista.items[h]).Potencia_instalada := pw;
      pw := 0;
      for j := 0 to lista.Count - 1 do
        if ((minhaClasse(lista.items[j]).Objeto = 'TCircuito') and
          (Tcircuito(lista.items[j]).tag = b)) then
        Begin
          Tcircuito(lista.items[j]).Dfio :=
            tabela36(a / (Tcircuito(lista.items[h]).FCA *
            Tcircuito(lista.items[h]).FCT), 5, bb);
          ddofio := tabela36(a / (Tcircuito(lista.items[h]).FCA *
            Tcircuito(lista.items[h]).FCT), 5, bb);
          case Tcircuito(lista.items[j]).TipoAlimentacao of
            Alimentacao: if ddofio < 2.5 then Tcircuito(lista.items[j]).DfioSel := 2.5
              else
                Tcircuito(lista.items[j]).DfioSel := Tcircuito(lista.items[j]).Dfio;
            Iluminacao: if ddofio < 1.5 then Tcircuito(lista.items[j]).DfioSel := 1.5
              else
                Tcircuito(lista.items[j]).DfioSel := Tcircuito(lista.items[j]).Dfio;
            Forca: if ddofio < 2.5 then Tcircuito(lista.items[j]).DfioSel := 2.5
              else
                Tcircuito(lista.items[j]).DfioSel := Tcircuito(lista.items[j]).Dfio;
            Controle: if ddofio < 0.5 then Tcircuito(lista.items[j]).DfioSel := 0.5
              else
                Tcircuito(lista.items[j]).DfioSel := Tcircuito(lista.items[j]).Dfio;
          end;
          Tcircuito(lista.items[j]).Iprojeto := a;
          ddofio := Tcircuito(lista.items[j]).DfioSel;
          if ddofio = 0.5 then  Tcircuito(lista.items[j]).Ifio := 7;
          if ddofio = 1.5 then  Tcircuito(lista.items[j]).Ifio := 15;
          if ddofio = 2.5 then  Tcircuito(lista.items[j]).Ifio := 21;
          if ddofio = 4.0 then  Tcircuito(lista.items[j]).Ifio := 28;
          if ddofio = 6.0 then  Tcircuito(lista.items[j]).Ifio := 41;
          if ddofio = 10 then  Tcircuito(lista.items[j]).Ifio := 50;
          if ddofio = 16 then  Tcircuito(lista.items[j]).Ifio := 68;
        end;

    end;
end;

procedure TFrPrincipal.ExportarDXFClick(Sender: TObject);
var
  arquivo: TDXF2DExport;
Begin
  savedialog1.FilterIndex := 2;
  if savedialog1.Execute then
  Begin
    arquivo := TDXF2DExport.Create(savedialog1.FileName);
    arquivo.WriteDXF;
    arquivo.Free;
  end;
end;

procedure TFrPrincipal.MenuItem24Click(Sender: TObject);
Begin
  Frplanilha.ShowModal;
end;

procedure TFrPrincipal.MenuItem25Click(Sender: TObject);

Begin
  {
  with TTaskDialog.Create(self) do
    try
      Title := 'Confirm removal';
      Caption := 'Confirm';
      Text := 'Remove selected item?';
      CommonButtons := [];
      with TTaskDialogButtonItem(Buttons.Add) do
      Begin
        Caption := 'Remove';
        ModalResult := mrYes;
      end;
      with TTaskDialogButtonItem(Buttons.Add) do
      Begin
        Caption := 'Keep';
        ModalResult := mrNo;
      end;
      MainIcon := tdiQuestion;
      if Execute then
        if ModalResult = mrYes then
          ShowMessage('Item removed');
    finally
      Free;
    end}
  config.Show;
 end;

procedure TFrPrincipal.LimparConteudoClick(Sender: TObject);
var
  f: integer;
  No_temp: Ttreenode;
Begin
                primeiro_elemento :=false;
  //showmessage((sender as Tmenuitem).Name);
  if (Sender as Tmenuitem).Name <> 'MenuItem12' then
  Begin
    f := QuestionDlg('Aviso', 'Todos os dados serão apagados, confirma? ',
      mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');
    if f <> mrYes then exit;
  end;
  FrPrincipal.Caption := 'FS_Cad ';
  for f := lista.Count - 1 downto 1 do lista.Remove(lista.items[f]);
  total := 0;
  frprincipal.workplace.Canvas.Clear;
  DefLayersForm.LayersList.Items.Clear;
  DefLayersForm.ActiveLayerCBox.Items.Clear;
  for f := 0 to arvore.Items.Count - 1 do
    if (arvore.Items.Item[f].Text = 'Circuitos') then
    Begin
      No_temp := arvore.Items.Item[f];
      No_temp.Selected := True;
      while No_temp.HasChildren do arvore.Items.Delete(no_temp.GetLastChild);
      break;
    end;


  for f := 0 to arvore.Items.Count - 1 do if (arvore.Items.Item[f].Text = 'Camadas') then
    Begin
      No_temp := arvore.Items.Item[f];
      No_temp.Selected := True;
      while No_temp.HasChildren do arvore.Items.Delete(no_temp.GetLastChild);
      break;
    end;
  for f := 0 to arvore.Items.Count - 1 do if (arvore.Items.Item[f].Text = 'Blocos') then
    Begin
      No_temp := arvore.Items.Item[f];
      No_temp.Selected := True;
      while No_temp.HasChildren do arvore.Items.Delete(no_temp.GetLastChild);
      break;
    end;
   TTela(Lista[0]).Ultima_Letra_Interruptor := 'a';
  TTela(Lista[0]).Ultima_potencia_Tomada := 150;
  TTela(Lista[0]).Ultimo_Circuito_Usado_interruptor := 1;
  TTela(Lista[0]).Ultimo_Circuito_Usado_tomada := 2;
  Layers.Clear;
   for f := blocos.Count - 1 downto 1 do blocos.Remove(blocos.items[f]);

  total:=0;
end;

procedure TFrPrincipal.MenuItem27Click(Sender: TObject);
Begin
  DefLayersForm.Show;
end;

procedure TFrPrincipal.ExportarPDFClick(Sender: TObject);
Begin
  savedialog1.FilterIndex := 3;
  if savedialog1.Execute then config.Button1Click(nil);
  cmdmemo.Lines.add('PDF da visualização corrente gerado');
  Process1.CommandLine:= 'SumatraPDF teste.pdf';
  Process1.Execute;
end;

procedure TFrPrincipal.MenuItem28Click(Sender: TObject);
Begin
  Showmessage('EED - Easy Eletric Design escrito por Fabricio Semonetti em Lazarus Free Pascal');
end;



procedure TFrPrincipal.MenuItem2Click(Sender: TObject);

Begin
  BtApaga.Click;
end;

procedure TFrPrincipal.CalcCorrenteTomIluClick(Sender: TObject);
var
  f: integer;
Begin
  CalcCorrenteTomIlu.Checked := not CalcCorrenteTomIlu.Checked;
  for f := 0 to lista.Count - 1 do
  Begin
    if (minhaClasse(lista.items[f]).Objeto = 'TTomada') then
      Ttomada(lista.items[f]).calculos;
    if (minhaClasse(lista.items[f]).Objeto = 'TIluminacao') then
      TIluminacao(lista.items[f]).calculos;
   end;
  cmdMemo.Lines.Add('Corrente de projeto de tomadas e lampadas calculadas');

end;

procedure TFrPrincipal.MenuItem4Click(Sender: TObject);
Begin
  config.Show;
end;

procedure TFrPrincipal.MenuItem5Click(Sender: TObject);

Begin
  GerarCircuitos.Checked := False;
  ccircuitos.Checked := False;
  CalCorrenteCir.Checked := False;
  CalQuedaTensao.Checked := False;
  CalcCorrenteTomIlu.Checked := False;
  cfiacao.Checked := False;


  {  Lista_circuitos:=TStringList.Create;
   Lista_circuitos.Sorted:=True;
   Lista_circuitos.Duplicates:=dupIgnore;
   Lista_circuitos.Delimiter:=';';
   Lista_circuitos.DelimitedText:=Ttubulacao(PrObjeto).descricao;



   for f := 0 to lista.Count - 1 do
     Begin





     end;

   Lista_circuitos.Destroy;}
end;

procedure TFrPrincipal.MenuItem6Click(Sender: TObject);
Begin
  FrCircuitos.ShowModal;
end;

procedure TFrPrincipal.GravarProjetoClick(Sender: TObject);

Begin
  //  r := QuestionDlg('Aviso',
  //    'O arquivo anterior sera substituido, confirma? ',
  //    mtInformation, [mrYes, 'Sim', mrNo, 'Não'], '');

  //  if r = mrYes then if savedialog1.Execute then  Salva_circuito(savedialog1);
  savedialog1.FilterIndex := 1;
  if savedialog1.Execute then  Salva_circuito(savedialog1);
end;

procedure TFrPrincipal.MenuItem7Click(Sender: TObject);
var
  Temponto : tpoint;
Begin
  Temponto := Mouse.CursorPos;
  temponto := workplace.ScreenToClient(temponto);
  cap_ponto1:=ToWorld(Temponto);


end;

procedure TFrPrincipal.Panel3Click(Sender: TObject);
begin

end;

procedure TFrPrincipal.ListComponentProperties(Component: TComponent;
  Strings: TStrings);
var
  Count, Size, I: integer;
  List: PPropList;
  PropInfo: PPropInfo;
  PropOrEvent, PropValue: string;
Begin
  Count := GetPropList(Component.ClassInfo, tkAny, nil);
  Size := Count * SizeOf(Pointer);
  GetMem(List, Size);
  try
    Count := GetPropList(Component.ClassInfo, tkAny, List);
    for I := 0 to Count - 1 do
    Begin
      PropInfo := List^[I];
      if PropInfo^.PropType^.Kind in tkMethods then
        PropOrEvent := 'Event'
      else
        PropOrEvent := 'Property';
      PropValue := VarToStr(GetPropValue(Component, PropInfo^.Name));
      Strings.Add(Format('[%s] %s: %s = %s', [PropOrEvent, PropInfo^.Name,
        PropInfo^.PropType^.Name, PropValue]));
    end;
  finally
    FreeMem(List);
  end;
end;




// inicialização da unit
Begin


end.










