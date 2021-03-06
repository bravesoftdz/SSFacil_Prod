unit UDMMapaProd;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, frxRich,
  frxExportMail, frxClass, frxExportPDF, frxDBSet;

type
  TDMMapaProd = class(TDataModule)
    sdsConsulta_Lote: TSQLDataSet;
    dspConsulta_Lote: TDataSetProvider;
    cdsConsulta_Lote: TClientDataSet;
    dsConsulta_Lote: TDataSource;
    mMapa: TClientDataSet;
    mMapaNum_Ordem: TIntegerField;
    mMapaNum_Lote: TIntegerField;
    mMapaID_Produto: TIntegerField;
    mMapaID_Combinacao: TIntegerField;
    mMapaReferencia: TStringField;
    mMapaNome_Produto: TStringField;
    mMapaNome_Combinacao: TStringField;
    mMapaQtd: TIntegerField;
    sdsTam: TSQLDataSet;
    dspTam: TDataSetProvider;
    cdsTam: TClientDataSet;
    cdsTamTAMANHO: TStringField;
    dsmMapa: TDataSource;
    cdsConsulta_LoteNUM_LOTE: TIntegerField;
    cdsConsulta_LoteDTENTREGA: TDateField;
    cdsConsulta_LoteNUM_ORDEM: TIntegerField;
    cdsConsulta_LoteID: TIntegerField;
    cdsConsulta_LoteID_PRODUTO: TIntegerField;
    cdsConsulta_LoteTAMANHO: TStringField;
    cdsConsulta_LoteQTD: TFloatField;
    cdsConsulta_LoteID_COMBINACAO: TIntegerField;
    cdsConsulta_LoteREFERENCIA: TStringField;
    cdsConsulta_LoteNOME_PRODUTO: TStringField;
    cdsConsulta_LoteUNIDADE: TStringField;
    cdsConsulta_LoteID_GRADE: TIntegerField;
    cdsConsulta_LoteNOME_COMBINACAO: TStringField;
    mMapaQTam1: TStringField;
    mMapaQTam2: TStringField;
    mMapaQTam3: TStringField;
    mMapaQTam4: TStringField;
    mMapaQTam5: TStringField;
    mMapaQTam6: TStringField;
    mMapaQTam7: TStringField;
    mMapaQTam8: TStringField;
    mMapaQTam9: TStringField;
    mMapaQTam10: TStringField;
    mMapaQTam11: TStringField;
    mMapaQTam12: TStringField;
    mMapaQTam13: TStringField;
    mMapaQTam14: TStringField;
    mMapaQTam15: TStringField;
    mMapaTipo: TStringField;
    frxReport1: TfrxReport;
    frxmMapa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxTam: TfrxDBDataset;
    dsTam: TDataSource;
    mMapaAgrupar: TStringField;
    sdsTamQ: TSQLDataSet;
    dspTamQ: TDataSetProvider;
    cdsTamQ: TClientDataSet;
    dsTamQ: TDataSource;
    cdsTamQQTD: TFloatField;
    cdsTamQTAMANHO: TStringField;
    frxTamQ: TfrxDBDataset;
    sdsConsulta_Talao: TSQLDataSet;
    dspConsulta_Talao: TDataSetProvider;
    cdsConsulta_Talao: TClientDataSet;
    dsConsulta_Talao: TDataSource;
    cdsConsulta_TalaoNUM_LOTE: TIntegerField;
    cdsConsulta_TalaoNUM_TALAO: TIntegerField;
    cdsConsulta_TalaoDTENTREGA: TDateField;
    cdsConsulta_TalaoNUM_ORDEM: TIntegerField;
    cdsConsulta_TalaoID: TIntegerField;
    cdsConsulta_TalaoID_PRODUTO: TIntegerField;
    cdsConsulta_TalaoTAMANHO: TStringField;
    cdsConsulta_TalaoQTD: TFloatField;
    cdsConsulta_TalaoID_COMBINACAO: TIntegerField;
    cdsConsulta_TalaoREFERENCIA: TStringField;
    cdsConsulta_TalaoNOME_PRODUTO: TStringField;
    cdsConsulta_TalaoUNIDADE: TStringField;
    cdsConsulta_TalaoID_GRADE: TIntegerField;
    cdsConsulta_TalaoNOME_COMBINACAO: TStringField;
    mMapa_Talao: TClientDataSet;
    dsmMapa_Talao: TDataSource;
    mMapa_TalaoNum_Ordem: TIntegerField;
    mMapa_TalaoNum_Lote: TIntegerField;
    mMapa_TalaoID_Produto: TIntegerField;
    mMapa_TalaoID_Combinacao: TIntegerField;
    mMapa_TalaoReferencia: TStringField;
    mMapa_TalaoNome_Produto: TStringField;
    mMapa_TalaoNome_Combinacao: TStringField;
    mMapa_TalaoQtd: TIntegerField;
    mMapa_TalaoTipo: TStringField;
    mMapa_TalaoAgrupar: TStringField;
    mMapa_TalaoTamanho: TStringField;
    mMapa_TalaoTalao: TIntegerField;
    mMapa_TalaoData1: TStringField;
    mMapa_TalaoData2: TStringField;
    mMapa_TalaoData3: TStringField;
    mMapa_TalaoData4: TStringField;
    mMapa_TalaoData5: TStringField;
    mMapa_TalaoData6: TStringField;
    mMapa_TalaoData7: TStringField;
    mMapa_TalaoData8: TStringField;
    mMapa_TalaoData9: TStringField;
    sdsSetorM: TSQLDataSet;
    dspSetorM: TDataSetProvider;
    cdsSetorM: TClientDataSet;
    sdsSetD: TSQLDataSet;
    dspSetD: TDataSetProvider;
    cdsSetD: TClientDataSet;
    dsSetD: TDataSource;
    dsSetorM: TDataSource;
    frxSetorM: TfrxDBDataset;
    cdsSetorMID: TIntegerField;
    cdsSetorMNOME: TStringField;
    cdsSetorMORDEM_ORC: TIntegerField;
    cdsSetorMENTRADA_AUT: TStringField;
    cdsSetorMIMP_MAPA: TStringField;
    cdsSetorMENCERRA_PROD: TStringField;
    cdsSetDDTENTRADA: TDateField;
    cdsSetDDTSAIDA: TDateField;
    cdsSetDNOME: TStringField;
    cdsSetDITEM: TIntegerField;
    cdsSetDIMP_MAPA: TStringField;
    cdsSetDENCERRA_PROD: TStringField;
    frxSetD: TfrxDBDataset;
    mMapa_TalaoNum_Talao: TIntegerField;
    frxmMapa_Talao: TfrxDBDataset;
    mMapaAux: TClientDataSet;
    mMapaAuxNum_Ordem: TIntegerField;
    mMapaAuxID_Produto: TIntegerField;
    mMapaAuxTamanho: TStringField;
    mMapaAuxQtd: TIntegerField;
    dsmMapaAux: TDataSource;
    frxTotal: TfrxDBDataset;
    sdsTotal: TSQLDataSet;
    dspTotal: TDataSetProvider;
    cdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    cdsTotalNUM_ORDEM: TIntegerField;
    cdsTotalID_PRODUTO: TIntegerField;
    cdsTotalTAMANHO: TStringField;
    cdsTotalQTD: TFloatField;
    frxTotalGeral: TfrxDBDataset;
    sdsTotalGeral: TSQLDataSet;
    dspTotalGeral: TDataSetProvider;
    cdsTotalGeral: TClientDataSet;
    dsTotalGeral: TDataSource;
    cdsTotalGeralTAMANHO: TStringField;
    cdsTotalGeralQTD: TFloatField;
    mSetorLote: TClientDataSet;
    dsSetorLote: TDataSource;
    mSetorLoteNUM_LOTE: TIntegerField;
    mSetorLoteID_SETOR: TIntegerField;
    mSetorLoteQUANTIDADE: TFloatField;
    cdsSetDQTD: TFloatField;
    cdsSetDID_SETOR: TIntegerField;
    cdsSetDNUM_LOTE: TIntegerField;
    mSetorLoteQUANTIDADE_ENCERRADO: TFloatField;
    frxSetorLote: TfrxDBDataset;
    mSetorLoteNOME_SETOR: TStringField;
    mSetorLoteAGRUPAR: TStringField;
    cdsConsulta_LoteNOME_MODELO: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteLOTE_CALCADO_NOVO: TStringField;
    cdsConsulta_TalaoNOME_MODELO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mMapaNewRecord(DataSet: TDataSet);
    procedure frxmMapaOpen(Sender: TObject);
    procedure mMapa_TalaoNewRecord(DataSet: TDataSet);
    procedure frxmMapa_TalaoFirst(Sender: TObject);
    procedure frxmMapa_TalaoOpen(Sender: TObject);
    procedure frxmMapa_TalaoNext(Sender: TObject);
  private
    { Private declarations }
    vID_Produto : Integer;
    vNum_Ordem : Integer;
    vID_Combinacao : Integer;

  public
    { Public declarations }
    ctConsulta_Lote : String;
    ctConsulta_Talao : String;
  end;

var
  DMMapaProd: TDMMapaProd;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMMapaProd.DataModuleCreate(Sender: TObject);
begin
  ctConsulta_Lote  := sdsConsulta_Lote.CommandText;
  ctConsulta_Talao := sdsConsulta_Talao.CommandText;
  qParametros_Lote.Open;
end;

procedure TDMMapaProd.mMapaNewRecord(DataSet: TDataSet);
var
  i : Integer;
begin
  for i := 1 to 15 do
    mMapa.FieldByName('QTam'+IntToStr(i)).AsString := '';
  mMapaQtd.AsInteger := 0;
end;

procedure TDMMapaProd.frxmMapaOpen(Sender: TObject);
begin
  cdsTam.Close;
  sdsTam.ParamByName('ID_PRODUTO').AsInteger := mMapaID_Produto.AsInteger;
  sdsTam.ParamByName('NUM_ORDEM').AsInteger  := mMapaNum_Ordem.AsInteger;
  cdsTam.Open;
  cdsTam.IndexFieldNames := 'TAMANHO';

  cdsTamQ.Close;
  sdsTamQ.ParamByName('ID_PRODUTO').AsInteger := mMapaID_Produto.AsInteger;
  sdsTamQ.ParamByName('NUM_ORDEM').AsInteger  := mMapaNum_Ordem.AsInteger;
  sdsTamQ.ParamByName('NUM_LOTE').AsInteger   := mMapaNum_Lote.AsInteger;
  cdsTamQ.Open;
  cdsTamQ.IndexFieldNames := 'TAMANHO';
end;

procedure TDMMapaProd.mMapa_TalaoNewRecord(DataSet: TDataSet);
var
  i : Integer;
begin
  mMapa_TalaoQtd.AsInteger := 0;
  for i := 1 to 9 do
    mMapa_Talao.FieldByName('Data'+IntToStr(i)).AsString := '';
  mMapa_TalaoTalao.AsInteger  := 0;
  mMapa_TalaoTamanho.AsString := '';
end;

procedure TDMMapaProd.frxmMapa_TalaoFirst(Sender: TObject);
begin
  cdsSetorM.Close;
  cdsSetorM.Open;
end;

procedure TDMMapaProd.frxmMapa_TalaoOpen(Sender: TObject);
begin
  cdsSetorM.Close;
  cdsSetorM.Open;
  vID_Produto := 0;
  vNum_Ordem  := 0;
end;

procedure TDMMapaProd.frxmMapa_TalaoNext(Sender: TObject);
begin
  cdsSetorM.Close;
  cdsSetorM.Open;
  if (vID_Produto > 0) and ((vID_Produto <> mMapa_TalaoID_Produto.AsInteger) or (vNum_Ordem <> mMapa_TalaoNum_Ordem.AsInteger) or (mMapa_TalaoID_Combinacao.AsInteger <> vID_Combinacao)
  or (frxmMapa_Talao.Eof)) then
  begin
    cdsTotal.Close;
    sdsTotal.ParamByName('NUM_ORDEM').AsInteger  := vNum_Ordem;
    sdsTotal.ParamByName('ID_PRODUTO').AsInteger := vID_Produto;
    sdsTotal.ParamByName('ID_COMBINACAO').AsInteger := vID_Combinacao;
    cdsTotal.Open;
  end;
  vID_Produto := mMapa_TalaoID_Produto.AsInteger;
  vNum_Ordem  := mMapa_TalaoNum_Ordem.AsInteger;
  vID_Combinacao := mMapa_TalaoID_Combinacao.AsInteger;

end;

end.
