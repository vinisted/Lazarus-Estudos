unit uClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  DBGrids, StdCtrls, DBCtrls;

type

  { TfrmClientes }

  TfrmClientes = class(TForm)
    btnPesquisa: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    DCliente: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    rbNome: TRadioButton;
    rbCodigo: TRadioButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private

  public

  end;

var
  frmClientes: TfrmClientes;

implementation
  uses uTabGlobal;

{$R *.lfm}

  { TfrmClientes }

  procedure TfrmClientes.DBEdit1Change(Sender: TObject);
  begin

  end;

procedure TfrmClientes.btnPesquisaClick(Sender: TObject);
begin
  TabGlobal.TCliente.Close;
  TabGlobal.TCliente.SQL.Clear;
  TabGlobal.TCliente.SQL.Add('select * from clientes');
  if rbNome.Checked then;
  begin
    TabGlobal.TCliente.SQL.Add('where Nome like :cNOME');
    TabGlobal.TCliente.SQL.Add('order by Nome');
    TabGlobal.TCliente.ParamByName('cNOME').AsString := '%' + UpperCase(edtPesquisa.text) + '%';
  end;
  TabGlobal.TCliente.Prepare;
  TabGlobal.TCliente.Open;
end;

end.

