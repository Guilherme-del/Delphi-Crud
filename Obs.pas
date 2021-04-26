unit Obs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, IBCustomDataSet, IBQuery, Datasnap.DBClient;

type
  TfrmObs = class(TForm)
    Label12: TLabel;
    Confirmar: TBitBtn;
    btnCanc: TBitBtn;
    memoObs: TDBMemo;
    procedure ConfirmarClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObs: TfrmObs;

implementation

{$R *.dfm}

uses crud, tabelas, Pesquisar;

procedure TfrmObs.btnCancClick(Sender: TObject);
begin
   frmCadastroCliente.qryObs.Cancel;
  Close;
end;

procedure TfrmObs.ConfirmarClick(Sender: TObject);
begin
  frmCadastroCliente.qryObs.Post;
   frmCadastroCliente.qryObs.ApplyUpdates;
    frmCadastroCliente.qryObs.Transaction.CommitRetaining;
  close;
end;

procedure TfrmObs.FormShow(Sender: TObject);
begin
  memoObs.SetFocus;
end;
end.
