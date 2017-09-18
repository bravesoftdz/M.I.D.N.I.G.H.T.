unit MDN.BaseView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  MDN.BaseController;

type
  TBaseView = class(TForm)
  private
    FController: TBaseController;
    procedure SetController(const Value: TBaseController);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); overload;
    constructor Create(AOwner: TComponent; Controller: TBaseController); overload;
    property Controller: TBaseController read FController write SetController;
  end;

var
  BaseView: TBaseView;

implementation

{$R *.fmx}

{ TBaseView }

constructor TBaseView.Create(AOwner: TComponent);
begin
  inherited;
  //
end;

constructor TBaseView.Create(AOwner: TComponent; Controller: TBaseController);
begin
  //inherited;
  Self.FController := Controller;
end;

procedure TBaseView.SetController(const Value: TBaseController);
begin
  FController := Value;
end;

end.
