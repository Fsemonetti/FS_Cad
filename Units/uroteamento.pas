unit Uroteamento;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses Classes, Dialogs, SysUtils;

type

  { TCidade }

  TCidade = class(TObject)
    Codigo: integer;
    Nome: string;
    CustoAcumulado: real;
    Predecessora: TCidade;
    constructor Criar(InitCod: integer; InitNome: string);
    destructor Liberar;
  end;

  TRodovia = class(TObject)
    Origem, Destino: TCidade;
    Distancia: real;
    constructor Criar(InitOrigem, InitDestino: TCidade; InitDist: real);
    destructor Liberar;
  end;

  TRede = class(TObject)
    ListaCidades, ListaRodovias, Caminho: TList;
    Origem, Destino: TCidade;
    constructor Ler(ArqCidade, ArqRodo: string; aa, bb: integer);
    destructor Liberar;
    procedure EncontrarCaminho(var arquivo: textfile);
    function BuscaNaLista(UmCodigo: integer): tCidade;
  end;

implementation

var
  i: integer;
  UmaRodo: tRodovia;
  UmaCidade: tCidade;
  Temp: real;

constructor TCidade.Criar(InitCod: integer; InitNome: string);
Begin
  Codigo := InitCod;
  Nome := InitNome;
  CustoAcumulado := 1E+30;
  Predecessora := nil;
end;

destructor TCidade.Liberar;
Begin
  //inherited;
end;

constructor tRodovia.Criar(InitOrigem, InitDestino: TCidade; InitDist: real);
Begin
  Origem := InitOrigem;
  Destino := InitDestino;
  Distancia := InitDist;
end;

destructor tRodovia.Liberar;
Begin
  //  inherited
end;

constructor tRede.Ler(ArqCidade, ArqRodo: string; aa, bb: integer);
var
  Arq: TextFile;
  InitCod, i, j: integer;
  Dist: real;
  InitNome: string;
  Cid1, Cid2, UmaCidade: tCidade;
  UmaRodo: tRodovia;
Begin
  ListaCidades := TList.Create;
  AssignFile(Arq, ArqCidade);
  Reset(Arq);
  while not EOF(Arq) do
  Begin
    Readln(Arq, InitCod, InitNome);
    UmaCidade := tCidade.Criar(InitCod, InitNome);
    ListaCidades.Add(UmaCidade);  // Armazeno cidades
    // form1.Memo2.lines.add(InitNome);
  end;
    closefile(Arq);
    ListaRodovias := TList.Create;
  AssignFile(Arq, ArqRodo);
  Reset(Arq);
  while not EOF(Arq) do
  Begin
    Readln(Arq, i, j, Dist);
    Cid1 := BuscaNaLista(i);
    Cid2 := BuscaNaLista(j);
    UmaRodo := tRodovia.Criar(Cid1, Cid2, Dist);
    ListaRodovias.Add(UmaRodo);  // armazena rodovias
    UmaRodo := tRodovia.Criar(Cid2, Cid1, Dist);
    ListaRodovias.Add(UmaRodo);
  end;
  CloseFile(Arq);
  Origem := BuscaNaLista(aa);
  Destino := BuscaNaLista(bb);
end;

destructor tRede.Liberar;
var
  UmaCidade: tCidade;
  UmaRodo: tRodovia;
Begin
  while ListaRodovias.Count > 0 do
  Begin
    UmaRodo := ListaRodovias.First;
    ListaRodovias.Remove(UmaRodo);
    UmaRodo.Liberar;
  end;

  while ListaCidades.Count > 0 do
  Begin
    UmaCidade := ListaCidades.First;
    ListaCidades.Remove(UmaCidade);
    UmaCidade.Liberar;
  end;
end;

procedure tRede.EncontrarCaminho(var arquivo: textfile);
var
  ListaPesquisa: TList;


  function SelecionarCidadeMinimoCusto: TCidade;
  var
    Minimo: real;
    i: integer;
    CidadeAux: tCidade;
  Begin
    Minimo := 1E+30;
    Result := nil;
    for i := 0 to ListaPesquisa.Count - 1 do
    Begin
      CidadeAux := ListaPesquisa.Items[i];
      if CidadeAux.CustoAcumulado < Minimo then
      Begin
        Result := CidadeAux;
        Minimo := CidadeAux.CustoAcumulado;
      end;
    end;
  end;

  procedure ApresentaCaminho(var arquivo: textfile);
  var
    UmaCidade: tCidade;
    i: integer;
  Begin
    i := 1;
    UmaCidade := Destino;
    while UmaCidade <> nil do
    Begin
      writeln(arquivo, trim(trim(destino.nome) + '=' + trim(umacidade.nome)));
      UmaCidade := UmaCidade.Predecessora;
      Inc(i);
    end;
  end;

Begin
  ListaPesquisa := TList.Create;
  ListaPesquisa.Add(Origem);
  Origem.CustoAcumulado := 0;
  UmaCidade := SelecionarCidadeMinimoCusto;
  while (UmaCidade <> nil) and (UmaCidade <> Destino) do
  Begin
    ListaPesquisa.Remove(UmaCidade);
    for i := 0 to ListaRodovias.Count - 1 do
    Begin
      UmaRodo := ListaRodovias.Items[i];
      if (UmaRodo.Origem = UmaCidade) then
      Begin
        Temp := UmaCidade.CustoAcumulado + UmaRodo.Distancia;
        if Temp < UmaRodo.Destino.CustoAcumulado then
        Begin
          UmaRodo.Destino.CustoAcumulado := Temp;
          UmaRodo.Destino.Predecessora := UmaCidade;
          if ListaPesquisa.IndexOf(UmaRodo.Destino) < 0 then
            ListaPesquisa.Add(UmaRodo.Destino);
        end;
      end;
    end;
    UmaCidade := SelecionarCidadeMinimoCusto;
  end;
  if UmaCidade <> nil then ApresentaCaminho(arquivo);
  Origem.CustoAcumulado := 1E+30;
  //for i:=ListaPesquisa.Count-1 downto 0 do  listaPesquisa.Remove(listapesquisa.Items[i]);
end;

function tRede.BuscaNaLista(UmCodigo: integer): tCidade;
var
  UmaCidade: tCidade;
  i: integer;
Begin
  Result := nil;
  i := 0;
  while (i < ListaCidades.Count) and (Result = nil) do
  Begin
    UmaCidade := ListaCidades.Items[i];
    if UmaCidade.Codigo = UmCodigo then
      Result := UmaCidade
    else
      Inc(i);
  end;
end;

end.
