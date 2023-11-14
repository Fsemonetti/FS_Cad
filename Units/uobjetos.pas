unit Uobjetos;

{$mode objfpc}{$H+}

interface

uses Classes, typinfo, variants, SysUtils, Uclasse_base,Graphics;
type
  ponto2d = record
    x, y: double;
  end;
  Paredeposicao = (Baixa, Media, Alta);
  Tipo_isolacao = (PVC, EPR, XLPE);
  Metodo_De_instalacao = (A, B, C, D, E, F, G, H);
  Tfases = (R, S, T);
  TipoAli = (Alimentacao, Iluminacao, Forca, Controle);
  EsqLig = (FN, FNT, FFFN, FFF);
  Ttensao = (T110, T220, T380);

  Entidade = record
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
    APAGADO: boolean;
    potencia: double;
    pai : integer;
    TEXTO: string[255];
    campo : string[255];
     Bloco : string;
     LayerName : string;
     AtributoBloco : boolean;
     definicaoDeBloco : boolean;
     valor : string;
     descricao : string;
     selecionado: boolean;
     cor : integer;
  end;
  { configuracoes }

  { TDimensionamento }

  TDimensionamento = Class(MinhaClasse)
    private
      FAdotar_Maior_Disjuntor_Da_Faixa: Boolean;
      FCapacidade_Minima_Do_Disjuntor: integer;
      FIgnorar_Fator_De_Agrupamento: Boolean;
      FPermitir_Forca_E_Iluminacao_Mesmo_Condutor: Boolean;
      FPermitir_LAmpada_Sem_Interruptor: Boolean;
      FPermitir_Retor_Secao_Difente: Boolean;
      FQueda_De_Tensao_Admissivel: double;
      FTolerancia_De_Corrente: double;
      procedure SetAdotar_Maior_Disjuntor_Da_Faixa(AValue: Boolean);
      procedure SetCapacidade_Minima_Do_Disjuntor(AValue: integer);
      procedure SetIgnorar_Fator_De_Agrupamento(AValue: Boolean);
      procedure SetPermitir_Forca_E_Iluminacao_Mesmo_Condutor(AValue: Boolean);
      procedure SetPermitir_LAmpada_Sem_Interruptor(AValue: Boolean);
      procedure SetPermitir_Retor_Secao_Difente(AValue: Boolean);
      procedure SetQueda_De_Tensao_Admissivel(AValue: double);
      procedure SetTolerancia_De_Corrente(AValue: double);
    published
   property Permitir_Retor_Secao_Difente : Boolean read FPermitir_Retor_Secao_Difente write SetPermitir_Retor_Secao_Difente;
   property Permitir_Forca_E_Iluminacao_Mesmo_Condutor : Boolean read FPermitir_Forca_E_Iluminacao_Mesmo_Condutor write SetPermitir_Forca_E_Iluminacao_Mesmo_Condutor;
   property Permitir_LAmpada_Sem_Interruptor : Boolean read FPermitir_LAmpada_Sem_Interruptor write SetPermitir_LAmpada_Sem_Interruptor;
   property Ignorar_Fator_De_Agrupamento : Boolean read FIgnorar_Fator_De_Agrupamento write SetIgnorar_Fator_De_Agrupamento;
   property Adotar_Maior_Disjuntor_Da_Faixa : Boolean read FAdotar_Maior_Disjuntor_Da_Faixa write SetAdotar_Maior_Disjuntor_Da_Faixa;
   property Tolerancia_De_Corrente : double read FTolerancia_De_Corrente write SetTolerancia_De_Corrente;
   property Queda_De_Tensao_Admissivel : double read FQueda_De_Tensao_Admissivel write SetQueda_De_Tensao_Admissivel;
   property Capacidade_Minima_Do_Disjuntor : integer read FCapacidade_Minima_Do_Disjuntor write SetCapacidade_Minima_Do_Disjuntor;
   public
     constructor create;
  end;


    { TLayers }
  TLayer = Class(MinhaClasse)
  private
   Fativo: boolean;
   Fcor: integer;
   Fespessura: double;
   FNome: string;
   FNumero: integer;
   Ftransparente: boolean;
   Fvisivel: boolean;
   procedure Setativo(AValue: boolean);
   procedure Setcor(AValue: integer);
   procedure Setcor(AValue: tcolor);
   procedure Setespessura(AValue: double);
   procedure SetNome(AValue: string);
   procedure SetNumero(AValue: integer);
   procedure Settransparente(AValue: boolean);
   procedure Setvisivel(AValue: boolean);
   published
   property Nome : string read FNome write SetNome;
   property cor : tcolor read Fcor write Setcor;
   property espessura : double read Fespessura write Setespessura;
   property visivel : boolean read Fvisivel write Setvisivel;
   property ativo  : boolean read Fativo write Setativo;
   property transparente : boolean read Ftransparente write Settransparente;
   property Numero  : integer read FNumero write SetNumero;
   public
   constructor Create;
  end;


  { TTela }
  TTela = class(MinhaClasse)
  private
    FAx: double;
    FAy: double;
    FBx: double;
    FBy: double;
    FIniciar_em: string;
    FMAI: boolean;
    FMCI: boolean;
    FMCT: boolean;
    FMI: boolean;
    FMPT: boolean;
    FUltima_Letra_Interruptor: char;
    FUltima_potencia_Tomada: double;
    FUltimo_Circuito_Usado_interruptor: integer;
    FUltimo_Circuito_Usado_tomada: integer;
    procedure SetAx(AValue: double);
    procedure SetAy(AValue: double);
    procedure SetBx(AValue: double);
    procedure SetBy(AValue: double);
    procedure SetIniciar_em(AValue: string);
    procedure SetMAI(AValue: boolean);
    procedure SetMCI(AValue: boolean);
    procedure SetMCT(AValue: boolean);
    procedure SetMI(AValue: boolean);
    procedure SetMPT(AValue: boolean);
    procedure SetUltima_Letra_Interruptor(AValue: char);
    procedure SetUltima_potencia_Tomada(AValue: double);
    procedure SetUltimo_Circuito_Usado_interruptor(AValue: integer);
    procedure SetUltimo_Circuito_Usado_tomada(AValue: integer);
  published
    property Ax: double read FAx write SetAx;
    property Ay: double read FAy write SetAy;
    property Bx: double read FBx write SetBx;
    property By: double read FBy write SetBy;
    property MPT: boolean read FMPT write SetMPT;
    property MCT: boolean read FMCT write SetMCT;
    property MAI: boolean read FMAI write SetMAI;
    property MCI: boolean read FMCI write SetMCI;
    property MI: boolean read FMI write SetMI;
    property Iniciar_em : string read FIniciar_em write SetIniciar_em;
    property Ultima_Letra_Interruptor          : char read FUltima_Letra_Interruptor write SetUltima_Letra_Interruptor;
    property Ultimo_Circuito_Usado_tomada      : integer read FUltimo_Circuito_Usado_tomada write SetUltimo_Circuito_Usado_tomada;
    property Ultimo_Circuito_Usado_interruptor : integer read FUltimo_Circuito_Usado_interruptor write SetUltimo_Circuito_Usado_interruptor;
    property Ultima_potencia_Tomada            : double read FUltima_potencia_Tomada write SetUltima_potencia_Tomada;

  public
    constructor Create;
  end;

  { TSimbolo }

  TSimbolo = class(MinhaClasse)
  private
    Farquivo: string;
    Fnome: string;
    procedure Setarquivo(AValue: string);
    procedure Setnome(AValue: string);
  published
    property nome: string read Fnome write Setnome;
    property arquivo: string read Farquivo write Setarquivo;
  public
    constructor Create;
  end;


  { TBloco }

  TBloco = class(MinhaClasse)
    private
      FAngulo: double;
      FDefinicao: boolean;
      FEscala: double;
      FNome: string;
      Fpx: double;
      Fpy: double;
      procedure SetAngulo(AValue: double);
      procedure SetDefinicao(AValue: boolean);
      procedure SetEscala(AValue: double);
      procedure SetNome(AValue: string);
      procedure Setpx(AValue: double);
      procedure Setpy(AValue: double);
    published
      property px:double read Fpx write Setpx;
      property py:double read Fpy write Setpy;
      property Angulo:double read FAngulo write SetAngulo;
      property Escala:double read FEscala write SetEscala;
      property Nome:string read FNome write SetNome;
      property Definicao:boolean read FDefinicao write SetDefinicao;


    public
    constructor create;
    procedure DeslocarPara(Dx,Dy:double);
     function Inside(a,b:ponto2d):boolean;
  end;

  { TLinha }
  TLinha = class(MinhaClasse)
  private
    FAx: double;
    FAy: double;
    FBx: double;
    FBy: double;
    FPai: integer;
    procedure SetAx(AValue: double);
    procedure SetAy(AValue: double);
    procedure SetBx(AValue: double);
    procedure SetBy(AValue: double);
    procedure SetPai(AValue: integer);
  published
    property Ax: double read FAx write SetAx;
    property Ay: double read FAy write SetAy;
    property Bx: double read FBx write SetBx;
    property By: double read FBy write SetBy;
    property Pai:integer read FPai write SetPai;

  public
    constructor Create;
    function Ponto_do_meio: ponto2d;
    function PontoExtremo(Pt: ponto2d): ponto2d;
    function PontoNaReta: ponto2d;
    function Inside(a,b:ponto2d):boolean;
    procedure DeslocarPara(Dx,Dy:double);
  end;

  { TTexto }

  TTexto = class(minhaclasse)

  private
    Fangulo: double;
    FCampo: string;
    Fpai: integer;
    FPx: double;
    FPy: double;
    Ftamanho: double;
    procedure Setangulo(AValue: double);
    procedure SetCampo(AValue: string);
    procedure Setpai(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure Settamanho(AValue: double);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property angulo: double read Fangulo write Setangulo;
    property tamanho: double read Ftamanho write Settamanho;
    property pai:integer read Fpai write Setpai;
    property Campo:string read FCampo write SetCampo;
  public
    constructor Create;
    procedure DeslocarPara(Dx,Dy:double);
    function Inside(a,b:ponto2d):boolean;
  end;



  
  { TAtributo }

  TAtributo = class(minhaclasse)

  private
    FCampo: string;
    FDefinicao: integer;
    Fpai: integer;
    FPx: double;
    FPy: double;
    Ftamanho: double;
    FValor: string;
    procedure SetCampo(AValue: string);
    procedure SetDefinicao(AValue: integer);
    procedure Setpai(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure Settamanho(AValue: double);
    procedure SetValor(AValue: string);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property tamanho: double read Ftamanho write Settamanho;
    property Escala:integer read Fpai write Setpai;
    property Campo:string read FCampo write SetCampo;
    property Valor:string read FValor write SetValor;
    property Pai : integer read FPai write SetPai;
    property Definicao : integer read FDefinicao write SetDefinicao;
  public
    constructor Create;
    procedure DeslocarPara(Dx,Dy:double);
     function Inside(a,b:ponto2d):boolean;
  end;

  { TArco }

  Tarco = class(MinhaClasse)
  private
    FAnguloFinal: double;
    FAnguloInicial: double;
    FComprimento: double;
    FDiametro: double;
    FObjFin: integer;
    FObjFin_X: double;
    FObjFin_Y: double;
    FObjIni: integer;
    FObjIni_X: double;
    FObjIni_Y: double;
    Fpai: integer;
    FPx: double;
    FPy: double;
    FRaio: double;
    FLocX: double;
    FLocY: double;
    procedure Setpai(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetAnguloFinal(AValue: double);
    procedure SetAnguloInicial(AValue: double);
    procedure SetComprimento(AValue: double);
    procedure SetDiametro(AValue: double);
    procedure SetLocX(AValue: double);
    procedure SetLocY(AValue: double);
    procedure SetObjFin(AValue: integer);
    procedure SetObjFin_X(AValue: double);
    procedure SetObjFin_Y(AValue: double);
    procedure SetObjIni(AValue: integer);
    procedure SetObjIni_X(AValue: double);
    procedure SetObjIni_Y(AValue: double);
    procedure SetRaio(AValue: double);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property Raio: double read FRaio write SetRaio;
    property AnguloInicial: double read FAnguloInicial write SetAnguloInicial;
    property AnguloFinal: double read FAnguloFinal write SetAnguloFinal;
    property ObjIni: integer read FObjIni write SetObjIni;
    property ObjIni_X: double read FObjIni_X write SetObjIni_X;
    property ObjIni_Y: double read FObjIni_Y write SetObjIni_Y;
    property ObjFin: integer read FObjFin write SetObjFin;
    property ObjFin_X: double read FObjFin_X write SetObjFin_X;
    property ObjFin_Y: double read FObjFin_Y write SetObjFin_Y;
    property Diametro: double read FDiametro write SetDiametro;
    property Comprimento: double read FComprimento write SetComprimento;
    property LocX: double read FLocX write SetLocX;
    property LocY: double read FLocY write SetLocY;
    property pai:integer read Fpai write Setpai;

  public
    constructor Create;
    procedure atualiza;
    procedure DeslocarPara(Dx,Dy:double);
    function Inside(a,b:ponto2d):boolean;
  end;

  { TArcoS }

  TarcoS = class(MinhaClasse)
  private
    FAnguloFinal: double;
    FAnguloInicial: double;
    Fpai: integer;
    FPx: double;
    FPy: double;
    FRaio: double;
    procedure SetAnguloFinal(AValue: double);
    procedure SetAnguloInicial(AValue: double);
    procedure Setpai(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetRaio(AValue: double);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property Raio: double read FRaio write SetRaio;
    property AnguloInicial: double read FAnguloInicial write SetAnguloInicial;
    property AnguloFinal: double read FAnguloFinal write SetAnguloFinal;
    property pai:integer read Fpai write Setpai;
  public
    constructor Create;

  end;

  { TCirculo }

  TCirculo = class(MinhaClasse)
  private
    Fpai: integer;
    FPx: double;
    FPy: double;
    Fraio: double;
    procedure Setpai(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure Setraio(AValue: double);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property raio: double read Fraio write Setraio;
    property pai:integer read Fpai write Setpai;
  public
    constructor Create;
    procedure DeslocarPara(Dx,Dy:double);
     function Inside(a,b:ponto2d):boolean;
  end;

  { TFio }
  TFio = class(MinhaClasse)
  private
    FObjetoInicial: integer;
    FTubo: integer;
    procedure SetObjetoInicial(AValue: integer);
    procedure SetTubo(AValue: integer);
  published
    property Tubo: integer read FTubo write SetTubo;
    property ObjetoInicial: integer read FObjetoInicial write SetObjetoInicial;
  public
    constructor Create;
  end;



  { TFiacao }

  TFiacao = class(MinhaClasse)
  private
    FCircuito1: integer;
    FCircuito2: integer;
    FCircuito3: integer;
    FCircuito4: integer;
    FCircuito5: integer;
    FTa: boolean;
    FTextoAuto: string;
    FTextoManual: string;
    FTsize: integer;
    FTubo: integer;
    Fx: double;
    Fy: double;
    procedure SetCircuito1(AValue: integer);
    procedure SetCircuito2(AValue: integer);
    procedure SetCircuito3(AValue: integer);
    procedure SetCircuito4(AValue: integer);
    procedure SetCircuito5(AValue: integer);
    procedure SetTa(AValue: boolean);
    procedure SetTextoAuto(AValue: string);
    procedure SetTextoManual(AValue: string);
    procedure SetTsize(AValue: integer);
    procedure SetTubo(AValue: integer);
    procedure Setx(AValue: double);
    procedure Sety(AValue: double);
  published
    property Tubo: integer read FTubo write SetTubo;
    property TextoAuto: string read FTextoAuto write SetTextoAuto;
    property TextoManual: string read FTextoManual write SetTextoManual;
    property Ta: boolean read FTa write SetTa;
    property x: double read Fx write Setx;
    property y: double read Fy write Sety;
    property Tsize: integer read FTsize write SetTsize;
    property Circuito1: integer read FCircuito1 write SetCircuito1;
    property Circuito2: integer read FCircuito2 write SetCircuito2;
    property Circuito3: integer read FCircuito3 write SetCircuito3;
    property Circuito4: integer read FCircuito4 write SetCircuito4;
    property Circuito5: integer read FCircuito5 write SetCircuito5;
  public
    constructor Create;
  end;



  { TCircuito }
  TCircuito = class(MinhaClasse)
  private
    FDfio: double;
    FDfioSel: double;
    FDisjuntor: integer;
    FEsquema: Esqlig;
    FExtensao: double;
    FFases: Tfases;
    FFCA: double;
    FFCT: double;
    FIfio: double;
    FIprojeto: double;
    FIsolacao: Tipo_isolacao;
    FMetodoInst: Metodo_De_instalacao;
    FMetodoInsttexto: string;
    FPer_ocup_ele: double;
    FPotencia_instalada: integer;
    FQtensao: double;
    FQuadro: integer;
    FTempAmbiente: integer;
    FTensao: Ttensao;
    FTipoAlimentacao: TipoAli;
    FTipoLigacao: double;
    procedure SetDfio(AValue: double);
    procedure SetDfioSel(AValue: double);
    procedure SetDisjuntor(AValue: integer);
    procedure SetEsquema(AValue: Esqlig);
    procedure SetExtensao(AValue: double);
    procedure SetFases(AValue: Tfases);
    procedure SetFCA(AValue: double);
    procedure SetFCT(AValue: double);
    procedure SetIfio(AValue: double);
    procedure SetIprojeto(AValue: double);
    procedure SetIsolacao(AValue: Tipo_isolacao);
    procedure SetMetodoInst(AValue: Metodo_De_instalacao);
    procedure SetMetodoInsttexto(AValue: string);
    procedure SetPer_ocup_ele(AValue: double);
    procedure SetPotencia_instalada(AValue: integer);
    procedure SetQtensao(AValue: double);
    procedure SetQuadro(AValue: integer);
    procedure SetTempAmbiente(AValue: integer);
    procedure SetTensao(AValue: Ttensao);
    procedure SetTipoAlimentacao(AValue: TipoAli);
    procedure SetTipoLigacao(AValue: double);
    procedure Calculos;
  published
    property Dfio: double read FDfio write SetDfio;
    property Qtensao: double read FQtensao write SetQtensao;
    property Extensao: double read FExtensao write SetExtensao;
    property FCT: double read FFCT write SetFCT;
    property FCA: double read FFCA write SetFCA;
    property Iprojeto: double read FIprojeto write SetIprojeto;
    property Quadro: integer read FQuadro write SetQuadro;
    property MetodoInst: Metodo_De_instalacao read FMetodoInst write SetMetodoInst;
    property MetodoInsttexto: string read FMetodoInsttexto write SetMetodoInsttexto;
    property Isolacao: Tipo_isolacao read FIsolacao write SetIsolacao;
    property TipoAlimentacao: TipoAli read FTipoAlimentacao write SetTipoAlimentacao;
    property TempAmbiente: integer read FTempAmbiente write SetTempAmbiente;
    property Fases: Tfases read FFases write SetFases;
    property Esquema: Esqlig read FEsquema write SetEsquema;
    property Tensao: Ttensao read FTensao write SetTensao;
    property Disjuntor : integer read FDisjuntor write SetDisjuntor;
    property Ifio : double read FIfio write SetIfio;
    property DfioSel: double read FDfioSel write SetDfioSel;
    property Per_ocup_ele : double read FPer_ocup_ele write SetPer_ocup_ele;
    property Potencia_instalada : integer read FPotencia_instalada write SetPotencia_instalada;
  public
    constructor Create;
  end;




  { TTubulacao }
  TTubulacao = class(MinhaClasse)
  private
    FAx: double;
    FAy: double;
    FBezier: boolean;
    FBx: double;
    FBy: double;
    FB_P_x1: double;
    FB_P_x2: double;
    FB_P_y1: double;
    FB_P_y2: double;
    FComprimento: double;
    FDiametro: double;
    FObjFin: integer;
    FObjFin_X: double;
    FObjFin_Y: double;
    FObjIni: integer;
    FObjIni_X: double;
    FObjIni_Y: double;
    procedure SetAx(AValue: double);
    procedure SetAy(AValue: double);
    procedure SetBezier(AValue: boolean);
    procedure SetBx(AValue: double);
    procedure SetBy(AValue: double);
    procedure SetB_P_x1(AValue: double);
    procedure SetB_P_x2(AValue: double);
    procedure SetB_P_y1(AValue: double);
    procedure SetB_P_y2(AValue: double);
    procedure SetComprimento(AValue: double);
    procedure SetDiametro(AValue: double);
    procedure SetObjFin(AValue: integer);
    procedure SetObjFin_X(AValue: double);
    procedure SetObjFin_Y(AValue: double);
    procedure SetObjIni(AValue: integer);
    procedure SetObjIni_X(AValue: double);
    procedure SetObjIni_Y(AValue: double);
    procedure Atualizar;
  published
    property ObjIni: integer read FObjIni write SetObjIni;
    property ObjIni_X: double read FObjIni_X write SetObjIni_X;
    property ObjIni_Y: double read FObjIni_Y write SetObjIni_Y;
    property ObjFin: integer read FObjFin write SetObjFin;
    property ObjFin_X: double read FObjFin_X write SetObjFin_X;
    property ObjFin_Y: double read FObjFin_Y write SetObjFin_Y;
    property Diametro: double read FDiametro write SetDiametro;
    property Comprimento: double read FComprimento write SetComprimento;
    property Ax : double read FAx write SetAx;
    property Bx : double read FBx write SetBx;
    property Ay : double read FAy write SetAy;
    property By : double read FBy write SetBy;
    property Bezier : boolean read FBezier write SetBezier;
    property B_P_x1 : double read FB_P_x1 write SetB_P_x1;
    property B_P_y1 : double read FB_P_y1 write SetB_P_y1;
    property B_P_x2 : double read FB_P_x2 write SetB_P_x2;
    property B_P_y2 : double read FB_P_y2 write SetB_P_y2;


  public
    constructor Create;
  end;

  { TIluminacao }

  TIluminacao = class(MinhaClasse)
  private
    Facionamento: char;
    Facionamento_id: integer;
    Fcircuito: integer;
    FFP: double;
    FIp: double;
    FNf: integer;
    Fpotencia: integer;
    FPx: double;
    FPy: double;
    FQuedaTensao: double;
    Frendimento: double;
    FSimbologia: string;
    Ftensao: integer;
    procedure Setacionamento(AValue: char);
    procedure Setacionamento_id(AValue: integer);
    procedure Setcircuito(AValue: integer);
    procedure SetFP(AValue: double);
    procedure SetIp(AValue: double);
    procedure SetNf(AValue: integer);
    procedure Setpotencia(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetQuedaTensao(AValue: double);
    procedure Setrendimento(AValue: double);
    procedure SetSimbologia(AValue: string);
    procedure Settensao(AValue: integer);
  published
    property potencia: integer read Fpotencia write Setpotencia;
    property circuito: integer read Fcircuito write Setcircuito;
    property acionamento: char read Facionamento write Setacionamento;
    property acionamento_id: integer read Facionamento_id write Setacionamento_id;
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property rendimento: double read Frendimento write Setrendimento;
    property FP: double read FFP write SetFP;
    property Ip: double read FIp write SetIp;
    property tensao: integer read Ftensao write Settensao;
    property Nf: integer read FNf write SetNf;
    property QuedaTensao: double read FQuedaTensao write SetQuedaTensao;
    property Simbologia : string read FSimbologia write SetSimbologia;

  public
    constructor Create;
    destructor Destroy;
    procedure calculos;
  end;

  { TInterruptor }

  TInterruptor = class(MinhaClasse)

  private
    Facionamento: char;
    Facionamento_id: integer;
    Fcircuito: integer;
    FFP: double;
    FIp: double;
    FNf: integer;
    Fpotencia: integer;
    FPx: double;
    FPy: double;
    Frendimento: double;
    FSimbologia: string;
    Ftensao: integer;
    procedure Setacionamento(AValue: char);
    procedure Setacionamento_id(AValue: integer);
    procedure Setcircuito(AValue: integer);
    procedure SetFP(AValue: double);
    procedure SetIp(AValue: double);
    procedure SetNf(AValue: integer);
    procedure Setpotencia(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure Setrendimento(AValue: double);
    procedure SetSimbologia(AValue: string);
    procedure Settensao(AValue: integer);
  published
    property potencia: integer read Fpotencia write Setpotencia;
    property circuito: integer read Fcircuito write Setcircuito;
    property acionamento: char read Facionamento write Setacionamento;
    property acionamento_id: integer read Facionamento_id write Setacionamento_id;
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property FP: double read FFP write SetFP;
    property Ip: double read FIp write SetIp;
    property Nf: integer read FNf write SetNf;
    property rendimento: double read Frendimento write Setrendimento;
    property tensao: integer read Ftensao write Settensao;
    property Simbologia : string read FSimbologia write SetSimbologia;

  public
    constructor Create;
  end;

  { TTomada }
  TTomada = class(MinhaClasse)
  private
    Fcircuito: integer;
    FFP: double;
    FIp: double;
    FNf: integer;
    Fposicao: integer;
    Fposicaoparede: paredeposicao;
    Fpotencia: integer;
    FPx: double;
    FPy: double;
    FQuedaTensao: double;
    Frendimento: double;
    FSimbologia: string;
    FTensao: integer;
    procedure Setcircuito(AValue: integer);
    procedure SetFP(AValue: double);
    procedure SetIp(AValue: double);
    procedure SetNf(AValue: integer);
    procedure Setposicao(AValue: integer);
    procedure Setposicaoparede(AValue: paredeposicao);
    procedure Setpotencia(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetQuedaTensao(AValue: double);
    procedure Setrendimento(AValue: double);
    procedure SetSimbologia(AValue: string);
    procedure SetTensao(AValue: integer);
  published
    property potencia: integer read Fpotencia write Setpotencia;
    property circuito: integer read Fcircuito write Setcircuito;
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property posicao: integer read Fposicao write Setposicao;
    property posicaoparede: paredeposicao read Fposicaoparede write Setposicaoparede;
    property QuedaTensao: double read FQuedaTensao write SetQuedaTensao;
    property rendimento: double read Frendimento write Setrendimento;
    property FP: double read FFP write SetFP;
    property Ip: double read FIp write SetIp;
    property Tensao: integer read FTensao write SetTensao;
    property Nf: integer read FNf write SetNf;
    property Simbologia : string read FSimbologia write SetSimbologia;
   public
    constructor Create;
    procedure calculos;
  end;

  { TCd }
  TCd = class(MinhaClasse)
  private
    Fnumero: integer;
    FPx: double;
    FPy: double;
    FSimbologia: string;
    procedure Setnumero(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetSimbologia(AValue: string);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property numero : integer read Fnumero write Setnumero;
    property Simbologia : string read FSimbologia write SetSimbologia;
  public
    constructor Create;
  end;
  { TCxp }
  TCxp = class(MinhaClasse)
  private
    Fnumero: integer;
    FPx: double;
    FPy: double;
    FSimbologia: string;
    procedure Setnumero(AValue: integer);
    procedure SetPx(AValue: double);
    procedure SetPy(AValue: double);
    procedure SetSimbologia(AValue: string);
  published
    property Px: double read FPx write SetPx;
    property Py: double read FPy write SetPy;
    property numero : integer read Fnumero write Setnumero;
     property Simbologia : string read FSimbologia write SetSimbologia ;
  public
    constructor Create;
  end;


function QuedaTensao(comprimento, tensao, corrente, diametro, R, K: double): double;

implementation

function QuedaTensao(comprimento, tensao, corrente, diametro, R, K: double): double;
Begin
  if diametro=0 then diametro:=2.5;
  k := 200; // F+N
  r := 0.0178; //cobre
  Result := (k * R * corrente * comprimento) / (tensao * diametro);
end;

{ TDimensionamento }

procedure TDimensionamento.SetAdotar_Maior_Disjuntor_Da_Faixa(AValue: Boolean);
Begin
  if FAdotar_Maior_Disjuntor_Da_Faixa=AValue then Exit;
  FAdotar_Maior_Disjuntor_Da_Faixa:=AValue;
end;

procedure TDimensionamento.SetCapacidade_Minima_Do_Disjuntor(AValue: integer);
Begin
  if FCapacidade_Minima_Do_Disjuntor=AValue then Exit;
  FCapacidade_Minima_Do_Disjuntor:=AValue;
end;

procedure TDimensionamento.SetIgnorar_Fator_De_Agrupamento(AValue: Boolean);
Begin
  if FIgnorar_Fator_De_Agrupamento=AValue then Exit;
  FIgnorar_Fator_De_Agrupamento:=AValue;
end;

procedure TDimensionamento.SetPermitir_Forca_E_Iluminacao_Mesmo_Condutor(
  AValue: Boolean);
Begin
  if FPermitir_Forca_E_Iluminacao_Mesmo_Condutor=AValue then Exit;
  FPermitir_Forca_E_Iluminacao_Mesmo_Condutor:=AValue;
end;

procedure TDimensionamento.SetPermitir_LAmpada_Sem_Interruptor(AValue: Boolean);
Begin
  if FPermitir_LAmpada_Sem_Interruptor=AValue then Exit;
  FPermitir_LAmpada_Sem_Interruptor:=AValue;
end;

procedure TDimensionamento.SetPermitir_Retor_Secao_Difente(AValue: Boolean);
Begin
  if FPermitir_Retor_Secao_Difente=AValue then Exit;
  FPermitir_Retor_Secao_Difente:=AValue;
end;

procedure TDimensionamento.SetQueda_De_Tensao_Admissivel(AValue: double);
Begin
  if FQueda_De_Tensao_Admissivel=AValue then Exit;
  FQueda_De_Tensao_Admissivel:=AValue;
end;

procedure TDimensionamento.SetTolerancia_De_Corrente(AValue: double);
Begin
  if FTolerancia_De_Corrente=AValue then Exit;
  FTolerancia_De_Corrente:=AValue;
end;

constructor TDimensionamento.create;
Begin
  inherited;
end;

{ TAtributo }

procedure TAtributo.SetCampo(AValue: string);
Begin
  if FCampo=AValue then Exit;
  FCampo:=AValue;
end;

procedure TAtributo.SetDefinicao(AValue: integer);
Begin
  if FDefinicao=AValue then Exit;
  FDefinicao:=AValue;
end;

procedure TAtributo.Setpai(AValue: integer);
Begin
  if Fpai=AValue then Exit;
  Fpai:=AValue;
end;

procedure TAtributo.SetPx(AValue: double);
Begin
  if FPx=AValue then Exit;
  FPx:=AValue;
end;

procedure TAtributo.SetPy(AValue: double);
Begin
  if FPy=AValue then Exit;
  FPy:=AValue;
end;

procedure TAtributo.Settamanho(AValue: double);
Begin
  if Ftamanho=AValue then Exit;
  Ftamanho:=AValue;
end;

procedure TAtributo.SetValor(AValue: string);
Begin
  if FValor=AValue then Exit;
  FValor:=AValue;
end;

constructor TAtributo.Create;
Begin
   inherited;
end;

procedure TAtributo.DeslocarPara(Dx, Dy: double);
Begin
    Px:=Px+Dx;
    Py:=Py+dy;
end;

function TAtributo.Inside(a, b: ponto2d): boolean;
Begin
  Result:=(PX >= A.X) and (PX <= B.X) and (PY >= A.Y) and (PY <= B.Y);

end;

{ TBloco }

procedure TBloco.SetAngulo(AValue: double);
Begin
  if FAngulo=AValue then Exit;
  FAngulo:=AValue;
end;

procedure TBloco.SetDefinicao(AValue: boolean);
Begin
  if FDefinicao=AValue then Exit;
  FDefinicao:=AValue;
end;

procedure TBloco.SetEscala(AValue: double);
Begin
  if FEscala=AValue then Exit;
  FEscala:=AValue;
end;

procedure TBloco.SetNome(AValue: string);
Begin
  if FNome=AValue then Exit;
  FNome:=AValue;
end;

procedure TBloco.Setpx(AValue: double);
Begin
  if Fpx=AValue then Exit;
  Fpx:=AValue;
end;

procedure TBloco.Setpy(AValue: double);
Begin
  if Fpy=AValue then Exit;
  Fpy:=AValue;
end;

constructor TBloco.create;
Begin
 inherited;
end;

procedure TBloco.DeslocarPara(Dx, Dy: double);
Begin
   Px:=Px+Dx;
    Py:=Py+dy;
end;

function TBloco.Inside(a, b: ponto2d): boolean;
Begin

  Result:=(PX >= A.X) and (PX <= B.X) and  (PY >= A.Y) and (PY <= B.Y);



end;

{ TLayers }

procedure TLayer.Setativo(AValue: boolean);
Begin
  if Fativo=AValue then Exit;
  Fativo:=AValue;
end;

procedure TLayer.Setcor(AValue: integer);
Begin
  if Fcor=AValue then Exit;
  Fcor:=AValue;
end;

procedure TLayer.Setcor(AValue: tcolor);
Begin
  if Fcor=AValue then Exit;
  Fcor:=AValue;
end;

procedure TLayer.Setespessura(AValue: double);
Begin
  if Fespessura=AValue then Exit;
  Fespessura:=AValue;
end;

procedure TLayer.SetNome(AValue: string);
Begin
  if FNome=AValue then Exit;
  FNome:=AValue;
end;

procedure TLayer.SetNumero(AValue: integer);
Begin
  if FNumero=AValue then Exit;
  FNumero:=AValue;
end;

procedure TLayer.Settransparente(AValue: boolean);
Begin
  if Ftransparente=AValue then Exit;
  Ftransparente:=AValue;
end;

procedure TLayer.Setvisivel(AValue: boolean);
Begin
  if Fvisivel=AValue then Exit;
  Fvisivel:=AValue;
end;

constructor TLayer.Create;
Begin
  inherited;
end;

{ TFiacao }

procedure TFiacao.SetTa(AValue: boolean);
Begin
  if FTa = AValue then Exit;
  FTa := AValue;
end;

procedure TFiacao.SetCircuito1(AValue: integer);
Begin
  if FCircuito1 = AValue then Exit;
  FCircuito1 := AValue;
end;

procedure TFiacao.SetCircuito2(AValue: integer);
Begin
  if FCircuito2 = AValue then Exit;
  FCircuito2 := AValue;
end;

procedure TFiacao.SetCircuito3(AValue: integer);
Begin
  if FCircuito3 = AValue then Exit;
  FCircuito3 := AValue;
end;

procedure TFiacao.SetCircuito4(AValue: integer);
Begin
  if FCircuito4 = AValue then Exit;
  FCircuito4 := AValue;
end;

procedure TFiacao.SetCircuito5(AValue: integer);
Begin
  if FCircuito5 = AValue then Exit;
  FCircuito5 := AValue;
end;

procedure TFiacao.SetTextoAuto(AValue: string);
Begin
  if FTextoAuto = AValue then Exit;
  FTextoAuto := AValue;
end;

procedure TFiacao.SetTextoManual(AValue: string);
Begin
  if FTextoManual = AValue then Exit;
  FTextoManual := AValue;
end;

procedure TFiacao.SetTsize(AValue: integer);
Begin
  if FTsize = AValue then Exit;
  FTsize := AValue;
end;

procedure TFiacao.SetTubo(AValue: integer);
Begin
  if FTubo = AValue then Exit;
  FTubo := AValue;
end;

procedure TFiacao.Setx(AValue: double);
Begin
  if Fx = AValue then Exit;
  Fx := AValue;
end;

procedure TFiacao.Sety(AValue: double);
Begin
  if Fy = AValue then Exit;
  Fy := AValue;
end;

constructor TFiacao.Create;
Begin
  inherited;
end;


{ TTela }

procedure TTela.SetAx(AValue: double);
Begin
  if FAx = AValue then Exit;
  FAx := AValue;
end;

procedure TTela.SetAy(AValue: double);
Begin
  if FAy = AValue then Exit;
  FAy := AValue;
end;

procedure TTela.SetBx(AValue: double);
Begin
  if FBx = AValue then Exit;
  FBx := AValue;
end;

procedure TTela.SetBy(AValue: double);
Begin
  if FBy = AValue then Exit;
  FBy := AValue;
end;

procedure TTela.SetIniciar_em(AValue: string);
Begin
  if FIniciar_em=AValue then Exit;
  FIniciar_em:=AValue;
end;

procedure TTela.SetMAI(AValue: boolean);
Begin
  if FMAI = AValue then Exit;
  FMAI := AValue;
end;

procedure TTela.SetMCI(AValue: boolean);
Begin
  if FMCI = AValue then Exit;
  FMCI := AValue;
end;

procedure TTela.SetMCT(AValue: boolean);
Begin
  if FMCT = AValue then Exit;
  FMCT := AValue;
end;

procedure TTela.SetMI(AValue: boolean);
Begin
  if FMI = AValue then Exit;
  FMI := AValue;
end;

procedure TTela.SetMPT(AValue: boolean);
Begin
  if FMPT = AValue then Exit;
  FMPT := AValue;
end;

procedure TTela.SetUltima_Letra_Interruptor(AValue: char);
Begin
  if FUltima_Letra_Interruptor=AValue then Exit;
  FUltima_Letra_Interruptor:=AValue;
end;

procedure TTela.SetUltima_potencia_Tomada(AValue: double);
Begin
  if FUltima_potencia_Tomada=AValue then Exit;
  FUltima_potencia_Tomada:=AValue;
end;

procedure TTela.SetUltimo_Circuito_Usado_interruptor(AValue: integer);
Begin
  if FUltimo_Circuito_Usado_interruptor=AValue then Exit;
  FUltimo_Circuito_Usado_interruptor:=AValue;
end;

procedure TTela.SetUltimo_Circuito_Usado_tomada(AValue: integer);
Begin
  if FUltimo_Circuito_Usado_tomada=AValue then Exit;
  FUltimo_Circuito_Usado_tomada:=AValue;
end;

constructor TTela.Create;
Begin
  inherited;
end;

{ TarcoS }

procedure TarcoS.SetAnguloFinal(AValue: double);
Begin
  if FAnguloFinal = AValue then Exit;
  FAnguloFinal := AValue;
end;

procedure TarcoS.SetAnguloInicial(AValue: double);
Begin
  if FAnguloInicial = AValue then Exit;
  FAnguloInicial := AValue;
end;

procedure TarcoS.Setpai(AValue: integer);
Begin
  if Fpai=AValue then Exit;
  Fpai:=AValue;
end;

procedure TarcoS.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TarcoS.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TarcoS.SetRaio(AValue: double);
Begin
  if FRaio = AValue then Exit;
  FRaio := AValue;
end;

constructor TarcoS.Create;
Begin
  inherited;
end;

{ TSimbolo }

procedure TSimbolo.Setarquivo(AValue: string);
Begin
  if Farquivo = AValue then Exit;
  Farquivo := AValue;
end;

procedure TSimbolo.Setnome(AValue: string);
Begin
  if Fnome = AValue then Exit;
  Fnome := AValue;
end;

constructor TSimbolo.Create;
Begin
  inherited;
end;



{ TCirculo }

procedure TCirculo.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TCirculo.Setpai(AValue: integer);
Begin
  if Fpai=AValue then Exit;
  Fpai:=AValue;
end;

procedure TCirculo.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TCirculo.Setraio(AValue: double);
Begin
  if Fraio = AValue then Exit;
  Fraio := AValue;
end;

constructor TCirculo.Create;
Begin
  inherited;
end;

procedure TCirculo.DeslocarPara(Dx, Dy: double);
Begin
 Px:=Px+Dx;
 Py:=Py+Dy;
end;

function TCirculo.Inside(a, b: ponto2d): boolean;
Begin
  Result:=(fpx >= A.X) and (fpx <= B.X) and (fpy >= A.Y) and (fpy <= B.Y);
end;

{ TArco }

procedure Tarco.SetAnguloFinal(AValue: double);
Begin
  if FAnguloFinal = AValue then Exit;
  FAnguloFinal := AValue;
end;

procedure Tarco.SetAnguloInicial(AValue: double);
Begin
  if FAnguloInicial = AValue then Exit;
  FAnguloInicial := AValue;
end;

procedure Tarco.SetComprimento(AValue: double);
Begin
  if FComprimento = AValue then Exit;
  FComprimento := AValue;
end;

procedure Tarco.SetDiametro(AValue: double);
Begin
  if FDiametro = AValue then Exit;
  FDiametro := AValue;
end;

procedure Tarco.SetLocX(AValue: double);
Begin
  if FLocX = AValue then Exit;
  FLocX := AValue;
end;

procedure Tarco.SetLocY(AValue: double);
Begin
  if FLocY = AValue then Exit;
  FLocY := AValue;
end;

procedure Tarco.SetObjFin(AValue: integer);
Begin
  if FObjFin = AValue then Exit;
  FObjFin := AValue;
end;

procedure Tarco.SetObjFin_X(AValue: double);
Begin
  if FObjFin_X = AValue then Exit;
  FObjFin_X := AValue;
end;

procedure Tarco.SetObjFin_Y(AValue: double);
Begin
  if FObjFin_Y = AValue then Exit;
  FObjFin_Y := AValue;
end;

procedure Tarco.SetObjIni(AValue: integer);
Begin
  if FObjIni = AValue then Exit;
  FObjIni := AValue;
end;

procedure Tarco.SetObjIni_X(AValue: double);
Begin
  if FObjIni_X = AValue then Exit;
  FObjIni_X := AValue;
end;

procedure Tarco.SetObjIni_Y(AValue: double);
Begin
  if FObjIni_Y = AValue then Exit;
  FObjIni_Y := AValue;
end;

procedure Tarco.SetPx(AValue: double);
var
  Ar: double;
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
  Ar := (self.anguloinicial + self.angulofinal / 2) *
    (0.01745329251994329576923690768489);
  self.locx := self.raio * cos(Ar);
  self.locy := self.raio * sin(Ar);
  self.locx := locx + self.Px;
  self.locy := locy + self.Py;

end;

procedure Tarco.Setpai(AValue: integer);
Begin
  if Fpai=AValue then Exit;
  Fpai:=AValue;
end;

procedure Tarco.SetPy(AValue: double);
var
  Ar: double;
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
  Ar := (self.anguloinicial + self.angulofinal / 2) * (0.01745329251994329576923690768489);
  self.locx := self.raio * cos(Ar);
  self.locy := self.raio * sin(Ar);
  self.locx := locx + self.Px;
  self.locy := locy + self.Py;
end;

procedure Tarco.SetRaio(AValue: double);
Begin
  if FRaio = AValue then Exit;
  FRaio := AValue;
end;

constructor Tarco.Create;
Begin
  inherited;
end;

procedure Tarco.atualiza;
Begin
  self.locx := self.raio * cos((self.anguloinicial + self.angulofinal / 2) *
    (0.01745329251994329576923690768489));
  self.locy := self.raio * sin((self.anguloinicial + self.angulofinal / 2) *
    (0.01745329251994329576923690768489));
  self.locx := locx + self.Px;
  self.locy := locy + self.Py;
end;

procedure Tarco.DeslocarPara(Dx, Dy: double);
Begin
Px:=Px+Dx;
Py:=Py+dy;
end;

function Tarco.Inside(a, b: ponto2d): boolean;
Begin
self.locx := self.raio * cos((self.anguloinicial)*(0.01745329251994329576923690768489));
self.locy := self.raio * sin((self.anguloinicial )*(0.01745329251994329576923690768489));
self.locx := locx + self.Px;
self.locy := locy + self.Py;
Result:=(locx >= A.X) and (locx <= B.X) and (locy >= A.Y) and (locy <= B.Y);
self.locx := self.raio * cos((self.angulofinal)*(0.01745329251994329576923690768489));
self.locy := self.raio * sin((self.angulofinal )*(0.01745329251994329576923690768489));
self.locx := locx + self.Px;
self.locy := locy + self.Py;
Result:=(locx >= A.X) and (locx <= B.X) and (locy >= A.Y) and (locy <= B.Y);

end;

{ TTexto }

procedure TTexto.Setangulo(AValue: double);
Begin
  if Fangulo = AValue then Exit;
  Fangulo := AValue;
end;

procedure TTexto.SetCampo(AValue: string);
Begin
  if FCampo=AValue then Exit;
  FCampo:=AValue;
end;

procedure TTexto.Setpai(AValue: integer);
Begin
  if Fpai=AValue then Exit;
  Fpai:=AValue;
end;

procedure TTexto.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TTexto.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TTexto.Settamanho(AValue: double);
Begin
  if Ftamanho = AValue then Exit;
  Ftamanho := AValue;
end;

constructor TTexto.Create;
Begin
  inherited;
end;

procedure TTexto.DeslocarPara(Dx, Dy: double);
Begin
  Px:=Px+Dx;
  Py:=Py+Dy;
end;

function TTexto.Inside(a, b: ponto2d): boolean;
Begin

  Result:=(PX >= A.X) and (PX <= B.X) and (PY >= A.Y) and (PY <= B.Y);




end;

{ TLinha }

procedure TLinha.SetAx(AValue: double);
Begin
  if FAx = AValue then Exit;
  FAx := AValue;
end;

procedure TLinha.SetAy(AValue: double);
Begin
  if FAy = AValue then Exit;
  FAy := AValue;
end;

procedure TLinha.SetBx(AValue: double);
Begin
  if FBx = AValue then Exit;
  FBx := AValue;
end;

procedure TLinha.SetBy(AValue: double);
Begin
  if FBy = AValue then Exit;
  FBy := AValue;
end;

procedure TLinha.SetPai(AValue: integer);
Begin
  if FPai=AValue then Exit;
  FPai:=AValue;
end;

constructor TLinha.Create;
Begin
  inherited;
end;

function TLinha.Ponto_do_meio: ponto2d;
Begin
  Result.x := (Ax + Bx) / 2;
  Result.y := (Ay + By) / 2;
end;

function TLinha.PontoExtremo(Pt: ponto2d): ponto2d;
var
  a, b, c, d: double;
Begin
  a := (Ax - pt.x) * (Ax - pt.x);
  b := (Ay - pt.y) * (Ay - pt.y);
  C := (Bx - pt.x) * (Bx - pt.x);
  D := (By - pt.y) * (By - pt.y);
  if sqrt(A + B) > sqrt(C + D) then
  Begin
    Result.x := Bx;
    Result.y := By;
  end
  else
  Begin
    Result.x := Ax;
    Result.y := Ay;
  end;

end;

function TLinha.PontoNaReta: ponto2d;
Begin

end;

function TLinha.Inside(a,b:ponto2d): boolean;
Begin
  // ax,ay,bx,by

  Result:=(aX >= A.X) and (aX <= B.X) and (aY >= A.Y) and (aY <= B.Y);

  Result:=(bX >= A.X) and (bX <= B.X) and (bY >= A.Y) and (bY <= B.Y);




end;

procedure TLinha.DeslocarPara(Dx, Dy: double);
Begin
  Ax:=ax+dx;
  Ay:=ay+dy;
  Bx:=bx+dx;
  By:=by+dy;
end;
{ TCxp }
procedure TCxp.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TCxp.Setnumero(AValue: integer);
Begin
  if Fnumero=AValue then Exit;
  Fnumero:=AValue;
end;

procedure TCxp.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TCxp.SetSimbologia(AValue: string);
Begin
  if FSimbologia=AValue then Exit;
  FSimbologia:=AValue;
end;

constructor TCxp.Create;
Begin
  inherited;
end;

{ TCd }

procedure TCd.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TCd.Setnumero(AValue: integer);
Begin
  if Fnumero=AValue then Exit;
  Fnumero:=AValue;
end;

procedure TCd.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TCd.SetSimbologia(AValue: string);
Begin
  if FSimbologia=AValue then Exit;
  FSimbologia:=AValue;
end;

constructor TCd.Create;
Begin
  inherited;
end;

{ TTomada }

procedure TTomada.Setcircuito(AValue: integer);
Begin
  if Fcircuito = AValue then Exit;
  Fcircuito := AValue;
end;

procedure TTomada.SetFP(AValue: double);
Begin
  if FFP = AValue then Exit;
  FFP := AValue;
end;

procedure TTomada.SetIp(AValue: double);
Begin
  if FIp = AValue then Exit;
  FIp := AValue;
end;

procedure TTomada.SetNf(AValue: integer);
Begin
  if FNf = AValue then Exit;
  FNf := AValue;
end;

procedure TTomada.Setposicao(AValue: integer);
Begin
  if Fposicao = AValue then Exit;
  Fposicao := AValue;
end;

procedure TTomada.Setposicaoparede(AValue: paredeposicao);
Begin
  if Fposicaoparede = AValue then Exit;
  Fposicaoparede := AValue;
end;

procedure TTomada.Setpotencia(AValue: integer);
Begin
  if Fpotencia = AValue then Exit;
  Fpotencia := AValue;
end;

procedure TTomada.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TTomada.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TTomada.SetQuedaTensao(AValue: double);
Begin
  if FQuedaTensao = AValue then Exit;
  FQuedaTensao := AValue;
end;

procedure TTomada.Setrendimento(AValue: double);
Begin
  if Frendimento = AValue then Exit;
  Frendimento := AValue;
end;

procedure TTomada.SetSimbologia(AValue: string);
Begin
  if FSimbologia=AValue then Exit;
  FSimbologia:=AValue;
end;

procedure TTomada.calculos;
Begin
  //Calculo corrente de projeto;
  {  = Corrente de projeto;
  = Potência nominal, em W (informada no cadastro da peça);
 = número de fases do circuito;
Para circuitos com esquema F+N, F+F o valor é 1;
Para circuitos com esquema 3F+N o valor é 3;
Para circuitos com esquema 3F o valor é ;
 = Tensão;
Para circuitos com esquema F+N e 3F+N é utilizado o valor de tensão de fase;
Para circuitos com esquema F+F e 3F é utilizado o valor de tensão de linha;
 = Fator de potência (informado no cadastro da peça);
 = Rendimento (informado no cadastro da peça);
  In= Pn/(Nf*V*Cos(fi)*rendimento)
  }
  self.Ip := self.potencia / (self.nf * self.FP * self.rendimento * self.tensao);
end;

procedure TTomada.SetTensao(AValue: integer);
Begin
  if FTensao = AValue then Exit;
  FTensao := AValue;
end;

constructor TTomada.Create;
Begin
  inherited;
end;

{ TInterruptor }

procedure TInterruptor.Setacionamento(AValue: char);
Begin
  if Facionamento = AValue then Exit;
  Facionamento := AValue;
end;

procedure TInterruptor.Setacionamento_id(AValue: integer);
Begin
  if Facionamento_id = AValue then Exit;
  Facionamento_id := AValue;
end;

procedure TInterruptor.Setcircuito(AValue: integer);
Begin
  if Fcircuito = AValue then Exit;
  Fcircuito := AValue;
end;

procedure TInterruptor.SetFP(AValue: double);
Begin
  if FFP = AValue then Exit;
  FFP := AValue;
end;

procedure TInterruptor.SetIp(AValue: double);
Begin
  if FIp = AValue then Exit;
  FIp := AValue;
end;

procedure TInterruptor.SetNf(AValue: integer);
Begin
  if FNf = AValue then Exit;
  FNf := AValue;
end;

procedure TInterruptor.Setpotencia(AValue: integer);
Begin
  if Fpotencia = AValue then Exit;
  Fpotencia := AValue;
end;

procedure TInterruptor.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TInterruptor.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TInterruptor.Setrendimento(AValue: double);
Begin
  if Frendimento = AValue then Exit;
  Frendimento := AValue;
end;

procedure TInterruptor.SetSimbologia(AValue: string);
Begin
  if FSimbologia=AValue then Exit;
  FSimbologia:=AValue;
end;

procedure TInterruptor.Settensao(AValue: integer);
Begin
  if Ftensao = AValue then Exit;
  Ftensao := AValue;
end;

constructor TInterruptor.Create;
Begin
  inherited;
end;

{ TIluminacao }

procedure TIluminacao.Setacionamento(AValue: char);
Begin
  if Facionamento = AValue then Exit;
  Facionamento := AValue;
end;

procedure TIluminacao.Setacionamento_id(AValue: integer);
Begin
  if Facionamento_id = AValue then Exit;
  Facionamento_id := AValue;
end;

procedure TIluminacao.Setcircuito(AValue: integer);
Begin
  if Fcircuito = AValue then Exit;
  Fcircuito := AValue;
end;

procedure TIluminacao.SetFP(AValue: double);
Begin
  if FFP = AValue then Exit;
  FFP := AValue;
end;

procedure TIluminacao.SetIp(AValue: double);
Begin
  if FIp = AValue then Exit;
  FIp := AValue;
end;

procedure TIluminacao.SetNf(AValue: integer);
Begin
  if FNf = AValue then Exit;
  FNf := AValue;
end;

procedure TIluminacao.Setpotencia(AValue: integer);
Begin
  if Fpotencia = AValue then Exit;
  Fpotencia := AValue;
end;

procedure TIluminacao.SetPx(AValue: double);
Begin
  if FPx = AValue then Exit;
  FPx := AValue;
end;

procedure TIluminacao.SetPy(AValue: double);
Begin
  if FPy = AValue then Exit;
  FPy := AValue;
end;

procedure TIluminacao.SetQuedaTensao(AValue: double);
Begin
  if FQuedaTensao=AValue then Exit;
  FQuedaTensao:=AValue;
end;

procedure TIluminacao.Setrendimento(AValue: double);
Begin
  if Frendimento = AValue then Exit;
  Frendimento := AValue;
end;

procedure TIluminacao.SetSimbologia(AValue: string);
Begin
  if FSimbologia=AValue then Exit;
  FSimbologia:=AValue;
end;

procedure TIluminacao.Settensao(AValue: integer);
Begin
  if Ftensao = AValue then Exit;
  Ftensao := AValue;
end;

constructor TIluminacao.Create;
Begin
  inherited;
end;

destructor TIluminacao.Destroy;
Begin
  inherited;
end;

procedure TIluminacao.calculos;
Begin
  self.Ip := self.potencia / (self.nf * self.FP * self.rendimento * self.tensao);
end;

{ TTubulacao }

procedure TTubulacao.SetComprimento(AValue: double);
Begin
  if FComprimento = AValue then Exit;
  FComprimento := AValue;
end;

procedure TTubulacao.SetAx(AValue: double);
Begin
  if FAx=AValue then Exit;
  FAx:=AValue;
end;

procedure TTubulacao.SetAy(AValue: double);
Begin
  if FAy=AValue then Exit;
  FAy:=AValue;
end;

procedure TTubulacao.SetBezier(AValue: boolean);
Begin
  if FBezier=AValue then Exit;
  FBezier:=AValue;
end;

procedure TTubulacao.SetBx(AValue: double);
Begin
  if FBx=AValue then Exit;
  FBx:=AValue;
end;

procedure TTubulacao.SetBy(AValue: double);
Begin
  if FBy=AValue then Exit;
  FBy:=AValue;
end;

procedure TTubulacao.SetB_P_x1(AValue: double);
Begin
  if FB_P_x1=AValue then Exit;
  FB_P_x1:=AValue;
end;

procedure TTubulacao.SetB_P_x2(AValue: double);
Begin
  if FB_P_x2=AValue then Exit;
  FB_P_x2:=AValue;
end;

procedure TTubulacao.SetB_P_y1(AValue: double);
Begin
  if FB_P_y1=AValue then Exit;
  FB_P_y1:=AValue;
end;

procedure TTubulacao.SetB_P_y2(AValue: double);
Begin
  if FB_P_y2=AValue then Exit;
  FB_P_y2:=AValue;
end;

procedure TTubulacao.SetDiametro(AValue: double);
Begin
  if FDiametro = AValue then Exit;
  FDiametro := AValue;
end;

procedure TTubulacao.SetObjFin(AValue: integer);
Begin
  if FObjFin = AValue then Exit;
  FObjFin := AValue;

end;

procedure TTubulacao.SetObjFin_X(AValue: double);
Begin
  if FObjFin_X = AValue then Exit;
  FObjFin_X := AValue;
  FAx:=AValue;
  Atualizar;
end;

procedure TTubulacao.SetObjFin_Y(AValue: double);
Begin
  if FObjFin_Y = AValue then Exit;
  FObjFin_Y := AValue;
    FAy:=AValue;
  Atualizar;
end;

procedure TTubulacao.SetObjIni(AValue: integer);
Begin
  if FObjIni = AValue then Exit;
  FObjIni := AValue;

end;

procedure TTubulacao.SetObjIni_X(AValue: double);
Begin
  if FObjIni_X = AValue then Exit;
  FObjIni_X := AValue;
  Fbx:=AValue;
  Atualizar;
end;

procedure TTubulacao.SetObjIni_Y(AValue: double);
Begin
  if FObjIni_Y = AValue then Exit;
  FObjIni_Y := AValue;
  FBy:=AValue;
  Atualizar;
end;

procedure TTubulacao.Atualizar;
Begin
  self.Comprimento := (self.ObjFin_X - self.ObjIni_X) * (self.ObjFin_X - self.ObjIni_X);
  self.Comprimento := self.Comprimento + (self.ObjFin_Y - self.ObjIni_Y) *
    (self.ObjFin_Y - self.ObjIni_Y);
  self.Comprimento := sqrt(self.Comprimento);
end;

constructor TTubulacao.Create;
Begin
  inherited;
end;

{ TCircuito }
procedure TCircuito.SetDfio(AValue: double);
Begin
  if FDfio = AValue then Exit;
  FDfio := AValue;
end;

procedure TCircuito.SetDfioSel(AValue: double);
Begin
  if FDfioSel=AValue then Exit;
  FDfioSel:=AValue;
end;

procedure TCircuito.SetDisjuntor(AValue: integer);
Begin
  if FDisjuntor=AValue then Exit;
  FDisjuntor:=AValue;
end;

procedure TCircuito.SetEsquema(AValue: Esqlig);
Begin
  if FEsquema = AValue then Exit;
  FEsquema := AValue;
end;




procedure TCircuito.SetExtensao(AValue: double);
Begin
  if FExtensao = AValue then Exit;
  FExtensao := AValue;
end;

procedure TCircuito.SetFases(AValue: Tfases);
Begin
  if FFases = AValue then Exit;
  FFases := AValue;
end;

procedure TCircuito.SetFCA(AValue: double);
Begin
  if FFCA = AValue then Exit;
  FFCA := AValue;
end;

procedure TCircuito.SetFCT(AValue: double);
Begin
  if FFCT = AValue then Exit;
  FFCT := AValue;
end;

procedure TCircuito.SetIfio(AValue: double);
Begin
  if FIfio=AValue then Exit;
  FIfio:=AValue;
end;



procedure TCircuito.SetIprojeto(AValue: double);
Begin
  if FIprojeto = AValue then Exit;
  FIprojeto := AValue;
end;

procedure TCircuito.SetIsolacao(AValue: Tipo_isolacao);
Begin
  if FIsolacao = AValue then Exit;
  FIsolacao := AValue;
end;

procedure TCircuito.SetMetodoInst(AValue: Metodo_De_instalacao);
Begin
  if FMetodoInst = AValue then Exit;
  FMetodoInst := AValue;
  if FMetodoInst = A then  FMetodoInsttexto :=
      'A-B1, Condutores isolados ou cabos unipolares em eletroduto de seção circular embutido em alvenaria';
  if FMetodoInst = B then  FMetodoInsttexto :=
      'B-B2, Cabo multipolar em eletroduto de seção circular embutido em alvenaria';
  if FMetodoInst = C then  FMetodoInsttexto :=
      'C-A1, Condutores isolados ou cabos unipolares em eletroduto de seção circular embutido em parede termicamente isolante';
  if FMetodoInst = D then  FMetodoInsttexto :=
      'D-A2, Cabo multipolar em eletroduto de seção circular embutido em parede termicamente isolante';
  if FMetodoInst = E then  FMetodoInsttexto :=
      'E-B1, Condutores isolados ou cabos unipolares em eletroduto aparente de seção circular sobre parede ou espaçado desta menos de 0,3 vez o diâmetro do eletroduto';
  if FMetodoInst = F then  FMetodoInsttexto :=
      'F-B2, Cabo multipolar em eletroduto aparente de seção circular sobre parede ou espaçado desta menos de 0,3 vez o diâmetro do eletroduto';
  if FMetodoInst = G then  FMetodoInsttexto :=
      'G-B1, Condutores isolados ou cabos unipolares em eletroduto aparente de seção não-circular sobre parede';
  if FMetodoInst = H then  FMetodoInsttexto :=
      'H-B2, Cabo multipolar em eletroduto aparente de seção não-circular sobre parede';
end;

procedure TCircuito.SetMetodoInsttexto(AValue: string);
Begin
  if FMetodoInsttexto = AValue then Exit;
  FMetodoInsttexto := AValue;
end;

procedure TCircuito.SetPer_ocup_ele(AValue: double);
Begin
  if FPer_ocup_ele=AValue then Exit;
  FPer_ocup_ele:=AValue;
end;

procedure TCircuito.SetPotencia_instalada(AValue: integer);
Begin
  if FPotencia_instalada=AValue then Exit;
  FPotencia_instalada:=AValue;
end;


procedure TCircuito.SetQtensao(AValue: double);
Begin
  if FQtensao = AValue then Exit;
  FQtensao := AValue;
end;



procedure TCircuito.SetQuadro(AValue: integer);
Begin
  if FQuadro = AValue then Exit;
  FQuadro := AValue;
end;

procedure TCircuito.SetTempAmbiente(AValue: integer);
Begin
  if FTempAmbiente = AValue then Exit;
  FTempAmbiente := AValue;
end;

procedure TCircuito.SetTensao(AValue: Ttensao);
Begin
  if FTensao = AValue then Exit;
  FTensao := AValue;
end;



procedure TCircuito.SetTipoAlimentacao(AValue: TipoAli);
Begin
  if FTipoAlimentacao = AValue then Exit;
  FTipoAlimentacao := AValue;
end;

procedure TCircuito.SetTipoLigacao(AValue: double);
Begin
  if FTipoLigacao = AValue then Exit;
  FTipoLigacao := AValue;
end;

procedure TCircuito.Calculos;
Begin
  //Calculo corrente de projeto;
  {  = Corrente de projeto;
  = Potência nominal, em W (informada no cadastro da peça);
 = número de fases do circuito;
Para circuitos com esquema F+N, F+F o valor é 1;
Para circuitos com esquema 3F+N o valor é 3;
Para circuitos com esquema 3F o valor é ;
 = Tensão;
Para circuitos com esquema F+N e 3F+N é utilizado o valor de tensão de fase;
Para circuitos com esquema F+F e 3F é utilizado o valor de tensão de linha;
 = Fator de potência (informado no cadastro da peça);
 = Rendimento (informado no cadastro da peça);
  In= Pn/(Nf*V*Cos(fi)*rendimento)
  }
  //calculo corrente corrigida
  // corrente de projeto / (FCA*FCT)

end;



constructor TCircuito.Create;
Begin
  inherited;//herdada
end;

{ TFio }

procedure TFio.SetObjetoInicial(AValue: integer);
Begin
  if FObjetoInicial = AValue then Exit;
  FObjetoInicial := AValue;
end;

procedure TFio.SetTubo(AValue: integer);
Begin
  if FTubo = AValue then Exit;
  FTubo := AValue;
end;

constructor TFio.Create;
Begin
  inherited;//herdada
end;

end.
