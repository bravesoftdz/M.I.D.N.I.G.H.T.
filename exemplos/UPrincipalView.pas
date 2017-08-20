unit UPrincipalView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDNBaseDesktopView, FMX.Menus;

type
  TPrincipalView = class(TBaseDesktopView)
    MenuBar1: TMenuBar;
    Telas: TMenuItem;
    MenuItemTelaDesktop: TMenuItem;
    MenuItemTelaApp: TMenuItem;
    procedure MenuItemTelaAppClick(Sender: TObject);
    procedure MenuItemTelaDesktopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalView: TPrincipalView;

implementation

{$R *.fmx}

uses MDNBaseMobileView, MDNBaseView;

procedure TPrincipalView.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := TWindowState.wsMaximized;
end;

procedure TPrincipalView.MenuItemTelaAppClick(Sender: TObject);
begin
  inherited;
  BaseMobileView := TBaseMobileView.Create(Self);
  BaseMobileView.ShowModal;
  BaseMobileView.Free;
end;

procedure TPrincipalView.MenuItemTelaDesktopClick(Sender: TObject);
begin
  inherited;
  BaseDesktopView := TBaseDesktopView.Create(Self);
  BaseDesktopView.ShowModal;
  BaseDesktopView.Free;
end;

end.
