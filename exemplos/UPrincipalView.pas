unit UPrincipalView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDN.BaseDesktopView, FMX.Menus, FMX.Controls.Presentation;

type
  TPrincipalView = class(TBaseDesktopView)
    MenuBar1: TMenuBar;
    MenuItemDesktop: TMenuItem;
    MenuItemTelaDesktop: TMenuItem;
    MenuItemTelaApp: TMenuItem;
    MenuItemDispositivo: TMenuItem;
    MenuItemCriptografia: TMenuItem;
    MenuItemMobile: TMenuItem;
    MenuItemMovelTelaToolbar: TMenuItem;
    procedure MenuItemTelaAppClick(Sender: TObject);
    procedure MenuItemTelaDesktopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemDispositivoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItemCriptografiaClick(Sender: TObject);
    procedure MenuItemMovelTelaToolbarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalView: TPrincipalView;

implementation

{$R *.fmx}

uses MDN.BaseMobileView, MDN.BaseView, UDispositivoView, UCriptografiaView,
  MDN.BaseMobileToolbarView;

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

procedure TPrincipalView.MenuItemCriptografiaClick(Sender: TObject);
begin
  inherited;
  if not Assigned(CriptografiaView) then
    CriptografiaView := TCriptografiaView.Create(Self);
  {$IFDEF MSWINDOWS}
  CriptografiaView.ShowModal;
  {$ELSE}
  CriptografiaView.Show;
  {$ENDIF}
  CriptografiaView.Free;
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
  DispositivoView.Free;
end;

procedure TPrincipalView.MenuItemMovelTelaToolbarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(BaseMobileToolbarView) then
    BaseMobileToolbarView := TBaseMobileToolbarView.Create(Self);
  BaseMobileToolbarView.Show;
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
