program ExemploGeral;

uses
  System.StartUpCopy,
  FMX.Forms,
  MDNBaseView in '..\src\view\MDNBaseView.pas' {BaseView},
  MDNBaseDesktopView in '..\src\view\MDNBaseDesktopView.pas' {BaseDesktopView},
  MDNBaseMobileView in '..\src\view\MDNBaseMobileView.pas' {BaseMobileView},
  UPrincipalView in 'UPrincipalView.pas' {PrincipalView},
  UDispositivoView in 'UDispositivoView.pas' {DispositivoView},
  MDNBaseClass in '..\src\class\MDNBaseClass.pas',
  MDNDevice in '..\src\class\MDNDevice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalView, PrincipalView);
  Application.Run;
end.
