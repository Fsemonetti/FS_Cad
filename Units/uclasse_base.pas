unit Uclasse_base;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, typinfo, variants, BASE64, ComCtrls,StdCtrls;

type
  { MinhaClasse }
  MinhaClasse = class(TComponent)
  private
    FAngulo: double;
    FBloco: string;
    Fcor: integer;
    Fdescricao: string;
    FdescricaoAD: string;
    FDesenho: integer;
    FId_obj: integer;
    Flayer: integer;
    FLayerName: string;
    FLigado: boolean;
    FObjeto: string;
    FSelecionado: boolean;
    FSub_tipo: integer;
    Ftag: integer;
    FTipo: integer;
    procedure SetAngulo(AValue: double);
    procedure SetBloco(AValue: string);
    procedure Setcor(AValue: integer);
    procedure Setdescricao(AValue: string);
    procedure SetdescricaoAD(AValue: string);
    procedure SetDesenho(AValue: integer);
    procedure SetId_obj(AValue: integer);
    procedure Setlayer(AValue: integer);
    procedure SetLayerName(AValue: string);
    procedure SetLigado(AValue: boolean);
    procedure SetObjeto(AValue: string);
    procedure SetSelecionado(AValue: boolean);
    procedure SetSub_tipo(AValue: integer);
    procedure Settag(AValue: integer);
    procedure SetTipo(AValue: integer);
  public
    procedure GravarEmArquivo(var arquivo: textfile; Sender: TObject);
   procedure  ListarObjeto(Destino: Tmemo; Sender: TObject);

  published
    property Id_obj: integer read FId_obj write SetId_obj;
    property layer: integer read Flayer write Setlayer;
    property cor: integer read Fcor write Setcor;
    property tag: integer read Ftag write Settag;
    property descricao: string read Fdescricao write Setdescricao;
    property descricaoAD: string read FdescricaoAD write SetdescricaoAD;
    property Ligado: boolean read FLigado write SetLigado;
    property Tipo: integer read FTipo write SetTipo;
    property Sub_tipo: integer read FSub_tipo write SetSub_tipo;
    property Angulo: double read FAngulo write SetAngulo;
    property Desenho: integer read FDesenho write SetDesenho;
    property Objeto: string read FObjeto write SetObjeto;
    property Selecionado : boolean read FSelecionado write SetSelecionado;
    property Bloco : string read FBloco write SetBloco;
    property LayerName : string read FLayerName write SetLayerName;
  public
    constructor Create;
    destructor Destroy;
  end;


implementation


{ MinhaClasse }
procedure MinhaClasse.Setcor(AValue: integer);
Begin
  if Fcor = AValue then Exit;
  Fcor := AValue;
end;

procedure MinhaClasse.SetAngulo(AValue: double);
Begin
  if FAngulo = AValue then Exit;
  FAngulo := AValue;
end;

procedure MinhaClasse.SetBloco(AValue: string);
Begin
  if FBloco=AValue then Exit;
  FBloco:=AValue;
end;

procedure MinhaClasse.Setdescricao(AValue: string);
Begin
  if Fdescricao = AValue then Exit;
  Fdescricao := AValue;
end;

procedure MinhaClasse.SetdescricaoAD(AValue: string);
Begin
  if FdescricaoAD = AValue then Exit;
  FdescricaoAD := AValue;
end;

procedure MinhaClasse.SetDesenho(AValue: integer);
Begin
  if FDesenho = AValue then Exit;
  FDesenho := AValue;
end;

procedure MinhaClasse.SetId_obj(AValue: integer);
Begin
  if FId_obj = AValue then Exit;
  FId_obj := AValue;
end;

procedure MinhaClasse.Setlayer(AValue: integer);
Begin
  if Flayer = AValue then Exit;
  Flayer := AValue;
end;

procedure MinhaClasse.SetLayerName(AValue: string);
Begin
  if FLayerName=AValue then Exit;
  FLayerName:=AValue;
end;

procedure MinhaClasse.SetLigado(AValue: boolean);
Begin
  if FLigado = AValue then Exit;
  FLigado := AValue;
end;

procedure MinhaClasse.SetObjeto(AValue: string);
Begin
  if FObjeto = AValue then Exit;
  FObjeto := AValue;
end;

procedure MinhaClasse.SetSelecionado(AValue: boolean);
Begin
  if FSelecionado=AValue then Exit;
  FSelecionado:=AValue;
end;

procedure MinhaClasse.SetSub_tipo(AValue: integer);
Begin
  if FSub_tipo = AValue then Exit;
  FSub_tipo := AValue;
end;

procedure MinhaClasse.Settag(AValue: integer);
Begin
  if Ftag = AValue then Exit;
  Ftag := AValue;
end;

procedure MinhaClasse.SetTipo(AValue: integer);
Begin
  if FTipo = AValue then Exit;
  FTipo := AValue;
end;

procedure MinhaClasse.GravarEmArquivo(var arquivo: textfile; Sender: TObject);
type
  registro = record
    objeto, nome, tipo, valor: string;
  end;

var
  Count, Loop: integer;
  List: PPropList;
  PropInfo: PPropInfo;
  ValorF: double;
  valor: integer;
  UmValor: registro;
Begin
  writeln(arquivo, Sender.ClassName);
  UmValor.objeto := Sender.ClassName;
  //Count := GetPropList(TypeInfo(Self.ClassName), tkAny, nil);
  Count := GetPropList(Sender.ClassInfo, tkAny, nil);
  GetMem(List, Count * SizeOf(PPropInfo));
  try
    GetPropList(Sender.ClassInfo, tkAny, List);
    writeln(arquivo, IntToStr(Count));
    for Loop := 0 to Pred(Count) do
    Begin
      PropInfo := List^[Loop];
      //   writeln(arquivo,PropInfo^.PropType^.Name);
      if (PropInfo^.PropType^.Kind = tkInteger) then
        //se a propriedade guarda valor inteiro
      Begin
        Valor := GetPropValue(Sender, List^[Loop]^.Name);
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkInteger');
        writeln(arquivo, (IntToStr(Valor)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkInteger';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkFloat) then
        //se a propriedade guarda valor pont flutuante
      Begin
        ValorF := GetPropValue(Sender, List^[Loop]^.Name);
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkFloat');
        writeln(arquivo, (floattostr(ValorF)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkFloat';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkAString) then
        //se a propriedade guarda valor ansi string
      Begin
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkAString');
        writeln(arquivo, GetPropValue(Sender, List^[Loop]^.Name));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkAString';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkChar) then
        //se a propriedade guarda valor ansi string
      Begin
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkChar');
        writeln(arquivo, GetPropValue(Sender, List^[Loop]^.Name));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkChar';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkbool) then
        //se a propriedade guarda valor ansi string
      Begin
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkbool');
        writeln(arquivo, booltostr(GetPropValue(Sender, List^[Loop]^.Name)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkbool';
        UmValor.valor := IntToStr(Valor);
      end;
      //tkEnumeration
      if (PropInfo^.PropType^.Kind = tkEnumeration) then
        //se a propriedade guarda valor enumerado posicionado em uma lista
      Begin
        writeln(arquivo, List^[Loop]^.Name);
        writeln(arquivo, 'tkEnumeration');
        writeln(arquivo, (GetPropValue(Sender, List^[Loop]^.Name)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkEnumeration';
        UmValor.valor := IntToStr(Valor);
      end;
    end;
  finally
    FreeMem(List, Count * SizeOf(PPropInfo));
  end;
end;

procedure MinhaClasse.ListarObjeto(Destino: Tmemo; Sender: TObject);
 type
  registro = record
    objeto, nome, tipo, valor: string;
  end;
var
  Count, Loop: integer;
  List: PPropList;
  PropInfo: PPropInfo;
  ValorF: double;
  valor: integer;
  UmValor: registro;
Begin
  Destino.lines.add( Sender.ClassName);
  UmValor.objeto := Sender.ClassName;
  //Count := GetPropList(TypeInfo(Self.ClassName), tkAny, nil);
  Count := GetPropList(Sender.ClassInfo, tkAny, nil);
  GetMem(List, Count * SizeOf(PPropInfo));
  try
    GetPropList(Sender.ClassInfo, tkAny, List);
    Destino.lines.add(IntToStr(Count));
    for Loop := 0 to Pred(Count) do
    Begin
      PropInfo := List^[Loop];
      //   Destino.lines.add('PropInfo^.PropType^.Name);
      if (PropInfo^.PropType^.Kind = tkInteger) then
        //se a propriedade guarda valor inteiro
      Begin
        Valor := GetPropValue(Sender, List^[Loop]^.Name);
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkInteger');
        Destino.lines.add( (IntToStr(Valor)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkInteger';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkFloat) then
        //se a propriedade guarda valor pont flutuante
      Begin
        ValorF := GetPropValue(Sender, List^[Loop]^.Name);
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkFloat');
        Destino.lines.add( (floattostr(ValorF)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkFloat';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkAString) then
        //se a propriedade guarda valor ansi string
      Begin
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkAString');
        Destino.lines.add( GetPropValue(Sender, List^[Loop]^.Name));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkAString';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkChar) then
        //se a propriedade guarda valor ansi string
      Begin
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkChar');
        Destino.lines.add( GetPropValue(Sender, List^[Loop]^.Name));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkChar';
        UmValor.valor := IntToStr(Valor);
      end;
      if (PropInfo^.PropType^.Kind = tkbool) then
        //se a propriedade guarda valor ansi string
      Begin
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkbool');
        Destino.lines.add( booltostr(GetPropValue(Sender, List^[Loop]^.Name)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkbool';
        UmValor.valor := IntToStr(Valor);
      end;
      //tkEnumeration
      if (PropInfo^.PropType^.Kind = tkEnumeration) then
        //se a propriedade guarda valor enumerado posicionado em uma lista
      Begin
        Destino.lines.add( List^[Loop]^.Name);
        Destino.lines.add( 'tkEnumeration');
        Destino.lines.add( (GetPropValue(Sender, List^[Loop]^.Name)));
        UmValor.nome := List^[Loop]^.Name;
        UmValor.tipo := 'tkEnumeration';
        UmValor.valor := IntToStr(Valor);
      end;
    end;
  finally
    FreeMem(List, Count * SizeOf(PPropInfo));
  end;
end;

constructor MinhaClasse.Create;
Begin
  inherited;
end;

destructor MinhaClasse.Destroy;
Begin
  inherited;
end;


end.
