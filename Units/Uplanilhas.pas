unit Uplanilhas; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus, ExtCtrls, ActnList, Spin, Buttons, ButtonPanel,
  fpspreadsheetgrid, fpspreadsheetctrls, fpspreadsheet, fpsallformats;

type

  { TFrPlanilha }

  TFrPlanilha = class(TForm)
    BtnOpen: TButton;
    BtnSave: TButton;
    BtnNew: TButton;
    SheetsCombo: TComboBox;
    Label1: TLabel;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog: TSaveDialog;
    WorksheetGrid: TsWorksheetGrid;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SheetsComboSelect(Sender: TObject);
  private
    { private declarations }
    procedure LoadFile(const AFileName: String);
  public
    { public declarations }
  end; 

var
  FrPlanilha: TFrPlanilha;

implementation
 
{$R *.lfm}
uses
  fpcanvas, fpsutils;



{ TFrPlanilha }

procedure TFrPlanilha.BtnNewClick(Sender: TObject);
var
  dlg: TForm;
  edCols, edRows: TSpinEdit;
Begin
  dlg := TForm.Create(nil);
  try
    dlg.Width := 220;
    dlg.Height := 128;
    dlg.Position := poMainFormCenter;
    dlg.Caption := 'New workbook';
    edCols := TSpinEdit.Create(dlg);
    with edCols do Begin
      Parent := dlg;
      Left := dlg.ClientWidth - Width - 24;
      Top := 16;
      Value := WorksheetGrid.ColCount - ord(WorksheetGrid.ShowHeaders);
    end;
    with TLabel.Create(dlg) do Begin
      Parent := dlg;
      Left := 24;
      Top := edCols.Top + 3;
      Caption := 'Columns:';
      FocusControl := edCols;
    end;
    edRows := TSpinEdit.Create(dlg);
    with edRows do Begin
      Parent := dlg;
      Left := edCols.Left;
      Top := edCols.Top + edCols.Height + 8;
      Value := WorksheetGrid.RowCount - ord(WorksheetGrid.ShowHeaders);
    end;
    with TLabel.Create(dlg) do Begin
      Parent := dlg;
      Left := 24;
      Top := edRows.Top + 3;
      Caption := 'Rows:';
      FocusControl := edRows;
    end;
    with TButtonPanel.Create(dlg) do Begin
      Parent := dlg;
      Align := alBottom;
      ShowButtons := [pbCancel, pbOK];
    end;
    if dlg.ShowModal = mrOK then Begin
      WorksheetGrid.NewWorkbook(edCols.Value, edRows.Value);
      SheetsCombo.Items.Clear;
      SheetsCombo.Items.Add('Sheet 1');
      SheetsCombo.ItemIndex := 0;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TFrPlanilha.BtnOpenClick(Sender: TObject);
Begin
  if OpenDialog.FileName <> '' then Begin
    OpenDialog.InitialDir := ExtractFileDir(OpenDialog.FileName);
    OpenDialog.FileName := ChangeFileExt(ExtractFileName(OpenDialog.FileName), '');
  end;
  if OpenDialog.Execute then Begin
    LoadFile(OpenDialog.FileName);
  end;
end;

// Saves sheet in grid to file, overwriting existing file
procedure TFrPlanilha.BtnSaveClick(Sender: TObject);
var
  err, fn: String;
Begin
  if WorksheetGrid.Workbook = nil then
    exit;

  if WorksheetGrid.Workbook.Filename <>'' then Begin
    fn := AnsiToUTF8(WorksheetGrid.Workbook.Filename);
    SaveDialog.InitialDir := ExtractFileDir(fn);
    SaveDialog.FileName := ChangeFileExt(ExtractFileName(fn), '');
  end;

  if SaveDialog.Execute then
  Begin
    Screen.Cursor := crHourglass;
    try
      WorksheetGrid.SaveToSpreadsheetFile(UTF8ToAnsi(SaveDialog.FileName));
    finally
      Screen.Cursor := crDefault;
      // Show a message in case of error(s)
      err := WorksheetGrid.Workbook.ErrorMsg;
      if err <> '' then
        MessageDlg(err, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrPlanilha.FormCreate(Sender: TObject);
Begin

end;

procedure TFrPlanilha.SheetsComboSelect(Sender: TObject);
Begin
  WorksheetGrid.SelectSheetByIndex(SheetsCombo.ItemIndex);
end;

// Loads first worksheet from file into grid
procedure TFrPlanilha.LoadFile(const AFileName: String);
var
  err: String;
Begin
  // Load file
  Screen.Cursor := crHourglass;
  try
    try
      WorksheetGrid.LoadFromSpreadsheetFile((AFileName));
                     {
      // Update user interface
      Caption := Format('fpsGrid - %s (%s)', [
        AFilename,
        GetFileFormatName(WorksheetGrid.Workbook.FileFormat)
      ]);
                      }
      // Collect the sheet names in the combobox for switching sheets.
      WorksheetGrid.GetSheets(SheetsCombo.Items);
      SheetsCombo.ItemIndex := 0;
    except
      on E:Exception do Begin
        // Empty worksheet instead of the loaded one
        WorksheetGrid.NewWorkbook(26, 100);
        Caption := 'fpsGrid - no name';
        SheetsCombo.Items.Clear;
        // Grab the error message
        WorksheetGrid.Workbook.AddErrorMsg(E.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;

    // Show a message in case of error(s)
    err := WorksheetGrid.Workbook.ErrorMsg;
    if err <> '' then
      MessageDlg(err, mtError, [mbOK], 0);
  end;
end;


initialization

end.

