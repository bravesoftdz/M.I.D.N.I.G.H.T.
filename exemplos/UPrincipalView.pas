unit UPrincipalView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDN.BaseDesktopView, FMX.Menus, FMX.Controls.Presentation;

type
  TPrincipalView = class(TBaseDesktopView)
    MenuBar1: TMenuBar;
    Telas: TMenuItem;
    MenuItemTelaDesktop: TMenuItem;
    MenuItemTelaApp: TMenuItem;
    MenuItemDispositivo: TMenuItem;
    procedure MenuItemTelaAppClick(Sender: TObject);
    procedure MenuItemTelaDesktopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemDispositivoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalView: TPrincipalView;

implementation

{$R *.fmx}

uses MDN.BaseMobileView, MDN.BaseView, UDispositivoView;

procedure TPrincipalView.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := TWindowState.wsMaximized;
end;

procedure TPrincipalView.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(DispositivoView) then
    DispositivoView.Free;
end;

procedure TPrincipalView.MenuItemDispositivoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(DispositivoView) then
    DispositivoView := TDispositivoView.Create(Self);
  {$IFDEF MSWINDOWS}
  DispositivoView.ShowModal;
  {$ELSE}
  DispositivoView.Show;
  {$ENDIF}
end;

procedure TPrincipalView.MenuItemTelaAppClick(Sender: TObject);
begin
  inherited;
  if not Assigned(BaseMobileView) then
    BaseMobileView := TBaseMobileView.Create(Self);
  BaseMobileView.ShowModal;
  BaseMobileView.Free;
end;

procedure TPrincipalView.MenuItemTelaDesktopClick(Sender: TObject);
begin
  inherited;
  if not Assigned(BaseDesktopView) then
    BaseDesktopView := TBaseDesktopView.Create(Self);
  BaseDesktopView.ShowModal;
  BaseDesktopView.Free;
end;

end.
