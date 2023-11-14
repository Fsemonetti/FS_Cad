unit Utabelas;

{$mode objfpc}{$H+}

interface



const
  MI_A1 =
    'condutores isolados em eletroduto de seção circular embutido em parede termicamente isolante';
  MI_A2 =
    'cabo multipolar em eletroduto de seção circular embutido em parede termicamente isolante';
  MI_B1 = 'condutores isolados em eletroduto de seção circular sobre parede de madeira';
  MI_B2 = 'cabo multipolar em eletroduto de seção circular sobre parede de madeira';
  MI_C = 'cabos unipolares ou cabo multipolar sobre parede de madeira';
  MI_D = 'cabo multipolar em eletroduto enterrado no solo';
  MI_E = 'cabo multipolar ao ar livre';
  MI_F = 'cabos unipolares justapostos (na horizontal, na vertical ou em trifólio) ao ar livre';
  MI_G = 'cabos unipolares espaçados ao ar livre.';




//Tabela 33 􀂲 Tipos de linhas elétricas
function Tabela33_5410(modelo: integer): string;

//  Fatores de correção para temperaturas ambientes diferentes
//  de 30ºC para linhas não-subterrâneas e de 20ºC
//  (temperatura do solo) para linhas subterrâneas
function Tabela40_5410(tipo: integer; modelo: integer; Temperatura: integer): double;


// Fatores de correção aplicáveis a condutores agrupados em feixe (em linhas abertas ou
// fechadas) e a condutores agrupados num mesmo plano, em camada única
function Tabela42_5410(Numero_de_circuitos: integer; modelo: integer): double;


// secao reduzida do condutor neutro
function Tabela48_5410(secao: integer): double;

function tabela36(Corrente: double; Modo: integer; Var CorrenteCabo : double): double;


implementation

uses principal;

function tabela36(Corrente: double; Modo: integer;var CorrenteCabo:double): double;
var
 a : array[1..12] of double = (7,7,7,7,9,8,9,8,10,9,12,10);
 b : array[1..12] of double = (9,9,9,9,11,10,11,10,13,11,15,12);
 c : array[1..12] of double = (11,10,11,10,14,12,13,12,15,14,18,15);
 d : array[1..12] of double = (14.5,13.5,14,13,17.5,15.5,16.5,15,19.5,17.5,22,18);
 e : array[1..12] of double = (19.5,18,18.5,17.5,24,21,23,20,27,24,29,24);
 f : array[1..12] of double = (26,24,25,23,32,28,30,27,36,32,38,31);
 g : array[1..12] of double = (34,31,32,29,41,36,38,34,46,41,47,39);
 h : array[1..12] of double = (46,42,43,39,57,50,52,46,63,57,63,52);
 i : array[1..12] of double = (61,56,57,52,76,68,69,62,85,76,81,67);
 j : array[1..12] of double = (80,73,75,68,101,89,90,80,112,96,104,86);
  posicao : integer;
 // matriz: array[0..1, 0..1] of double = ((1,2),(3,4));

begin
{  A:=(7,7,7,7,9,8,9,8,10,9,12,10);
  B:=(9,9,9,9,11,10,11,10,13,11,15,12);
  C:=(11,10,11,10,14,12,13,12,15,14,18,15);
  D:=(14.5,13.5,14,13,17.5,15.5,16.5,15,19.5,17.5,22,18);
  E:=(19.5,18,18.5,17.5,24,21,23,20,27,24,29,24);
  F:=(26,24,25,23,32,28,30,27,36,32,38,31);
  G:=(34,31,32,29,41,36,38,34,46,41,47,39);
  H:=(46,42,43,39,57,50,52,46,63,57,63,52);
  I:=(61,56,57,52,76,68,69,62,85,76,81,67);
  J:=(80,73,75,68,101,89,90,80,112,96,104,86);}

{
0,5=A
0,75=B
1=C
1,5=D
2,5=E
4=F
6=G
10=H
16=I
25=J
A1/2=1
A1/3=2
A2/2=3
A2/3=4
B1/2=5
B1/3=6
B2/2=7
B2/3=8
C/2= 9
C/3=10
D/2=11
D/3=12
}

  posicao:= Modo;

  if A[posicao]>= corrente then
  Begin
  result:=0.5;
  CorrenteCabo:=A[posicao];
  exit;
  end;
  if B[posicao]>= corrente then
  Begin
  result:=0.75;
  CorrenteCabo:=B[posicao];
  exit;
  end;
  if C[posicao]>= corrente then
  Begin
  result:=1;
  CorrenteCabo:=C[posicao];
  exit;
  end;
  if D[posicao]>= corrente then
  Begin
  result:=1.5;
  CorrenteCabo:=D[posicao];
  exit;
  end;
  if E[posicao]>= corrente then
  Begin
  result:=2.5;
  CorrenteCabo:=E[posicao];
  exit;
  end;
  if F[posicao]>= corrente then
  Begin
  result:=4;
  CorrenteCabo:=F[posicao];
  exit;
  end;
  if G[posicao]>= corrente then
  Begin
  result:=6;
  CorrenteCabo:=G[posicao];
  exit;
  end;
  if H[posicao]>= corrente then
  Begin
  result:=10;
  CorrenteCabo:=H[posicao];
  exit;
  end;
  if I[posicao]>= corrente then
  Begin
  result:=16;
  CorrenteCabo:=I[posicao];
  exit;
  end;
  if J[posicao]>= corrente then
  Begin
  result:=25;
  CorrenteCabo:=J[posicao];
  exit;
  end;

result:=-1;
CorrenteCabo:=0;





end;

function Tabela40_5410(tipo: integer; modelo: integer; Temperatura: integer): double;
begin
  Result := -1;
  if tipo = 1 then   // ambiente
  begin
    case temperatura of
      // modelo 1 é pvc , modelo 2 e   EPR ou XLPE
      10: if modelo = 1 then Result := 1.22
        else if modelo = 2 then Result := 1.15;
      15: if modelo = 1 then Result := 1.17
        else if modelo = 2 then Result := 1.12;
      20: if modelo = 1 then Result := 1.12
        else if modelo = 2 then Result := 1.08;
      25: if modelo = 1 then Result := 1.06
        else if modelo = 2 then Result := 1.04;
      35: if modelo = 1 then Result := 0.96
        else if modelo = 2 then Result := 0.96;
      40: if modelo = 1 then Result := 0.94
        else if modelo = 2 then Result := 0.91;
      45: if modelo = 1 then Result := 0.79
        else if modelo = 2 then Result := 0.87;
      50: if modelo = 1 then Result := 0.71
        else if modelo = 2 then Result := 0.82;
      55: if modelo = 1 then Result := 0.61
        else if modelo = 2 then Result := 0.76;
      60: if modelo = 1 then  if modelo = 2 then Result := 0.71;
      65: if modelo = 1 then  if modelo = 2 then Result := 0.65;
      70: if modelo = 1 then  if modelo = 2 then Result := 0.58;
      75: if modelo = 1 then  if modelo = 2 then Result := 0.50;
      80: if modelo = 1 then  if modelo = 2 then Result := 0.41;
    end;
    exit;
  end;
  if tipo = 2 then   // solo
  begin
    case temperatura of
      // modelo 1 é pvc , modelo 2 e   EPR ou XLPE
      10: if modelo = 1 then Result := 1.10
        else if modelo = 2 then Result := 1.07;
      15: if modelo = 1 then Result := 1.05
        else if modelo = 2 then Result := 1.04;
      20: if modelo = 1 then Result := 0.95
        else if modelo = 2 then Result := 0.96;
      25: if modelo = 1 then Result := 0.89
        else if modelo = 2 then Result := 0.93;
      35: if modelo = 1 then Result := 0.84
        else if modelo = 2 then Result := 0.89;
      40: if modelo = 1 then Result := 0.77
        else if modelo = 2 then Result := 0.85;
      45: if modelo = 1 then Result := 0.71
        else if modelo = 2 then Result := 0.80;
      50: if modelo = 1 then Result := 0.63
        else if modelo = 2 then Result := 0.76;
      55: if modelo = 1 then Result := 0.55
        else if modelo = 2 then Result := 0.71;
      60: if modelo = 1 then Result := 0.45
        else if modelo = 2 then Result := 0.65;
      65: if modelo = 1 then  if modelo = 2 then Result := 0.60;
      70: if modelo = 1 then  if modelo = 2 then Result := 0.53;
      75: if modelo = 1 then  if modelo = 2 then Result := 0.46;
      80: if modelo = 1 then  if modelo = 2 then Result := 0.38;
    end;
  end;
end;


function Tabela42_5410(Numero_de_circuitos: integer; modelo: integer): double;
begin
  Result := -1;
  if modelo = 1 then
    // Em feixe: ao ar livre ou  sobre superfície;embutidos; em conduto fechado
  begin
    case Numero_de_circuitos of    //Número de circuitos ou de cabos multipolares
      1: if modelo = 1 then Result := 1;
      2: if modelo = 1 then Result := 0.8;
      3: if modelo = 1 then Result := 0.7;
      4: if modelo = 1 then Result := 0.65;
      5: if modelo = 1 then Result := 0.60;
      6: if modelo = 1 then Result := 0.57;
      7: if modelo = 1 then Result := 0.54;
      8: if modelo = 1 then Result := 0.52;
    end;
    exit;
  end;
  if modelo = 2 then
    //  Camada única sobre parede, piso, ou em bandeja não perfurada ou prateleira
  begin
    case Numero_de_circuitos of  //Número de circuitos ou de cabos multipolares
      1: if modelo = 1 then Result := 1;
      2: if modelo = 1 then Result := 0.85;
      3: if modelo = 1 then Result := 0.79;
      4: if modelo = 1 then Result := 0.75;
      5: if modelo = 1 then Result := 0.73;
      6: if modelo = 1 then Result := 0.72;
      7: if modelo = 1 then Result := 0.72;
      8: if modelo = 1 then Result := 0.71;
    end;
    exit;
  end;

end;


function Tabela33_5410(modelo: integer): string;
begin
  Result := '-1';
  case modelo of
    1: Result := 'A1';
    2: Result := 'A2';
    3: Result := 'B1';
    4: Result := 'B2';
    5: Result := 'B1';
    6: Result := 'B2';
    7: Result := 'B1';
    8: Result := 'B2';
    9: Result := 'C';
{1  Condutores isolados ou cabos unipolares em  eletroduto de seção circular embutido em 1 parede termicamente isolante  A1
2  Cabo multipolar em eletroduto de seção circular  embutido em parede termicamente isolante  A2
3  Condutores isolados ou cabos unipolares em  eletroduto aparente de seção circular   B1
4  Cabo multipolar em eletroduto aparente de  seção circular  B2
5  Condutores isolados ou cabos unipolares em  eletroduto aparente de seção não circula  B1
6  Cabo multipolar em eletroduto aparente de  seção não circula  B2
7  Condutores isolados ou cabos unipolares em  eletroduto de seção circular embutido em alvenari  B1
8  Cabo multipolar em eletroduto de seção circular  embutido em alvenaria  B2
9  Cabos unipolares ou cabo multipolar sobre  parede  C}
  end;
end;

function Tabela48_5410(secao: integer): double;
begin
  Result := -1;
  case secao of
    35: Result := 25;
    50: Result := 25;
    70: Result := 35;
    95: Result := 50;
    120: Result := 70;
    150: Result := 70;
    185: Result := 95;
    240: Result := 120;
    300: Result := 150;
    400: Result := 185;
  end;

  if secao < 25 then Result := secao;
 {
 Seção dos condutores de fase mm2  Seção reduzida do condutor neutro mm2
25  S
35  25
50  25
70  35
95  50
120  70
150  70
185  95
240  120
300  150
400  185
As condições de utilização desta tabela são dadas em 6.2.6.2.6.
  }
end;




end.
