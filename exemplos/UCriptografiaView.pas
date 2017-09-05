unit UCriptografiaView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDN.BaseMobileView, FMX.ScrollBox, FMX.Memo, FMX.Edit,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts;

type
  TCriptografiaView = class(TBaseMobileView)
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    LabelTextoHash: TLabel;
    EditHashValor: TEdit;
    Memo1: TMemo;
    ButtonCalcularHash: TButton;
    procedure ButtonCalcularHashClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CriptografiaView: TCriptografiaView;

implementation

{$R *.fmx}

uses MDN.Criptografy;

procedure TCriptografiaView.ButtonCalcularHashClick(Sender: TObject);
var
  Cript: TCriptografy;
begin
  inherited;
  Cript := TCriptografy.Create;
  Memo1.Lines.Add(Cript.HashStringToMD5(EditHashValor.Text));
  Cript.Free;
end;

procedure TCriptografiaView.FormCreate(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
end;

end.
