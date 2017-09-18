unit MDN.BaseDao;

interface

uses
  MDN.BaseClass,
  FireDAC.Comp.Client;

type
  TBaseDAO=class(TBaseClass)
  private
    FConnection: TFDConnection;
  public
    constructor Create(Connection: TFDConnection);
    destructor Destroy; override;
    property Connection: TFDConnection read FConnection;
  end;

implementation

{ TBaseDAO }

constructor TBaseDAO.Create(Connection: TFDConnection);
begin
  if Assigned(Connection) then
    Self.FConnection := Connection;
end;

destructor TBaseDAO.Destroy;
begin
  Self.FConnection := nil;
  inherited;
end;

end.
