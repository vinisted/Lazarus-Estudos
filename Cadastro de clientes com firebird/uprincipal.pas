unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
  Uses uClientes;

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure TfrmPrincipal.MenuItem2Click(Sender: TObject);
begin
  frmClientes.showmodal;
end;

end.

