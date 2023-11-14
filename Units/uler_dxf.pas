unit Uler_dxf;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses SysUtils, conver, Dialogs, UObjetos,
  Classes, Contnrs, typinfo, variants, Uclasse_base, fileutil, laz.VirtualTrees, ComCtrls;

const
  nenhum = 0;
  pilar = 1;
  inter = 2;
  linha_dxf = 3;
  Arco = 4;
  circulo = 5;
  texto = 6;
  capturar_ponto = 7;
  glip = 8;
  Zoom_janela = 9;
  apaga_ponto = 10;
  apaga_barra = 11;
  end_point = 12;
  mid_point = 13;
  duas = 14;
  move_desenho = 15;
  ponto = 16;
  tubulacao = 17;
  Ponto_Zero = 18;
  Ponto_iluminacao = 19;
  tubulacaoReta = 20;
  centro_retangulo = 21;
  interruptor = 22;
  tomada = 23;
  CoLigarEletrodutos = 24;
  CoLigarEletrodutosArea = 25;
  CoEditaElemento = 26;
  CaixaDisjuntores = 27;
  Caminhos = 28;
  Fio = 29;
  CxPassagem = 30;
  MoverFio = 31;
  ArcoDxf = 32;
  Circuito = 33;
  Simbolo = 34;
  Fiacao = 35;
  BtBezier = 36;
  BtApagaAreaSelecionada = 37;
  Layer = 38;
  JanelaSelecionar = 39;
  bloco = 40;
  Atributo = 41;
  bloco_insercao = 42;
  Atributo_insercao = 43;
  MoverArco = 44;
  mover = 45;

type
  OBJETOS = ^OBJTS;
    OBJTS = record
    INDICE: integer;
    TIPO: integer;
    Modelo: integer;
    circuito: integer;
    AcionamentoAcionador: integer;
    ObjetoInicial: integer;
    ObjetoFinal: integer;
    Tubulacao: integer;
    acionamentoAcionado: integer;
    LAYER: integer;
    ax: double;
    bx: double;
    cx: double;
    dx: double;
    ay: double;
    by: double;
    cy: double;
    dy: double;
    AnguloRotacao: double;
    AnguloInicial: double;
    AnguloFinal: double;
    RAIO: double;
    altura: double;
    Potencia: double;
    APAGADO: boolean;
    TEXTO: string;
    PROXIMO: OBJETOS;
  end;

// aqui vou criar as classses do objetos que vou armazenar no tlist e no BD
procedure Adiciona(dados: entidade; incrementar: boolean; Eobjeto: boolean;  Bloco_Nome: string);
procedure carrega_dxf(dxf: string);
function Comando_para_texto(indice: integer): string;
function Limpar_entidade: entidade;
var
  total: longint;
  lista, Blocos: TObjectList;
  ObjetoSelecionado: integer;
  Linha1, Linha2: Tlinha;
//  InHalt: boolean;
  primeiro_elemento : boolean;
  Lista_de_layers,Lista_de_blocos : Tstringlist;

implementation

uses principal;




function Limpar_entidade: entidade;

Begin
  Limpar_entidade.INDICE := -1;
  Limpar_entidade.definicaoDeBloco:=false;
  Limpar_entidade.TIPO := -1;
  Limpar_entidade.Modelo := -1;
  Limpar_entidade.circuito := -1;
  Limpar_entidade.AcionamentoAcionador := -1;
  Limpar_entidade.ObjetoInicial := -1;
  Limpar_entidade.ObjetoFinal := -1;
  Limpar_entidade.Tubulacao := -1;
  Limpar_entidade.acionamentoAcionado := -1;
  Limpar_entidade.LAYER := -1;
  Limpar_entidade.ax := 0;
  Limpar_entidade.bx := 0;
  Limpar_entidade.cx := 0;
  Limpar_entidade.dx := 0;
  Limpar_entidade.ay := 0;
  Limpar_entidade.by := 0;
  Limpar_entidade.cy := 0;
  Limpar_entidade.dy := 0;
  Limpar_entidade.AnguloRotacao := 0;
  Limpar_entidade.AnguloInicial := 0;
  Limpar_entidade.AnguloFinal := 0;
  Limpar_entidade.RAIO := 0;
  Limpar_entidade.altura := 0;
  Limpar_entidade.APAGADO := False;
  Limpar_entidade.potencia := 0;
  Limpar_entidade.pai := -1;
  Limpar_entidade.TEXTO := '';
  Limpar_entidade.campo := '';
  Limpar_entidade.Bloco := '';
  Limpar_entidade.AtributoBloco:=false;
  Limpar_entidade.pai:=-1;
end;



function Comando_para_texto(indice: integer): string;
Begin
  Result := 'Não encontrado';

  case indice of

    0: Result := 'nenhum';
    01: Result := 'pilar';
    02: Result := 'inter';
    03: Result := 'linha_dxf';
    04: Result := 'Arco';
    05: Result := 'circulo';
    06: Result := 'texto';
    07: Result := 'capturar_ponto';
    08: Result := 'glip';
    09: Result := 'Zoom_janela';
    010: Result := 'apaga_ponto';
    011: Result := 'apaga_barra';
    012: Result := 'end_point';
    013: Result := 'mid_point';
    014: Result := 'duas';
    015: Result := 'move_desenho';
    016: Result := 'ponto';
    017: Result := 'tubulacao';
    018: Result := 'Ponto_Zero';
    019: Result := 'Ponto_iluminacao';
    020: Result := 'tubulacaoReta';
    021: Result := 'centro_retangulo';
    022: Result := 'interruptor';
    023: Result := 'tomada';
    024: Result := 'CoLigarEletrodutos';
    025: Result := 'CoLigarEletrodutosArea';
    026: Result := 'CoEditaElemento';
    027: Result := 'CaixaDisjuntores';
    028: Result := 'Caminhos';
    029: Result := 'Fio';
    030: Result := 'CxPassagem';
    031: Result := 'MoverFio';
  end;

end;
function strtoreal(s: string): double;
var
  a: double;
  erro: integer;
Begin
  val(s, a, erro);
  strtoreal := a;
end;

function StrToInt(s: string): integer;
var
  a: integer;
  erro: integer;
Begin
  val(s, a, erro);
  StrToInt := a;
end;


procedure adiciona(dados: entidade; Incrementar: boolean;
  Eobjeto: boolean; Bloco_Nome: string);
var
  registro: minhaclasse;
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
  NovoCircuito: Tcircuito;
  NovoFiacao: Tfiacao;
  NovoLayer: Tlayer;
  NovoBloco: Tbloco;
  NovoAtributo: TAtributo;
  i: integer;
Begin
  Inc(total);
  dados.indice := total;

  if ((dados.TIPO = bloco)OR (dados.TIPO = bloco_INSERCAO)) then
  Begin
    NovoBloco := Tbloco.Create;
    NovoBloco.Bloco := dados.bloco;
    NovoBloco.Nome:=dados.texto;
    NovoBloco.px := dados.ax;
    NovoBloco.py := dados.ay;
    NovoBloco.Id_obj := dados.indice;
    NovoBloco.Tipo := dados.TIPO;
    NovoBloco.Angulo := dados.AnguloRotacao;
    NovoBloco.Escala:=dados.bx;
    NovoBloco.ligado := True;
    NovoBloco.objeto := 'TBloco';
    NovoBloco.layer := dados.LAYER;
    NovoBloco.Selecionado:=dados.selecionado;
    NovoBloco.Definicao:=dados.definicaoDeBloco;
    Blocos.add(NovoBloco);
  end;
  if dados.TIPO = linha_dxf then
  Begin
    NovoLinhaDXF := TLinha.Create;
    NovoLinhaDXF.Bloco := dados.bloco;
    NovoLinhaDXF.Id_obj := dados.indice;
    NovoLinhaDXF.Tipo := dados.TIPO;
    NovoLinhaDXF.Ax := dados.ax;
    NovoLinhaDXF.Ay := dados.ay;
    NovoLinhaDXF.Bx := dados.bx;
    NovoLinhaDXF.By := dados.by;
    NovoLinhaDXF.Angulo := dados.AnguloRotacao;
    NovoLinhaDXF.ligado := True;
    NovoLinhaDXF.objeto := 'TLinha';
    NovoLinhaDXF.layer := dados.LAYER;
    NovoLinhaDXF.Pai := dados.pai;
    NovoLinhaDXF.LayerName := dados.LayerName;
    NovoLinhaDXF.Bloco := dados.Bloco;
    NovoLinhaDXF.Selecionado:=Dados.selecionado;
    if Eobjeto = False then  lista.add(NovoLinhaDXF)
    else
      Blocos.add(NovoLinhaDXF);
  end;

  if ((dados.TIPO = Arco) or ((dados.TIPO = 32))) then
  Begin
    NovoArco := Tarco.Create;
    NovoArco.Id_obj := dados.indice;
    NovoArco.Tipo := dados.TIPO;
    NovoArco.AnguloInicial := dados.AnguloInicial;
    NovoArco.AnguloFinal := dados.AnguloFinal;
    NovoArco.Raio := dados.RAIO;
    NovoArco.Angulo := dados.AnguloRotacao;
    NovoArco.ObjIni := dados.ObjetoInicial;
    NovoArco.ObjFin := dados.ObjetoFinal;
    NovoArco.Px := dados.ax;
    NovoArco.Py := dados.ay;
    NovoArco.ligado := True;
    NovoArco.objeto := 'Tarco';
    NovoArco.Bloco := dados.Bloco;
    NovoArco.Pai := dados.pai;
    NovoArco.LayerName := dados.LayerName;
    NovoArco.Selecionado:=Dados.selecionado;
    if Eobjeto = False then  lista.add(NovoArco)
    else
      Blocos.add(NovoArco);
    Inc(total);
    dados.indice := total;
    NovoFiacao := Tfiacao.Create;
    NovoFiacao.Id_obj := Dados.INDICE;
    NovoFiacao.objeto := 'Tfiacao';
    NovoFiacao.Circuito2 := 0;
    NovoFiacao.Circuito3 := 0;
    NovoFiacao.Circuito4 := 0;
    NovoFiacao.Circuito5 := 0;
    NovoFiacao.Ta := False;
    NovoFiacao.TextoAuto := '';
    NovoFiacao.TextoManual := '';
    NovoFiacao.Tsize := 0;
    NovoFiacao.Tubo := total - 1;
    NovoFiacao.x := 0;
    NovoFiacao.y := 0;
    NovoFiacao.Selecionado:=Dados.selecionado;
    if Eobjeto = False then  lista.add(NovoFiacao);
    end;

  if dados.TIPO = circulo then
  Begin
    NovoCirculo := TCirculo.Create;
    NovoCirculo.Id_obj := dados.indice;
    NovoCirculo.Tipo := dados.TIPO;
    NovoCirculo.Px := dados.ax;
    NovoCirculo.Py := dados.ay;
    NovoCirculo.Raio := dados.RAIO;
    NovoCirculo.Angulo := dados.AnguloRotacao;
    NovoCirculo.ligado := True;
    NovoCirculo.objeto := 'TCirculo';
    NovoCirculo.Bloco := dados.bloco;
    NovoCirculo.pai := dados.pai;
    NovoCirculo.LayerName := dados.LayerName;
    NovoCirculo.Selecionado:=Dados.selecionado;
    if Eobjeto = False then  lista.add(NovoCirculo)
    else
      Blocos.add(NovoCirculo);
  end;

  if dados.TIPO = texto then
  Begin
    NovoTexto := TTexto.Create;
    NovoTexto.Id_obj := dados.indice;
    NovoTexto.Tipo := dados.TIPO;
    NovoTexto.Px := dados.ax;
    NovoTexto.Py := dados.ay;
    NovoTexto.angulo := dados.by;
    Novotexto.tamanho := dados.bx;
    NovoTexto.descricao := dados.TEXTO;
    NovoTexto.ligado := True;
    NovoTexto.objeto := 'TTexto';
    NovoTexto.Bloco := dados.bloco;
    NovoTexto.pai := dados.pai;
    NovoTexto.LayerName := dados.LayerName;
    NovoTexto.Selecionado:=Dados.selecionado;

    if Eobjeto = False then  lista.add(Novotexto)
    else
      Blocos.add(Novotexto);
  end;


  if (dados.TIPO = Atributo) then
  Begin
    NovoAtributo := TAtributo.Create;
    NovoAtributo.Px := dados.ax;
    NovoAtributo.Py := dados.ay;
    NovoAtributo.angulo := dados.AnguloRotacao;
    NovoAtributo.Tipo := dados.tipo;
    NovoAtributo.Id_obj := dados.indice;
    NovoAtributo.Objeto := 'TAtributo';
    NovoAtributo.Ligado := True;
    NovoAtributo.tamanho:=dados.altura;
    NovoAtributo.Bloco := dados.Bloco;
    NovoAtributo.Selecionado:=dados.selecionado;
    NovoAtributo.descricao:=dados.descricao;
    NovoAtributo.campo:=dados.campo;
    NovoAtributo.Valor:=dados.texto;
    NovoAtributo.Definicao:=round(dados.bx);
    NovoAtributo.LayerName := dados.LayerName;
    NovoAtributo.Pai:=dados.pai;
    Blocos.add(NovoAtributo);
  end;


    
  if (dados.TIPO = Atributo_INSERCAO) then
  Begin
    NovoAtributo := TAtributo.Create;
    NovoAtributo.Px := dados.ax;
    NovoAtributo.Py := dados.ay;
    NovoAtributo.angulo := dados.AnguloRotacao;
    NovoAtributo.Tipo := dados.tipo;
    NovoAtributo.Id_obj := dados.indice;
    NovoAtributo.Objeto := 'TAtributo';
    NovoAtributo.Ligado := True;
    NovoAtributo.tamanho:=dados.altura;
    NovoAtributo.Bloco := dados.Bloco;
    NovoAtributo.Selecionado:=dados.selecionado;
    NovoAtributo.descricao:=dados.descricao;
    NovoAtributo.campo:=dados.campo;
    NovoAtributo.Valor:=dados.texto;
    NovoAtributo.Definicao:=round(dados.bx);
    NovoAtributo.LayerName := dados.LayerName;
    NovoAtributo.Pai:=dados.pai;
    Blocos.add(NovoAtributo);
  end;



  if dados.Tipo = Fio then
  Begin
    NovoFio := TFio.Create;
    // preciso do tubo que ele pertence e do objeto inicial
    NovoFio.Id_obj := dados.INDICE;
    NovoFio.Tubo := dados.Tubulacao;
    NovoFio.ObjetoInicial := dados.ObjetoInicial;
    NovoFio.Tipo := Fio;
    NovoFio.Angulo := dados.AnguloRotacao;
    NovoFio.ligado := True;
    NovoFio.objeto := 'TFio';
    NovoFio.Selecionado:=Dados.selecionado;
      lista.add(NovoFio)
    end;
  if dados.Tipo = tubulacao then
  Begin
    NovoTubo := TTubulacao.Create;
    NovoTubo.ObjIni := Dados.ObjetoInicial;
    NovoTubo.ObjIni_X := Dados.Bx;
    NovoTubo.ObjIni_Y := Dados.By;
    NovoTubo.ObjFin := Dados.ObjetoFinal;
    NovoTubo.ObjFin_X := Dados.Cx;
    NovoTubo.ObjFin_Y := Dados.CY;
    NovoTubo.Diametro := 1.8;
    NovoTubo.Comprimento := sqr((dados.bx - dados.cx) * (dados.bx - dados.cx) +
      (dados.by - dados.cy) * (dados.by - dados.cy));
    NovoTubo.Id_obj := Dados.INDICE;
    NovoTubo.Tipo := Dados.TIPO;
    NovoTubo.Angulo := dados.AnguloRotacao;
    NovoTubo.ligado := True;
    NovoTubo.objeto := 'TTubulacao';
    NovoTubo.Selecionado:=Dados.selecionado;
   lista.add(NovoTubo);
    FrPrincipal.ListaPro.TIObject := TComponent(NovoTubo);
    // dados para escrevr no tubo
    Inc(total);
    dados.indice := total;
    NovoFiacao := Tfiacao.Create;
    NovoFiacao.Id_obj := Dados.INDICE;
    NovoFiacao.objeto := 'TFiacao';
    NovoFiacao.Circuito2 := 0;
    NovoFiacao.Circuito3 := 0;
    NovoFiacao.Circuito4 := 0;
    NovoFiacao.Circuito5 := 0;
    NovoFiacao.Ta := False;
    NovoFiacao.TextoAuto := '';
    NovoFiacao.TextoManual := '';
    NovoFiacao.Tsize := 0;
    NovoFiacao.Tubo := total - 1;
    NovoFiacao.x := 0;
    NovoFiacao.y := 0;
    NovoFiacao.Selecionado:=Dados.selecionado;
    lista.add(NovoFiacao)


  end;
  if dados.Tipo = Ponto_iluminacao then
  Begin
    NovaLampada := TIluminacao.Create;
    NovaLampada.Tipo := Dados.tipo;
    NovaLampada.Id_obj := Dados.INDICE;
    NovaLampada.Potencia := 50;
    NovaLampada.FP := 1;
    NovaLampada.rendimento := 1;
    NovaLampada.tensao := 220;
    NovaLampada.acionamento := Ttela(lista.items[0]).Ultima_Letra_Interruptor;
    NovaLampada.circuito := Ttela(lista.items[0]).Ultimo_Circuito_Usado_interruptor;
    NovaLampada.Px := dados.ax;
    NovaLampada.Py := dados.ay;
    NovaLampada.Angulo := dados.AnguloRotacao;
    NovaLampada.ligado := True;
    NovaLampada.objeto := 'TIluminacao';
    NovaLampada.Nf := 2;
    NovaLampada.Selecionado:=Dados.selecionado;
    lista.add(NovaLampada);
     FrPrincipal.ListaPro.TIObject := TComponent(NovaLampada);
  end;

  if dados.Tipo = interruptor then
  Begin
    NovoInterruptor := TInterruptor.Create;
    NovoInterruptor.Tipo := Dados.tipo;
    NovoInterruptor.Id_obj := Dados.INDICE;
    NovoInterruptor.Potencia := round(Dados.Potencia);
    NovoInterruptor.acionamento := Ttela(lista.items[0]).Ultima_Letra_Interruptor;
    NovoInterruptor.circuito := Ttela(lista.items[0]).Ultimo_Circuito_Usado_interruptor;
    NovoInterruptor.Px := dados.ax;
    NovoInterruptor.Py := dados.ay;
    NovoInterruptor.Angulo := dados.AnguloRotacao;
    NovoInterruptor.ligado := True;
    NovoInterruptor.objeto := 'TInterruptor';
    NovoInterruptor.Selecionado:=Dados.selecionado;
   lista.add(NovoInterruptor) ;
    FrPrincipal.ListaPro.TIObject := TComponent(NovoInterruptor);
  end;
  if dados.Tipo = tomada then
  Begin
    NovoTomada := TTomada.Create;
    NovoTomada.Tipo := Dados.tipo;
    NovoTomada.Id_obj := Dados.INDICE;
    NovoTomada.Potencia := round(Dados.Potencia);
    NovoTomada.Px := dados.ax;
    NovoTomada.py := dados.ay;
    NovoTomada.circuito := Ttela(lista.items[0]).Ultimo_Circuito_Usado_tomada;
    NovoTomada.potencia := round(Ttela(lista.items[0]).Ultima_potencia_Tomada);
    NovoTomada.Angulo := dados.AnguloRotacao;
    NovoTomada.ligado := True;
    NovoTomada.Objeto := 'TTomada';
    NovoTomada.FP := 1;
    NovoTomada.Tensao := 220;
    NovoTomada.rendimento := 1;
    NovoTomada.Nf := 2;
    NovoTomada.Selecionado:=Dados.selecionado;
   lista.add(NovoTomada) ;
    FrPrincipal.ListaPro.TIObject := TComponent(NovoTomada);
  end;
  if dados.Tipo = CaixaDisjuntores then
  Begin
    NovoCd := TCd.Create;
    NovoCd.Tipo := Dados.tipo;
    NovoCd.Px := Dados.ax;
    NovoCd.Py := Dados.ay;
    NovoCd.Id_obj := Dados.INDICE;
    NovoCD.Angulo := dados.AnguloRotacao;
    NovoCD.ligado := True;
    NovoCD.Selecionado:=Dados.selecionado;
    NovoCD.Objeto := 'TCd';
    lista.add(NovoCd);
     FrPrincipal.ListaPro.TIObject := TComponent(NovoCd);
  end;
  if dados.Tipo = CxPassagem then
  Begin
    NovoCxp := TCxp.Create;
    NovoCxp.Tipo := Dados.tipo;
    NovoCxp.Px := Dados.ax;
    NovoCxp.Py := Dados.ay;
    NovoCxp.Id_obj := Dados.INDICE;
    NovoCxp.Angulo := dados.AnguloRotacao;
    NovoCxp.ligado := True;
    NovoCxp.objeto := 'TCxp';
    NovoCxp.Selecionado:=Dados.selecionado;
    lista.add(NovoCxp) ;
      FrPrincipal.ListaPro.TIObject := TComponent(NovoCxp);
  end;
  if dados.Tipo = Circuito then
  Begin
    NovoCircuito := Tcircuito.Create;
    NovoCircuito.Id_obj := Dados.INDICE;
    NovoCircuito.objeto := 'TCircuito';
    NovoCircuito.Selecionado:=Dados.selecionado;
      lista.add(NovoCircuito)
     end;

  if dados.Tipo = Layer then
  Begin
    for i := 1 to lista.Count - 1 do
      if minhaclasse(lista.items[i]).tipo = 38 then
     if tlayer(lista.items[i]).Nome = dados.TEXTO then exit;
    NovoLayer := TLayer.Create;
    NovoLayer.Id_obj := Dados.INDICE;
    NovoLayer.objeto := 'TLayer';
    NovoLayer.tipo := Dados.tipo;
    NovoLayer.nome := dados.TEXTO;
    NovoLayer.layer := dados.LAYER;
    NovoLayer.cor:=dados.cor;
    NovoLayer.Selecionado:=Dados.selecionado;
    NovoLayer.Ligado := True;
   lista.add(NovoLayer)
     end;

end;

procedure carrega_dxf(dxf: string);

var
  arq: Text;
  secao, ultimo_objeto,Bloco_Nome: string;
  temp: entidade;
  GroupCode, GroupValor,Last_GroupCode, Last_GroupValor: string;
  simb: TSimbolo;
  temp1: Ttreenode;
  ContaLinha: double;
  f, ultimo_bloco: integer;
  Arquivo,entrada : TStringList;
  Foi_lido_uma_entidade : Boolean;
  primeiro_elemento : boolean;
  log : textfile;
  TextoSaida,codepage,AcadVersao : string;

  function entre(valor, menor, maior: double): boolean;
  Begin
    Result := False;
    if ((menor < valor) and (valor < maior)) then Result := True;
  end;
  procedure ler;
  Begin
    Last_GroupCode:=GroupCode;
    Last_GroupValor:=GroupValor;
    readln(arq, GroupCode);
    readln(arq, GroupValor);
    ContaLinha := ContaLinha + 2;
   end;
  procedure Ler_texto;
  Begin
      Foi_lido_uma_entidade:=false;
    Temp.by := 0;
    repeat
      case StrToInt(GroupCode) of
        1:Begin

          TEMP.texto :=AnsiString(GroupValor);
          end;
        8: Begin
          temp.LAYER := Layers.IndexOf(GroupValor) - 1;
          temp.LayerName := GroupValor;
        end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
        40: TEMP.bx := int(strtoreal(GroupValor) * 1000) / 1000;
        50: Temp.by := int(strtoreal(GroupValor) * 1000) / 1000;
      end;
    Ler;
    until ((StrToInt(GroupCode) = 0) or EOF(arq));
    temp.tipo := 6;
    temp.pai := ultimo_bloco;
    temp.indice := total;
    temp.apagado := False;
    temp.Bloco := Bloco_nome;
     temp.selecionado:=true;

      if  Secao= 'Blocos' then    adiciona(temp, True, True, dxf)
                       else    adiciona(temp, True, False, '');
     Foi_lido_uma_entidade:=true;
       if (Secao = 'Entidades')  then
    Begin
      if TEMP.ax < Canto_Inferior_Esquerdo.x then Canto_Inferior_Esquerdo.x := TEMP.ax;
      if TEMP.ay < Canto_Inferior_Esquerdo.y then Canto_Inferior_Esquerdo.y := TEMP.ay;
      if TEMP.ax > Canto_Superior_Direito.x then Canto_Superior_Direito.x := TEMP.ax;
      if TEMP.ay > Canto_Superior_Direito.y then Canto_Superior_Direito.y := TEMP.ay;
    end;
    temp := limpar_entidade;

  end;
  procedure Ler_atributo_definicao;
  Begin
      Foi_lido_uma_entidade:=false;
    Temp.by := 0;
    temp := limpar_entidade;
    repeat
      case StrToInt(GroupCode) of
        1: TEMP.valor := GroupValor; // Valor da propriedade
        2: Temp.descricao := GroupValor;  //descricao  da propriedade
        3 : temp.campo:=GroupValor;  //propriedade
        8: Begin
          temp.LAYER := Layers.IndexOf(GroupValor) - 1;
          temp.LayerName := GroupValor;
        end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
        40: TEMP.altura := int(strtoreal(GroupValor) * 1000) / 1000;
        50: Temp.by := int(strtoreal(GroupValor) * 1000) / 1000;
        70: temp.bx := int(strtoreal(GroupValor));
      end;
     Ler;
    until ((StrToInt(GroupCode) = 0) or EOF(arq));
    temp.tipo := 41;
    temp.indice := total;
    temp.pai := -1;
    temp.apagado := False;
    temp.bloco := Bloco_nome;
           temp.selecionado:=true;
       if  Secao= 'Blocos' then    adiciona(temp, True, True, dxf)
                           else    adiciona(temp, True, False, '');
       temp := limpar_entidade;
        Foi_lido_uma_entidade:=true;
  end;
  procedure Ler_atributo_Valor(Bloco_nome_interno:string);
  Begin
    Foi_lido_uma_entidade:=false;
    Temp.by := 0;
    temp := limpar_entidade;
    repeat
      case StrToInt(GroupCode) of
        1: TEMP.texto := GroupValor;
        2: Temp.campo := GroupValor;
        8: Begin
          temp.LAYER := Layers.IndexOf(GroupValor) - 1;
          temp.LayerName := GroupValor;
        end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
        40: TEMP.altura := int(strtoreal(GroupValor) * 1000) / 1000;
        50: Temp.by := int(strtoreal(GroupValor) * 1000) / 1000;
        70: temp.bx := int(strtoreal(GroupValor));
      end;
     Ler;
    until ((StrToInt(GroupCode) = 0) or EOF(arq));
    temp.tipo := 43;
    temp.indice := total;
    temp.pai := ultimo_bloco;
    temp.apagado := False;
    temp.bloco := Bloco_nome_interno;
    temp.selecionado:=true;
    adiciona(temp, True, True, dxf);
    Foi_lido_uma_entidade:=true;
  end;
  procedure Ler_linha;
  Begin
    Foi_lido_uma_entidade:=false;
    repeat
      case StrToInt(GroupCode) of
        8: Begin
          temp.LAYER := Layers.IndexOf(GroupValor) - 1;
          temp.LayerName := GroupValor;
         end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000000) / 1000000;
        11: TEMP.bx := DX + int(strtoreal(GroupValor) * 1000000) / 1000000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000000) / 1000000;
        21: TEMP.by := DY + int(strtoreal(GroupValor) * 1000000) / 1000000;
      end;
      ler;
      until ((StrToInt(GroupCode) = 0) or EOF(arq));
    temp.tipo := 3;
    temp.indice := total;
    temp.apagado := False;
    temp.pai := ultimo_bloco;
    temp.Bloco:=Bloco_nome;
    temp.selecionado:=true;
   if Secao = 'Blocos' then  adiciona(temp, True, True, dxf);
    if Secao = 'Entidades' then
    Begin
    adiciona(temp, True, False, '');
   // L -10,0 10,0
    TextoSaida:='L '+floattostr(round(temp.ax*100))+','+floattostr(round(temp.ay*100))+' '+floattostr(round(temp.bx*100))+','+floattostr(round(temp.by*100));
    writeln(log,TextoSaida);

    end;

    if primeiro_elemento=false then
    Begin
    Canto_Inferior_Esquerdo.x := TEMP.ax;
    Canto_Inferior_Esquerdo.y := TEMP.ay;
    Canto_Superior_Direito.x := TEMP.bx;
    Canto_Superior_Direito.y := TEMP.by;
     primeiro_elemento:=true;
    end;


    if (Secao = 'Entidades') then
    Begin
      if TEMP.ax < Canto_Inferior_Esquerdo.x then Canto_Inferior_Esquerdo.x := TEMP.ax;
      if TEMP.ay < Canto_Inferior_Esquerdo.y then Canto_Inferior_Esquerdo.y := TEMP.ay;
      if TEMP.ax > Canto_Superior_Direito.x then Canto_Superior_Direito.x := TEMP.ax;
      if TEMP.ay > Canto_Superior_Direito.y then Canto_Superior_Direito.y := TEMP.ay;
      if TEMP.bx < Canto_Inferior_Esquerdo.x then Canto_Inferior_Esquerdo.x := TEMP.bx;
      if TEMP.by < Canto_Inferior_Esquerdo.y then Canto_Inferior_Esquerdo.y := TEMP.by;
      if TEMP.bx > Canto_Superior_Direito.x then Canto_Superior_Direito.x := TEMP.bx;
      if TEMP.by > Canto_Superior_Direito.y then Canto_Superior_Direito.y := TEMP.by;
    end;
    temp := limpar_entidade;
        Foi_lido_uma_entidade:=true;
  end;
  procedure Ler_Arco;
Begin
  Foi_lido_uma_entidade:=false;
  repeat
    case StrToInt(GroupCode) of
        1: TEMP.texto := GroupValor;
        8: Begin
             temp.LAYER := Layers.IndexOf(GroupValor) - 1;
             temp.LayerName := GroupValor;
           end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
        40: TEMP.raio := int(strtoreal(GroupValor) * 1000) / 1000;
        50: Temp.AnguloInicial := int(strtoreal(GroupValor) * 1000) / 1000;
        51: Begin
              Temp.AnguloFinal :=int(((strtoreal(GroupValor) * 1000) / 1000) - Temp.AnguloInicial);
              if Temp.AnguloFinal < 0 then Temp.AnguloFinal := Temp.AnguloFinal + 360;
            end;
    end;
  // tratar o angulo final conforme o quadrante do inicio do arco
 Ler;
  until ((StrToInt(GroupCode) = 0) or EOF(arq));
  temp.tipo := 32;
  temp.indice := total;
  temp.apagado := False;
  temp.pai := ultimo_bloco;
  temp.Bloco:=Bloco_nome;
  temp.selecionado:=true;
  if  Secao= 'Blocos' then    adiciona(temp, True, True, dxf)
                      else    adiciona(temp, True, False, '');
  temp := limpar_entidade;
       Foi_lido_uma_entidade:=true;
end;
  procedure Ler_circulo;
Begin
  Foi_lido_uma_entidade:=false;
  repeat
    case StrToInt(GroupCode) of
      8: Begin
           temp.LAYER := Layers.IndexOf(GroupValor) - 1;
           temp.LayerName := GroupValor;
         end;
      10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
      20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
      40: TEMP.raio := int(strtoreal(GroupValor) * 1000) / 1000;

    end;
  Ler;
    until ((StrToInt(GroupCode) = 0) or EOF(arq));
    temp.tipo := 5;
    temp.indice := total;
    temp.apagado := False;
    temp.pai := ultimo_bloco;
      temp.Bloco:=Bloco_nome;
   //   if temp.raio=0.2 then frprincipal.Mensagem('Linha='+floattostr(ContaLinha));
    //temp.LAYER := 0;
      temp.selecionado:=true;
      if  Secao= 'Blocos' then    adiciona(temp, True, True, dxf)
                       else       adiciona(temp, True, False, '');


      if (Secao = 'Entidades') then
        Begin
      if TEMP.ax < Canto_Inferior_Esquerdo.x then Canto_Inferior_Esquerdo.x := TEMP.ax;
      if TEMP.ay < Canto_Inferior_Esquerdo.y then Canto_Inferior_Esquerdo.y := TEMP.ay;
      if TEMP.ax > Canto_Superior_Direito.x then Canto_Superior_Direito.x := TEMP.ax;
      if TEMP.ay > Canto_Superior_Direito.y then Canto_Superior_Direito.y := TEMP.ay;
     Foi_lido_uma_entidade:=true;
 end;
 temp := limpar_entidade;
end;
  procedure ler_Insert;
 var
  ff: integer;
Begin
    temp:=limpar_entidade;
     Foi_lido_uma_entidade:=false;
    ler;
//    frprincipal.Mensagem('Insert='+floattostr(ContaLinha));
    while ((not EOF(arq)) and (GroupValor <> 'SEQEND') and (StrToInt(groupcode)<>0)) do
    Begin
      ler;
        case StrToInt(GroupCode) of
        1: Begin
          TEMP.texto := GroupValor;
        end;
        2: Temp.Bloco := GroupValor;
        8: Begin
          temp.LAYER := Layers.IndexOf(GroupValor) - 1;
          temp.LayerName := GroupValor;
        end;
        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
        40: TEMP.bx := int(strtoreal(GroupValor) * 1000) / 1000;
        50: TEMP.AnguloRotacao:= int(strtoreal(GroupValor) * 1000) / 1000;
      end;
    end;
    temp.TIPO:=42;
    temp.selecionado:=true;
    adiciona(temp, True, True, dxf);
    ultimo_bloco:=total;
  //FrPrincipal.cmdMemo.Lines.Add('Foi definido uma cópia para o bloco de nome:'+Temp.Bloco);
    Foi_lido_uma_entidade:=true;
    //if groupvalor<>'INSERT' then
    while ((not EOF(arq)) and (GroupValor <> 'SEQEND') and (groupvalor='ATTRIB') ) do
    Begin
      {********************* inicio atributo ***********************}
      // falta ler as caracteristicas do bloco
         if (GroupValor = 'ATTRIB') then
      Begin
       Ler_atributo_Valor(temp.bloco);
      end;
  if Foi_lido_uma_entidade=true then Foi_lido_uma_entidade:=false else Ler;
    end;
    Foi_lido_uma_entidade:=true;
  end;
{*****************************************************************************}
{*                      Inicio do procedimento principal                     *}
{*****************************************************************************}
Begin
   {$i-}
  assignfile(log,'Detalhes.txt');
  rewrite(log);
   {$i+}
  primeiro_elemento:=false;
  Bloco_Nome:='';
  ContaLinha := 0;
  temp := Limpar_entidade;
  groupCode := '';
  groupValor := '';
 //Abertura do arquivo dxf
  {$i-}
  assignfile(arq, dxf);
  reset(arq);
  {$i+}
  if ioresult <> 0 then  exit;
  entrada:=Tstringlist.Create;
  Arquivo:=Tstringlist.Create;
  Arquivo.LoadFromFile(dxf);
  if Arquivo.IndexOf('LAYER')>-1 then frprincipal.Mensagem('Seção Layer encontrada na linha='+floattostr(Arquivo.IndexOf('LAYER')),2);
  if Arquivo.IndexOf('BLOCKS')>-1 then frprincipal.Mensagem('Seção BLOCKS encontrada na linha='+floattostr(Arquivo.IndexOf('BLOCKS')),2);
  if Arquivo.IndexOf('ENTITIES')>-1 then frprincipal.Mensagem('Seção ENTITIES encontrada na linha='+floattostr(Arquivo.IndexOf('ENTITIES')),2);
  if Arquivo.IndexOf('EOF')>-1 then frprincipal.Mensagem('Fim do arquivo encontrada na linha='+floattostr(Arquivo.IndexOf('EOF')),2);
   // Procura inicio dos layers no arquivo
   AcadVersao:='';
  while not (EOF(arq)) and (Upcase(GroupValor) <> 'LAYER') do
  Begin
  Ler;
  if Upcase(GroupValor)='$DWGCODEPAGE' then
    Begin
        Ler;
        Codepage:=GroupValor;
        frprincipal.Mensagem('Pagina de código='+codepage,2);
    end;
  if Upcase(GroupValor)='$ACADVER' then
    Begin
        Ler;
        AcadVersao:=GroupValor;
        if AcadVersao='' then  frprincipal.Mensagem('Versão do arquivo='+AcadVersao,2);
        if AcadVersao='AC1024'   then  frprincipal.Mensagem('DXF versão AutoCAD R2010 (could be AC1024 or AC1021 depending on the file format)',2);
        if AcadVersao='AC1021'	 then  frprincipal.Mensagem('DXF versão AutoCAD R2007, R2008, R2009',2);
        if AcadVersao='AC1018'	 then  frprincipal.Mensagem('DXF versão AutoCAD R2004, R2005, R2006',2);
        if AcadVersao='AC1015'	 then  frprincipal.Mensagem('DXF versão AutoCAD R2000, R2000i, R2002',2);
        if AcadVersao='AC1014'	 then  frprincipal.Mensagem('DXF versão AutoCAD R4',2);
        if AcadVersao='AC1012'   then  frprincipal.Mensagem('DXF versão AutoCAD 13',2);
        if AcadVersao='AC1009'   then  frprincipal.Mensagem('DXF versão AutoCAD R11 and R12',2);
        if AcadVersao='AC1006'	 then  frprincipal.Mensagem('DXF versão AutoCAD R10',2);
        if AcadVersao='AC1004'	 then  frprincipal.Mensagem('DXF versão AutoCAD R9',2);
        if AcadVersao='AC1002'   then  frprincipal.Mensagem('DXF versão AutoCAD R2',2);
    end;
   end;
    if AcadVersao='' then  frprincipal.Mensagem('Versão do arquivo desconhecida',2);
   {*****************************************************************************}
 // Incio da leitura dos layers
 {*****************************************************************************}
 Secao := 'Layers';
 Ler;
while not (EOF(arq)) and (Upcase(GroupValor) <> 'ENDTAB') do
  Begin
      if (upcase(GroupValor) = 'LAYER') then
    Begin
      Temp.by := 0;
      temp := limpar_entidade;
      repeat
        case StrToInt(GroupCode) of
          2: Begin
              TEMP.texto := GroupValor;
              Layers.Add(GroupValor);
             end;
          62 :Begin
              TEMP.cor :=strtoint(GroupValor);
             end;

        end;
        Ler;
      until ((StrToInt(GroupCode) =  0) or EOF(arq));
      temp.tipo := 38;
      temp.indice := total;
      temp.apagado := False;
           temp.selecionado:=true;
      adiciona(temp, True, False, '');
      temp := limpar_entidade;
      end;
     if StrToInt(GroupCode)<>0 then ler;
  end;
  {*****************************************************************************}
// Inicio  da leitura dos blocos
 {*****************************************************************************}
Secao := 'Blocos';
// Procura pelo inicio dos blocos
while not (EOF(arq)) and (Upcase(GroupValor) <> 'BLOCKS') and (Upcase(GroupValor) <> 'ENTITIES') do   Ler;
// Inicio da leitura dos blocos, essa parte le o cabeçalho

temp := Limpar_entidade;
IF groupValor<>'ENTITIES' then
while not (EOF(arq)) and (Upcase(GroupValor) <> 'ENDSEC') and ((GroupValor) <> 'ENTITIES') do
Begin
   ler;
if ( groupvalor = 'BLOCK') then
Begin
  ultimo_objeto:='NADA';
     ler;
      while ( (StrToInt(GroupCode)<>0) and not eof(arq)) do
                Begin
                   case StrToInt(GroupCode) of
                        2: Begin
                        TEMP.texto := GroupValor;  Bloco_Nome:=GroupValor;
                        end;
                        3 : Begin
                       temp.Bloco:=GroupValor;
                        end;
                        8: Begin
                        temp.LAYER := Layers.IndexOf(GroupValor) - 1;
                        temp.LayerName := GroupValor;
                        end;
                        10: TEMP.ax := DX + int(strtoreal(GroupValor) * 1000) / 1000;
                        20: TEMP.ay := DY + int(strtoreal(GroupValor) * 1000) / 1000;
                         end;
                      ler;
                 End; //CABEÇALHO DO BLOCO
      temp.tipo := 40;
      temp.indice := total;
      temp.apagado := False;
      temp.definicaoDeBloco:=true;
      temp.selecionado:=true;
    if ( leftstr(temp.bloco,1)<>'*') then adiciona(temp, True, true, '') else  frprincipal.cmdmemo.lines.add('bloco de nome '+temp.bloco+ ' foi ignorado');
      temp := limpar_entidade;
      ultimo_bloco := total;

 while ((not EOF(arq)) and (GroupValor <> 'ENDBLK') and (GroupValor <> 'ENDSEC') and(GroupValor<>'ENDBLK')) do
           Begin
             if (GroupValor = 'ARC')    then  Ler_Arco;
             if (GroupValor = 'TEXT')   then  Ler_texto;
             if (GroupValor = 'ATTDEF') then  Ler_atributo_definicao;
             if (GroupValor = 'LINE') then    Ler_linha;
             if (GroupValor = 'CIRCLE') then  Ler_circulo;
           If Foi_lido_uma_entidade=true then Foi_lido_uma_entidade:=false else  Ler;
           end;
 end;// Fim de um bloco do if
end;// fim das definições de blocos  do while
Bloco_Nome:='';


 {*****************************************************************************}
// Inicio  da leitura das entidades
 {*****************************************************************************}
 ultimo_objeto := '';
  temp.TEXTO := '';
  temp.pai := -1;
  secao := 'Entidades';
  // Procura pelo inicio das entidades
  while not (EOF(arq)) and (Upcase(GroupValor) <> 'ENTITIES') do
  Begin
   ler;
  end;
  Foi_Lido_Uma_Entidade:=false;
// Inicio da leitura das entidades
while ((not EOF(arq)) or (GroupValor='ENDSEC')) do
Begin
  If Foi_Lido_Uma_Entidade=True then Foi_Lido_Uma_Entidade:=False else Ler;
    if (GroupValor = 'ARC')     then  Ler_Arco;
    if ((GroupValor = 'TEXT') or (GroupValor = 'MTEXT'))then Ler_texto;
    if (GroupValor = 'LINE')    then  Ler_linha;
    if (GroupValor = 'CIRCLE')  then  Ler_circulo;
    if (GroupValor = 'INSERT')  then  Ler_Insert;
end;  // Fim das entidades  e fim do arquivo
    closefile(arq); // Fecha o arquivo

    // Verificar se não tem um layer novo
  //for f:=0 to frprincipal.arvore.Items.Count-1 do
  // if (frprincipal.arvore.Items.Item[f].Text = 'Camadas') then
  // Begin
  //  frprincipal.arvore.Items.Item[f].Expand(true);
  //  frprincipal.arvore.Items.Item[f].Selected:=true;
  // end;
{
for f := 0 to frprincipal.arvore.Items.Count - 1 do
if (frprincipal.arvore.Items.Item[f].Text = 'Camadas') then
    Begin
      temp1 := frprincipal.arvore.Items.Item[f];
      temp1.Selected := True;
      while temp1.HasChildren do frprincipal.arvore.Items.Delete(temp1.GetLastChild);
      break;
    end;
 }


{
for f := 0 to frprincipal.arvore.Items.Count - 1 do
if (frprincipal.arvore.Items.Item[f].Text = 'Camadas') then
    Begin
      temp1 := frprincipal.arvore.Items.Item[f];
    end;

for f := 0 to lista.Count - 1 do
 Begin
    if upcase(minhaclasse(lista.items[f]).Objeto) = upcase('TLayer') then
    Begin
      frprincipal.arvore.Items.AddChild(temp1, tlayer(lista.items[f]).nome).MakeVisible;
    end;
  end;



for f := 0 to frprincipal.arvore.Items.Count - 1 do
if (frprincipal.arvore.Items.Item[f].Text = 'Blocos') then
    Begin
      temp1 := frprincipal.arvore.Items.Item[f];
      temp1.Selected := True;
      while temp1.HasChildren do frprincipal.arvore.Items.Delete(temp1.GetLastChild);
      break;
    end;}
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


  MDmenorx := Canto_Inferior_Esquerdo.x;
  MDmaiorx := Canto_Superior_Direito.x;
  MDmenory := Canto_Inferior_Esquerdo.y;
  MDMaiory := Canto_Superior_Direito.y;
  TTela(lista.items[0]).Ax := Canto_Inferior_Esquerdo.x;
  TTela(lista.items[0]).Ay := Canto_Inferior_Esquerdo.y;
  TTela(lista.items[0]).Bx := Canto_Superior_Direito.x;
  TTela(lista.items[0]).By := Canto_Superior_Direito.y;
  closefile(log);

  Arquivo.Destroy;
end;

{ Tbase }
Begin
   lista := TObjectList.Create;
  Blocos := TObjectList.Create;
  Lista_de_layers:=tstringlist.Create;
  Lista_de_layers.Sorted:= True;
  Lista_de_layers.Duplicates:=dupIgnore;
  Lista_de_blocos :=Tstringlist.create;
  Lista_de_blocos.Sorted:= True;
  Lista_de_blocos.Duplicates:=dupIgnore;

  //InHalt := False;
end.
