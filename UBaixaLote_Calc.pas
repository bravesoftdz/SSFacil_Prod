unit UBaixaLote_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, RzEdit,
  RzPanel, SqlExpr, dbXPress, UDMBaixaProd_Calc, DBGrids, SMDBGrid;

type
  TfrmBaixaLote_Calc = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    vMSGLocal : WideString;
    vDigitoIni : String;
    vNumPedido_Loc : Integer;
    vRef_Loc, vNome_Comb_Loc, vNome_Prod_Loc : String;

    vContador: Integer;

    procedure prc_Gravar_ES;

    procedure prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
    procedure prc_Le_Talao_Setor;
    procedure prc_Le_Talao_Setor_Atu;

    procedure prc_Montar_mLote_Setor;

  public
    { Public declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;
    vNum_Lote_Loc : Integer;
    vHora_Loc: TTime;
    vData_Loc:TDate;

  end;

var
  frmBaixaLote_Calc: TfrmBaixaLote_Calc;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, Math;

{$R *.dfm}

procedure TfrmBaixaLote_Calc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaLote_Calc.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);

  Label2.Caption := IntToStr(vNum_Lote_Loc);

  Label8.Caption := 'Ref: ' + fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString + ' - ' + fDMBaixaProd_Calc.cdsLoteNOME.AsString;
  Label9.Caption := 'Combina��o: ' + fDMBaixaProd_Calc.cdsLoteNOME_COMBINACAO.AsString;

  prc_Montar_mLote_Setor;
end;

procedure TfrmBaixaLote_Calc.prc_Gravar_ES;
var
  ID: TTransactionDesc;
begin
  vMSGLocal := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vMSGLocal := vMSGLocal + '  Lote: ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString + '/' + fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsString;
    vMSGLocal := vMSGLocal + #13 + '  Refer�ncia: ' + fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString;

    fDMBaixaProd_Calc.mLote_Setor.First;
    while not fDMBaixaProd_Calc.mLote_Setor.Eof do
    begin
      if fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean then
      begin
        prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.mLote_SetorID.AsInteger,0,fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger);
        prc_Le_Talao_Setor;
      end;

      fDMBaixaProd_Calc.mLote_Setor.Next;
    end;

    prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.mLote_SetorID.AsInteger,0,0);
    prc_Le_Talao_Setor_Atu;

    dmDatabase.scoDados.Commit(ID);
    
    Label5.Caption := 'LOTE ' + IntToStr(vNum_Lote_Loc) +  #13 + #13 + '  Processo Conclu�do';

    MessageDlg('*** Processo Conclu�do!', mtError, [mbOk], 0);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;
  Panel2.Visible := False;

  Close;
end;

procedure TfrmBaixaLote_Calc.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
  Panel2.Visible := False;
end;

procedure TfrmBaixaLote_Calc.prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
var
  vComando : String;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.Close;
  fDMBaixaProd_Calc.sdsTalao_Setor.CommandText := fDMBaixaProd_Calc.ctTalao_Setor;
  if ID_SETOR > 0 then
  begin
    fDMBaixaProd_Calc.sdsTalao_Setor.CommandText := fDMBaixaProd_Calc.sdsTalao_Setor.CommandText
                                                  + ' AND ID_SETOR = :ID_SETOR ';
    fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('ID_SETOR').AsInteger := ID_Setor;
  end;
  fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('ID').AsInteger       := ID_Lote;
  fDMBaixaProd_Calc.cdsTalao_Setor.Open;
end;

procedure TfrmBaixaLote_Calc.btnConfirmarClick(Sender: TObject);
begin
  if MessageDlg('Confirmar a baixa dos setores selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Gravar_ES;
end;

procedure TfrmBaixaLote_Calc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean then
    Background := $0077FF77;
end;

procedure TfrmBaixaLote_Calc.prc_Montar_mLote_Setor;
begin
  fDMBaixaProd_Calc.cdsLote_Setor.Close;
  fDMBaixaProd_Calc.sdsLote_Setor.ParamByName('NUM_LOTE').AsInteger := vNum_Lote_Loc;
  fDMBaixaProd_Calc.cdsLote_Setor.Open;

  fDMBaixaProd_Calc.mLote_Setor.EmptyDataSet;
  fDMBaixaProd_Calc.cdsLote_Setor.First;
  while not fDMBaixaProd_Calc.cdsLote_Setor.Eof do
  begin
    fDMBaixaProd_Calc.mLote_Setor.Insert;
    fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger  := fDMBaixaProd_Calc.cdsLote_SetorID_SETOR.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger       := fDMBaixaProd_Calc.cdsLote_SetorQTD.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString := fDMBaixaProd_Calc.cdsLote_SetorNOME_SETOR.AsString;
    fDMBaixaProd_Calc.mLote_SetorNum_Lote.AsInteger  := fDMBaixaProd_Calc.cdsLote_SetorNUM_LOTE.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorItem.AsInteger      := fDMBaixaProd_Calc.cdsLote_SetorITEM.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorID.AsInteger        := fDMBaixaProd_Calc.cdsLote_SetorID.AsInteger;

    fDMBaixaProd_Calc.qVerBaixaLoteSetor.Close;
    fDMBaixaProd_Calc.qVerBaixaLoteSetor.ParamByName('ID').AsInteger       := fDMBaixaProd_Calc.cdsLote_SetorID.AsInteger;
    fDMBaixaProd_Calc.qVerBaixaLoteSetor.ParamByName('ID_SETOR').AsInteger := fDMBaixaProd_Calc.cdsLote_SetorID_SETOR.AsInteger;
    fDMBaixaProd_Calc.qVerBaixaLoteSetor.Open;

    if fDMBaixaProd_Calc.qVerBaixaLoteSetorCONTADOR.AsInteger > 0 then
      fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean := False
    else
      fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean := True;
    fDMBaixaProd_Calc.mLote_Setor.Post;

    fDMBaixaProd_Calc.cdsLote_Setor.Next;
  end;
end;

procedure TfrmBaixaLote_Calc.prc_Le_Talao_Setor;
var
  vAtualizar : String;
  vSaida : Boolean;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.First;
  while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
  begin
    vSaida     := True;
    fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
    if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull then
    begin
      fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora_Loc;
      //fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsInteger := fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger;
    end;
    if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.IsNull then
    begin
      fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime := vHora_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime);
    end;
    fDMBaixaProd_Calc.cdsTalao_Setor.Post;
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
  end;
  fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
end;

procedure TfrmBaixaLote_Calc.prc_Le_Talao_Setor_Atu;
var
  vAtualizar : String;
  vGravar : Boolean;
begin
  vGravar := False;
  vAtualizar := 'N';
  fDMBaixaProd_Calc.cdsTalao_Setor.First;
  while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
  begin
    if (vAtualizar = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorclEntrada_Aut.AsString = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull) then
    begin
      fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
      fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora_Loc;
      fDMBaixaProd_Calc.cdsTalao_Setor.Post;
      vGravar := True;
    end;
    vAtualizar := 'N';
    if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 10 then
      vAtualizar := 'S';
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
  end;
  if vGravar  then
    fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
end;

procedure TfrmBaixaLote_Calc.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaLote_Calc.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean then
    exit;
  fDMBaixaProd_Calc.mLote_Setor.Edit;
  fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean := not(fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean);
  fDMBaixaProd_Calc.mLote_Setor.Post;
end;

end.
