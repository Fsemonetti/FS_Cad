program FS_Cad;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads,   {$ENDIF}   {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  runtimetypeinfocontrols,
  principal,
  Uler_dxf,
  Ugerar_pdf,
  Uroteamento,
  conver,
  Ucircuitos,
  UObjetos,
  DiarioDeBordo,
  Uclasse_base,
  Usalva_dxf,
   Ulayers, Uplanilhas;

{$R *.res}

Begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.CreateForm(TFrCircuitos, FrCircuitos);
  Application.CreateForm(TDefLayersForm, DefLayersForm);
  Application.CreateForm(TConfig, Config);
  Application.CreateForm(TFrPlanilha, FrPlanilha);


  Application.Run;
end.
