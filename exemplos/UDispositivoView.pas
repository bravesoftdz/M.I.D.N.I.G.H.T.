unit UDispositivoView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDNBaseMobileView, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TDispositivoView = class(TBaseMobileView)
    Layout1: TLayout;
    Label1: TLabel;
    EditIMEI: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DispositivoView: TDispositivoView;

implementation

{$R *.fmx}

uses MDNDevice;

procedure TDispositivoView.FormCreate(Sender: TObject);
var
  Dispositivo: TDevice;
begin
  inherited;
  Dispositivo := TDevice.Create;
  try
    EditIMEI.Text := Dispositivo.IMEI;
  except
    on E:Exception do
      EditIMEI.Text := 'IMEI não suportado para este dispositivo';
  end;
  Dispositivo.Free;
end;

end.
