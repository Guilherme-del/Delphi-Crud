unit Rels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, DB, IBCustomDataSet, IBQuery, Grids, ExtCtrls,
  StdCtrls, FFKNumEdit, Mask,  Buttons,  IBSQL, IniFiles,
  Menus,  IBDatabase, uutils, frxClass, frxChart,
  frxBarcode, frxDCtrl, frxDMPExport, frxGradient, frxCross, frxExportXLS,
  frxIBXComponents, frxExportPDF, frxExportHTML, frxExportRTF,
  frxExportCSV, frxExportMail, frxExportText, frxExportTXT, frxExportODF,
  frxDesgn, frxRich,  ComCtrls, ImgList;

type
   TString = class(TObject)
   private
     fStr: String;
     fDescr: String;
   public
     constructor Create(const AStr, ADescr: String) ;
     property Str: String read FStr write FStr;
     property Descr: String read FDescr write FDescr;
   end;

   TfrmRels = class(TForm)
    BitBtn2: TBitBtn;
    popRel: TPopupMenu;
    mnuNovoRel: TMenuItem;
    mnuEditarRel: TMenuItem;
    mnuDelRel: TMenuItem;
    btnImprimir: TBitBtn;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Novorelatrio1: TMenuItem;
    ImageList1: TImageList;
    memDescr: TMemo;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TreeViewPrm: TTreeView;
    TreeViewUsr: TTreeView;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Novorelatrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeViewPrmChange(Sender: TObject; Node: TTreeNode);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PathRelsPrm, PathRelsUsr: String;
  public
    { Public declarations }
  end;

var
  frmRels: TfrmRels;

implementation

uses TabPrincipal, TabRels;

{$R *.dfm}

constructor TString.Create(const AStr, ADescr: String) ;
begin
   inherited Create;
   FStr := AStr;
   FDescr := ADescr
end;

procedure TfrmRels.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRels.btnImprimirClick(Sender: TObject);
var
  ArqRel: string;
begin
  if PageControl.ActivePageIndex=0 then
    ArqRel := TString(TreeviewPrm.Selected.Data).fStr
  else
    ArqRel := TString(TreeviewUsr.Selected.Data).fStr;
  if ( ArqRel<>'' ) and FileExists( ArqRel ) then
  begin
    dmTabRels.frxReport.Report.LoadFromFile( ArqRel );
    dmTabRels.frxReport.ShowReport;
  end
  else
    Aviso('Problema ao abrir o arquivo de configuração do relatório!');
end;

procedure TfrmRels.Editar1Click(Sender: TObject);
var
  ArqRel: string;
begin
  if PageControl.ActivePageIndex=0 then
    ArqRel := TString(TreeviewPrm.Selected.Data).fStr
  else
    ArqRel := TString(TreeviewUsr.Selected.Data).fStr;
  if ( ArqRel<>'' ) and FileExists( ArqRel ) then
  begin
    dmTabRels.frxReport.Report.LoadFromFile( ArqRel );
    dmTabRels.frxReport.DesignReport;
  end
  else
    Aviso('Problema ao abrir o arquivo de configuração do relatório!');
end;

procedure TfrmRels.Novorelatrio1Click(Sender: TObject);
begin
  dmTabRels.frxReport.Report.Clear;
  dmTabRels.frxReport.DesignReport;
end;

procedure TfrmRels.FormCreate(Sender: TObject);

  procedure ListaRels( TreeView: TTreeView; Path: String; NodeAux: TTreeNode );
  var
    SR1: TSearchRec;
    NodeAux1: TTreeNode;
  begin
    if FindFirst( Path + '*.fr3', faAnyFile, SR1) = 0 then
      repeat
        if ( not( SR1.Attr in [faDirectory, 17] ) ) and ( SR1.Name<>'' ) then
        begin
          dmTabRels.frxReportAux.LoadFromFile(Path + SR1.Name);
          if dmTabRels.frxReportAux.ReportOptions.Name <> '' then
            NodeAux1 := TreeView.Items.AddChild( NodeAux, dmTabRels.frxReportAux.ReportOptions.Name )
          else
            NodeAux1 := TreeView.Items.AddChild( NodeAux, SR1.Name );
          NodeAux1.Data          := TString.Create(Path + SR1.Name, dmTabRels.frxReportAux.ReportOptions.Description.Text );
          NodeAux1.ImageIndex    := 1;
          NodeAux1.SelectedIndex := 2;
        end;
      until FindNext(SR1) <> 0;
  end;

  procedure ListaDir2(TreeView: TTreeView; Path: String; NodeAux: TTreeNode);
  var
    SR1: TSearchRec;
    NodeAux1: TTreeNode;
  begin
    if FindFirst( Path + '*.*', faAnyFile, SR1) = 0 then
    begin
      repeat
        if ( SR1.Attr in [faDirectory, 17] ) and ( SR1.Name<>'' ) and (SR1.Name[1] <> '.') then
        begin
          NodeAux1 := TreeView.Items.AddChild( NodeAux, SR1.Name );
          NodeAux1.ImageIndex := 0;
          NodeAux1.SelectedIndex := 0;
        end;
      until FindNext(SR1) <> 0;
      ListaRels( TreeView, Path, NodeAux );
    end;
  end;

  procedure ListaDir1(TreeView: TTreeView; Path: String; NodeAux: TTreeNode);
  var
    SR1: TSearchRec;
    NodeAux1: TTreeNode;
  begin
    if FindFirst( Path + '*.*', faAnyFile, SR1) = 0 then
    begin
      repeat
        if ( SR1.Attr in [faDirectory, 17] ) and ( SR1.Name<>'' ) and (SR1.Name[1] <> '.') then
        begin
          NodeAux1 := TreeView.Items.AddChild(NodeAux,SR1.Name);
          NodeAux1.ImageIndex := 0;
          NodeAux1.SelectedIndex := 0;
          ListaDir2(TreeView, Path + SR1.Name + '\', NodeAux1);
        end;
      until FindNext(SR1) <> 0;
      ListaRels( TreeView, Path, NodeAux );
    end;
  end;

var
  SR: TSearchRec;
  Node1: TTreeNode;
begin
  dmTabPrincipal.FFKUtils.Aguarde('carregando relatórios!');
  try
    //Relatórios padrões do Premium
    PathRelsPrm := GetCurrentDir + '\Reports\Premium\';
    if not DirectoryExists( PathRelsPrm ) then
      if not ForceDirectories( PathRelsPrm ) then
        Erro( 'Erro ao criar o diretório padrão de relatórios do sistema!' + #13#10 + #13#10 + 'Favor criá-lo manualmente: ' + #13#10 + PathRelsPrm );
    if FindFirst( PathRelsPrm + '*.*', faAnyFile, SR) = 0 then
    begin
      repeat
        if ( SR.Attr in [faDirectory, 17] ) and ( SR.Name<>'' ) and (SR.Name[1] <> '.') then
        begin
          Node1 := TreeViewPrm.Items.Add(nil,SR.Name);
          Node1.ImageIndex    := 0;
          Node1.SelectedIndex := 0;
          ListaDir1( TreeViewPrm, PathRelsPrm + SR.Name + '\', Node1 );
        end;
      until FindNext(SR) <> 0;
      ListaRels( TreeViewPrm, PathRelsPrm, nil );
    end;
    //Relatórios personalizados pelo usuário
    PathRelsUsr := dmTabPrincipal.PathConfig + 'Reports\Usuario\';
    if not DirectoryExists( PathRelsUsr ) then
      if not ForceDirectories( PathRelsUsr ) then
        Erro( 'Erro ao criar o diretório padrão de relatórios personalizados!' + #13#10 + #13#10 + 'Favor criá-lo manualmente: ' + #13#10 + PathRelsUsr );
    dmTabRels.frxDesigner.SaveDir := PathRelsUsr;
    if FindFirst( PathRelsUsr + '*.*', faAnyFile, SR) = 0 then
    begin
      repeat
        if ( SR.Attr in [faDirectory, 17] ) and ( SR.Name<>'' ) and (SR.Name[1] <> '.') then
        begin
          Node1 := TreeViewUsr.Items.Add(nil,SR.Name);
          Node1.ImageIndex    := 0;
          Node1.SelectedIndex := 0;
          ListaDir1( TreeViewUsr, PathRelsUsr + SR.Name + '\', Node1 );
        end;
      until FindNext(SR) <> 0;
      ListaRels( TreeViewUsr, PathRelsUsr, nil );
    end;

    TreeViewPrm.SortType := stText;
    TreeViewUsr.SortType := stText;

  finally
    dmTabPrincipal.FFKUtils.FimAguarde;
  end;
end;

procedure TfrmRels.TreeViewPrmChange(Sender: TObject; Node: TTreeNode);
begin
  if ( not Node.HasChildren ) and ( Node.Data <> Nil ) then
  begin
    btnImprimir.Enabled := True;
    memDescr.Lines.Text := TString( Node.Data ).Descr;
  end
  else
  begin
    btnImprimir.Enabled := False;
    memDescr.Lines.Text := '';
  end;
end;

procedure TfrmRels.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i:=0 to TreeViewPrm.Items.Count-1 do
  begin
    if TreeViewPrm.Items.Item[i].Data<>nil then
    begin
      TString( TreeViewPrm.Items.Item[i].Data ).Free;
      TreeViewPrm.Items.Item[i].Data := Nil;
    end;
  end;
  for i:=0 to TreeViewUsr.Items.Count-1 do
  begin
    if TreeViewUsr.Items.Item[i].Data<>nil then
    begin
      TString( TreeViewUsr.Items.Item[i].Data ).Free;
      TreeViewUsr.Items.Item[i].Data := Nil;
    end;
  end;
end;

procedure TfrmRels.FormShow(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

end.
