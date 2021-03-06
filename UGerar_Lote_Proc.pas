unit UGerar_Lote_Proc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadLote, StdCtrls,DB, dbXPress,
  SqlExpr, RzTabs, CurrEdit, Mask, ToolEdit, RxLookup, Menus, UCBase, ExtCtrls, NxCollection, NxEdit, DBVGrids, RzPanel,
  Grids, DBGrids, SMDBGrid, ComCtrls, Buttons, strUtils;

type
  TfrmGerar_Lote_Proc = class(TForm)
    RzPageControl2: TRzPageControl;
    TS_Gerar: TRzTabSheet;
    TS_Consulta: TRzTabSheet;
    PopupMenu1: TPopupMenu;
    Panel2: TPanel;
    btnExcluir: TNxButton;
    pnlPesquisa: TPanel;
    NxLabel3: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel7: TNxLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxOpcaoData: TNxComboBox;
    btnConsultar: TNxButton;
    NxLabel2: TNxLabel;
    CurrencyEdit3: TCurrencyEdit;
    btnImprimir: TNxButton;
    SMDBGrid2: TSMDBGrid;
    TS_Pedidos: TRzTabSheet;
    Panel5: TPanel;
    btnConsultar_Pedidos_Ord: TNxButton;
    NxLabel15: TNxLabel;
    CurrencyEdit7: TCurrencyEdit;
    SMDBGrid4: TSMDBGrid;
    PopupMenu2: TPopupMenu;
    MarcarDesmarcargerarOCIndividual1: TMenuItem;
    MarcarCampoGerarOC1: TMenuItem;
    MarcartodososcampoparagerarOC1: TMenuItem;
    Desmarcartodos1: TMenuItem;
    MarcarDesmarcarPedido1: TMenuItem;
    NxPanel1: TNxPanel;
    ImprimirOrdemProduo1: TMenuItem;
    StaticText3: TStaticText;
    SMDBGrid1: TSMDBGrid;
    NxSplitter1: TNxSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    NxFlipPanel1: TNxFlipPanel;
    Label6: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    DateEdit6: TDateEdit;
    DateEdit8: TDateEdit;
    Edit5: TEdit;
    DateEdit9: TDateEdit;
    DateEdit7: TDateEdit;
    ckFaturado: TNxCheckBox;
    btnConsultar_Pedidos: TNxButton;
    NxFlipPanel2: TNxFlipPanel;
    Label5: TLabel;
    Label2: TLabel;
    Shape4: TShape;
    Label13: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit2: TEdit;
    DateEdit3: TDateEdit;
    ckDtEntrega: TCheckBox;
    ckAgrupar: TCheckBox;
    ckAgrupar_Pedido: TCheckBox;
    Panel3: TPanel;
    btnGerarAuxiliar: TNxButton;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultar_PedidosClick(Sender: TObject);
    procedure ckDtEntregaClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
    procedure MarcarDesmarcargerarOCIndividual1Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MarcarCampoGerarOC1Click(Sender: TObject);
    procedure MarcarDesmarcarPedido1Click(Sender: TObject);
    procedure MarcartodososcampoparagerarOC1Click(Sender: TObject);
    procedure Desmarcartodos1Click(Sender: TObject);
    procedure ImprimirOrdemProduo1Click(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarAuxiliarClick(Sender: TObject);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadLote: TDMCadLote;
    vNumLote: Integer;
    vNumOrdem: Integer;
    vNumPedido: Integer;
    vItem_Mat: Integer;
    vQtd_Produto: Real;
    vQtd_Selecionada: Real;
    vID_Semi : Integer;
    vQtd_Semi : Real;
    vUnid_Semi : String;
    vRef_Semi : String;
    vID_BaixaProcesso : Integer;
    vID_Material_Pri : Integer;
    vConsumo_Pri : Real;
    vID_Material_Pri2 : Integer;
    vConsumo_Pri2 : Real;
    vIDLoteAux : Integer;

    vQtd_Restante : Real;
    vQtd_Original : Real;

    vItem_Ordem : Integer;
    vItem_Ordem_T1 : Integer;
    vItem_Ordem_T2 : Integer;

    procedure prc_Consultar;
    procedure prc_Gerar_Lote(Tipo : String ; Repete : Boolean = False); //S=Semi   L=Por Referencia //Sul Textil
    procedure prc_Consultar_Lote;
    procedure prc_Le_mLote;

    procedure prc_Limpar_Auxiliar;
    procedure prc_Limpar_Var;

    procedure prc_Marcar_Desmarcar(Tipo : String); //I=Item   R=Refer�ncia   P=Pedido   TM=Total    TD=Total
    procedure prc_Marcar_Desmarcar_PED(Tipo : String); //P=Pedido   TM=Total marcar    TD=Total Desmarcar

    procedure prc_Le_cdsPendenteAux;

    //14/03/2017
    procedure prc_Le_Processo_Grupo_Item(Tipo : String); //S= Semi Acabado   L=Lote     P=Pedido

    function fnc_Existe_Grupo_proc : Boolean;

    procedure prc_Gravar_mAuxLote(Tipo : String);
    function fnc_Busca_Ped(Num_Lote_Cli : Integer)  : String;

  public
    { Public declarations }
  end;

var
  frmGerar_Lote_Proc: TfrmGerar_Lote_Proc;

implementation

uses rsDBUtils, DmdDatabase, uUtilPadrao, UMenu, UDMLoteImp, UAltQtdLote,
  UGerar_Lote_Aux2;

{$R *.dfm}

procedure TfrmGerar_Lote_Proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Proc.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMCadLote := TDMCadLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  DateEdit3.Date := Date;
  
  fDMCadLote.qProxima_Ordem.Close;
  fDMCadLote.qProxima_Ordem.Open;
  CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;
  //pnlCadastro.Visible  := (fDMCadLote.qParametrosGERAR_TALAO_AUXILIAR.AsString <> 'P');

  //TS_Item.TabVisible   := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  Label15.Visible      := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  Label16.Visible      := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  DateEdit8.Visible    := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  DateEdit9.Visible    := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  ckFaturado.Visible   := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');

  Label3.Visible := ((fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'I') or (fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'P'));
  CurrencyEdit5.Visible := ((fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'I') or (fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'P'));
  Label4.Visible := ((fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'I') or (fDMCadLote.qParametros_PedUSA_NUM_TALAO.AsString = 'P'));

  NxFlipPanel1.Expanded := False;
  NxFlipPanel2.Expanded := False;
end;

procedure TfrmGerar_Lote_Proc.btnConsultar_PedidosClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmGerar_Lote_Proc.prc_Consultar;
var
  vTextoData : String;
begin
  if fDMCadLote.qParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P' then
    vTextoData := 'PED.DTENTREGA'
  else
    vTextoData := 'PI.DTENTREGA';
  Label12.Caption  := '0';
  vQtd_Selecionada := 0;
  fDMCadLote.cdsPendente.Close;
  fDMCadLote.sdsPendente.CommandText := fDMCadLote.ctPendente;
  if not ckFaturado.Checked then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PI.QTD_RESTANTE > 0';
  if DateEdit6.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  if DateEdit7.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if DateEdit8.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND ' + vTextoData + '  >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit8.date));
  if DateEdit9.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND ' + vTextoData + '  <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit9.date));
  if trim(Edit5.Text) <> '' then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND  CLI.NOME LIKE ' + QuotedStr('%'+Edit5.Text+'%');
  fDMCadLote.cdsPendente.Open;
  fDMCadLote.cdsPendente.IndexFieldNames := 'NUM_PEDIDO;REFERENCIA;ID_PRODUTO;TAMANHO';
end;

procedure TfrmGerar_Lote_Proc.prc_Gerar_Lote(Tipo : String ; Repete : Boolean = False); //S=Semi   L=Por Referencia //Sul Textil
var
  vData: TDateTime;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vIDProdAux : Integer;
  vRefAux : String;
  vID_Cliente : Integer;
  vCompleto : String;
  vQtdAux : Real;
begin
  if not Repete then
    vItem_Ordem := 1
  else
    vItem_Ordem := vItem_Ordem + 1;

  if ckDtEntrega.Checked then
    vData := fDMCadLote.cdsPendenteDTENTREGA.AsDateTime
  else
    vData := DateEdit3.Date;
  vID_CombinacaoAux := 0;
  if (Tipo <> 'S') and (fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString = 'S') then
    exit;

  //if (fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString = 'P') and not(fnc_Existe_Grupo_proc) then
   // exit;

  //if Tipo <> 'S' then   02/05/2017
  if (fDMCadLote.cdsPendenteTIPO_MAT.AsString = 'P') or (fDMCadLote.cdsPendenteTIPO_MAT.AsString = 'R') or
     (fDMCadLote.cdsPendenteTIPO_MAT.AsString = 'O') or (fDMCadLote.cdsPendenteTIPO_MAT.AsString = 'C') or (Tipo <> 'S') then
  begin
    if fDMCadLote.cdsPendenteID_COR.AsInteger > 0 then
      vID_CombinacaoAux := fDMCadLote.cdsPendenteID_COR.AsInteger;
  end;
  if not ckAgrupar_Pedido.Checked then
    vNumPedAux := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger
  else
    vNumPedAux := 0;
  vID_Cliente := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;

  vRefAux    := '';
  vIDProdAux := 0;
  if Tipo = 'S' then
  begin
    vIDProdAux := vID_Semi;
    vRefAux    := vRef_Semi;
  end
  else
  begin
    //vRefAux    := fDMCadLote.cdsPendenteREFERENCIA.AsString;
    vIDProdAux := vID_Semi;
  end;

  //Esquema do Repete foi incluido 13/05/2017   para controlar nos lotes as quantidades que cada um pode ter
  if Repete then
    fDMCadLote.prc_Inserir
  else
  begin
    if Tipo = 'S' then
    begin //Na linha abaixo foi incluido o campo Completo   13/05/2017
      if fDMCadLote.cdsLote.Locate('ID_PRODUTO;DTENTREGA;ID_COMBINACAO;NUM_PEDIDO;ID_CLIENTE;ID_PROCESSO_GRUPO;COMPLETO;ID_PRODUTO_PRI',
                                  VarArrayOf([vIDProdAux,vData,vID_CombinacaoAux,vNumPedAux,vID_Cliente,fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger,'N',
                                  fDMCadLote.cdsPendenteID_PRODUTO.AsInteger]),[locaseinsensitive]) then
        fDMCadLote.cdsLote.Edit
      else
        fDMCadLote.prc_Inserir;
    end
    else
    begin //Na linha abaixo foi incluido o campo Completo   13/05/2017
      //if fDMCadLote.cdsLote.Locate('REFERENCIA;DTENTREGA;ID_COMBINACAO;NUM_PEDIDO;ID_CLIENTE;ID_PROCESSO_GRUPO;COMPLETO',
      //                            VarArrayOf([vRefAux,vData,vID_CombinacaoAux,vNumPedAux,vID_Cliente,fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger,'N']),
      //                            [locaseinsensitive]) then
      if fDMCadLote.cdsLote.Locate('ID_PRODUTO;DTENTREGA;ID_COMBINACAO;NUM_PEDIDO;ID_CLIENTE;ID_PROCESSO_GRUPO;COMPLETO;ID_PRODUTO_PRI',
                                  VarArrayOf([vIDProdAux,vData,vID_CombinacaoAux,vNumPedAux,vID_Cliente,fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger,'N',
                                  fDMCadLote.cdsPendenteID_PRODUTO.AsInteger]),[locaseinsensitive]) then


        fDMCadLote.cdsLote.Edit
      else
        fDMCadLote.prc_Inserir;
    end;

    // 13/05/2017
    //vQtd_Original := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
    //vQtd_Restante := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
    vQtd_Original := vQtd_Semi;
    vQtd_Restante := vQtd_Semi;

    fDMCadLote.qProdQtd.Close;
    fDMCadLote.qProdQtd.ParamByName('ID').AsInteger := vID_Semi;
    fDMCadLote.qProdQtd.Open;
    if StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) > 0 then
    begin
      vQtdAux := StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) - StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsLoteQTD.AsFloat));
      if (StrToFloat(FormatFloat('0',vQtdAux)) < StrToFloat(FormatFloat('0.00000',vQtd_Restante))) then
        vQtd_Restante := StrToFloat(FormatFloat('0',vQtdAux));
    end;
    //if (StrToFloat(FormatFloat('0',fDMCadLote.qProcessoGQTD_POR_LOTE.AsFloat)) > 0)
    //  and (StrToFloat(FormatFloat('0',fDMCadLote.qProcessoGQTD_POR_LOTE.AsFloat)) < StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat))) then
    //  vQtd_Restante := (StrToFloat(FormatFloat('0',fDMCadLote.qProcessoGQTD_POR_LOTE.AsFloat))
    //else
    //  vQtd_Restante := StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat));
    //**************************
  end;

  if fDMCadLote.cdsLote.State in [dsInsert] then
  begin
    fDMCadLote.cdsLoteQTD_TALOES.AsInteger    := 0;
    fDMCadLote.cdsLoteDTEMISSAO.AsDateTime    := Date;
    fDMCadLote.cdsLoteHREMISSAO.AsDateTime    := Now;
    //if Tipo = 'S' then
      fDMCadLote.cdsLoteID_PRODUTO.AsInteger    := vIDProdAux;
    fDMCadLote.cdsLoteID_PRODUTO_PRI.AsInteger := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    //15/05/2017
    //fDMCadLote.cdsLoteREFERENCIA.AsString := vRefAux;
    fDMCadLote.cdsLoteREFERENCIA.AsString := vRef_Semi;
    //*************
    fDMCadLote.cdsLoteID_COMBINACAO.AsInteger := vID_CombinacaoAux;
    fDMCadLote.cdsLoteCARIMBO.AsString        := '';
    fDMCadLote.cdsLoteNUM_PEDIDO.AsInteger    := vNumPedAux;
    fDMCadLote.cdsLoteID_CLIENTE.AsInteger    := vID_Cliente;
    fDMCadLote.cdsLoteDTENTREGA.AsDateTime    := vData;
    fDMCadLote.cdsLoteFILIAL.AsInteger        := fDMCadLote.cdsPendenteFILIAL.AsInteger;
    fDMCadLote.cdsLoteQTD.AsFloat             := 0;
    fDMCadLote.cdsLoteQTD_PRODUZIDO.AsFloat   := 0;
    fDMCadLote.cdsLoteQTD_TALOES.AsInteger    := 0;
    fDMCadLote.cdsLoteNOME.AsString           := Edit2.Text;
    if vNumLote <= 0 then
    begin
      fDMCadLote.qProximo_Lote.Close;
      fDMCadLote.qProximo_Lote.Open;
      vNumLote := fDMCadLote.qProximo_LoteNUM_LOTE.AsInteger;
    end;
    vNumLote := vNumLote + 1;
    if vNumOrdem <= 0 then
    begin
      fDMCadLote.qProxima_Ordem.Close;
      fDMCadLote.qProxima_Ordem.Open;
      vNumOrdem := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger + 1;
    end;
    fDMCadLote.cdsLoteNUM_LOTE.AsInteger  := vNumLote;
    fDMCadLote.cdsLoteNUM_ORDEM.AsInteger := vNumOrdem;
    fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := 0;
    fDMCadLote.cdsLoteQTD_PARES.AsFloat    := 0;
    fDMCadLote.cdsLoteID_PROCESSO_GRUPO.AsInteger := fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger;

    //fDMCadLote.cdsLoteID_SEMI.AsInteger := vID_Semi;

    if (Tipo = 'S') and (vID_Material_Pri > 0) then
    begin
      fDMCadLote.cdsLoteID_MATERIAL.AsInteger := vID_Material_Pri;
      fDMCadLote.cdsLoteCONSUMO_MAT.AsFloat   := StrToFloat(FormatFloat('0.00000',vConsumo_Pri));
    end;
    if (Tipo = 'S') and (vID_Material_Pri2 > 0) then
    begin
      fDMCadLote.cdsLoteID_MATERIAL2.AsInteger := vID_Material_Pri2;
      fDMCadLote.cdsLoteCONSUMO_MAT2.AsFloat   := StrToFloat(FormatFloat('0.00000',vConsumo_Pri2));
    end;

    fDMCadLote.cdsLoteITEM_ORDEM.AsInteger := vItem_Ordem;
    if Tipo = 'S' then
      vItem_Ordem_T1 := vItem_Ordem
    else
      vItem_Ordem_T2 := vItem_Ordem;

    fDMCadLote.cdsLoteCOMPLETO.AsString := 'N';
  end;
  fDMCadLote.cdsLoteQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat + vQtd_Semi;
  fDMCadLote.cdsLoteQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
  fDMCadLote.cdsLoteTIPO_LOTE.AsString   := Tipo;
  fDMCadLote.cdsLoteUNIDADE.AsString     := vUnid_Semi;
  fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat + fDMCadLote.cdsLoteQTD.AsFloat;
  if fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString = 'P' then
    fDMCadLote.cdsLoteQTD_PARES.AsFloat := fDMCadLote.cdsLoteQTD_PARES.AsFloat + fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  fDMCadLote.cdsLote.Post;

  if (fDMCadLote.cdsLote_Ped.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMCadLote.cdsPendenteID.AsInteger,fDMCadLote.cdsPendenteITEM.AsInteger]),[locaseinsensitive])) then
    fDMCadLote.cdsLote_Ped.Edit
  else
  begin
    fDMCadLote.cdsLote_Ped.Insert;
    fDMCadLote.cdsLote_PedID_PEDIDO.AsInteger     := fDMCadLote.cdsPendenteID.AsInteger;
    fDMCadLote.cdsLote_PedITEM_PEDIDO.AsInteger   := fDMCadLote.cdsPendenteITEM.AsInteger;
    fDMCadLote.cdsLote_PedQTD.AsFloat             := 0;
  end;
  //foi alterado dia 13/04/2017 para gravar o que esta indo no lote e n�o os pares.
  //fDMCadLote.cdsLote_PedQTD.AsFloat             := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  fDMCadLote.cdsLote_PedQTD.AsFloat             := fDMCadLote.cdsLote_PedQTD.AsFloat + vQtd_Semi;
  fDMCadLote.cdsLote_PedID_CLIENTE.AsInteger    := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;
  fDMCadLote.cdsLote_PedNUM_LOTE.AsInteger      := fDMCadLote.cdsLoteNUM_LOTE.AsInteger;
  fDMCadLote.cdsLote_PedBAIXADO.AsString        := 'N';
  fDMCadLote.cdsLote_PedPEDIDO_CLIENTE.AsString := fDMCadLote.cdsPendentePEDIDO_CLIENTE.AsString;
  fDMCadLote.cdsLote_PedNUM_PEDIDO.AsInteger    := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger;
  fDMCadLote.cdsLote_PedQTD_PARES.AsFloat       := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  fDMCadLote.cdsLote_Ped.Post;

  prc_Le_Processo_Grupo_Item(fDMCadLote.cdsLoteTIPO_LOTE.AsString);

  //13/05/2017
  if (StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) > 0) then
  begin
    vQtd_Original := StrToFloat(FormatFloat('0.00000',vQtd_Original - vQtd_Restante));
    if StrToFloat(FormatFloat('0.000',vQtd_Original)) > 0 then
    begin
      if (StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) > 0)
        and (StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) < StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat))) then
        vQtd_Restante := StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat))
      else
        vQtd_Restante := StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat));
      fDMCadLote.cdsLote.Edit;
      fDMCadLote.cdsLoteCOMPLETO.AsString := 'S';
      fDMCadLote.cdsLote.Post;

      prc_Gerar_Lote(Tipo,True);

    end;
  end;
  //***************


end;

procedure TfrmGerar_Lote_Proc.ckDtEntregaClick(Sender: TObject);
begin
  Label2.Visible    := not(ckDtEntrega.Checked);
  DateEdit3.Visible := not(ckDtEntrega.Checked);
end;

procedure TfrmGerar_Lote_Proc.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar_Lote;
  fDMCadLote.qParametros.Close;
  fDMCadLote.qParametros.Open;
end;

procedure TfrmGerar_Lote_Proc.prc_Consultar_Lote;
var
  vComando: String;
  vDescData: String;
begin
  case cbxOpcaoData.ItemIndex of
    0: vDescData := 'L.DTEMISSAO';
    1: vDescData := 'L.DTENTREGA';
  end;
  fDMCadLote.cdsConsulta_Lote_Proc.Close;
  fDMCadLote.sdsConsulta_Lote_Proc.CommandText := fDMCadLote.ctConsulta_Lote_Proc + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + CurrencyEdit1.Text;
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + CurrencyEdit2.Text;
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM = ' + CurrencyEdit3.Text;
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxOpcao.ItemIndex of
    0: vComando := vComando + ' AND L.QTD_PENDENTE > 0';
    1: vComando := vComando + ' AND L.QTD_PRODUZIDO > 0';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND L.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo1.KeyValue);

  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND L.OBS_PED LIKE ' + QuotedStr('%<'+Edit1.Text+'>%');
  fDMCadLote.sdsConsulta_Lote_Proc.CommandText := fDMCadLote.sdsConsulta_Lote_Proc.CommandText + vComando;
  fDMCadLote.cdsConsulta_Lote_Proc.Open;
end;

procedure TfrmGerar_Lote_Proc.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadLote.cdsProduto.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmGerar_Lote_Proc.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo1.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo1.KeyValue;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      RxDBLookupCombo1.KeyValue := vCodProduto_Pos;
  end;}
end;

procedure TfrmGerar_Lote_Proc.prc_Limpar_Auxiliar;
begin
  fDMCadLote.mLote.First;
  while not fDMCadLote.mLote.eof do
    fDMCadLote.mLote.Delete;
  fDMCadLote.mMaterial.First;
  while not fDMCadLote.mMaterial.Eof do
  begin
    fDMCadLote.mMaterial_Tam.First;
    while not fDMCadLote.mMaterial_Tam.Eof do
      fDMCadLote.mMaterial_Tam.Delete;
    fDMCadLote.mMaterial.Delete;
  end;
  fDMCadLote.mTamanho.First;
  while not fDMCadLote.mTamanho.Eof do
    fDMCadLote.mTamanho.Delete;
end;

procedure TfrmGerar_Lote_Proc.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin

  ColunaOrdenada := Column.FieldName;
  fDMCadLote.cdsConsulta_Lote_Proc.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid2.Columns.Count - 1 do
  //  if not (SMDBGrid2.Columns.Items[I] = Column) then
  //    SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;

end;

procedure TfrmGerar_Lote_Proc.prc_Limpar_Var;
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
  cbxOpcao.ItemIndex := 0;
  RxDBLookupCombo1.ClearValue;
end;

procedure TfrmGerar_Lote_Proc.btnExcluirClick(Sender: TObject);
var
  vNumOrdemAux: String;
  sds: TSQLDataSet;
begin
  if MessageDlg('Deseja excluir os Lotes/Tal�es selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vNumOrdemAux := InputBox('Exclus�o dos Lotes/Tal�es','Informe o n�mero do controle: ', '');
  vNumOrdemAux := Monta_Numero(vNumOrdemAux,0);
  if (trim(vNumOrdemAux) = '') or (vNumOrdemAux = '0') then
    exit;

  fDMCadLote.qVerificaExclusao.Close;
  fDMCadLote.qVerificaExclusao.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote.qVerificaExclusao.Open;
  if fDMCadLote.qVerificaExclusaoCOUNT.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Lote/Tal�o baixado, exclus�o cancelada!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadLote.qVerificaExclusao2.Close;
  fDMCadLote.qVerificaExclusao2.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote.qVerificaExclusao2.Open;
  if fDMCadLote.qVerificaExclusao2Contador.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Ordem de compra gerada para esta Ordem de Produ��o!', mtError, [mbOk], 0);
    exit;
  end;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    sds.CommandText   := ' DELETE FROM BAIXA_PROCESSO  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE_MAT  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE_TING  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    MessageDlg('*** N� Controle ' + vNumOrdemAux + ' exclu�do!', mtInformation, [mbok], 0);

  finally
    FreeAndNil(sds);
    btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Proc.RzPageControl2Change(Sender: TObject);
begin
  if RzPageControl2.ActivePage = TS_Gerar then
    btnConsultar_PedidosClick(Sender)
  else
  if RzPageControl2.ActivePage = TS_Consulta then
  begin
    if CurrencyEdit3.AsInteger <= 0 then
    begin
      fDMCadLote.qProxima_Ordem.Close;
      fDMCadLote.qProxima_Ordem.Open;
      CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;
    end;
  end;
end;

procedure TfrmGerar_Lote_Proc.prc_Le_mLote;
begin
  fDMCadLote.mLote.First;
  while not fDMCadLote.mLote.Eof do
  begin
    if SMDBGrid2.SelectedRows.CurrentRowSelected then
    begin
      fDMCadLote.mLote.Edit;
      fDMCadLote.mLoteSelecionado.AsString := 'S';
      fDMCadLote.mLote.Post;
    end
    else
    begin
      fDMCadLote.mLote.Edit;
      fDMCadLote.mLoteSelecionado.AsString := 'N';
      fDMCadLote.mLote.Post;
    end;
    fDMCadLote.mLote.Next;
  end;
  fDMCadLote.mLote.First;
end;

procedure TfrmGerar_Lote_Proc.MarcarDesmarcargerarOCIndividual1Click(
  Sender: TObject);
begin
  prc_Marcar_Desmarcar('I');
end;

procedure TfrmGerar_Lote_Proc.prc_Marcar_Desmarcar(Tipo: String); //I=Item   R=Refer�ncia   P=Pedido   TM=Total    TD=Total
var
  vIDProdAux : Integer;
  vMD : String;
  vIDPedAux : Integer;


  procedure prc_Somar_Qtd;
  begin
    if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
      vQtd_Selecionada := vQtd_Selecionada + fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat
    else
      vQtd_Selecionada := vQtd_Selecionada - fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
    Label12.Caption := FormatFloat('0.#####',vQtd_Selecionada);
  end;

  procedure prc_Selecionado;
  var
    vAux2 : String;
  begin
    vAux2 := fDMCadLote.cdsPendenteSELECIONADO.AsString;
    if (trim(fDMCadLote.cdsPendenteSELECIONADO.AsString) = '') then
      vAux2 := 'N';
    if vAux2 <> vMD then
    begin
      fDMCadLote.cdsPendente.Edit;
      fDMCadLote.cdsPendenteSELECIONADO.AsString := vMD;
      fDMCadLote.cdsPendente.Post;
      prc_Somar_Qtd;
    end;
  end;


begin
  if not(fDMCadLote.cdsPendente.Active) or (fDMCadLote.cdsPendente.IsEmpty) then
    exit;
  SMDBGrid1.DisableScroll;
  if Tipo = 'TS' then
    vMD := 'S'
  else
  if Tipo = 'TD' then
    vMD := 'N'
  else
  if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
    vMD := 'N'
  else
    vMD := 'S';
  if Tipo = 'I' then
  begin
    prc_Selecionado;
  end
  else
  if Tipo = 'R' then
  begin
    vIDProdAux := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      if fDMCadLote.cdsPendenteID_PRODUTO.AsInteger = vIDProdAux then
        prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
    fDMCadLote.cdsPendente.Locate('ID_PRODUTO',vIDProdAux,[loCaseInsensitive]);
  end
  else
  if Tipo = 'P' then
  begin
    vIDPedAux := fDMCadLote.cdsPendenteID.AsInteger;
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      if fDMCadLote.cdsPendenteID.AsInteger = vIDPedAux then
        prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
    fDMCadLote.cdsPendente.Locate('ID',vIDPedAux,[loCaseInsensitive]);
  end
  else
  if copy(Tipo,1,1) = 'T' then
  begin
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmGerar_Lote_Proc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadLote.cdsTingimentoCRU.AsString = 'S' then
    AFont.Style := [fsBold];
end;

procedure TfrmGerar_Lote_Proc.MarcarCampoGerarOC1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('R');
end;

procedure TfrmGerar_Lote_Proc.MarcarDesmarcarPedido1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('P');
end;

procedure TfrmGerar_Lote_Proc.MarcartodososcampoparagerarOC1Click(
  Sender: TObject);
begin
  prc_Marcar_Desmarcar('TS');
end;

procedure TfrmGerar_Lote_Proc.Desmarcartodos1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('TD');
end;

procedure TfrmGerar_Lote_Proc.ImprimirOrdemProduo1Click(Sender: TObject);
var
  vNumOrdemAux : String;
  fDMLoteImp: TDMLoteImp;
  vArq : String;
  sds : TSQLDataSet;
begin
  if fDMCadLote.mLoteNum_Ordem.AsInteger > 0 then
    vNumOrdemAux := fDMCadLote.mLoteNum_Ordem.AsString
  else
    vNumOrdemAux := '';
  vNumOrdemAux := InputBox('Imprimir Ordem de Produ��o','Informe o n�mero da Ordem de Produ��o: ', vNumOrdemAux);
  vNumOrdemAux := Monta_Numero(vNumOrdemAux,0);
  if (trim(vNumOrdemAux) = '') or (vNumOrdemAux = '0') then
  begin
    MessageDlg('*** Ordem de Produ��o n�o informada!', mtError, [mbOk], 0);
    exit;
  end;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Talao_Por_Processo.fr3';
  if not (FileExists(vArq)) then
  begin
    MessageDlg('*** Relat�rio n�o localizado: ' + vArq , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMCadLote.qImpressao.Close;
  fDMCadLote.qImpressao.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote.qImpressao.Open;
  if not (fDMCadLote.qImpressao.IsEmpty) then
  begin
    if MessageDlg('OP j� impressa, deseja Reimprimir?',mtInformation,[mbYes,mbNo],0) = mrNo then
    Exit;
  end;

  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' UPDATE LOTE SET IMPRESSO = ' + QuotedStr('S') +
                         ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL;
  finally
    FreeAndNil(sds);
  end;

  fDMLoteImp := TDMLoteImp.Create(Self);
  fDMLoteImp.cdsTalao_Proc.Close;
  fDMLoteImp.sdsTalao_Proc.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux) ;
  fDMLoteImp.cdsTalao_Proc.Open;
  fDMLoteImp.cdsTalao_Proc.First;
  {fDMLoteImp.cdsLote_Processo.Close;
  fDMLoteImp.sdsLote_Processo.ParamByName('ID_LOTE').AsInteger := fDMLoteImp.cdsTalao_SLID.AsInteger;
  fDMLoteImp.cdsLote_Processo.Open;}
  fDMLoteImp.frxReport1.Report.LoadFromFile(vArq);
  fDMLoteImp.frxReport1.ShowReport;

  FreeAndNil(fDMLoteImp);
end;

procedure TfrmGerar_Lote_Proc.prc_Marcar_Desmarcar_PED(Tipo: String);//P=Pedido   TM=Total marcar    TD=Total Desmarcar
var
  ID : Integer;
begin
  ID := fDMCadLote.cdsPendente_PedID.AsInteger;
  if Tipo = 'P' then
  begin
    fDMCadLote.cdsPendente_Ped.Edit;
    if fDMCadLote.cdsPendente_PedSELECIONADO.AsString = 'S' then
      fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'N'
    else
      fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'S';
    fDMCadLote.cdsPendente_Ped.Post;
  end
  else
  begin
    fDMCadLote.cdsPendente_Ped.First;
    while not fDMCadLote.cdsPendente_Ped.Eof do
    begin
      fDMCadLote.cdsPendente_Ped.Edit;
      if Tipo = 'TM' then
        fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'S'
      else
        fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'N';
      fDMCadLote.cdsPendente_Ped.Post;
      fDMCadLote.cdsPendente_Ped.Next;
    end;
  end;
  fDMCadLote.cdsPendente_Ped.Locate('ID',ID,[loCaseInsensitive]);
end;

procedure TfrmGerar_Lote_Proc.SMDBGrid2DblClick(Sender: TObject);
var
  ffrmAltQtdLote: TfrmAltQtdLote;
begin
  if not(fDMCadLote.cdsConsulta_Lote_Proc.Active) or (fDMCadLote.cdsConsulta_Lote_ProcID.AsInteger <= 0) then
    exit;
  fDMCadLote.prc_Localizar(fDMCadLote.cdsConsulta_Lote_ProcID.AsInteger);
  if fDMCadLote.cdsLote.IsEmpty then
  begin
    MessageDlg('*** Lote n�o encontrado na base!', mtError, [mbOk], 0);
    exit;
  end;
  ffrmAltQtdLote := TfrmAltQtdLote.Create(self);
  ffrmAltQtdLote.fDMCadLote := fDMCadLote;
  ffrmAltQtdLote.btnExcluir.Enabled := False;
  ffrmAltQtdLote.ShowModal;
  FreeAndNil(ffrmAltQtdLote);
end;

procedure TfrmGerar_Lote_Proc.prc_Le_Processo_Grupo_Item(Tipo: String);
var
  vTipo : String;
  vItemAux : Integer;
begin
  fDMCadLote.qProcesso_Grupo_Item.Close;

  if not fDMCadLote.cdsBaixa_Processo.Active then
  begin
    fDMCadLote.cdsBaixa_Processo.Close;
    fDMCadLote.sdsBaixa_Processo.ParamByName('NUM_ORDEM').AsInteger := vNumOrdem;
    fDMCadLote.cdsBaixa_Processo.Open;
  end;

  if (Tipo = 'S') then
  begin
    if fDMCadLote.cdsProduto.Locate('ID',fDMCadLote.cdsLoteID_PRODUTO.AsInteger,[loCaseInsensitive]) then
      fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := fDMCadLote.cdsProdutoID_PROCESSO_GRUPO.AsInteger
    else
      fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := 0;
  end
  else
    fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger;
  fDMCadLote.qProcesso_Grupo_Item.Open;
  while not fDMCadLote.qProcesso_Grupo_Item.Eof do
  begin
    vTipo := '';
    if (Tipo = 'S') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'S') then
      vTipo := '1'
    else
    if (Tipo = 'L') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'T') then
      vTipo := '2'
    else
    if (Tipo = 'P') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'P') then
      vTipo := '5';
    if trim(vTipo) <> '' then
    begin
      if (Tipo = 'S') or (Tipo = 'L') then
      begin
        if fDMCadLote.cdsBaixa_Processo.Locate('ID_LOTE;ID_PROCESSO',VarArrayOf([fDMCadLote.cdsLoteID.AsInteger,fDMCadLote.qProcesso_Grupo_ItemID_PROCESSO.AsInteger]),[locaseinsensitive]) then
        begin
          fDMCadLote.cdsBaixa_Processo.Edit;
          fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
          fDMCadLote.cdsBaixa_Processo.Post;
          vTipo := '';
        end;
      end;

      if trim(vTipo) <> '' then
      begin
        if vID_BaixaProcesso <= 0 then
          vID_BaixaProcesso := dmDatabase.ProximaSequencia('BAIXA_PROCESSO',0);
        fDMCadLote.cdsBaixa_Processo.Last;
        vItemAux := fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger;
        fDMCadLote.cdsBaixa_Processo.Insert;
        fDMCadLote.cdsBaixa_ProcessoID.AsInteger   := vID_BaixaProcesso;
        fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger := vItemAux + 1;
        fDMCadLote.cdsBaixa_ProcessoID_PROCESSO.AsInteger := fDMCadLote.qProcesso_Grupo_ItemID_PROCESSO.AsInteger;
        if vTipo <> '5' then
          fDMCadLote.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMCadLote.cdsLoteID.AsInteger
        else
        begin
          fDMCadLote.cdsBaixa_ProcessoID_PEDIDO.AsInteger   := fDMCadLote.cdsPendenteID.AsInteger;
          fDMCadLote.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger := fDMCadLote.cdsPendenteITEM.AsInteger;
        end;
        fDMCadLote.cdsBaixa_ProcessoDTENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoDTBAIXA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRBAIXA.Clear;
        if vTipo <> '5' then
          fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat
        else
          fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
        fDMCadLote.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
        fDMCadLote.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := vNumOrdem;
        fDMCadLote.cdsBaixa_ProcessoTIPO.AsString         := vTipo;
        fDMCadLote.cdsBaixa_Processo.Post;
      end;
    end;
    fDMCadLote.qProcesso_Grupo_Item.Next;
  end;
end;

function TfrmGerar_Lote_Proc.fnc_Existe_Grupo_proc: Boolean;
var
  vComandoAux : String;
begin
  Result := False;
  fDMCadLote.qVerificaGrupo_Proc.Close;
  vComandoAux := '';
  if fDMCadLote.cdsPendenteENCERADO.AsString = 'S' then
    vComandoAux := ' AND (P.ENCERADO = ' + QuotedStr('N') + ' OR P.ENCERADO = ' + QuotedStr('S') + ')'
  else
  if fDMCadLote.cdsPendenteENCERADO.AsString = 'G' then
    vComandoAux := ' AND (P.ENCERADO = ' + QuotedStr('N') + ' OR P.ENCERADO = ' + QuotedStr('G') + ')'
  else
    vComandoAux := ' AND (P.ENCERADO = ' + QuotedStr('N') + ')';
  fDMCadLote.qVerificaGrupo_Proc.SQL.Text := fDMCadLote.ctVerificaGrupo_Proc + vComandoAux;
  fDMCadLote.qVerificaGrupo_Proc.ParamByName('ID').AsInteger := fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger;
  fDMCadLote.qVerificaGrupo_Proc.Open;

  if not fDMCadLote.qVerificaGrupo_Proc.IsEmpty then
    Result := True;
end;

procedure TfrmGerar_Lote_Proc.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmGerar_Lote_Proc.btnGerarAuxiliarClick(Sender: TObject);
var
  ffrmGerar_Lote_Aux2: TfrmGerar_Lote_Aux2;
  vQtdAux : Real;
  vPedAnt : Integer;
begin
  fDMCadLote.mAuxLote.First;
  while not fDMCadLote.mAuxLote.Eof do
  begin
    fDMCadLote.mAuxLote_Ped.First;
    while not fDMCadLote.mAuxLote_Ped.eof do
      fDMCadLote.mAuxLote_Ped.Delete;
    fDMCadLote.mAuxLote_Talao.First;
    while not fDMCadLote.mAuxLote_Talao.eof do
      fDMCadLote.mAuxLote_Talao.Delete;
    fDMCadLote.mAuxLote.Delete;
  end;
  fDMCadLote.mMaterial.EmptyDataSet;
  fDMCadLote.mAuxPed.EmptyDataSet;

  vIDLoteAux := 0;

  if MessageDlg('Gerar Lote/Tal�es?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  if not(ckDtEntrega.Checked) and (DateEdit3.Date < 10) then
  begin
    MessageDlg('*** Data de entrega do Lote/Tal�o n�o informada!', mtError, [mbOk], 0);
    exit;
  end;

  SMDBGrid1.DisableScroll;
  vID_BaixaProcesso   := 0;
  fDMCadLote.vMsgErro := '';
  fDMCadLote.mMaterial.EmptyDataSet;

  prc_Le_cdsPendenteAux;

  fDMCadLote.mAuxLote.First;
  while not fDMCadLote.mAuxLote.Eof do
  begin
    fDMCadLote.qProdQtd.Close;
    fDMCadLote.qProdQtd.ParamByName('ID').AsInteger := fDMCadLote.mAuxLoteID_Produto.AsInteger;
    fDMCadLote.qProdQtd.Open;
    if StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) > 0 then
    begin
      if StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxLoteQtd.AsFloat)) <= StrToFloat(FormatFloat('0',fDMCadLote.qProdQtdQTD_TALAO.AsFloat)) then
        vQtdAux := 1
      else
      begin
        vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxLoteQtd.AsFloat)) / fDMCadLote.qProdQtdQTD_TALAO.AsInteger;
        if frac(StrToFloat(FormatFloat('0.00000',vQtdAux))) > 0 then
          vQtdAux := vQtdAux + 1;
        vQtdAux := trunc(vQtdAux);
      end;
      fDMCadLote.mAuxLote.Edit;
      fDMCadLote.mAuxLoteQtd_Por_Talao.AsFloat := fDMCadLote.qProdQtdQTD_TALAO.AsFloat;
      fDMCadLote.mAuxLoteTotal_Talao.AsFloat   := StrToFloat(FormatFloat('0',vQtdAux));
      fDMCadLote.mAuxLote.Post;
    end;

    vPedAnt := 0;
    fDMCadLote.mAuxLote_Ped.First;
    while not fDMCadLote.mAuxLote_Ped.Eof do
    begin
      fDMCadLote.mAuxLote.Edit;
      if vPedAnt <> fDMCadLote.mAuxLote_PedID_Pedido.AsInteger then
      begin
        if trim(fDMCadLote.mAuxLoteObs_Pedido.AsString) = '' then
          fDMCadLote.mAuxLoteObs_Pedido.AsString := '<' + fDMCadLote.mAuxLote_PedPedido_Cliente.AsString + '>'
        else
          fDMCadLote.mAuxLoteObs_Pedido.AsString := fDMCadLote.mAuxLoteObs_Pedido.AsString + ' <' + fDMCadLote.mAuxLote_PedPedido_Cliente.AsString + '>';
      end;
      fDMCadLote.mAuxLote.Post;
      vPedAnt := fDMCadLote.mAuxLote_PedID_Pedido.AsInteger;
      fDMCadLote.mAuxLote_Ped.Next;
    end;

    fDMCadLote.mAuxLote.Next;
  end;

  SMDBGrid1.EnableScroll;

  fDMCadLote.vGerado := False;
  ffrmGerar_Lote_Aux2 := TfrmGerar_Lote_Aux2.Create(self);
  ffrmGerar_Lote_Aux2.fDMCadLote := fDMCadLote;
  ffrmGerar_Lote_Aux2.ShowModal;
  FreeAndNil(ffrmGerar_Lote_Aux2);

  if fDMCadLote.vGerado then
  begin
    fDMCadLote.qProxima_Ordem.Close;
    fDMCadLote.qProxima_Ordem.Open;
    CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;
    RzPageControl2.ActivePage := TS_Consulta;
    btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Proc.prc_Le_cdsPendenteAux;
begin
  fDMCadLote.cdsPendente.First;
  while not fDMCadLote.cdsPendente.Eof do
  begin
    if (fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S') then
    begin
      vID_Semi   := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
      vQtd_Semi  := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
      vUnid_Semi := fDMCadLote.cdsPendenteUNIDADE.AsString;
      if fDMCadLote.cdsProdutoID.AsInteger <> vID_Semi then
        fDMCadLote.cdsProduto.Locate('ID',vID_Semi,[loCaseInsensitive]);
      vRef_Semi := fDMCadLote.cdsProdutoREFERENCIA.AsString;

      if vID_Semi > 0 then
        prc_Gravar_mAuxLote('S');

      //Gravando pedido
      fDMCadLote.mAuxPed.Insert;
      fDMCadLote.mAuxPedID_Pedido.AsInteger := fDMCadLote.cdsPendenteID.AsInteger;
      fDMCadLote.mAuxPedItem_Pedido.AsInteger := fDMCadLote.cdsPendenteITEM.AsInteger;
      fDMCadLote.mAuxPedID_Processo_Grupo.AsInteger := fDMCadLote.cdsPendenteID_PROCESSO_GRUPO.AsInteger;
      fDMCadLote.mAuxPedID_Cliente.AsInteger        := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;
      fDMCadLote.mAuxPedNum_Pedido.AsInteger        := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger;
      fDMCadLote.mAuxPedPedido_Cliente.AsString     := fDMCadLote.cdsPendentePEDIDO_CLIENTE.AsString;
      fDMCadLote.mAuxPedQtd_Pares.AsFloat           := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
      fDMCadLote.mAuxPedQtd.AsFloat                 := 0;
      fDMCadLote.mAuxPedID_Produto.AsInteger        := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
      fDMCadLote.mAuxPedTipo_Mat.AsString           := fDMCadLote.cdsPendenteTIPO_MAT.AsString;
      fDMCadLote.mAuxPedTipo_Produto_Reg.AsString   := fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString;
      fDMCadLote.mAuxPedID_Cor.AsInteger            := fDMCadLote.cdsPendenteID_COR.AsInteger;
      fDMCadLote.mAuxPed.Post;
    end;
    fDMCadLote.cdsPendente.Next;
  end;
end;

procedure TfrmGerar_Lote_Proc.prc_Gravar_mAuxLote(Tipo: String);
var
  vData: TDateTime;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vIDProdAux : Integer;
  vRefAux : String;
  vID_Cliente : Integer;
  VID_Processo : Integer;

  vCompleto : String;
  vQtdAux : Real;

  vEncAux : String;
begin
  if ckDtEntrega.Checked then
    vData := fDMCadLote.cdsPendenteDTENTREGA.AsDateTime
  else
    vData := DateEdit3.Date;
  vID_CombinacaoAux := 0;
  if fDMCadLote.cdsPendenteID_COR.AsInteger > 0 then
    vID_CombinacaoAux := fDMCadLote.cdsPendenteID_COR.AsInteger;
  if not ckAgrupar_Pedido.Checked then
    vNumPedAux := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger
  else
    vNumPedAux := 0;
  vID_Cliente := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;

  vEncAux      := 'N';
  vRefAux      := '';
  vIDProdAux   := vID_Semi;
  vRefAux      := vRef_Semi;

  if fDMCadLote.mAuxLote.Locate('ID_PRODUTO;DTENTREGA;ID_COMBINACAO;NUM_PEDIDO;ID_CLIENTE',
                              VarArrayOf([vIDProdAux,vData,vID_CombinacaoAux,vNumPedAux,vID_Cliente]),[locaseinsensitive]) then
    fDMCadLote.mAuxLote.Edit

  else
    fDMCadLote.mAuxLote.Insert;

  vQtd_Original := vQtd_Semi;
  vQtd_Restante := vQtd_Semi;

  if fDMCadLote.mAuxLote.State in [dsInsert] then
  begin
    vIDLoteAux := vIDLoteAux + 1;
    fDMCadLote.mAuxLoteID.AsInteger             := vIDLoteAux;
    fDMCadLote.mAuxLoteID_Produto.AsInteger     := vIDProdAux;
    fDMCadLote.mAuxLoteTipo_Reg_Prod.AsString   := fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString;
    fDMCadLote.mAuxLoteID_Produto_Pri.AsInteger := vIDProdAux;
    fDMCadLote.mAuxLoteReferencia.AsString      := vRef_Semi;
    fDMCadLote.mAuxLoteID_Combinacao.AsInteger  := vID_CombinacaoAux;
    fDMCadLote.mAuxLoteNum_Pedido.AsInteger     := vNumPedAux;
    fDMCadLote.mAuxLoteID_Cliente.AsInteger     := vID_Cliente;
    fDMCadLote.mAuxLoteDtEntrega.AsDateTime     := vData;
    fDMCadLote.mAuxLoteTipo_Geracao.AsString    := Tipo;
    fDMCadLote.mAuxLoteQtd.AsFloat              := 0;
    fDMCadLote.mAuxLoteQtd_Original.AsFloat     := 0;
    fDMCadLote.mAuxLoteQtd_Pares.AsFloat        := 0;
    fDMCadLote.mAuxLoteID_Processo_Grupo.AsInteger := 0;
    fDMCadLote.mAuxLoteNome_Cliente.AsString       := fDMCadLote.cdsPendenteNOME_CLIENTE.AsString;
    if vID_CombinacaoAux > 0 then
      fDMCadLote.mAuxLoteNome_Combinacao.AsString    := fDMCadLote.cdsPendenteNOME_COMBINACAO.AsString;
    fDMCadLote.mAuxLoteTotal_Talao.AsInteger := 1;
  end;
  fDMCadLote.mAuxLoteQtd.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat + vQtd_Semi;
  fDMCadLote.mAuxLoteTipo_Lote.AsString   := Tipo;
  fDMCadLote.mAuxLoteUnidade.AsString     := vUnid_Semi;
  fDMCadLote.mAuxLoteQtd_Original.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat;
  if fDMCadLote.cdsPendenteTIPO_REG_PROD.AsString = 'P' then
    fDMCadLote.mAuxLoteQtd_Pares.AsFloat := fDMCadLote.mAuxLoteQtd_Pares.AsFloat + fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  fDMCadLote.mAuxLote.Post;

  if (fDMCadLote.mAuxLote_Ped.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMCadLote.cdsPendenteID.AsInteger,fDMCadLote.cdsPendenteITEM.AsInteger]),[locaseinsensitive])) then
    fDMCadLote.mAuxLote_Ped.Edit
  else
  begin
    fDMCadLote.mAuxLote_Ped.Insert;
    fDMCadLote.mAuxLote_PedID.AsInteger := fDMCadLote.mAuxLoteID.AsInteger;
    fDMCadLote.mAuxLote_PedID_Pedido.AsInteger := fDMCadLote.cdsPendenteID.AsInteger;
    fDMCadLote.mAuxLote_PedItem_Pedido.AsInteger   := fDMCadLote.cdsPendenteITEM.AsInteger;
    fDMCadLote.mAuxLote_PedID_Produto.AsInteger    := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;  
    fDMCadLote.mAuxLote_PedQtd.AsFloat             := 0;
    fDMCadLote.mAuxLote_PedEncerado.AsString       := fDMCadLote.cdsPendenteENCERADO.AsString;
  end;
  fDMCadLote.mAuxLote_PedQtd.AsFloat            := fDMCadLote.mAuxLote_PedQtd.AsFloat + vQtd_Semi;
  fDMCadLote.mAuxLote_PedID_Cliente.AsInteger    := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;
  fDMCadLote.mAuxLote_PedPedido_Cliente.AsString := fDMCadLote.cdsPendentePEDIDO_CLIENTE.AsString;
  fDMCadLote.mAuxLote_PedNum_Pedido.AsInteger    := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger;
  fDMCadLote.mAuxLote_PedQtd_Pares.AsFloat       := fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  fDMCadLote.mAuxLote_Ped.Post;
end;

function TfrmGerar_Lote_Proc.fnc_Busca_Ped(Num_Lote_Cli: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := '';
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select P.pedido_cliente, P.num_doc from pedido P '
                       + ' WHERE P.num_doc = :NUM_DOC ';
    sds.ParamByName('NUM_DOC').AsInteger := Num_Lote_Cli;
    sds.Open;
    if sds.IsEmpty then
    begin
      MessageDlg('*** N� Lote do Cliente n�o encontrado!', mtInformation, [mbok], 0);
      CurrencyEdit5.Clear;
    end;
    Result := sds.FieldByName('PEDIDO_CLIENTE').AsString;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmGerar_Lote_Proc.CurrencyEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit5.AsInteger > 0) then
  begin
    Edit1.Text := fnc_Busca_Ped(CurrencyEdit5.AsInteger);
    if CurrencyEdit5.AsInteger > 0 then
      btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Proc.SMDBGrid1DblClick(Sender: TObject);
begin
  if not(fDMCadLote.cdsPendente.Active) or (fDMCadLote.cdsPendenteID.AsInteger <= 0) then
    exit;

  fDMCadLote.cdsPendente.Edit;
  if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
    fDMCadLote.cdsPendenteSELECIONADO.AsString := ''
  else
    fDMCadLote.cdsPendenteSELECIONADO.AsString := 'S';
  fDMCadLote.cdsPendente.Post;
end;

end.
