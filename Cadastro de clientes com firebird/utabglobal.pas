unit uTabGlobal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, FBAdmin, SQLDB, DB;

type

  { TTabGlobal }

  TTabGlobal = class(TDataModule)
    conexao: TIBConnection;
    TCliente: TSQLQuery;
    TClienteBAIRRO: TStringField;
    TClienteCEP: TStringField;
    TClienteCIDADE: TStringField;
    TClienteCODIGO: TLongintField;
    TClienteENDERECO: TStringField;
    TClienteNOME: TStringField;
    TClienteTELEFONE: TStringField;
    TClienteUF: TStringField;
    Transacao: TSQLTransaction;
    procedure TClienteAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.TClienteAfterPost(DataSet: TDataSet);
begin
  TCliente.ApplyUpdates;
  Transacao.CommitRetaining;
  TCliente.Refresh;
  TCliente.Close;
  TCliente.SQl.Clear;
  TCliente.SQl.Add('select * from Clientes');
  TCliente.SQl.Add('order by Nome');
  TCliente.Prepare;
  TCliente.Open;
end;

end.

