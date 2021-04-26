unit Pesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, JvDBCombobox, JvExControls, JvDBLookup, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, ACBrBase, ACBrEnterTab, IBCustomDataSet, IBQuery, Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    btnConfirmar: TBitBtn;
    BitBtn1: TBitBtn;
    edtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    gridBusca: TDBGrid;
    cmbIndex: TComboBox;
    dsBusca: TDataSource;
    qryBusca: TIBQuery;
    qryBuscaCODIGO: TIntegerField;
    qryBuscaNOME: TIBStringField;
    tmrBusca: TTimer;
    ACBrEnterTab1: TACBrEnterTab;
    procedure edtValorChange(Sender: TObject);
    procedure gridBuscaDblClick(Sender: TObject);
    procedure cmbIndexKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tmrBuscaTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses tabelas, crud, Obs;

procedure TfrmPesquisa.BitBtn1Click(Sender: TObject);
begin
CloseModal;
end;

procedure TfrmPesquisa.btnConfirmarClick(Sender: TObject);
begin
  if edtValor.Text = '' then
    try
      if Application.MessageBox
        ('Impossivel encontrar um registro vazio, deseja tentar novamente?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  IF frmPesquisa.showmodal = mrOk then
  begin
  edtvalor.SetFocus;
    dmTabelas.qryCliente.Locate('CODIGO', frmPesquisa.qryBuscaCODIGO.Value, [])
  end;
  FreeAndNil(frmPesquisa);
end;
    Except
      on E: Exception do
        ShowMessage('FATAL ERROR');
    end;
end;

procedure TfrmPesquisa.cmbIndexKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmPesquisa.edtValorChange(Sender: TObject);
begin
  tmrBusca.Enabled := False;
  tmrBusca.Enabled := True;
end;

procedure TfrmPesquisa.gridBuscaDblClick(Sender: TObject);
begin
  dmTabelas.qryCliente.Locate('CODIGO', frmPesquisa.qryBuscaCODIGO.Value, []);
  Close;
end;

procedure TfrmPesquisa.tmrBuscaTimer(Sender: TObject);
begin
  tmrBusca.Enabled := False;
  if edtValor.Text <> '' then
  begin
    qryBusca.Close;
    qryBusca.SQL.Clear;
    qryBusca.SQL.Add('SELECT * FROM cliente');
    if cmbIndex.ItemIndex = 0 then
    begin
      qryBusca.SQL.Add('WHERE codigo = ' + edtValor.Text);
    end
    else
    begin
      qryBusca.SQL.Add('WHERE nome CONTAINING ' + quotedStr(edtValor.Text));
    end;
    qryBusca.open;
  end
  else
  begin
    qryBusca.Close;
  end;
end;

end.
