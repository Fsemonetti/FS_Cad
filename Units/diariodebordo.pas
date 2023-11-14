unit DiarioDeBordo;

{$mode ObjFPC}{$H+}

interface


implementation

end.
{


procedure TForm1.Button1Click(Sender: TObject);

var

  W: Integer;

Begin

  Canvas.Font.Name  := Panel1.Font.Name;

  Canvas.Font.Style := Panel1.Font.Style;

  Canvas.Font.Size  := Panel1.Font.Size;



  while Canvas.TextWidth(Edit1.Text) >= (Panel1.Width - 10) do

    Canvas.Font.Size := Canvas.Font.Size - 1;



  while (Canvas.TextWidth(Edit1.Text) <= (Panel1.Width - 50)) and (Canvas.TextHeight(Edit1.Text)



<= (Panel1.Height - 5)) do

    Canvas.Font.Size := Canvas.Font.Size + 1;



  Panel1.Font.Size := Canvas.Font.Size;

  Panel1.Caption   := Edit1.Text;

end;



{in  [5,6,7,9] then exit;

procedure TFrPrincipal.desenha_FIO(Fio: entidade; cor: integer;selecao:boolean);
var
  meio, final: ponto2d;
Begin
  if cor = 1 then  workplace.Canvas.Pen.Style := psdot;
  meio.x := fio.bx;
  meio.y := fio.by;
  final := meio;
  final.x := final.x + 0.25;
  desenha_linha_na_telaR(meio,final,clwhite);
  // era 0 em vez de cor
  if cor > 0 then
    FrPrincipal.desenha_blip(final, clwhite);
  meio.y := meio.y + 0.07;
  meio.x := meio.x + 0.08;
  if cor > 0 then
  Begin
    if fio.AnguloInicial = 23 then
      desenha_texto(meio, 0.07, 0, '2.5', cor,'Untitled1');
    if fio.AnguloInicial = 22 then
      desenha_texto(meio, 0.07, 0, '1.5', cor,'Untitled1');
    meio.y := meio.y - 0.28;
    meio.x := meio.x + 0.05;
    if fio.AnguloInicial = 23 then
      desenha_texto(meio, 0.07, 0, IntToStr(round(fio.AnguloFinal)), cor,'Untitled1');
    if fio.AnguloInicial = 22 then
      desenha_texto(meio, 0.07, 0, IntToStr(round(fio.AnguloFinal)), cor,'Untitled1');
  end;
  meio.x := fio.bx;
  meio.y := fio.by;
  final := meio;
  final.x := final.x + 0.40;
  //fase
  meio.x := meio.x + 0.1;
  final.x := meio.x;
  final.y := meio.y + 0.08;
  meio.y := meio.y - 0.08;
  desenha_linha_na_telaR(meio,final,clwhite);
  //neutro
  meio.x := meio.x + 0.06;
  final.x := final.x + 0.06;
  desenha_linha_na_telaR(meio,final,clwhite);
  meio := final;
  meio.x := meio.x - 0.04;
  desenha_linha_na_telaR(meio,final,clwhite);
  // terra
  final.x := final.x + 0.06;
  final.y := final.y - 0.16;
  meio := final;
  meio.y := meio.y + 0.16;
  desenha_linha_na_telaR(meio,final,clwhite);
  meio.x := meio.x - 0.03;
  final := meio;
  final.x := meio.x + 0.06;
  desenha_linha_na_telaR(meio,final,clwhite);
  workplace.Canvas.Pen.Style := pssolid;
end;



}


Problem With Solution
If P (-2, 1), Q (2, 3) and R (-2, -4) are three points, find the angle between the straight lines PQ and QR.

The slope of PQ is given by

m = ( y2 – y1 ) / (x2 – x1)

m =( 3 – 1 ) / (2 – (-2 ))

m= 2/4

Therefore, m1=1/2

The slope of QR is given by

m= (−4−3) / (−2−2)

m= 7/4

Therefore, m2 = 7/4

Substituting the values of m2 and m1 in the formula for the angle between two lines when we know the slopes of two sides, we have,

tan θ=± (m2 – m1 ) / (1+m1m2)

tan θ=± ((7/4) – (1/2) ) / (1+ (1/2)(7/4))

tan θ=± (2/3)

Therefore,  θ = tan -1 (⅔)

Learn more about the angle between two lines and related topics from analytic geometry in a simple way. Register with BYJU’S – The Learning App today.

















...Perpendicular distance from Point to Segment in 2D?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (10):


function PntToSegmentDistance(Px, Py, x1, y1, x2, y2: Double): Double;
var
  Ratio: Double;
  Dx: Double;
  Dy: Double;
Begin
  if IsEqual(x1, x2) and IsEqual(y1, y2) then
  Begin
    Result := Distance(Px, Py, x1, y1);
  end
  else
  Begin
    Dx    := x2 - x1;
    Dy    := y2 - y1;
    Ratio := ((Px - x1) * Dx + (Py - y1) * Dy) / (Dx * Dx + Dy * Dy);
    if Ratio < 0 then Result := Distance(Px, Py, x1, y1)
    else if Ratio > 1 then Result := Distance(Px, Py, x2, y2)
    else
      Result := Distance(Px, Py, (1 - Ratio) * x1 + Ratio * x2,
        (1 - Ratio) * y1 + Ratio * y2);
  end;
end;
(* End PntToSegmentDistance *)



Note: Distance is simple pythagoras distance routine

// calcule la distance entre 1 point et 1 droite (bidimensionnel)

...Perpendicular from Point to Segment in 2D?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (11):


procedure PerpendicularPntToSegment(x1, y1, x2, y2, Px, Py: Double; var Nx, Ny: Double);
var
  R: Double;
  Dx: Double;
  Dy: Double;
Begin
  Dx := x2 - x1;
  Dy := y2 - y1;
  R  := ((Px - x1) * Dx + (Py - y1) * Dy) / Sqr(Dx * Dx + Dy * Dy);
  Nx := x1 + R * Dx;
  Ny := y1 + R * Dy;
end;
(* End PerpendicularPntSegment *)

// trouve la perpendiculaire entre un point et une droite (2D)



...Determine the point at which two 2D segments intersect?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (9):


procedure IntersectPoint(x1, y1, x2, y2, x3, y3, x4, y4: Double; var Nx, Ny: Double);
var
  R: Double;
  dx1, dx2, dx3: Double;
  dy1, dy2, dy3: Double;
Begin
  dx1 := x2 - x1;
  dx2 := x4 - x3;
  dx3 := x1 - x3;

  dy1 := y2 - y1;
  dy2 := y1 - y3;
  dy3 := y4 - y3;

  R := dx1 * dy3 - dy1 * dx2;

  if R <> 0 then
  Begin
    R  := (dy2 * (x4 - x3) - dx3 * dy3) / R;
    Nx := x1 + R * dx1;
    Ny := y1 + R * dy1;
  end
  else
  Begin
    if Collinear(x1, y1, x2, y2, x3, y3) then
    Begin
      Nx := x3;
      Ny := y3;
    end
    else
    Begin
      Nx := x4;
      Ny := y4;
    end;
  end;
end;



function Collinear(x1, y1, x2, y2, x3, y3: Double): Boolean;
Begin
  Result := (((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) = 0);
end;
(* End Of Collinear *)

// calcule le point d'intersection de 2 droites bidimensionnelles

 
...Determine if two 2d segments intersect?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (17):


function Intersect(x1, y1, x2, y2, x3, y3, x4, y4: Double): Boolean;
Begin
  Result := (Orientation(x1, y1, x2, y2, x3, y3) <> Orientation(x1, y1, x2, y2, x4, y4))
    and
    (Orientation(x3, y3, x4, y4, x1, y1) <> Orientation(x3, y3, x4, y4, x2, y2));
end;
(* End Of SegmentIntersect *)

function Orientation(x1, y1, x2, y2, Px, Py: Double): Integer;
var
  Orin: Double;
Begin
  (* Linear determinant of the 3 points *)
  Orin := (x2 - x1) * (py - y1) - (px - x1) * (y2 - y1);

  if Orin > 0.0 then Result := +1    (* Orientaion is to the right-hand side  *)
  else if Orin < 0.0 then Result := -1  (* Orientaion is to the left-hand side   *)
  else
    Result := 0;                  (* Orientaion is neutral if result is 0  *)
end;
(* End Of Orientation *)

// vérifier si 2 droites bidimensionnelles se coupent


...Determine if 3 points are collinear in 2D?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (15):


function Collinear(x1, y1, x2, y2, x3, y3: Double): Boolean;
Begin
  Result := (((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) = 0);
end;
(* End Of Collinear *)

// vérifier si 3 points appartiennent à une même droite bidimensionnelle
// c.a.d s'ils sont alignés.
...Determine if 3 points are collinear in 3D?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (23):


function Collinear(x1, y1, z1, x2, y2, z2, x3, y3, z3: Double): Boolean;
var
  Dx1, Dx2: Double;
  Dy1, Dy2: Double;
  Dz1, Dz2: Double;
  Cx, Cy, Cz: Double;
  //Var AB,AC,BC:Double;
Begin
  {find the difference between the 2 points P2 and P3 to P1 }
  Dx1 := x2 - x1;
  Dy1 := y2 - y1;
  Dz1 := z2 - z1;

  Dx2 := x3 - x1;
  Dy2 := y3 - y1;
  Dz2 := z3 - z1;

  {perform a 3d cross product}
  Cx := Dy1 * Dz2 - Dy2 * Dz1;
  Cy := Dx2 * Dz1 - Dx1 * Dz2;
  Cz := Dx1 * Dy2 - Dx2 * Dy1;

  Result := IsEqual(Cx * Cx + Cy * Cy + Cz * Cz, 0.0);

 {
  Note:
   The method below is very stable and logical, however at the same time
   it is "VERY" inefficient, it requires 3 SQRTs which is not acceptable...
 Result:=False;
 AB:=Distance(x1,y1,z1,x2,y2,z2);
 AC:=Distance(x1,y1,z1,x3,y3,z3);
 BC:=Distance(x2,y2,z2,x3,y3,z3);

 If (AB+AC) = BC Then Result:=True
  Else
   If (AB+BC) = AC Then Result:=True
    Else
     If (AC+BC) = AB Then Result:=True;
 }
end;
(* End Of Collinear *)

// vérifier si 3 points appartiennent à une même droite tridimensionnelle
// c.a.d s'ils sont alignés.







...get the perpendicular point on segment from external point?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (11):


{---------------------------------------------------------------------
Two routines are made available, the first takes into account a segment
and will produce point on the given segment that is of least distance
to an external point.

The second routine is similar to the first other than the fact that it
will extended the given segment into a ray and hence also produce a point
on the ray which will produce a segment of least distance between that
point and an external point, the segment produced between the point on
the ray and the external point is guaranteed to be perpendicular to the
ray in all cases except for the instance where the external point is
collinear to ray.

Both routines come from the computational geometry library
FastGEO (url: http://fastgeo.partow.net)
---------------------------------------------------------------------}

procedure PerpendicularPntToSegment(const x1, y1, x2, y2, Px, Py: Double;
  out Nx, Ny: Double);
var
  Ratio: Double;
  Dx: Double;
  Dy: Double;
Begin
  Dx    := x2 - x1;
  Dy    := y2 - y1;
  Ratio := ((Px - x1) * Dx + (Py - y1) * Dy) / (Dx * Dx + Dy * Dy);
  if Ratio < 0 then
  Begin
    Nx := x1;
    Ny := y1;
  end
  else if Ratio > 1 then
  Begin
    Nx := x2;
    Ny := y2;
  end
  else
  Begin
    Nx := x1 + (Ratio * Dx);
    Ny := y1 + (Ratio * Dy);
  end;
end;
(* End PerpendicularPntSegment *)



procedure PerpendicularPntToLine(const Rx1, Ry1, Rx2, Ry2, Px, Py: Double;
  out Nx, Ny: Double);
var
  Ratio: Double;
  Gr1, Gr2: Double;
  Gr3, Gr4: Double;
Begin
  (*  The ray is defined by the coordinate pairs (Rx1,Ry1) and (Rx2,Ry2) *)
  if NotEqual(Rx1, Rx2) then
    Gr1 := (Ry2 - Ry1) / (Rx2 - Rx1)
  else
    Gr1 := 1e300;
  Gr3 := Ry1 - Gr1 * Rx1;
  if NotEqual(Gr1, 0) then
  Begin
    Gr2   := -1 / Gr1;
    Gr4   := Py - (Gr2 * Px);
    Ratio := (Gr4 - Gr3) / (Gr1 - Gr2);
    Nx    := Ratio;
    Ny    := (Gr2 * Ratio) + Gr4;
  end
  else
  Begin
    Nx := Px;
    Ny := Ry2;
  end;
end;
(* End PerpendicularPntToLine *)



    ...Determine if two segments are intersecting?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (12):


function Intersect(const x1, y1, x2, y2, x3, y3, x4, y4: Double): Boolean;
var
  UpperX: Double;
  UpperY: Double;
  LowerX: Double;
  LowerY: Double;
  Ax: Double;
  Bx: Double;
  Cx: Double;
  Ay: Double;
  By: Double;
  Cy: Double;
  D: Double;
  F: Double;
  E: Double;
Begin
  Result := False;

  Ax := x2 - x1;
  Bx := x3 - x4;

  if Ax < 0.0 then
  Begin
    LowerX := x2;
    UpperX := x1;
  end
  else
  Begin
    UpperX := x2;
    LowerX := x1;
  end;

  if Bx > 0.0 then
  Begin
    if (UpperX < x4) or (x3 < LowerX) then
      Exit;
  end
  else if (Upperx < x3) or (x4 < LowerX) then
    Exit;

  Ay := y2 - y1;
  By := y3 - y4;

  if Ay < 0.0 then
  Begin
    LowerY := y2;
    UpperY := y1;
  end
  else
  Begin
    UpperY := y2;
    LowerY := y1;
  end;

  if By > 0.0 then
  Begin
    if (UpperY < y4) or (y3 < LowerY) then
      Exit;
  end
  else if (UpperY < y3) or (y4 < LowerY) then
    Exit;

  Cx := x1 - x3;
  Cy := y1 - y3;
  d  := (By * Cx) - (Bx * Cy);
  f  := (Ay * Bx) - (Ax * By);

  if f > 0.0 then
  Begin
    if (d < 0.0) or (d > f) then
      Exit;
  end
  else if (d > 0.0) or (d < f) then
    Exit;

  e := (Ax * Cy) - (Ay * Cx);

  if f > 0.0 then
  Begin
    if (e < 0.0) or (e > f) then
      Exit;
  end
  else if (e > 0.0) or (e < f) then
    Exit;

  Result := True;

(*

  Simple method, yet not so accurate for certain situations and a little more
  inefficient (roughly 19.5%).
  Result := (
  ((Orientation(x1,y1, x2,y2, x3,y3) * Orientation(x1,y1, x2,y2, x4,y4)) <= 0) and
  ((Orientation(x3,y3, x4,y4, x1,y1) * Orientation(x3,y3, x4,y4, x2,y2)) <= 0)
  );
*)
end;
(* End of SegmentIntersect *)











...Determine if a point exists within a triangle?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (20):


function PointInTriangle(const Px, Py, x1, y1, x2, y2, x3, y3: Double): Boolean;
var
  Or1: Integer;
  Or2: Integer;
  Or3: Integer;
Begin
  Or1 := Orientation(x1, y1, x2, y2, Px, Py);
  Or2 := Orientation(x2, y2, x3, y3, Px, Py);
  Or3 := Orientation(x3, y3, x1, y1, Px, Py);

  if (Or1 = Or2) and (Or2 = Or3) then
    Result := True
  else if Or1 = 0 then
    Result := (Or2 = 0) or (Or3 = 0)
  else if Or2 = 0 then
    Result := (Or1 = 0) or (Or3 = 0)
  else if Or3 = 0 then
    Result := (Or2 = 0) or (Or1 = 0)
  else
    Result := False;
end;
(* End of PointInTriangle *)



function Orientation(const x1, y1, x2, y2, Px, Py: Double): Integer;
var
  Orin: Double;
Begin
  (* Linear determinant of the 3 points *)
  Orin := (x2 - x1) * (py - y1) - (px - x1) * (y2 - y1);

  if Orin > 0.0 then
    Result := +1             (* Orientaion is to the right-hand side *)
  else if Orin < 0.0 then
    Result := -1             (* Orientaion is to the left-hand side  *)
  else
    Result := 0;             (* Orientaion is neutral aka collinear  *)
end;
(* End of Orientation *)


 ...Determine the incenter of 3 pionts?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (12):


procedure Incenter(const x1, y1, x2, y2, x3, y3: Double; out Px, Py: Double);
var
  Perim: Double;
  Side12: Double;
  Side23: Double;
  Side31: Double;
Begin
  Side12 := Distance(x1, y1, x2, y2);
  Side23 := Distance(x2, y2, x3, y3);
  Side31 := Distance(x3, y3, x1, y1);

  (* Using Heron's S=UR *)
  Perim := 1.0 / (Side12 + Side23 + Side31);
  Px    := (Side23 * x1 + Side31 * x2 + Side12 * x3) * Perim;
  Py    := (Side23 * y1 + Side31 * y2 + Side12 * y3) * Perim;
end;
(* End of Incenter *)


function Distance(const x1, y1, x2, y2: Double): Double;
var
  dx: Double;
  dy: Double;
Begin
  dx     := x2 - x1;
  dy     := y2 - y1;
  Result := Sqrt(dx * dx + dy * dy);
end;
(* End of Distance *)


















...Determine The circumcenter of 3 points?
Autor: Arash Partow
Homepage: http://www.partow.net
[ Print tip ]

Tip Rating (19):


procedure Circumcenter(const x1, y1, x2, y2, x3, y3: Double; out Px, Py: Double);
var
  A: Double;
  C: Double;
  B: Double;
  D: Double;
  E: Double;
  F: Double;
  G: Double;
Begin
  A := x2 - x1;
  B := y2 - y1;
  C := x3 - x1;
  D := y3 - y1;
  E := A * (x1 + x2) + B * (y1 + y2);
  F := C * (x1 + x3) + D * (y1 + y3);
  G := 2.0 * (A * (y3 - y2) - B * (x3 - x2));
  if IsEqual(G, 0.0) then Exit;
  Px := (D * E - B * F) / G;
  Py := (A * F - C * E) / G;
end;
(* End of Circumcenter *)

















  //  showmessage(no.text);
//  b:=copy(no.Text, 1, 1);
//  showmessage(b);
  if copy(no.Text, 3, 1) = '-' then
  Begin
    f:= pos('-',no.Text,1);
    B :=Copy(no.text,f+1,length(no.text)-f+1);
    //Copy(no.text,f+1,length(no.text)-f+1);
   // ShowMessage(b);

   r:=strtoint(b);
    for f := lista.Count - 1 downto 0 do
      if minhaclasse(lista.items[f]).tipo = 33 then
      if Tcircuito(lista.items[f]).tag=r then
      Begin
        listapro.TIObject := minhaclasse(lista.items[f]);
        ObjetoCorrenteNoGrid:= minhaclasse(lista.items[f]).Id_obj;
      end;
  end;


if objetoTipo = 'TCircuito' then

    Begin

        PropInfo := GetPropInfo(TCircuito.ClassInfo,NomeProp);
if PropInfo <> nil then
      SetPropValue(NovoCircuito, NomeProp, Propvalor)
else
 showmessage('gg');
end;







    end;




Determinação da corrente de projeto;   - Realizado.
Determinação da corrente corrigida;    - Realizado.
Determinação da seção da fiação através do critério da capacidade de condução de corrente;
Verificação da seção mínima admissível;
Verificação do critério da concessionária;
Verificação da coordenação fiação - disjuntor;
Verificação da queda de tensão parcial.



  RegisterPropertyEditor(TypeInfo(TAnchorSide), TControl, 'AnchorSideLeft', THiddenPropertyEditor);

             //  showmessage(no.text);
//  b:=copy(no.Text, 1, 1);
//  showmessage(b);
  if copy(no.Text, 3, 1) = '-' then
  Begin
    f:= pos('-',no.Text,1);
    B :=Copy(no.text,f+1,length(no.text)-f+1);
    //Copy(no.text,f+1,length(no.text)-f+1);
   // ShowMessage(b);

   r:=strtoint(b);
    for f := lista.Count - 1 downto 0 do
      if minhaclasse(lista.items[f]).tipo = 33 then
      if Tcircuito(lista.items[f]).tag=r then
      Begin
        listapro.TIObject := minhaclasse(lista.items[f]);
        ObjetoCorrenteNoGrid:= minhaclasse(lista.items[f]).Id_obj;
      end;
  end;
  Uses TypInfo;

  Procedure SetReadOnlyProperty( forComponent: TComponent; value: Boolean
);
  Var
    PInfo: PPropInfo;
  Begin
    PInfo := GetPropInfo( forComponent.ClassInfo, 'readonly' );
    If Assigned( PInfo ) and (PInfo^.Proptype^.Kind = tkInteger) Then
      SetOrdProp( forComponent, PInfo, Ord(value));
  End;

Peter Below (TeamB)  100113.1...@compuserve.com)
No e-mail responses, please, unless explicitly requested!




   procedure DumpPropInfoExt(AClass: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProp: TRttiProperty;
  LPropInfo: PPropInfo;
  LField: TRttiField;
  LMethod: TRttiMethod;
Begin
  LType := LContext.GetType(AClass.ClassInfo);
  for LProp in LType.GetProperties() do
    if LProp is TRttiInstanceProperty then
    Begin
      LPropInfo := TRttiInstanceProperty(LProp).PropInfo;
      Writeln(Format('%-18s GetProc %p SetProc %p',
        [LProp.Name, LPropInfo.GetProc, LPropInfo.SetProc]));

      if LProp.IsReadable then
      Begin
        LField := LProp.GetterField;
        if LField <> nil then
          Writeln(Format('  Getter Field Name %s', [LField.Name]))
        else
        Begin
          LMethod := LProp.GetterMethod(AClass);
          if LMethod <> nil then
            Writeln(Format('  Getter Method Name %s', [LMethod.Name]))
        end;
      end;

      if LProp.IsWritable then
      Begin
        LField := LProp.SetterField;
        if LField <> nil then
          Writeln(Format('  Setter Field Name %s', [LField.Name]))
        else
        Begin
          LMethod := LProp.SetterMethod(AClass);
          if LMethod <> nil then
            Writeln(Format('  Setter Method Name %s', [LMethod.Name]))
        end;
      end;

    end;
end;












25/08/2021 - Quarta-feira

>Missão====> converter o formato do arquivo que guarda o caminho entre um objeto e o CD
atualemente está na forma que contem o objeto inicio e fim de cada tracho, vouj mudar para gravar so o index
da tubulação vai facilitar outras buscar futuras.
procedure TForm1.Caminhos_para_objetos; linha  1520
caminhos constuidos e fiações colocadadas - Pendencia não preciar carregar o arquivo cada vez que faz um caminho

02/11/2021 - Alterado na rotina que carrega o dxf para converter os valores importados em metros para precisão de cm .... 2.4567 > 2.46   no arquivo unit 2
           - Eliminado o mostrar parcil das quedas de tensão na unit1/399
           - criado a opção no menu para apagar ligações e fios na unit1
           -Criado objetos gravando em arquivo funcional e apagar eles , leitura do arquivo ainda não

03/11/2021 - Criar uma lista para o dxf. criado lista, mas não criei os objetos
             queda tensão correção parcial. depende das alterações na lista ainda pendente
            - Mostra propriedades do objetos via rtti parcial  - torcado tudo...
            -olhar linha 716 da unit1
            1031-1072 - unit1
            1137-1162 - unit1
            1236-1249 - unit1
            589 - unit1
            1076 - unit1
            618 unit1
            1253 unit1
            2188 unit1
            2215 unit1

            criado tipo 33
            então
            tipo = 33 é um objeto de desenho
            sub_Tipo = vai ter o tag que identifica componentes que são do desenho do objeto
            mudei a rotina de importar dxf para ler simbolo

462
464
471
472



  procedure TTubulacao.Atualizar;
Begin
  self.Comprimento:=(self.ObjFin_X-self.ObjIni_X)*(self.ObjFin_X-self.ObjIni_X);
  self.Comprimento:=self.Comprimento+(self.ObjFin_Y-self.ObjIni_Y)*(self.ObjFin_Y-self.ObjIni_Y);
  self.Comprimento:=sqrt(self.Comprimento);
end;







procedure TFrPrincipal.CfiacaoClick(Sender: TObject);
var
  ind, Obini, Obfin: integer;
  p_aux, p_aux2: ponto2d;
  texto, a, b: string;
  temp: entidade;
  locais, objetos,Tubos: textfile;
  encontrou: boolean;
  pigual: byte;
  potencia : double;
Procedure um_caminho;
  var
    circuito: integer;
  Begin
    // metodologia nova
    assignfile(Locais, 'caminhos.txt');
    reset(Locais);
    encontrou := False;
    {
     301=307
     301=505
     301=371
    }
    while (not (EOF(locais)) and (encontrou = False)) do
    Begin
      readln(locais, a); // pegar o primeiro objeto
      pigual := pos('=', a, 1);
      b := copy(a, 1, pigual - 1);
      if b = texto then   // texto tem o nome do tubo qu eo objeto passa
      Begin
        encontrou := True;
        obini := StrtoIntDEF(copy(a, 1, pigual - 1),1);
      end;
    end;
    // pegar o circuito do objeto
    Busca_por_indice(StrtoIntDEF(texto,1), temp);
    circuito := round(temp.circuito);
    potencia:=temp.Potencia;
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
      obfin := StrtoIntDEF(b,1);
      if Busca_por_tubulacao(obini, obfin, ind) = True then
        if Busca_por_indice(ind, temp) = True then
        Begin
         writeln(tubos,texto+'='+inttostr(ind));
          p_aux.x := temp.bx;
          p_aux.y := temp.by;
          p_aux2.x := temp.cx;
          p_aux2.y := temp.cy;
          if temp.TIPO = 17 then
          desenha_linha(FrPrincipal.workplace,toscreen(p_aux), toscreen(p_aux2), clblack, 0);
          if temp.TIPO = arco then
          Begin
            p_aux.x := temp.ax;
            p_aux.y := temp.ay;
            desenha_arc(p_aux, temp.Raio, temp.AnguloInicial, temp.AnguloFinal, clblack);
          end;
          // inicio do processo para adicionar o fio
          temp.TIPO := 29; // tipo fio
          temp.circuito := 0;
          temp.ay := 0;
          temp.bx := 0;
          temp.by := 0;
          temp.cx := 0;  // indice do tubo
          temp.cy := 0;
          temp.Tubulacao:=ind;
          temp.ObjetoInicial :=StrtoIntDEF(texto,1); // origem  objeto que começou o fio
          temp.raio := 0;
          temp.Potencia:=0;
          temp.Apagado := False;
          temp.AnguloInicial := 0;
          temp.AnguloFinal := 0;
          temp.texto := '';
          temp.layer := 1;
          Adiciona(temp, True,false,0);
        end;
      obini := obfin;
    end;
    closefile(Locais);
  end;

Begin
  assignfile(tubos,'CaminhosTubo.txt');
  rewrite(tubos);
  assignfile(objetos, 'cidades.txt');
  reset(objetos);
  while not (EOF(objetos)) do
  Begin
    readln(objetos, texto);
    pigual := pos(' ', texto, 1);
    b := copy(texto, pigual + 1, length(texto));
    texto := trim(b);
    um_caminho;
  end;
  closefile(objetos);
  closefile(tubos);
  cmdMemo.Lines.add('Fiação criada');
end;









 unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TypInfo, StdCtrls;

type

  TEnum1 = (vEnum1, vEnum2);
  TEnum2 = (v2Enum1, v2Enum2);


  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  public
    function GetNomeCampoAmigavel(eType: PTypeInfo; codigo: string; descArray: array of string): string;
    function GetNomeCampo(eType: PTypeInfo; codigo: integer): string;
    function MyValString(pMyVal: array of string):string;
  end;

const

  sTEnum1 : array[TEnum1] of string = ('Valor a', 'Valor B');
  sTEnum2 : array[TEnum2] of string = ('Valor enum 2 A', 'Valor enum 2 B');

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

function TForm1.GetNomeCampo(eType: PTypeInfo; codigo: integer): string;
Begin
  Result := GetEnumName(eType, codigo);
end;

function TForm1.GetNomeCampoAmigavel(eType: PTypeInfo; codigo: string; descArray: array of string): string;
var
   OrdTypeInfo: PTypeInfo;
   OrdTypeData: PTypeData;

   TypeNameStr: string;
   TypeKindStr: string;
   ix, MinVal, MaxVal: Integer;
Begin
     OrdTypeData := GetTypeData(eType);

     {- Get the type kind string }
     MinVal := OrdTypeData^.MinValue;
     MaxVal := OrdTypeData^.MaxValue;
     for ix := MinVal to MaxVal do
     Begin
        if GetEnumName(eType, ix) = codigo then
        Begin
          ShowMessage(descArray[ix]);
          Exit;
        end
     end
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  campo : string;
Begin
  campo := GetNomeCampo(TypeInfo(TEnum2), StrToInt(Edit1.Text));
  ShowMessage(campo);
  GetNomeCampoAmigavel(TypeInfo(TEnum2),campo,sTEnum2);
end;

end.


     program Project1;

    uses
     TypInfo;

    type
      TTestRec=record
        dummy1:integer;
        dummy2:byte;
      end;

    procedure PrepareRecordTypeinfo(pti:PTypeInfo);
    var
       td:PTypeData;
       mf: PManagedField;
       i:integer;
    Begin
      if pti^.Kind<>tkRecord then
        exit;
      td:=GetTypeData(pti);
      mf:=@td^.TotalFieldCount;
      inc(pointer(mf),sizeof(td^.TotalFieldCount));
      for i:=0 to td^.TotalFieldCount-1 do
      Begin
        pti:=mf^.TypeRef;

        writeln(pti^.Name);
        inc(mf);
      end;
    end;

    Begin
      PrepareRecordTypeinfo(TypeInfo(TTestRec));
      readln;
    end.
 




procedure TFrPrincipal.arvoreClick(Sender: TObject);
var
  temp : ttreenode;
Begin
 temp:=arvore.Selected;
 showmessage(temp.Text);
   arvore.Items.AddChild(temp,'Fabricio');




//////////// fim do programaTamanho := Canvas.TextWidth(Caption);Re: xortext to a TCanvas
I have just dug this out for anyone interested.I have not checked it
through for elegance, but it seems to work for me.
procedure DrawTextXor (Canvas: TCanvas;
X, Y: integer;
Str: string);
var
Temp: TBitmap;
TempMode: TCopyMode;
Begin
Temp := TBitmap.Create;
try
Temp.Width := Canvas.TextWidth(Str);
Temp.Height := Canvas.TextHeight(Str);
Temp.Canvas.Brush.Color := clBlack;
Temp.Canvas.FillRect(rect(0, 0, Temp.Width, Temp.Height));
Temp.Canvas.Font.Assign(Canvas.Font);
//Temp.Canvas.Font.Color := (Temp.Canvas.Font.Color) Xor clWhite ;Temp.Canvas.Font.Color :=
(Temp.Canvas.Font.Color) xor
Canvas.Brush.Color;
Temp.Canvas.TextOut(0, 0, 'HI!');
TempMode := Canvas.CopyMode;
Canvas.CopyMode := cmSrcInvert;
Canvas.CopyRect(Rect(X, Y, X +Temp.Width, Y +Temp.Height), Temp.Canvas,
Rect(0, 0, Temp.Width, Temp.Height));
Canvas.CopyMode := TempMode;
finally
Temp.Free;
end;
end;
Problem / Question / Abstract: How to xor a font on a bitmap canvas
Answer: write the text to a (temporary) bitmap and copyrect that to the image:
procedure XORText(sheet: TCanvas;
x, y: integer;
text: string);
var
bmp: TBitmap;
r1, r2: TRect;
Begin
bmp := TBitmap.create;
try
with sheet do
Begin
bmp.Width := textWidth(text);
bmp.height := textheight(text);
r1 := rect(0, 0, bmp.Width, bmp.Height);
r2 := Rect(x, y, x + bmp.Width, y + bmp.Height);
bmp.canvas.font.assign(font);
bmp.canvas.brush.color := clBlack;
bmp.Canvas.fillrect(r1);
bmp.canvas.brush.style := bsClear;
bmp.canvas.textout(0, 0, text);
copymode := cmSrcInvert;
copyrect(r2, bmp.canvas, r1);
end;
finally
bmp.free;
end;




end;
    for g:=1 to blocos.count-1 do
     if  ( (minhaclasse(blocos.items[g]).bloco = bloco_Atual ) and (minhaclasse(blocos.items[g]).Tipo=43)) then
    Begin
      if  (minhaclasse(blocos.items[g]).objeto = 'TLinha')   then  frPrincipal.cmdMemo.Lines.Add('ok');



    end;



   alinhamento do texto
procedure TFrm_Form1.Stringgrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  vTxtSt : TTextStyle;
Begin
    if (ACol = 2) or (ACol = 3) or (ACol = 4)then
    Begin  // ACol is zero based
      vTxtSt := StringGrid1.Canvas.TextStyle;
      vTxtSt.Alignment := taCenter;
      vTxtSt.Layout := tlCenter;
      StringGrid1.Canvas.TextStyle := vTxtSt;
      StringGrid1.Canvas.TextRect(aRect,aRect.Left, aRect.Top,StringGrid1.Cells[aCol,aRow]);
    end;
end;




















 }
