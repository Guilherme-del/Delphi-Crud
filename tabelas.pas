unit tabelas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, IBCustomDataSet, IBQuery, IBDatabase,
  Datasnap.DBClient;

type
  TdmTabelas = class(TDataModule)
    IBTransaction: TIBTransaction;
    Database: TIBDatabase;
    qryCliente: TIBDataSet;
    dsCliente: TDataSource;
    qryClienteCODIGO: TIntegerField;
    qryClienteDATA: TDateField;
    qryClienteNOME: TIBStringField;
    qryClienteTELEFONE: TIBStringField;
    qryClienteCELULAR: TIBStringField;
    qryClienteFAX: TIBStringField;
    qryClienteENDERECO: TIBStringField;
    qryClienteNUMERO: TIBStringField;
    qryClienteBAIRRO: TIBStringField;
    qryClienteCIDADE: TIBStringField;
    qryClienteESTADO: TIBStringField;
    qryClienteCEP: TIBStringField;
    procedure qryClienteAfterScroll(DataSet: TDataSet);
    procedure qryClienteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTabelas: TdmTabelas;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses crud, Obs, Pesquisar;

{$R *.dfm}

procedure TdmTabelas.qryClienteAfterOpen(DataSet: TDataSet);
begin
  frmCadastroCliente.lblClie1.Caption := qryClienteNOME.Value;
  frmCadastroCliente.lblClie2.Caption := qryClienteNOME.Value;

end;

procedure TdmTabelas.qryClienteAfterScroll(DataSet: TDataSet);
begin
  if frmCadastroCliente.cbPago.Checked = false then
  begin
    frmCadastroCliente.qryPagamento.Close;
    frmCadastroCliente.qryPagamento.ParamByName('pcodclie').AsInteger :=
      dmTabelas.qryClienteCODIGO.Value;
    frmCadastroCliente.qryPagamento.ParamByName('pago').AsString := 'N';
    frmCadastroCliente.qryPagamento.Open;
  end
  else
  begin
    frmCadastroCliente.qryPagamento.Close;
    frmCadastroCliente.qryPagamento.ParamByName('pcodclie').AsInteger :=
      dmTabelas.qryClienteCODIGO.Value;
    frmCadastroCliente.qryPagamento.ParamByName('pago').AsString := 'S';
    frmCadastroCliente.qryPagamento.Open;
  end;

  frmCadastroCliente.qryObs.Close;
  frmCadastroCliente.qryObs.ParamByName('pcodclie').AsInteger :=
    dmTabelas.qryClienteCODIGO.Value;
  frmCadastroCliente.qryObs.Open;

  frmCadastroCliente.lblClie1.Caption :=  qryClienteNome.Value;
   frmCadastroCliente.lblClie2.Caption :=  qryClienteNome.Value;
end;
end.
