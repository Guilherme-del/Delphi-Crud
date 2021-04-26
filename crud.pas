unit crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Vcl.ComCtrls, Data.Bind.DBScope, Vcl.Buttons, Vcl.Bind.Navigator,
  System.IniFiles, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Menus, IBCustomDataSet, JvExMask, JvToolEdit,
  JvDBControls, FFKNumEdit, ACBrBase, ACBrEnterTab;

type
  TfrmCadastroCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnSave: TBitBtn;
    btnCanc: TBitBtn;
    btnPrimerio: TBitBtn;
    btnAnterior: TBitBtn;
    btnprox: TBitBtn;
    btnUltimo: TBitBtn;
    btnNovo: TBitBtn;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label7: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    UF: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edtEnd: TDBEdit;
    edtTel: TDBEdit;
    edtCodigo: TDBEdit;
    edtData: TDBEdit;
    edtNome: TDBEdit;
    edtCel: TDBEdit;
    edtNum: TDBEdit;
    edtBairro: TDBEdit;
    edtCidade: TDBEdit;
    edtUF: TDBEdit;
    edtCEP: TDBEdit;
    edtFax: TDBEdit;
    TabSheet2: TTabSheet;
    popObs: TPopupMenu;
    btnInserir: TMenuItem;
    gridObs: TDBGrid;
    btnAlterar: TMenuItem;
    btnApagar: TMenuItem;
    dsCliente: TDataSource;
    Label1: TLabel;
    btnPesquisar: TBitBtn;
    TabSheet3: TTabSheet;
    dsPagamento: TDataSource;
    lblClie: TLabel;
    qryPagamento: TIBDataSet;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    btnAdd: TBitBtn;
    edtDesc: TEdit;
    edtValor: TFFKNumEdit;
    edtQtde: TFFKNumEdit;
    edtTotal: TFFKNumEdit;
    dbedtData: TJvDateEdit;
    popPag: TPopupMenu;
    btnPagar: TMenuItem;
    btnAltera: TMenuItem;
    btnExclusão: TMenuItem;
    qryObs: TIBDataSet;
    qryObsCODIGO: TIntegerField;
    qryObsCODCLIE: TIntegerField;
    qryObsDATA: TDateField;
    qryObsOBS: TIBStringField;
    dsObs: TDataSource;
    lblClie1: TLabel;
    Label18: TLabel;
    lblClie2: TLabel;
    lblSoma: TLabel;
    Image1: TImage;
    cbPago: TCheckBox;
    dbgridPg: TDBGrid;
    qryPagamentoCODIGO: TIntegerField;
    qryPagamentoCOD_CLIE: TIntegerField;
    qryPagamentoDATA: TDateField;
    qryPagamentoDATA_VENC: TDateField;
    qryPagamentoDESCRICAO: TIBStringField;
    qryPagamentoVALOR_UN: TIBBCDField;
    qryPagamentoQTDE: TIBBCDField;
    qryPagamentoVALOR_TOTAL: TIBBCDField;
    qryPagamentoPAGO: TIBStringField;
    Label19: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    popBusca: TPopupMenu;
    Clientes1: TMenuItem;
    Relatorios1: TMenuItem;
    procedure btnNovoclick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure btnPrimerioClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnproxClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure qryPagamentoCalcFields(DataSet: TDataSet);
    procedure qryPagamentoNewRecord(DataSet: TDataSet);
    procedure btnPagarClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnExclusãoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure qryPagamentoAfterOpen(DataSet: TDataSet);
    procedure cbPagoClick(Sender: TObject);
    procedure dbgridPgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtTotalChange(Sender: TObject);
    procedure dbedtDataButtonClick(Sender: TObject);
    procedure dbedtDataEnter(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);

  private
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses tabelas, Obs, Pesquisar;

procedure TfrmCadastroCliente.btnEditClick(Sender: TObject);
begin
  TabSheet1.Show;
  dmTabelas.qryCliente.Edit;
  dmTabelas.qryClienteDATA.AsDateTime := Now;
  edtNome.SetFocus;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
end;

procedure TfrmCadastroCliente.btnExclusãoClick(Sender: TObject);
begin
  try
    if Application.MessageBox('Deseja realmente excluir este registro',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin
      qryPagamento.Delete;
      qryPagamento.ApplyUpdates;
      qryPagamento.Transaction.CommitRetaining;

      qryPagamento.Close;
      qryPagamento.Open;
    end;
  Except
    on E: Exception do
      ShowMessage('Impossivel excluir um registro vazio');
  end;
end;

procedure TfrmCadastroCliente.btnCancClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Cancel;
  TabSheet2.TabVisible := True;
  TabSheet3.TabVisible := True;
end;

procedure TfrmCadastroCliente.btnAddClick(Sender: TObject);
begin
  try
    begin
      if edtDesc.Text = '' then
      begin
        ShowMessage('Componente não pode ser nulo');
        edtDesc.SetFocus;
      end
      else if dsPagamento.State in [dsEdit] then
      begin

        qryPagamentoCOD_CLIE.Value := dmTabelas.qryClienteCODIGO.Value;
        qryPagamentoDATA.AsDateTime := Now;
        qryPagamentoCOD_CLIE.Value := dmTabelas.qryClienteCODIGO.Value;
        qryPagamentoDATA_VENC.Value := dbedtData.Date;
        qryPagamentoQTDE.Value := edtQtde.AsCurrency;
        qryPagamentoVALOR_TOTAL.Value := edtTotal.Value;
        qryPagamentoVALOR_UN.Value := edtValor.AsCurrency;
        qryPagamentoDESCRICAO.Value := Trim(edtDesc.Text);

        qryPagamento.Post;
        qryPagamento.ApplyUpdates;
        qryPagamento.Transaction.CommitRetaining;

        qryPagamento.Close;
        qryPagamento.Open;

        edtQtde.Value := 1;
        dbedtData.Clear;
        edtTotal.Clear;
        edtDesc.Clear;
        edtValor.Clear;

      end
      else if (edtQtde.Value <> 0) or (edtValor.Value <> 0) then
      begin
        edtDesc.SetFocus;
        qryPagamento.Append;
        qryPagamentoPAGO.Value := 'N';
        qryPagamentoDATA.AsDateTime := Now;
        qryPagamentoCOD_CLIE.Value := dmTabelas.qryClienteCODIGO.Value;
        qryPagamentoDATA_VENC.Value := dbedtData.Date;
        qryPagamentoQTDE.Value := edtQtde.AsCurrency;
        qryPagamentoVALOR_TOTAL.Value := edtTotal.Value;
        qryPagamentoVALOR_UN.Value := edtValor.AsCurrency;
        qryPagamentoDESCRICAO.Value := Trim(edtDesc.Text);

        qryPagamento.Post;
        qryPagamento.ApplyUpdates;
        qryPagamento.Transaction.CommitRetaining;

        qryPagamento.Close;
        qryPagamento.Open;

        edtQtde.Value := 1;
        dbedtData.Clear;
        edtTotal.Clear;
        edtDesc.Clear;
        edtValor.Clear;
      end
    end;
  except
    ShowMessage('Cancelando.....');
    qryPagamento.CancelUpdates;
    raise;
  end
end;

procedure TfrmCadastroCliente.btnAlteraClick(Sender: TObject);
begin
  qryPagamento.Edit;

  frmCadastroCliente.qryPagamentoCOD_CLIE.Value :=
    dmTabelas.qryClienteCODIGO.Value;
  dbedtData.Date := qryPagamentoDATA_VENC.Value;
  edtDesc.Text := qryPagamentoDESCRICAO.Value;
  edtValor.Value := qryPagamentoVALOR_UN.Value;
  edtQtde.Value := qryPagamentoQTDE.Value;
  edtTotal.Value := qryPagamentoVALOR_TOTAL.Value;
  edtDesc.SetFocus;
end;

procedure TfrmCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  frmCadastroCliente.qryObs.Edit;
  frmCadastroCliente.qryObsCODCLIE.Value := dmTabelas.qryClienteCODIGO.Value;
  frmCadastroCliente.qryObsDATA.AsDateTime := Now;
  frmObs.showmodal;
end;

procedure TfrmCadastroCliente.btnAnteriorClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Prior;
end;

procedure TfrmCadastroCliente.btnApagarClick(Sender: TObject);
begin
  try
    if Application.MessageBox('Deseja realmente excluir este registro',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin
      frmCadastroCliente.qryObs.Delete;
      frmCadastroCliente.qryObs.ApplyUpdates;
      frmCadastroCliente.qryObs.Transaction.CommitRetaining;
    end;
  Except
    on E: Exception do
      ShowMessage('Impossivel excluir um registro vazio');
  end;
end;

procedure TfrmCadastroCliente.btnDelClick(Sender: TObject);
begin
  try
    if PageControl.ActivePage <> TabSheet1 then
    begin
      TabSheet1.Show;
      if Application.MessageBox('Deseja realmente excluir este registro',
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin
        dmTabelas.qryCliente.Delete;
        dmTabelas.qryCliente.ApplyUpdates;
        dmTabelas.qryCliente.Transaction.CommitRetaining;
        dmTabelas.qryCliente.Last;
      end;
    end
    else if PageControl.ActivePage = TabSheet1 then
      if Application.MessageBox('Deseja realmente excluir este registro',
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin
        dmTabelas.qryCliente.Delete;
        dmTabelas.qryCliente.ApplyUpdates;
        dmTabelas.qryCliente.Transaction.CommitRetaining;
        dmTabelas.qryCliente.Last;
      end;
  Except
    on E: Exception do
      ShowMessage('Impossivel excluir um registro vazio');
  end;
end;

procedure TfrmCadastroCliente.btnNovoclick(Sender: TObject);
begin
  TabSheet1.Show;
  dmTabelas.qryCliente.Refresh;
  dmTabelas.qryCliente.Append;
  dmTabelas.qryClienteDATA.AsDateTime := Now;
  edtNome.SetFocus;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
end;

procedure TfrmCadastroCliente.btnPagarClick(Sender: TObject);
begin
  qryPagamento.Edit;
  qryPagamentoPAGO.Value := 'S';

  qryPagamento.Post;
  qryPagamento.Transaction.CommitRetaining;
  qryPagamento.ApplyUpdates;

  qryPagamento.Close;
  qryPagamento.Open;
end;

procedure TfrmCadastroCliente.btnPesquisarClick(Sender: TObject);
var
  P1, P2: TPoint;
begin
  P1.X := btnPesquisar.Left;
  P1.Y := btnPesquisar.Top + btnPesquisar.Height;
  P2 := ClientToScreen(P1);
  popBusca.PopUp(P2.X, P2.Y);
end;

procedure TfrmCadastroCliente.btnPrimerioClick(Sender: TObject);
begin
  dmTabelas.qryCliente.First;
end;

procedure TfrmCadastroCliente.btnproxClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Next;
end;

procedure TfrmCadastroCliente.btnSaveClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Post;
  dmTabelas.qryCliente.ApplyUpdates;
  dmTabelas.qryCliente.Transaction.CommitRetaining;
  TabSheet2.TabVisible := True;
  TabSheet3.TabVisible := True;
end;

procedure TfrmCadastroCliente.btnUltimoClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Last;
end;

procedure TfrmCadastroCliente.cbPagoClick(Sender: TObject);
begin
  if frmCadastroCliente.cbPago.Checked = False then
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
end;

procedure TfrmCadastroCliente.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  IF frmPesquisa.showmodal = mrOk then
      frmPesquisa.edtValor.SetFocus;
  begin
    dmTabelas.qryCliente.Locate('CODIGO', frmPesquisa.qryBuscaCODIGO.Value, []);
  end;
  FreeAndNil(frmPesquisa);
end;


procedure TfrmCadastroCliente.dsClienteStateChange(Sender: TObject);
begin
  if dmTabelas.qryCliente.State in [dsInsert, dsEdit] then
  begin
    btnNovo.Enabled := False;
    btnSave.Enabled := True;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnCanc.Enabled := True;
    btnPrimerio.Enabled := False;
    btnAnterior.Enabled := False;
    btnprox.Enabled := False;
    btnUltimo.Enabled := False;
    edtNome.Enabled := True;
    edtTel.Enabled := True;
    edtNum.Enabled := True;
    edtEnd.Enabled := True;
    edtCidade.Enabled := True;
    edtCEP.Enabled := True;
    edtFax.Enabled := True;
    edtBairro.Enabled := True;
    edtUF.Enabled := True;
    edtCel.Enabled := True;
    btnPesquisar.Enabled := False;
  end
  else
  begin
    btnDel.Enabled := True;
    btnSave.Enabled := False;
    btnEdit.Enabled := True;
    btnCanc.Enabled := False;
    btnNovo.Enabled := True;
    btnPrimerio.Enabled := True;
    btnAnterior.Enabled := True;
    btnprox.Enabled := True;
    btnUltimo.Enabled := True;
    edtNome.Enabled := False;
    edtTel.Enabled := False;
    edtNum.Enabled := False;
    edtEnd.Enabled := False;
    edtCidade.Enabled := False;
    edtCEP.Enabled := False;
    edtFax.Enabled := False;
    edtBairro.Enabled := False;
    edtUF.Enabled := False;
    edtCel.Enabled := False;
    btnPesquisar.Enabled := True;
  end;
end;

procedure TfrmCadastroCliente.Editar1Click(Sender: TObject);
begin
  dmTabelas.qryCliente.Edit;
  dmTabelas.qryClienteDATA.AsDateTime := Now;
end;

procedure TfrmCadastroCliente.edtTotalChange(Sender: TObject);
begin
  edtTotal.Value := edtValor.Value * edtQtde.Value;
end;

procedure TfrmCadastroCliente.edtValorChange(Sender: TObject);
begin
  edtTotal.Value := edtValor.Value * edtQtde.Value;
end;

procedure TfrmCadastroCliente.Excluir1Click(Sender: TObject);
begin
  try
    if Application.MessageBox('Deseja realmente excluir este registro',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin
      dmTabelas.qryCliente.Delete;
      dmTabelas.qryCliente.ApplyUpdates;
      dmTabelas.qryCliente.Transaction.CommitRetaining;;
    end;
  Except
    on E: Exception do
      ShowMessage('Impossivel excluir um registro vazio');
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  dmTabelas.qryCliente.Open;
end;

procedure TfrmCadastroCliente.dbedtDataButtonClick(Sender: TObject);
begin
  dbedtData.Date := Now;
end;

procedure TfrmCadastroCliente.dbedtDataEnter(Sender: TObject);
begin
  dbedtData.Date := Now;
end;

procedure TfrmCadastroCliente.dbgridPgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ((qryPagamentoDATA_VENC.Value < Date) and (cbPago.Checked = False)) then
  begin
    dbgridPg.Canvas.Font.Color := clRed;
    dbgridPg.DefaultDrawDataCell(Rect, dbgridPg.Columns[DataCol].Field, State);
  end
  else if frmCadastroCliente.qryPagamento.ParamByName('pago').AsString = 'S'
  then
    dbgridPg.Canvas.Font.Color := clGreen;
  dbgridPg.DefaultDrawDataCell(Rect, dbgridPg.Columns[DataCol].Field, State);
end;

procedure TfrmCadastroCliente.PageControlChange(Sender: TObject);
begin
  inherited;

  if PageControl.ActivePage = TabSheet2 then
  begin
    // teste
  end;

  inherited;

  if PageControl.ActivePage = TabSheet3 then
  begin
    dbedtData.SetFocus;
    // qryPagamento.append;

  end;

  if PageControl.ActivePage = TabSheet1 then
  begin
    dmTabelas.qryCliente.Open;

  end;
end;

procedure TfrmCadastroCliente.qryPagamentoAfterOpen(DataSet: TDataSet);
var
  soma: Currency;
begin
  qryPagamento.First;
  soma := 0;
  while not qryPagamento.eof do
  begin
    soma := soma + qryPagamento.FieldByName('Valor_Total').AsFloat;
    qryPagamento.Next;
  end;
  lblSoma.Caption := FormatFloat('R$ ###,##0.00', soma);
end;

procedure TfrmCadastroCliente.qryPagamentoCalcFields(DataSet: TDataSet);
begin
  // qryPagamentoVALOR_UN.AsCurrency :=
  // ((qryPagamentoVALOR_UN.Value) * (qryPagamentoQTDE.Value));
end;

procedure TfrmCadastroCliente.qryPagamentoNewRecord(DataSet: TDataSet);
begin
  qryPagamentoCOD_CLIE.AsInteger := dmTabelas.qryClienteCODIGO.AsInteger;
end;

procedure TfrmCadastroCliente.btnInserirClick(Sender: TObject);
begin
  frmCadastroCliente.qryObs.Close;
  frmCadastroCliente.qryObs.Open;
  frmCadastroCliente.qryObs.Refresh;
  frmCadastroCliente.qryObs.Append;
  frmCadastroCliente.qryObsCODCLIE.Value := dmTabelas.qryClienteCODIGO.Value;
  frmCadastroCliente.qryObsDATA.AsDateTime := Now;
  frmObs.showmodal;

  if frmObs.memoObs.Text = '' then
  begin
    ShowMessage('Impossivel adicionar um registro vazio');
    frmCadastroCliente.qryObs.Close;
    frmCadastroCliente.qryObs.Open;
    frmCadastroCliente.qryObs.Append;
    frmCadastroCliente.qryObsCODCLIE.Value := dmTabelas.qryClienteCODIGO.Value;
    frmCadastroCliente.qryObsDATA.AsDateTime := Now;
    frmObs.showmodal;
  end;
end;

end.
