unit MDN.BaseMobileToolbarView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  MDN.BaseMobileView, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
  TBaseMobileToolbarView = class(TBaseMobileView)
    MainLayout: TLayout;
    MainToolBar: TToolBar;
    MainButton: TSpeedButton;
    ContextButton: TSpeedButton;
    ViewTitle: TLabel;
    ActionButton: TSpeedButton;
    ToolbarImage: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseMobileToolbarView: TBaseMobileToolbarView;

implementation

{$R *.fmx}

end.
