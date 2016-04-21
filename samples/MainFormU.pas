unit MainFormU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  StringExColumn, FMX.Types;

type
  TForm5 = class(TForm)
    Grid1: TGrid;
    StringExColumn1: TStringExColumn;
    StringExColumn2: TStringExColumn;
    StringExColumn3: TStringExColumn;
    procedure Grid1DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Grid1DrawColumnCell(Sender: TObject; const Canvas: TCanvas;
  const Column: TColumn; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
begin
  if Row mod 2 = 0 then
  begin
    Canvas.BeginScene;
    try
      Canvas.Fill.Kind := TBrushKind.Solid;
      Canvas.Fill.Color := TAlphaColorRec.Red;
      Canvas.FillRect(Bounds, 5, 5, [TCorner.TopLeft, TCorner.TopRight,
        TCorner.BottomLeft, TCorner.BottomRight], 1);
      Canvas.Fill.Color := TAlphaColorRec.White;
      Canvas.FillText(Bounds, 'Hello World', True, 1, [], TTextAlign.Center);
    finally
      Canvas.EndScene;
    end;
    //Column.DefaultDrawCell(Canvas, Bounds, Row, Value, State);
  end;
end;

end.
