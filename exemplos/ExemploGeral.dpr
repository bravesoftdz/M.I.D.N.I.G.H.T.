program ExemploGeral;

uses
  System.StartUpCopy,
  FMX.Forms,
  MDNBaseView in '..\src\view\MDNBaseView.pas' {BaseView},
  MDNBaseDesktopView in '..\src\view\MDNBaseDesktopView.pas' {BaseDesktopView},
  MDNBaseMobileView in '..\src\view\MDNBaseMobileView.pas' {BaseMobileView},
  UPrincipalView in 'UPrincipalView.pas' {PrincipalView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalView, PrincipalView);
  Application.Run;
end.
