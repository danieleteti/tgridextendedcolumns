unit StringExColumn;

interface

uses
  FMX.Grid, FMX.Graphics, System.Classes, System.Rtti, FMX.Types;

type
  TStringExColumn = class(TStringColumn)
  private
    FHorizontalAlign: TTextAlign;
    procedure SetHorizontalAlign(const Value: TTextAlign);
  protected
    procedure BeforeDrawing(const Canvas: TCanvas); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property HorizontalAlign: TTextAlign read FHorizontalAlign
      write SetHorizontalAlign;
  end;

implementation

uses
  System.SysUtils;

{ TStringExColumn }

procedure TStringExColumn.BeforeDrawing(const Canvas: TCanvas);
begin
  inherited;
  Layout.HorizontalAlign := FHorizontalAlign;
end;

constructor TStringExColumn.Create(AOwner: TComponent);
begin
  inherited;
  FHorizontalAlign := TTextAlign.Leading;
  Self.Header := Self.ClassName;
end;

procedure TStringExColumn.SetHorizontalAlign(const Value: TTextAlign);
begin
  FHorizontalAlign := Value;
end;

initialization

TColumnClasses.Register([TStringExColumn]);

finalization

TColumnClasses.Unregister([TStringExColumn]);

end.
