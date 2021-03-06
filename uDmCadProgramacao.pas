unit UDMCadProgramacao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, dbXPress, LogTypes, Dialogs;

type
  TDMCadProgramacao = class(TDataModule)
    dspProgramacao: TDataSetProvider;
    sdsProgramacao: TSQLDataSet;
    sdsProgramacaoID: TIntegerField;
    sdsProgramacaoID_BAIXA: TIntegerField;
    sdsProgramacaoITEM_BAIXA: TIntegerField;
    sdsProgramacaoID_PROCESSO: TIntegerField;
    sdsProgramacaoID_LOTE: TIntegerField;
    sdsProgramacaoNUM_ORDEM: TIntegerField;
    sdsProgramacaoNUM_LOTE: TIntegerField;
    sdsProgramacaoDTINICIAL: TDateField;
    sdsProgramacaoHRINICIAL: TTimeField;
    sdsProgramacaoDTFINAL: TDateField;
    sdsProgramacaoHRFINAL: TTimeField;
    sdsProgramacaoID_MAQUINA: TIntegerField;
    cdsProgramacao: TClientDataSet;
    cdsProgramacaoID: TIntegerField;
    cdsProgramacaoID_BAIXA: TIntegerField;
    cdsProgramacaoITEM_BAIXA: TIntegerField;
    cdsProgramacaoID_PROCESSO: TIntegerField;
    cdsProgramacaoID_LOTE: TIntegerField;
    cdsProgramacaoNUM_ORDEM: TIntegerField;
    cdsProgramacaoNUM_LOTE: TIntegerField;
    cdsProgramacaoDTINICIAL: TDateField;
    cdsProgramacaoHRINICIAL: TTimeField;
    cdsProgramacaoDTFINAL: TDateField;
    cdsProgramacaoHRFINAL: TTimeField;
    cdsProgramacaoID_MAQUINA: TIntegerField;
    dsProgramacao: TDataSource;
    sdsPend: TSQLDataSet;
    dspPend: TDataSetProvider;
    cdsPend: TClientDataSet;
    dsPend: TDataSource;
    cdsPendNOME_PROCESSO: TStringField;
    cdsPendNUM_ORDEM: TIntegerField;
    cdsPendNUM_LOTE: TIntegerField;
    cdsPendNOME_PRODUTO: TStringField;
    cdsPendREFERENCIA: TStringField;
    cdsPendID_BAIXA: TIntegerField;
    cdsPendITEM_BAIXA: TIntegerField;
    cdsPendQTD: TFloatField;
    sdsMaqPend: TSQLDataSet;
    dspMaqPend: TDataSetProvider;
    cdsMaqPend: TClientDataSet;
    dsMaqPend: TDataSource;
    cdsMaqPendID: TIntegerField;
    cdsMaqPendNOME_MAQUINA: TStringField;
    cdsMaqPendQTD_BOCA: TIntegerField;
    cdsMaqPendQTD_FUSO: TIntegerField;
    cdsMaqPendESPESSURA: TFloatField;
    cdsMaqPendID_MAQUINA: TIntegerField;
    cdsMaqPendBOCA_DISPONIVEL: TFMTBCDField;
    cdsPendID_PRODUTO: TIntegerField;
    cdsPendTOTAL_BATIDAS: TFloatField;
    cdsPendQTD_POR_MIN: TFloatField;
    cdsPendTEMPO_PROD: TFloatField;
    cdsPendclTempo_Hora: TFloatField;
    cdsMaqPendclTempo_Hora: TFloatField;
    cdsPendSETUP_INICIO: TFloatField;
    cdsPendSETUP_TROCA: TFloatField;
    cdsPendSOMA_SETUP_INI: TStringField;
    cdsPendSOMA_SETUP_TRO: TStringField;
    mMaq: TClientDataSet;
    dsmMaq: TDataSource;
    mMaqID: TIntegerField;
    mMaqNome: TStringField;
    mMaqQtd_Bocas: TIntegerField;
    mMaqQtd_Disponivel: TIntegerField;
    mProg: TClientDataSet;
    mProgID_Maquina: TIntegerField;
    mProgNome_Maquina: TStringField;
    mProgNum_Boca: TIntegerField;
    mProgQtd: TFloatField;
    dsmProg: TDataSource;
    sdsMaqUsada: TSQLDataSet;
    dspMaqUsada: TDataSetProvider;
    cdsMaqUsada: TClientDataSet;
    cdsMaqUsadaID_MAQUINA: TIntegerField;
    cdsMaqUsadaNUM_BOCA: TIntegerField;
    cdsMaqUsadaDTENTRADA: TDateField;
    cdsMaqUsadaDTINICIAL: TDateField;
    cdsMaqUsadaDTFINAL: TDateField;
    cdsMaqUsadaQTD_PROCESSO: TFloatField;
    cdsMaqUsadaQTD_PROGRAMADA: TFloatField;
    cdsMaqUsadaHRINICIAL: TTimeField;
    cdsMaqUsadaHRFINAL: TTimeField;
    mProgDtFinal: TDateField;
    mProgHrFinal: TTimeField;
    dsMaqUsada: TDataSource;
    mMaq_Boca: TClientDataSet;
    dsmMaq_Boca: TDataSource;
    mMaq_BocaQtd_Programada: TFloatField;
    mMaq_BocaDtFinal: TDateField;
    mMaq_BocaHrFinal: TTimeField;
    mMaq_BocaQtd_Gerar: TFloatField;
    mMaq_BocaTempo: TFloatField;
    mMaq_BocaID_Maquina: TIntegerField;
    mMaq_BocaNum_Boca: TIntegerField;
    mMaq_BocaSelecionado: TStringField;
    mMaqQtd_Prog: TFloatField;
    mProgTempo: TFloatField;
    mProgDtInicial: TDateField;
    mProgHrInicial: TTimeField;
    mMaq_BocaDtPrevista: TDateField;
    mMaq_BocaHrPrevista: TTimeField;
    mMaq_BocaDtPrevista2: TSQLTimeStampField;
    mMaq_BocaDtInicial: TDateField;
    mMaq_BocaHrInicial: TTimeField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteTOTAL_HORAS_PROD: TFloatField;
    mMaq_BocaPrimeira_Hora: TTimeField;
    mMaq_BocaPrimeira_Data: TDateField;
    mProgID_Baixa: TIntegerField;
    mProgItem_Baixa: TIntegerField;
    sdsBaixa_Processo: TSQLDataSet;
    sdsBaixa_ProcessoID: TIntegerField;
    sdsBaixa_ProcessoITEM: TIntegerField;
    sdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    sdsBaixa_ProcessoID_LOTE: TIntegerField;
    sdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoDTENTRADA: TDateField;
    sdsBaixa_ProcessoHRENTRADA: TTimeField;
    sdsBaixa_ProcessoDTBAIXA: TDateField;
    sdsBaixa_ProcessoHRBAIXA: TTimeField;
    sdsBaixa_ProcessoQTD: TFloatField;
    sdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    sdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    sdsBaixa_ProcessoTIPO: TStringField;
    sdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    sdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    sdsBaixa_ProcessoPARCIAL: TStringField;
    sdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    sdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    sdsBaixa_ProcessoAJUSTE: TStringField;
    sdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    sdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    sdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    sdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    sdsBaixa_ProcessoRETRABALHO: TStringField;
    dspBaixa_Processo: TDataSetProvider;
    cdsBaixa_Processo: TClientDataSet;
    cdsBaixa_ProcessoID: TIntegerField;
    cdsBaixa_ProcessoITEM: TIntegerField;
    cdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    cdsBaixa_ProcessoID_LOTE: TIntegerField;
    cdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoDTENTRADA: TDateField;
    cdsBaixa_ProcessoHRENTRADA: TTimeField;
    cdsBaixa_ProcessoDTBAIXA: TDateField;
    cdsBaixa_ProcessoHRBAIXA: TTimeField;
    cdsBaixa_ProcessoQTD: TFloatField;
    cdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    cdsBaixa_ProcessoTIPO: TStringField;
    cdsBaixa_ProcessoclNome_Processo: TStringField;
    cdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    cdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsBaixa_ProcessoPARCIAL: TStringField;
    cdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    cdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    cdsBaixa_ProcessoAJUSTE: TStringField;
    cdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    cdsBaixa_ProcessoRETRABALHO: TStringField;
    dsBaixa_Processo: TDataSource;
    sdsProgramacaoNUM_BOCA: TIntegerField;
    sdsProgramacaoDTPROGRAMACAO: TDateField;
    sdsProgramacaoTEMPO: TFloatField;
    sdsProgramacaoQTD: TFloatField;
    sdsProgramacaoSTATUS: TStringField;
    cdsProgramacaoNUM_BOCA: TIntegerField;
    cdsProgramacaoDTPROGRAMACAO: TDateField;
    cdsProgramacaoTEMPO: TFloatField;
    cdsProgramacaoQTD: TFloatField;
    cdsProgramacaoSTATUS: TStringField;
    sdsBaixa_ProcessoPROGRAMADO: TStringField;
    cdsBaixa_ProcessoPROGRAMADO: TStringField;
    cdsPendID_PROCESSO: TIntegerField;
    cdsPendID_LOTE: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspProgramacaoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsPendCalcFields(DataSet: TDataSet);
    procedure cdsMaqPendCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMSGErro: String;
        
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

    procedure prc_Consultar_MaqUsada(ID : Integer);
    procedure prc_Gerar_MaqBoca;
    procedure prc_Gravar_mMaq_Boca(Qtd_Processo : Real ; DTFinal, HRFinal : TDateTime ; Num_Boca : Integer);

    procedure prc_Monta_Qtd_Maq(Qtd : Real);

  end;

var
  DMCadProgramacao: TDMCadProgramacao;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider, Math;

{$R *.dfm}

{ TDMCadCFOP}

procedure TDMCadProgramacao.prc_Inserir;
var
  vAux: Integer;
  sds: TSQLDataSet;
  vNumAux: Integer;
begin
  if not cdsProgramacao.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PROGRAMACAO',0);

  cdsProgramacao.Insert;
  cdsProgramacaoID.AsInteger    := vAux;
end;

procedure TDMCadProgramacao.prc_Excluir;
begin
  if not(cdsProgramacao.Active) or (cdsProgramacao.IsEmpty) then
    Exit;
  cdsProgramacao.Delete;
  cdsProgramacao.ApplyUpdates(0);
end;

procedure TDMCadProgramacao.prc_Gravar;
begin
  vMsgErro := '';
  if trim(vMSGErro) <> '' then
  begin
    MessageDlg(vMSGErro, mtError, [mbOk], 0);
    exit;
  end;
  cdsProgramacao.Post;
  cdsProgramacao.ApplyUpdates(0);

end;

procedure TDMCadProgramacao.prc_Localizar(ID: Integer); //-1 � para inclus�o
begin
  cdsProgramacao.Close;
  sdsProgramacao.ParamByName('ID').AsInteger := ID;
  cdsProgramacao.Open;
end;

procedure TDMCadProgramacao.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  qParametros_Lote.Open;
  //*** Logs Implantado na vers�o .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMCadProgramacao.dspProgramacaoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadProgramacao.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadProgramacao.cdsPendCalcFields(DataSet: TDataSet);
var
  vAux : Real;
  vTempo : Real;
begin
   cdsPendclTempo_Hora.AsFloat := 0;
   vTempo := cdsPendTEMPO_PROD.AsFloat;
   if cdsPendSOMA_SETUP_INI.AsString = 'S' then
     vTempo := vTempo + StrToFloat(FormatFloat('0.00',cdsPendSETUP_INICIO.AsFloat /60 ));
   if cdsPendSOMA_SETUP_TRO.AsString = 'S' then
     vTempo := vTempo + StrToFloat(FormatFloat('0.00',cdsPendSETUP_TROCA.AsFloat / 60));
   //vAux := cdsPendTEMPO_PROD.AsFloat - Trunc(cdsPendTEMPO_PROD.AsFloat);
   vAux := vTempo - Trunc(vTempo);
   if StrToFloat(FormatFloat('0.00',vAux)) > 0 then
     cdsPendclTempo_Hora.AsFloat := Trunc(vTempo) + StrToFloat(FormatFloat('0.00',(vAux * 60) / 100));
end;

procedure TDMCadProgramacao.cdsMaqPendCalcFields(DataSet: TDataSet);
var
  vAux : Real;
  vTempo : Real;
  vQtd : Real;
begin
  cdsMaqPendclTempo_Hora.AsFloat := 0;
  if StrToFloat(FormatFloat('0.00',cdsPendTEMPO_PROD.AsFloat)) <= 0 then
    exit;

  vQtd := StrToFloat(FormatFloat('0.000',cdsPendQTD.AsFloat * 100));
  if StrToFloat(FormatFloat('0.00',cdsMaqPendBOCA_DISPONIVEL.AsFloat)) > 0 then
    vQtd := StrToFloat(FormatFloat('0.0000',vQtd / cdsMaqPendBOCA_DISPONIVEL.AsFloat));
  vTempo := StrToFloat(FormatFloat('0.00',vQtd / cdsPendQTD_POR_MIN.AsFloat));
  vTempo := StrToFloat(FormatFloat('0.00',vTempo / cdsPendQTD_POR_MIN.AsFloat));

  //vTempo := cdsPendTEMPO_PROD.AsFloat;
  if cdsPendSOMA_SETUP_INI.AsString = 'S' then
    vTempo := vTempo + StrToFloat(FormatFloat('0.00',cdsPendSETUP_INICIO.AsFloat /60 ));
  if cdsPendSOMA_SETUP_TRO.AsString = 'S' then
    vTempo := vTempo + StrToFloat(FormatFloat('0.00',cdsPendSETUP_TROCA.AsFloat / 60));

  //if StrToFloat(FormatFloat('0.00',cdsMaqPendBOCA_DISPONIVEL.AsFloat)) > 0 then
  //     vTempo := StrToFloat(FormatFloat('0.00',vTempo / cdsMaqPendBOCA_DISPONIVEL.AsFloat));
  vAux   := vTempo - Trunc(vTempo);
  if StrToFloat(FormatFloat('0.00',vAux)) > 0 then
    cdsMaqPendclTempo_Hora.AsFloat := Trunc(vTempo) + StrToFloat(FormatFloat('0.00',(vAux * 60) / 100));

end;

procedure TDMCadProgramacao.prc_Consultar_MaqUsada(ID: Integer);
begin
  cdsMaqUsada.Close;
  sdsMaqUsada.ParamByName('ID_MAQUINA').AsInteger := ID;
  cdsMaqUsada.Open;
end;

procedure TDMCadProgramacao.prc_Gerar_MaqBoca;
var
  i : Integer;
begin
  i := 1;
  while i <= mMaqQtd_Bocas.AsInteger do
  begin
    if cdsMaqUsada.Locate('NUM_BOCA',i,[loCaseInsensitive]) then
      prc_Gravar_mMaq_Boca(cdsMaqUsadaQTD_PROGRAMADA.AsFloat,cdsMaqUsadaDTFINAL.AsDateTime,cdsMaqUsadaHRFINAL.AsDateTime,i)
    else
      prc_Gravar_mMaq_Boca(0,0,0,i);

    i := i + 1;
  end;

end;

procedure TDMCadProgramacao.prc_Gravar_mMaq_Boca(Qtd_Processo: Real;
  DTFinal, HRFinal: TDateTime; Num_Boca: Integer);
begin
  mMaq_Boca.Insert;
  mMaq_BocaQtd_Programada.AsFloat := Qtd_Processo;
  if DTFinal > 10 then
    mMaq_BocaDtFinal.AsDateTime := DTFinal;
  if HRFinal <> 0 then
    mMaq_BocaHrFinal.AsDateTime := HRFinal;
  mMaq_BocaQtd_Gerar.AsFloat := 0;
  mMaq_BocaTempo.AsFloat := 0;
  mMaq_BocaID_Maquina.AsInteger := mMaqID.AsInteger;
  mMaq_BocaNum_Boca.AsInteger := Num_Boca;
  mMaq_Boca.Post;
end;

procedure TDMCadProgramacao.prc_Monta_Qtd_Maq(Qtd : Real);
var
  vQtd : Real;
  vQtdDiv : Real;
begin
  vQtdDiv := StrToFloat(FormatFloat('0.00',Qtd / mMaq.RecordCount));
  vQtd    := Qtd;
  mMaq.First;
  while not mMaq.Eof do
  begin
    mMaq.Edit;
    if mMaq.RecordCount = mMaq.RecNo then
      mMaqQtd_Prog.AsFloat := vQtd
    else
      mMaqQtd_Prog.AsFloat := vQtdDiv;
    vQtd := StrToFloat(FormatFloat('0.00',vQtd - mMaqQtd_Prog.AsFloat));
    mMaq.Post;

    mMaq_Boca.First;
    while not mMaq_Boca.Eof do
      mMaq_Boca.Delete;

    prc_Consultar_MaqUsada(mMaqID.AsInteger);
    prc_Gerar_MaqBoca;

    mMaq.Next;
  end;

end;

end.
