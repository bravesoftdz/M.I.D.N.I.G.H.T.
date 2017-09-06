program ExemploGeral;

uses
  System.StartUpCopy,
  FMX.Forms,
  MDN.BaseView in '..\src\view\MDN.BaseView.pas' {BaseView},
  MDN.BaseDesktopView in '..\src\view\MDN.BaseDesktopView.pas' {BaseDesktopView},
  MDN.BaseMobileView in '..\src\view\MDN.BaseMobileView.pas' {BaseMobileView},
  UPrincipalView in 'UPrincipalView.pas' {PrincipalView},
  UDispositivoView in 'UDispositivoView.pas' {DispositivoView},
  MDN.BaseClass in '..\src\class\MDN.BaseClass.pas',
  MDN.Device in '..\src\class\MDN.Device.pas',
  MDN.Criptografy in '..\src\class\MDN.Criptografy.pas',
  UCriptografiaView in 'UCriptografiaView.pas' {CriptografiaView},
  MDN.BaseMobileToolbarView in '..\src\view\MDN.BaseMobileToolbarView.pas' {BaseMobileToolbarView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalView, PrincipalView);
  Application.Run;
end.
