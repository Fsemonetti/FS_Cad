unit conver;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}


interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,  ComCtrls,
  MaskEdit, ExtCtrls, Math, UObjetos;

procedure ReduceToRect(var A, B: Ponto2d);
procedure acha_equacao_da_linha(p1x, p1y, p2x, p2y: double; var a, b, c: double);
procedure acha_circulo(x1, y1, x2, y2, x3, y3: double; var valores: entidade);
procedure intersecao(a2, b2, c2, a1, b1, c1: double; var x, y: double);
procedure GravaLista_inteiro(variavel: string; valor: integer);
procedure GravaLista_double(variavel: string; valor: double);
procedure GravaLista_string(variavel: string; valor: string);
function ToScreen(pr: ponto2d): tpoint;
function ToWorld(pt: tpoint): ponto2d;
function SetWindowAndViewPort(Dxmin, Dxmax, Dymin, Dymax: double; Txmin, Txmax, Tymin, Tymax: integer): boolean;
function Rotate2D(aa: ponto2d; _Angulo: double): ponto2d;
function Rotate2DEmTorno(Ponto,Pivo: ponto2d; R: double): ponto2d;
function EscalaLinha(Pa, Pb: ponto2d; Escala: double): ponto2d;
function Para_Ponto_tela(a, b: double): tpoint; overload;
function Para_Ponto_tela(a, b: integer): tpoint; overload;
function AsciiToInt(Caracter: char): integer;
function IntToAscii(Numero: integer): char;
function anguloRetaAHorizontal(a, b: double; a1, b1: double): double;
function IntEntreLinhaCirculo(r: double; pa, pb: ponto2d): ponto2d;
function distancia_ponto_a_reta(f, g, h, x, y: double): double;
function d_dois_pontos(x, y, x1, y1: double): double;
function angulo_entre_setor_arco(cx, cy, x1, y1, x2, y2: double): double;
function DentroDoRetangulo(x1, y1, x2, y2, x3, y3: double): boolean;
function DentroDoCirculo(x1, y1, R, y2, x2: double): boolean;
function Sentido(var ax, ay, bx, by, cx, cy: double): double;
function isVertical(pa, pb: ponto2d): boolean;
function Dist_ponto_seg_arc(Pa, Pb: ponto2d; raio, A_i, A_f: double): double;
function LeLista_inteiro(variavel: string): integer;
function LeLista_double(variavel: string): double;
function LeLista_string(variavel: string): string;
function DistanciaSretaAoPonto(a, b, c: tpoint): double;
function PointInRect(A, B, P: Ponto2D): Boolean;






var
  GbPanx, GbPany: integer;
  dx_pan: integer;
  zoom: integer;
  Dmenorx, Dmaiorx, Dmenory, Dmaiory: double;
   MDmenorx, MDmaiorx, MDmenory, MDmaiory: double;
  TMenorx, Tmaiorx, Tmenory, TmaiorY: integer;
  Pmaiorx, Pmaiory, Pmenorx, Pmenory: double;
  Selecionado: integer;
  ScaleX, ScaleY: double;
  dis_cap: integer;


implementation

uses principal;

{
  Function ArcStartPoint(ByVal myArc As Arc) As Point3d

        Dim startWCS As CartesianCoordinateSystem
        startWCS = workPart.WCS.CoordinateSystem
        Dim startPT As Point3d = workPart.WCS.Origin


        Dim startPoint As Point3d

        workPart.WCS.SetOriginAndMatrix(myArc.CenterPoint, myArc.Matrix.Element)

        'start point
        startPoint.X = myArc.Radius * Math.Cos(myArc.StartAngle)
        startPoint.Y = myArc.Radius * Math.Sin(myArc.StartAngle)
        startPoint.Z = 0

        'convert point work coordinates to ACS
        Return WCS2Abs(startPoint)

        workPart.WCS.SetOriginAndMatrix(startPT, startWCS.Orientation.Element)

    End Function

    Function ArcEndPoint(ByVal myArc As Arc) As Point3d

        Dim startWCS As CartesianCoordinateSystem
        startWCS = workPart.WCS.CoordinateSystem

        Dim endPoint As Point3d

        workPart.WCS.SetOriginAndMatrix(myArc.CenterPoint, myArc.Matrix.Element)

        'end point
        startPoint.X = myArc.Radius * Math.Cos(myArc.StartAngle)
        startPoint.Y = myArc.Radius * Math.Sin(myArc.StartAngle)
        endPoint.X = myArc.Radius * Math.Cos(myArc.EndAngle)
        endPoint.Y = myArc.Radius * Math.Sin(myArc.EndAngle)
        endPoint.Z = 0

        'convert point work coordinates to ACS
        Return WCS2Abs(endPoint)

        workPart.WCS.SetOriginAndMatrix(New Point3d(0, 0, 0), startWCS.Orientation.Element)

    End Function

}

function PointInRect(A, B, P: Ponto2D): Boolean;
Begin
  Result:=(P.X >= A.X) and (P.X <= B.X) and (P.Y >= A.Y) and (P.Y <= B.Y);
end;

procedure ReduceToRect(var A, B: Ponto2d);
var
  T: double;
Begin
  if A.X > B.X then Begin T:=A.X; A.X:=B.X; B.X:=T; end;
  if A.Y > B.Y then Begin T:=A.Y; A.Y:=B.Y; B.Y:=T; end;
end;

function DistanciaSretaAoPonto(a, b, c: tpoint): double;
var
  dx, dy, t: double;
Begin
  dx := b.X - a.X;
  dy := b.Y - a.Y;
  if ((dx = 0) and (dy = 0)) then
  Begin
    dx := c.X - a.X;
    dy := c.Y - a.Y;
    Result := Sqrt(dx * dx + dy * dy);
    exit;
  end;
  t := ((c.X - a.X) * dx + (c.Y - a.Y) * dy);
  t := t / (dx * dx + dy * dy);
  if (t < 0) then
  Begin
    dx := c.X - a.X;
    dy := c.Y - a.Y;
  end
  else if (t > 1) then
  Begin
    dx := c.X - b.X;
    dy := c.Y - b.Y;
  end
  else
  Begin
    dx := c.X - (a.X + t * dx);
    dy := c.Y - (a.Y + t * dy);
  end;
  Result := Sqrt(dx * dx + dy * dy);
end;




function LeLista_inteiro(variavel: string): integer;
Begin
//  Result := StrToInt(Parametros.Values[variavel]);
end;

function LeLista_double(variavel: string): double;
Begin
 // Result := strtofloat(Parametros.Values[variavel]);
end;

function LeLista_string(variavel: string): string;
Begin
 // Result := Parametros.Values[variavel];
end;

procedure GravaLista_inteiro(variavel: string; valor: integer);
Begin
 // parametros.Values[variavel + '=' + IntToStr(valor)];
end;

procedure GravaLista_double(variavel: string; valor: double);
Begin
 // parametros.Values[variavel + '=' + floattostr(valor)];
end;

procedure GravaLista_string(variavel: string; valor: string);
Begin
 // parametros.Values[variavel + '=' + valor];
end;

function Dist_ponto_seg_arc(Pa, Pb: ponto2d; raio, A_i, A_f: double): double;
var
  a: double;
Begin
  a := d_dois_pontos(Pa.x, Pa.y, Pb.x, Pb.y);

  if a < raio then
    Result := 10;

end;

procedure acha_circulo(x1, y1, x2, y2, x3, y3: double; var valores: entidade);
var
  x12, x13, y21, x31, sx13, sy21, y12, y13, y31, x21, sy13, sx21, f,
  g, cc, h, k, ang, ang_inic: double;
  r: longword;
  oi, a: ponto2d;
  temponto: tpoint;
Begin
  a.x := x1;
  a.y := y1;
  x12 := x1 - x2;
  x13 := x1 - x3;
  y12 := y1 - y2;
  y13 := y1 - y3;
  y31 := y3 - y1;
  y21 := y2 - y1;
  x31 := x3 - x1;
  x21 := x2 - x1;
  sx13 := x1 * x1 - x3 * x3;
  sy13 := y1 * y1 - y3 * y3;
  sx21 := x2 * x2 - x1 * x1;
  sy21 := y2 * y2 - y1 * y1;
  if (2 * ((y31) * (x12) - (y21) * (x13))) <> 0 then
    f := ((sx13) * (x12) + (sy13) * (x12) + (sx21) * (x13) + (sy21) * (x13)) /
      (2 * ((y31) * (x12) - (y21) * (x13)));
  if (2 * ((x31) * (y12) - (x21) * (y13))) <> 0 then
    g := ((sx13) * (y12) + (sy13) * (y12) + (sx21) * (y13) + (sy21) * (y13)) /
      (2 * ((x31) * (y12) - (x21) * (y13)));
  cc := -(x1 * x1) - (y1 * y1) - 2 * g * x1 - 2 * f * y1;
  h := -g;
  k := -f;
  r := round(sqrt(h * h + k * k - cc));
  // ponto no primeiro quadrante
  if (A.x > h) and (A.y < k) then
  Begin
    ang_inic := angulo_entre_setor_arco(h, k, h + 100, k, x1, y1);
    ang := angulo_entre_setor_arco(h, k, x1, y1, x3, y3);
    valores.AnguloInicial := ang_inic;
    valores.AnguloFinal := ang;
  end;
  // ponto no segundo quadrante
  if (A.x < h) and (A.y < k) then
  Begin
    ang_inic := angulo_entre_setor_arco(h, k, h + 100, k, x1, y1);
    ang := angulo_entre_setor_arco(h, k, x1, y1, x3, y3);
    valores.AnguloInicial := ang_inic;
    valores.AnguloFinal := ang;
  end;
  // ponto no terceiro quadrante
  if (A.x < h) and (A.y > k) then
  Begin
    ang_inic := angulo_entre_setor_arco(h, k, h - 100, k, x1, y1);
    ang := angulo_entre_setor_arco(h, k, x1, y1, x3, y3);
    valores.AnguloInicial := 180 + ang_inic;
    valores.AnguloFinal := ang;
  end;
  // ponto no quarto quadrante
  if (A.x > h) and (A.y > k) then
  Begin
    ang_inic := angulo_entre_setor_arco(h, k, h + 100, k, x1, y1);
    ang_inic := 360 - ang_inic;
    ang := angulo_entre_setor_arco(h, k, x1, y1, x3, y3);
    valores.AnguloInicial := ang_inic;
    valores.AnguloFinal := ang;
  end;
  Temponto.x := round(h);
  Temponto.y := round(k);
  oi := ToWorld(Temponto);
  valores.TIPO := 4;
  valores.ax := oi.x;
  valores.ay := oi.y;
  Temponto.x := round(X1);
  Temponto.y := round(Y1);
  oi := ToWorld(Temponto);
  valores.apagado := False;
  valores.raio := d_dois_pontos(valores.ax, valores.ay, oi.x, oi.y);
end;

function isVertical(pa, pb: ponto2d): boolean;
Begin
  Result := False;
  if pa.y = pb.y then
    Result := True;
end;

function DentroDoRetangulo(x1, y1, x2, y2, x3, y3: double): boolean;
var
  troca: double;
Begin
  Result := False;
  if x1 > x2 then
  Begin
    troca := x1;
    x1 := x2;
    x2 := troca;
  end;
  if y1 > y2 then
  Begin
    troca := y1;
    y1 := y2;
    y2 := troca;
  end;
  if ((x3 > x1) and (x3 < x2)) then
    if ((y3 > y1) and (y3 < y2)) then
      Result := True;
end;

function DentroDoCirculo(x1, y1, R, y2, x2: double): boolean;
Begin
  Result := False;
  if d_dois_pontos(x1, y1, x2, y2) < R then
    Result := True;
end;

function Sentido(var ax, ay, bx, by, cx, cy: double): double;
var
  Bax, bay, bcx, bcy: double;
Begin
  bax := ax - bx;
  bay := ay - by;
  bcx := cx - bx;
  bcy := cy - by;
  Result := bax * bcy - bay * bcx;
  // 0 colineares
  // maior que zero horário
  // menor que zero anti horário
end;




function angulo_entre_setor_arco(cx, cy, x1, y1, x2, y2: double): double;
var
  Ma, Mb, VaxVb: double;
Begin
  Ma := sqrt((x1 - cx) * (x1 - cx) + (y1 - cy) * (y1 - cy));
  Mb := sqrt((x2 - cx) * (x2 - cx) + (y2 - cy) * (y2 - cy));
  VaxVb := ((x1 - cx) * (x2 - cx) + (y1 - cy) * (y2 - cy));
  Result := radtodeg(arccos(VaxVb / (Ma * Mb)));
end;

procedure intersecao(a2, b2, c2, a1, b1, c1: double; var x, y: double);
var
  ub: double;
Begin
  x := 0;
  y := 0;
  if (b1 = 0) and (b2 = 0) then
    exit;
  if (a1 = 0) and (a2 = 0) then
    exit;
  if (b2 = 0) then
  Begin
    x := -c2 / a2;
    y := (-a1 * X - c1) / b1;
  end
  else
  if (b1 = 0) then
  Begin
    x := -c1 / a1;
    y := (-a2 * X - c2) / b2;
  end
  else
  if (a1 = 0) then
  Begin
    y := -c1 / b1;
    x := (-b2 * y - c2) / a2;
  end
  else
  if (a2 = 0) then
  Begin
    y := -c2 / b2;
    x := (-b1 * y - c1) / a1;
  end
  else
  Begin
    { igualei o termo a1 e a das 2 eqc }
    { guardei o valor do coeficiente a antes de altera-lo }
    {a2:=a2*a1;}
    b2 := b2 * a1;
    c2 := c2 * a1;
    a1 := a1 * -a2;
    b1 := b1 * -a2;
    c1 := c1 * -a2;
    { somar os termos resultantes }
    a2 := b2 + b1;
    ub := c2 + c1;
    if a2 <> 0 then
      Y := -ub / a2; { achei y }
    if a1 <> 0 then
      x := (-b1 * y - c1) / a1;
    if ((a2 = 0) or (a1 = 0)) then
    Begin
      x := 0;
      y := 0;
    end;
  end;

end;

{ distancia de um ponto p1 a reta Ax+by+C=0; }
function distancia_ponto_a_reta(f, g, h, x, y: double): double;
var
  d, t: double;
Begin
  d := (f * x) + (g * Y) + h;
  d := abs(d);
  t := (sqrt((f * f) + (g * g)));
  if t <> 0 then
    d := d / t
  else
    d := 0;
  distancia_ponto_a_reta := d;
end;

{ distancia entre dois pontos p1 e p2 }
function d_dois_pontos(x, y, x1, y1: double): double;
Begin
  d_Dois_pontos := sqrt(sqr(x1 - x) + sqr(y1 - y));
end;

function angulo(a, b: double; a1, b1: double): double;
var
  aux, m1, m2, ang: double;
Begin
  m1 := -(a / b);
  m2 := -(a1 / b1);
  aux := 1 + (m1 * m2);
  if (m1 * m2 <> -1) then
  Begin
    ang := (m2 - m1) / aux;
    Result := arctan(ang) * (180 / (4 * arctan(1)));
  end
  else
    Result := 90;
end;

procedure acha_equacao_da_linha(p1x, p1y, p2x, p2y: double; var a, b, c: double);
Begin
  a := p1y - p2y;
  b := p2x - p1x;
  c := (p1x * p2y) - (p1y * p2x);
end;

function IntEntreLinhaCirculo(r: double; pa, pb: ponto2d): ponto2d;
var
  a, b, c: double;
Begin
  acha_equacao_da_linha(pa.x, pa.y, pb.x, pb.y, a, b, c);
  Result.x := -a * c / (a * a + b * b);
  Result.y := -b * c / (a * a + b * b);
end;

function anguloRetaAHorizontal(a, b: double; a1, b1: double): double;
var
  aux, m1, m2, ang: double;
Begin
  m1 := -(a / b);
  m2 := -(a1 / b1);
  aux := 1 + (m1 * m2);
  if (m1 * m2 <> -1) then
  Begin
    ang := (m2 - m1) / aux;
    Result := arctan(ang) * (180 / (4 * arctan(1)));
  end
  else
    Result := 90;
end;

function AsciiToInt(Caracter: char): integer;
var
  i: integer;
Begin
  i := 32;
  while i < 255 do
  Begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

function IntToAscii(Numero: integer): char;
Begin
  Result := Chr(Numero);
end;

function Para_Ponto_tela(a, b: double): tpoint; overload;
Begin
  Result.x := round(a);
  Result.y := round(b);
end;

function Para_Ponto_tela(a, b: integer): tpoint; overload;
Begin
  Result.x := a;
  Result.y := b;
end;

function ToScreen(pr: ponto2d): tpoint;
Begin
  if (scalex = 0) or (scaley = 0) then
    exit;
  Result.x := round(((Pr.x - Dmenorx) / scalex) + tmenorx) + Gbpanx;
  Result.y := round(((Pr.y - Dmenory) / scaley) + tmenory) - Gbpany;
end;

function ToWorld(pt: tpoint): ponto2d;
Begin
  Result.x := scalex * (pt.x - tmenorx - Gbpanx) + Dmenorx;
  Result.y := scaley * (pt.y - Tmenory + Gbpany) + Dmenory;
end;


function SetWindowAndViewPort(Dxmin, Dxmax, Dymin, Dymax: double;
  Txmin, Txmax, Tymin, Tymax: integer): boolean;
Begin
  Dmenorx := Dxmin;
  Dmaiorx := Dxmax;
  Dmenory := Dymin;
  Dmaiory := Dymax;
  Tmenorx := Txmin;
  Tmaiorx := Txmax;
  Tmenory := Tymin;
  Tmaiory := Tymax;
{
 rreal:=(Dmaiorx-Dmenorx)/(Dmaiory-Dmenory);
 rtela:=(Tmaiorx-Tmenorx)/(Tmaiory-Tmenory);

 if rreal>rtela then
 Begin
 end
 else
 Begin
 end;
}
  if (((Dmaiory - Dmenory) = 0) or ((Dmaiorx - Dmenorx) = 0)) then
    // proteger divisão por zero
    exit;
  Scalex := (Dmaiorx - Dmenorx) / (Tmaiorx - Tmenorx);
  Scaley := (Dmaiory - Dmenory) / (Tmaiory - Tmenory);
  if abs(scalex) > abs(scaley) then
    scaley := -scalex
  else
    scalex := -scaley;

end;

function Rotate2D(aa: ponto2d; _Angulo: double): ponto2d;
var
  angulo: double;
Begin
  angulo := _Angulo * (0.01745329251994329576923690768489);
  Result.x := aa.x * cos(angulo) - aa.y * sin(angulo);
  Result.y := aa.x * sin(angulo) + aa.y * cos(angulo);
     //frprincipal.cmdmemo.lines.add('angulo de '+floattostr(_angulo)+' x='+floattostr(round(result.x))+' Y='+floattostr(round(result.y)));

end;
function Rotate2DEmTorno(Ponto,Pivo: ponto2d; R: double): ponto2d;
var
  angulo,s,c: double;
  p : ponto2d;
Begin
    angulo := r * (0.01745329251994329576923690768489);
  s:= sin(angulo);
  c:= cos(angulo);
  ponto.x:=ponto.x- pivo.x;
  ponto.y:=ponto.y- pivo.y;
  result.x:=ponto.x * c - ponto.y * s+pivo.x;
  result.y:=ponto.x * s + ponto.y * c+pivo.y;
//    frprincipal.cmdmemo.lines.add('angulo de '+floattostr(r)+' x='+floattostr(round(result.x))+' Y='+floattostr(round(result.y)));
 end;

function EscalaLinha(Pa, Pb: ponto2d; Escala: double): ponto2d;
var
  Pd: ponto2d;
Begin
 // Pc.x := 0;
//  Pc.y := 0;
  Pd.x := Pb.x - Pa.x;
  Pd.y := Pb.y - Pa.y;
  Pd.x := (Pd.x * Escala);
  Pd.y := (Pd.y * Escala);
  Result.x := Pd.x + Pa.x;
  Result.y := Pd.y + Pa.y;
end;

Begin
  dx_pan := 0;
  zoom := 5;

end.
