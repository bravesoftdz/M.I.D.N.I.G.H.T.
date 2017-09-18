unit MDN.BaseController;

interface

uses
  MDN.BaseClass;

type
  TBaseController=class(TBaseClass)
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TBaseController }

constructor TBaseController.Create;
begin
  //
end;

destructor TBaseController.Destroy;
begin
  //
  inherited;
end;

end.
