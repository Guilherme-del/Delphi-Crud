program Projeto;

uses
  Vcl.Forms,
  crud in 'crud.pas' {frmCadastroCliente},
  tabelas in 'tabelas.pas' {dmTabelas: TDataModule},
  Obs in 'Obs.pas' {frmObs},
  Pesquisar in 'Pesquisar.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmTabelas, dmTabelas);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmObs, frmObs);
  Application.Run;
end.
