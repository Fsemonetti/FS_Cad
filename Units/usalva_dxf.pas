
unit Usalva_dxf;

interface

uses SysUtils, Classes, Graphics, ComCtrls,
  LCLIntf, UObjetos, conver;

type
  // -----===== Starting Cs4DXFReadWrite.pas =====-----
  TSections = (scHeader, scClasses, scObjects, scThumbinalImage,
    scTables, scBlocks, scEntities, scUnknow);

  { Used to store readed groups from 0 group to 0 group. }
  TGroupTable = array[0..512] of variant;


  TLine2D = record
    a, b: ponto2d;
  end;

  TFrame2D = record
    SuperiorE, InferiorD: ponto2d;
  end;


  TDXFWrite = class(TObject)
  private
    FStream: TextFile;
  public
    constructor Create(FileName: string);
    destructor Destroy; override;
    procedure Reset;
    procedure BeginSection(Sect: TSections);
    procedure EndSection(Sect: TSections);
    procedure WriteGroup(GroupCode: word; GroupValue: variant);
    procedure WriteAnEntry(var Values: TGroupTable);
  end;

  EDXFException = Exception;
  EDXFEndOfFile = EAbort;


  TDXF2DExport = class(TObject)
  private
    FDXFWrite: TDXFWrite;
  protected
    procedure WriteLine2D(Line: TLine2D);
    procedure WriteFrame2D(Frm: TFrame2D);
    procedure WriteText2D(Text: string);
  public
    constructor Create(const FileName: string);
    destructor Destroy; override;
    { Write the DXF headers. }
    procedure WriteHeader;
    { Write the DXF tables. }
    procedure WriteTables;
    { Write the DXF entities. }
    procedure WriteEntities;
    { Write the DXF informations. }
    procedure WriteDXF;
  end;

var
  Colors: array[0..255] of TColor;

implementation

uses Math, principal, Dialogs, Forms, Variants, Uler_dxf, Uclasse_base;

// function body

// -----===== Starting Cs4DXFReadWrite.pas =====-----

function ColorToIndex(Col: TColor; Active: boolean): integer;
Begin
  Result := 7;
  case Col of
    clBlack,
    clWhite: Result := 7;
    clRed: Result := 1;
    clYellow: Result := 2;
    clLime: Result := 3;
    clAqua: Result := 4;
    clBlue: Result := 5;
    clFuchsia: Result := 6;
    clGray: Result := 8;
    clLtGray: Result := 9;
  end;
  if not Active then Result := -1 * Result;
end;

{ --================== DXFWriter ==================-- }

constructor TDXFWrite.Create(FileName: string);
Begin
  inherited Create;
  AssignFile(FStream, FileName);
  Rewrite(FStream);
end;

destructor TDXFWrite.Destroy;
Begin
  CloseFile(FStream);
  inherited Destroy;
end;

procedure TDXFWrite.Reset;
Begin
  Rewrite(FStream);
end;

procedure TDXFWrite.WriteGroup(GroupCode: word; GroupValue: variant);
var
  TxtLine: string;
  LastSep: char;
Begin
  LastSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    WriteLn(FStream, Format('%3d', [GroupCode]));
    case GroupCode of
      0..9,
      999,
      1000..1009: TxtLine := Copy(GroupValue, 1, 255);
      10..59,
      140..147,
      210..239,
      1010..1059: TxtLine := Format('%.6f', [double(GroupValue)]);
      60..79,
      170..175,
      1060..1079: TxtLine := Format('%6d', [integer(GroupValue)]);
      100 : TxtLine:=GroupValue;
      330 : TxtLine:=GroupValue;
      280:TxtLine:=GroupValue;
      else
        TxtLine := '';
    end;
    WriteLn(FStream, TxtLine);
  finally
    DecimalSeparator := LastSep;
  end;
end;

procedure TDXFWrite.BeginSection(Sect: TSections);
Begin
  WriteGroup(0, 'SECTION');
  case Sect of
    scHeader: WriteGroup(2, 'HEADER');
    scTables: WriteGroup(2, 'TABLES');
    scBlocks: WriteGroup(2, 'BLOCKS');
    scEntities: WriteGroup(2, 'ENTITIES');
  end;
end;

procedure TDXFWrite.EndSection(Sect: TSections);
Begin
  WriteGroup(0, 'ENDSEC');
end;

{ Table Index => DXF file group value
  0-255       => 0-255
  256-512     => 1000-1255 }
procedure TDXFWrite.WriteAnEntry(var Values: TGroupTable);
var
  Cont: word;
Begin
  for Cont := 0 to 255 do
    if VarType(Values[Cont]) > 0 then
      WriteGroup(Cont, Values[Cont]);
  for Cont := 1000 to 1255 do
    if VarType(Values[Cont - 744]) > 0 then
      WriteGroup(Cont, Values[Cont - 744]);
end;

{ --================ DXF2DExport ==================-- }

constructor TDXF2DExport.Create(const FileName: string);
Begin
  inherited Create;
  FDXFWrite := TDXFWrite.Create(FileName);
end;

destructor TDXF2DExport.Destroy;
Begin
  FDXFWrite.WriteGroup(0, 'EOF');
  FDXFWrite.Free;
  inherited Destroy;
end;

procedure TDXF2DExport.WriteDXF;
Begin
  FDXFWrite.Reset;
  WriteHeader;
  WriteTables;
  WriteEntities;
end;

procedure TDXF2DExport.WriteHeader;
var
  TmpInt: integer;
Begin
  with FDXFWrite do
  Begin
    BeginSection(scHeader);
    { Angle direction, Default CounterClockWise }
    WriteGroup(9, '$ANGDIR');
    TmpInt := 0;
    WriteGroup(70, TmpInt);
    { Extension of the drawing }
    WriteGroup(9, '$EXTMAX');
    WriteGroup(10, MDmaiorx);
    WriteGroup(20, MDmaiory);
    WriteGroup(30, 0);
    WriteGroup(9, '$EXTMIN');
    WriteGroup(10, MDmenorx);
    WriteGroup(20, MDmenory);
    WriteGroup(30, 0);
    WriteGroup(9, '$CECOLOR');
    WriteGroup(62, 256);
    WriteGroup(9, '$CELTYPE');
    WriteGroup(6, 'BYLAYER');
    { End Header Section }
    EndSection(scHeader);
  end;
end;

procedure TDXF2DExport.WriteTables;
var
  Count, f, g: integer;
  nome_do_bloco: string;
Begin
  with FDXFWrite do
  Begin
    { Begin Tables Section }
    BeginSection(scTables);
    WriteGroup(0, 'TABLE');
    WriteGroup(2, 'LTYPE');
    WriteGroup(70, 1);
    WriteGroup(0, 'LTYPE');
    WriteGroup(2, 'CONTINUOUS');
    WriteGroup(70, 64);
    WriteGroup(3, 'Solid line');
    WriteGroup(72, 65);
    WriteGroup(73, 0);
    WriteGroup(40, 0.0);
    WriteGroup(0, 'ENDTAB');
    WriteGroup(0, 'TABLE');
    WriteGroup(2, 'LAYER');
    WriteGroup(70, 257);
    WriteGroup(0, 'LAYER');
    WriteGroup(2, '0');
    WriteGroup(70, 64);
    WriteGroup(62, 7);
    WriteGroup(6, 'CONTINUOUS');

    // gravar os layers;
     { for Count := 0 to 255 do
      with FCADCmp2D.Layers[Count] do
       if Modified then
        Begin
          WriteGroup(0, 'LAYER');
          WriteGroup(2, Name);
          WriteGroup(70, 64);
          WriteGroup(62, ColorToIndex(Pen.Color, Active));
          WriteGroup(6, 'CONTINUOUS');
        end;
        { End Tables Section }
     }

    WriteGroup(0, 'LAYER');
    WriteGroup(2, 'Arquitetura');
    WriteGroup(70, 64);
    WriteGroup(62, 1);
    WriteGroup(6, 'CONTINUOUS');

    WriteGroup(0, 'LAYER');
    WriteGroup(2, 'Fiacao');
    WriteGroup(70, 64);
    WriteGroup(62, 2);
    WriteGroup(6, 'CONTINUOUS');

    WriteGroup(0, 'LAYER');
    WriteGroup(2, 'Tomada');
    WriteGroup(70, 64);
    WriteGroup(62, 3);
    WriteGroup(6, 'CONTINUOUS');


    WriteGroup(0, 'ENDTAB');
    EndSection(scTables);
  end;


  { Begin Tables Section }
  FDXFWrite.BeginSection(scBlocks);

  {aqui escrever os blocos}
  for f := 0 to blocos.Count - 1 do
  Begin
    if ((minhaClasse(blocos.items[f]).Tipo = 40)) then
      Begin
      FDXFWrite.WriteGroup(0, 'BLOCK');
      FDXFWrite.WriteGroup(5, 65);
      FDXFWrite.WriteGroup(330, 64);
  //    FDXFWrite.WriteGroup(100, 'AcDbEntity');
      FDXFWrite.WriteGroup(8, 0);
    //  FDXFWrite.WriteGroup(100, 'AcDbBlockBegin');
      FDXFWrite.WriteGroup(2, Tbloco(blocos.items[f]).Bloco);
      FDXFWrite.WriteGroup(70, 0);
      FDXFWrite.WriteGroup(10, Tbloco(blocos.items[f]).px);
      FDXFWrite.WriteGroup(20, Tbloco(blocos.items[f]).py);
      FDXFWrite.WriteGroup(30, 0.0);
      FDXFWrite.WriteGroup(3, Tbloco(blocos.items[f]).Bloco);
      FDXFWrite.WriteGroup(1, 0);

      nome_do_bloco := Tbloco(blocos.items[f]).Bloco;
      // inserir objetos dentro do bloco
      for g := 0 to blocos.Count - 1 do
      Begin
        if minhaclasse(blocos.items[f]).Ligado = False then Continue;
        if TBloco(blocos.items[g]).Bloco = Nome_do_bloco then
        Begin
          //linha
          if minhaclasse(blocos.items[g]).objeto = 'TLinha' then
          Begin
            FDXFWrite.WriteGroup(0, 'LINE');
            FDXFWrite.WriteGroup(8, Tlinha(blocos.items[g]).LayerName);
            FDXFWrite.WriteGroup(10, Tlinha(blocos.items[g]).Ax);
            FDXFWrite.WriteGroup(20, Tlinha(blocos.items[g]).Ay);
            FDXFWrite.WriteGroup(30, 0);
            FDXFWrite.WriteGroup(11, Tlinha(blocos.items[g]).Bx);
            FDXFWrite.WriteGroup(21, Tlinha(blocos.items[g]).By);
            FDXFWrite.WriteGroup(31, 0);
          end;
          //circulo
          if (Minhaclasse(blocos.items[g]).tipo = 5) then
          Begin
            FDXFWrite.WriteGroup(0, 'CIRCLE');
            FDXFWrite.WriteGroup(8, 'LAYER 0');
            FDXFWrite.WriteGroup(10, Tcirculo(blocos.items[g]).Px);
            FDXFWrite.WriteGroup(20, Tcirculo(blocos.items[g]).Py);
            FDXFWrite.WriteGroup(30, 0);
            FDXFWrite.WriteGroup(40, Tcirculo(blocos.items[g]).raio);
          end;
          //texto
          if minhaClasse(blocos.items[g]).tipo = 6 then
          Begin
            FDXFWrite.WriteGroup(0, 'TEXT');
            FDXFWrite.WriteGroup(5, 64);
            FDXFWrite.WriteGroup(330, '1F');
         //   FDXFWrite.WriteGroup(100, 'AcDbEntity');
            FDXFWrite.WriteGroup(8, 0);
           // FDXFWrite.WriteGroup(100, 'AcDbText');
            FDXFWrite.WriteGroup(10, Ttexto(blocos.items[g]).Px);
            FDXFWrite.WriteGroup(20, Ttexto(blocos.items[g]).Py);
            FDXFWrite.WriteGroup(30, 0.0);
            FDXFWrite.WriteGroup(40, Ttexto(blocos.items[g]).tamanho);
            FDXFWrite.WriteGroup(1, Ttexto(blocos.items[g]).descricao);
            FDXFWrite.WriteGroup(50, Ttexto(blocos.items[g]).angulo);
         //   FDXFWrite.WriteGroup(100, 'AcDbText');
          end;
          // arc
          if ((minhaClasse(blocos.items[g]).tipo = 4) or
            (minhaClasse(blocos.items[g]).tipo = 32)) then
          Begin
            FDXFWrite.WriteGroup(0, 'ARC');
            FDXFWrite.WriteGroup(5, 65);
            FDXFWrite.WriteGroup(330, '1F');
         //   FDXFWrite.WriteGroup(100, 'AcDbEntity');
            FDXFWrite.WriteGroup(8, 0);
        //    FDXFWrite.WriteGroup(100, 'AcDbCircle');
            FDXFWrite.WriteGroup(10, Tarco(blocos.items[g]).Px);
            FDXFWrite.WriteGroup(20, Tarco(blocos.items[g]).Py);
            FDXFWrite.WriteGroup(30, 0.0);
            FDXFWrite.WriteGroup(40, Tarco(blocos.items[g]).Raio);
       //     FDXFWrite.WriteGroup(100, 'AcDbArc');
            FDXFWrite.WriteGroup(50, Tarco(blocos.items[g]).AnguloInicial);
            FDXFWrite.WriteGroup(51, Tarco(blocos.items[g]).AnguloFinal +
              Tarco(lista.items[f]).AnguloInicial - 360);
          end;
          // atributo
          if (minhaClasse(blocos.items[g]).tipo = 41) then
          Begin
            FDXFWrite.WriteGroup(0, 'ATTDEF');
            FDXFWrite.WriteGroup(5,6);
            FDXFWrite.WriteGroup(330,64);
        //    FDXFWrite.WriteGroup(100, 'AcDbEntity');
            FDXFWrite.WriteGroup(8, Tatributo(blocos.items[g]).layername);
        //    FDXFWrite.WriteGroup(100, 'AcDbText');
            FDXFWrite.WriteGroup(10, Tatributo(blocos.items[g]).Px);
            FDXFWrite.WriteGroup(20, Tatributo(blocos.items[g]).Py);
            FDXFWrite.WriteGroup(30, 0.0);
            FDXFWrite.WriteGroup(40, Tatributo(blocos.items[g]).tamanho);
            FDXFWrite.WriteGroup(1, 'segundo');
     //       FDXFWrite.WriteGroup(100, 'AcDbAttributeDefinition');
            FDXFWrite.WriteGroup(3, 'primeiro');
            FDXFWrite.WriteGroup(2, 'NOME');
            FDXFWrite.WriteGroup(70,Tatributo(blocos.items[g]).Definicao);
            FDXFWrite.WriteGroup(280,0);
          end;
         end;
      end;
        // aqui fecha o bloco
       // FDXFWrite.WriteGroup(5,'6F');
       // FDXFWrite.WriteGroup(330,'6D');
       // FDXFWrite.WriteGroup(100,'AcDbEntity');
       // FDXFWrite.WriteGroup(8,'0');
       // FDXFWrite.WriteGroup(100,'AcDbBlockEnd');
        FDXFWrite.WriteGroup(0,'ENDBLK');
    end;


  end;
   FDXFWrite.EndSection(scBlocks);
 end;

procedure TDXF2DExport.WriteEntities;
var
  f,g,h,pai,filho: integer;
  nome_do_bloco : string;
Begin
  FDXFWrite.BeginSection(scEntities);
  for f := 0 to lista.Count - 1 do
  Begin
    if minhaClasse(lista.items[f]).tipo = 3 then
    Begin
      FDXFWrite.WriteGroup(0, 'LINE');
      FDXFWrite.WriteGroup(8, Tlinha(lista.items[f]).LayerName);
      FDXFWrite.WriteGroup(10, Tlinha(lista.items[f]).Ax);
      FDXFWrite.WriteGroup(20, Tlinha(lista.items[f]).Ay);
      FDXFWrite.WriteGroup(30, 0);
      FDXFWrite.WriteGroup(11, Tlinha(lista.items[f]).Bx);
      FDXFWrite.WriteGroup(21, Tlinha(lista.items[f]).By);
      FDXFWrite.WriteGroup(31, 0);
    end;
    if minhaClasse(lista.items[f]).tipo = 17 then
    Begin
      FDXFWrite.WriteGroup(0, 'LINE');
      FDXFWrite.WriteGroup(8, 'LAYER 0');
      FDXFWrite.WriteGroup(10, Ttubulacao(lista.items[f]).ObjIni_X);
      FDXFWrite.WriteGroup(20, Ttubulacao(lista.items[f]).ObjIni_Y);
      FDXFWrite.WriteGroup(30, 0);
      FDXFWrite.WriteGroup(11, Ttubulacao(lista.items[f]).ObjFin_X);
      FDXFWrite.WriteGroup(21, Ttubulacao(lista.items[f]).ObjFin_Y);
      FDXFWrite.WriteGroup(31, 0);
    end;
    if (minhaClasse(lista.items[f]).tipo = Ponto_iluminacao) then
    Begin
      FDXFWrite.WriteGroup(0, 'CIRCLE');
      FDXFWrite.WriteGroup(8, 'LAYER 0');
      FDXFWrite.WriteGroup(10, Tiluminacao(lista.items[f]).Px);
      FDXFWrite.WriteGroup(20, Tiluminacao(lista.items[f]).Py);
      FDXFWrite.WriteGroup(30, 0);
      FDXFWrite.WriteGroup(40, 0.3);
    end;
    if (minhaClasse(lista.items[f]).tipo = circulo) then
    Begin
      FDXFWrite.WriteGroup(0, 'CIRCLE');
      FDXFWrite.WriteGroup(8, 'LAYER 0');
      FDXFWrite.WriteGroup(10, Tcirculo(lista.items[f]).Px);
      FDXFWrite.WriteGroup(20, Tcirculo(lista.items[f]).Py);
      FDXFWrite.WriteGroup(30, 0);
      FDXFWrite.WriteGroup(40, Tcirculo(lista.items[f]).raio);
    end;
    if ((minhaClasse(lista.items[f]).tipo = 4) or
      (minhaClasse(lista.items[f]).tipo = 32)) then
    Begin
      FDXFWrite.WriteGroup(0, 'ARC');
      FDXFWrite.WriteGroup(5, 65);
      FDXFWrite.WriteGroup(330, '1F');
      FDXFWrite.WriteGroup(100, 'AcDbEntity');
      FDXFWrite.WriteGroup(8, 0);
      FDXFWrite.WriteGroup(100, 'AcDbCircle');
      FDXFWrite.WriteGroup(10, Tarco(lista.items[f]).Px);
      FDXFWrite.WriteGroup(20, Tarco(lista.items[f]).Py);
      FDXFWrite.WriteGroup(30, 0.0);
      FDXFWrite.WriteGroup(40, Tarco(lista.items[f]).Raio);
      FDXFWrite.WriteGroup(100, 'AcDbArc');
      FDXFWrite.WriteGroup(50, Tarco(lista.items[f]).AnguloInicial);
      FDXFWrite.WriteGroup(51, Tarco(lista.items[f]).AnguloFinal + Tarco(
        lista.items[f]).AnguloInicial - 360);
    end;
     if minhaClasse(lista.items[f]).tipo = 6 then
    Begin
      FDXFWrite.WriteGroup(0, 'TEXT');
      FDXFWrite.WriteGroup(5, 64);
      FDXFWrite.WriteGroup(330, '1F');
      FDXFWrite.WriteGroup(100, 'AcDbEntity');
      FDXFWrite.WriteGroup(8, 0);
      FDXFWrite.WriteGroup(100, 'AcDbText');
      FDXFWrite.WriteGroup(10, Ttexto(lista.items[f]).Px);
      FDXFWrite.WriteGroup(20, Ttexto(lista.items[f]).Py);
      FDXFWrite.WriteGroup(30, 0.0);
      FDXFWrite.WriteGroup(40, Ttexto(lista.items[f]).tamanho);
      FDXFWrite.WriteGroup(1, Ttexto(lista.items[f]).descricao);
      FDXFWrite.WriteGroup(50, Ttexto(lista.items[f]).angulo);
      FDXFWrite.WriteGroup(100, 'AcDbText');
    end;
  end;
  // escrever insert dos blocos
  {aqui escrever os blocos}
  for f := 0 to blocos.Count - 1 do
  Begin
    if ((minhaClasse(blocos.items[f]).Tipo = 42)) then
      Begin
      FDXFWrite.WriteGroup(0, 'INSERT');
      FDXFWrite.WriteGroup(5, 67);
      FDXFWrite.WriteGroup(330, '1F');
      FDXFWrite.WriteGroup(100, 'AcDbEntity');
      FDXFWrite.WriteGroup(8, 0);
      FDXFWrite.WriteGroup(100, 'AcDbBlockReference');
      FDXFWrite.WriteGroup(66,1);
      FDXFWrite.WriteGroup(2, Tbloco(blocos.items[f]).Bloco);
      FDXFWrite.WriteGroup(10, Tbloco(blocos.items[f]).px);
      FDXFWrite.WriteGroup(20, Tbloco(blocos.items[f]).py);
      FDXFWrite.WriteGroup(50, Tbloco(blocos.items[f]).Angulo);
//       FDXFWrite.WriteGroup(50, 0.0);

//      FDXFWrite.WriteGroup(3, Tbloco(blocos.items[f]).Bloco);
    //  FDXFWrite.WriteGroup(1, 0);
      nome_do_bloco := Tbloco(blocos.items[f]).Bloco;
      pai:=Tbloco(blocos.items[f]).Id_obj;
      // inserir objetos dentro do bloco
      for g := 0 to blocos.Count - 1 do
      Begin
        if minhaclasse(blocos.items[g]).Ligado = False then Continue;
         h:=minhaClasse(blocos.items[g]).tipo;
         filho:=Tatributo(blocos.items[g]).Pai;
        if  h=43 then
        Begin
         // atributo
         if TBloco(blocos.items[g]).Bloco = Nome_do_bloco
          then  if filho=pai then
          Begin
            FDXFWrite.WriteGroup(0,'ATTRIB');
            FDXFWrite.WriteGroup(5,68);
            FDXFWrite.WriteGroup(330,67);
            FDXFWrite.WriteGroup(100,'AcDbEntity');
            FDXFWrite.WriteGroup(8,0);
            FDXFWrite.WriteGroup(100,'AcDbText');
            FDXFWrite.WriteGroup(10,Tatributo(blocos.items[g]).px);
            FDXFWrite.WriteGroup(20,Tatributo(blocos.items[g]).py);
            FDXFWrite.WriteGroup(30,0.0);
            FDXFWrite.WriteGroup(40,tatributo(blocos.items[g]).tamanho);
            FDXFWrite.WriteGroup(1,tatributo(blocos.items[g]).valor);
            FDXFWrite.WriteGroup(100,'AcDbAttribute');
            FDXFWrite.WriteGroup(2,tatributo(blocos.items[g]).Campo);
            FDXFWrite.WriteGroup(70,0);
           // FDXFWrite.WriteGroup(280,0);
            frprincipal.cmdmemo.lines.add('Bloco='+nome_do_bloco+' Pai='+inttostr(pai)+' nome='+tatributo(blocos.items[g]).Campo+ ' valor'+tatributo(blocos.items[g]).valor);
          end;
         end;
      end;
       // aqui fecha o bloco
      FDXFWrite.WriteGroup(0,'SEQEND');
    end;
  end;
  FDXFWrite.EndSection(scEntities);
end;



procedure TDXF2DExport.WriteLine2D(Line: TLine2D);

Begin
  {
  with FDXFWrite, Line do
   Begin
     TmpPnt := TransformPoint2D(Points[0], ModelTransform);
     WriteGroup(10, TmpPnt.X);
     WriteGroup(20, TmpPnt.Y);
     WriteGroup(30, 0);
     TmpPnt := TransformPoint2D(Points[1], ModelTransform);
     WriteGroup(11, TmpPnt.X);
     WriteGroup(21, TmpPnt.Y);
     WriteGroup(31, 0);
   end;}
end;

procedure TDXF2DExport.WriteFrame2D(Frm: TFrame2D);
var
  TmpPnt: Ponto2D;
Begin
  with FDXFWrite, Frm do
  Begin
    WriteGroup(66, 1);
    WriteGroup(10, 0);
    WriteGroup(20, 0);
    WriteGroup(30, 0); // Questo setta l'elevazione.
    WriteGroup(0, 'VERTEX');
    //     WriteGroup(8, FCADCmp2D.Layers[Frm.Layer].Name);
    //     TmpPnt := TransformPoint2D(Points[0], ModelTransform);
    WriteGroup(10, TmpPnt.X);
    WriteGroup(20, TmpPnt.Y);
    WriteGroup(30, 0);
    WriteGroup(0, 'VERTEX');
    //    WriteGroup(8, FCADCmp2D.Layers[Frm.Layer].Name);
    //    TmpPnt := TransformPoint2D(Point2D(Points[0].X, Points[1].Y), ModelTransform);
    WriteGroup(10, TmpPnt.X);
    WriteGroup(20, TmpPnt.Y);
    WriteGroup(30, 0);
    WriteGroup(0, 'VERTEX');
    //  WriteGroup(8, FCADCmp2D.Layers[Frm.Layer].Name);
    //  TmpPnt := TransformPoint2D(Points[1], ModelTransform);
    WriteGroup(10, TmpPnt.X);
    WriteGroup(20, TmpPnt.Y);
    WriteGroup(30, 0);
    WriteGroup(0, 'VERTEX');
    //  WriteGroup(8, FCADCmp2D.Layers[Frm.Layer].Name);
    //   TmpPnt := TransformPoint2D(Point2D(Points[1].X, Points[0].Y), ModelTransform);
    WriteGroup(10, TmpPnt.X);
    WriteGroup(20, TmpPnt.Y);
    WriteGroup(30, 0);
    WriteGroup(0, 'VERTEX');
    //   WriteGroup(8, FCADCmp2D.Layers[Frm.Layer].Name);
    //   TmpPnt := TransformPoint2D(Points[0], ModelTransform);
    WriteGroup(10, TmpPnt.X);
    WriteGroup(20, TmpPnt.Y);
    WriteGroup(30, 0);
    WriteGroup(0, 'SEQEND');
  end;
end;

procedure TDXF2DExport.WriteText2D(Text: string);
var
  TmpPnt, TmpPnt1: Ponto2D;
  InsPnt: Ponto2D;
  AllPnt: Ponto2D;
  TmpAngle: single;
Begin
    {Begin

     WriteGroup(1, Text);
     WriteGroup(40, Height);
     TmpPnt := TransformPoint2D(Points[0], ModelTransform);
     AllPnt := TransformPoint2D(Points[1], ModelTransform);
     InsPnt := TransformPoint2D(Point2D(Points[0].X, Points[1].Y - Height), ModelTransform);
     WriteGroup(10, InsPnt.X);
     WriteGroup(20, InsPnt.Y);
     WriteGroup(30, 0);
     // I compute the angle of the Text from the rotation of it.
     TmpPnt := TransformPoint2D(Point2D(0, 0), ModelTransform);
     TmpPnt1 := TransformPoint2D(Point2D(10, 0), ModelTransform);
     TmpAngle := ArcTan2(TmpPnt1.Y - TmpPnt.Y, TmpPnt1.X - TmpPnt.X);
     WriteGroup(50, RadToDeg(TmpAngle));
     case HorizontalJust of
       jhCenter: Begin
         WriteGroup(11, AllPnt.X - InsPnt.X);
         WriteGroup(21, AllPnt.Y - InsPnt.Y);
         WriteGroup(31, 0);
         WriteGroup(72, 1);
       end;
       jhRight: Begin
         WriteGroup(11, AllPnt.X);
         WriteGroup(21, AllPnt.Y);
         WriteGroup(31, 0);
         WriteGroup(72, 2);
       end;
     end;
  end;}
end;




const
  ColArray1: array[1..4] of byte = (0, 63, 127, 191);
  ColArray2: array[1..4] of byte = (127, 159, 191, 223);

var
  Cont: byte;

initialization
  // Settaggio colori per DXF.
  // Colori base.
  Colors[0] := RGB(255, 255, 255);
  Colors[1] := RGB(255, 0, 0);
  Colors[2] := RGB(255, 255, 0);
  Colors[3] := RGB(0, 255, 0);
  Colors[4] := RGB(0, 255, 255);
  Colors[5] := RGB(0, 0, 255);
  Colors[6] := RGB(255, 0, 255);
  Colors[7] := RGB(0, 0, 0);
  Colors[8] := RGB(134, 134, 134);
  Colors[9] := RGB(187, 187, 187);
  // Toni di grigio.
  Colors[250] := RGB(0, 0, 0);
  Colors[251] := RGB(45, 45, 45);
  Colors[252] := RGB(91, 91, 91);
  Colors[253] := RGB(137, 137, 137);
  Colors[254] := RGB(183, 183, 183);
  Colors[255] := RGB(179, 179, 179);
  // Altre tonalità
  for Cont := 1 to 4 do
  Begin
    Colors[Cont * 10] := RGB(255, ColArray1[Cont], 0);
    Colors[40 + Cont * 10] := RGB(ColArray1[5 - Cont], 255, 0);
    Colors[80 + Cont * 10] := RGB(0, 255, ColArray1[Cont]);
    Colors[120 + Cont * 10] := RGB(0, ColArray1[5 - Cont], 255);
    Colors[160 + Cont * 10] := RGB(ColArray1[Cont], 0, 255);
  end;
  Colors[210] := RGB(255, 0, 255);
  Colors[220] := RGB(255, 0, 191);
  Colors[230] := RGB(255, 0, 127);
  Colors[240] := RGB(255, 0, 63);
  for Cont := 1 to 4 do
  Begin
    Colors[Cont * 10 + 1] := RGB(255, ColArray2[Cont], 127);
    Colors[41 + Cont * 10] := RGB(ColArray2[5 - Cont], 255, 127);
    Colors[81 + Cont * 10] := RGB(127, 255, ColArray2[Cont]);
    Colors[121 + Cont * 10] := RGB(127, ColArray2[5 - Cont], 255);
    Colors[161 + Cont * 10] := RGB(ColArray2[Cont], 127, 255);
  end;
  Colors[211] := RGB(255, 127, 255);
  Colors[221] := RGB(255, 127, 223);
  Colors[231] := RGB(255, 127, 191);
  Colors[241] := RGB(255, 127, 159);
  // Gli altri sono tutti zero per ora.
end.
