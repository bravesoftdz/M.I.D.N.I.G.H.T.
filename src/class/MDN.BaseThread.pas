unit MDN.BaseThread;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TBaseThread = class(TThread)
  public
    constructor Create; reintroduce;
  protected
    procedure Execute; override;
    procedure BeforeSynchronize; virtual;
    procedure AfterSynchronize; virtual;
    procedure DoSynchronize; virtual;
  end;

implementation

{ TBaseThread }

procedure TBaseThread.AfterSynchronize;
begin
  //
end;

procedure TBaseThread.BeforeSynchronize;
begin
  //
end;

constructor TBaseThread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TBaseThread.DoSynchronize;
begin
  //
end;

procedure TBaseThread.Execute;
begin
  inherited;
  BeforeSynchronize;
  Synchronize(DoSynchronize);
  AfterSynchronize;
end;

end.
