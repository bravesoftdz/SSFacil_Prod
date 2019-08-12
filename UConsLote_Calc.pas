unit UConsLote_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMLoteImp_Calc, DBVGrids, DBGrids,
  Grids, SMDBGrid, StdCtrls, NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls, RzTabs, DB,
  TeEngine, Series, TeeProcs, Chart, DbChart, DBCtrls;

type
  TfrmConsLote_Calc = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel1: TNxLabel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    NxLabel9: TNxLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape6: TShape;
    Label6: TLabel;
    NxLabel11: TNxLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit1: TCurrencyEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnImprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Edit2: TEdit;
    TS_Processo: TRzTabSheet;
    NxLabel10: TNxLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SMDBGrid2: TSMDBGrid;
    TS_Setor: TRzTabSheet;
    RzPageControl2: TRzPageControl;
    TS_Setor_Dados: TRzTabSheet;
    TS_Setor_Graf: TRzTabSheet;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    SMDBGrid3: TSMDBGrid;
    TS_Setor_Ref: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    TS_Ref: TRzTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SMDBGrid5: TSMDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    DBText4: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzPageControl1Change(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid4TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDMLoteImp_Calc: TDMLoteImp_Calc;
    vOpcaoImp: String;

    procedure prc_Monta_Opcao;
    procedure prc_Consulta_Lote;
    procedure prc_ConsProcesso;
    procedure prc_ConsTalao_Setor;

  public
    { Public declarations }
  end;

var
  frmConsLote_Calc: TfrmConsLote_Calc;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, Math, USel_Produto, StrUtils;

{$R *.dfm}

procedure TfrmConsLote_Calc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsLote_Calc.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMLoteImp_Calc:= TDMLoteImp_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp_Calc);
  fDMLoteImp_Calc.cdsProcesso.Open;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
    NxLabel2.Caption := 'N� Remessa:'
  else
    NxLabel2.Caption := 'N� Ordem Produ��o:';

  for i := 0 to SMDBGrid1.ColCount - 2 do
  begin
    if SMDBGrid1.Columns[i].FieldName = 'NUM_ORDEM' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S');
    if SMDBGrid1.Columns[i].FieldName = 'NUM_REMESSA' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S');
  end;

  TS_Processo.TabVisible := (fDMLoteImp_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S');

  if fDMLoteImp_Calc.qParametros_LoteID_SETOR_EST.AsInteger > 0 then
    RxDBLookupCombo3.KeyValue := fDMLoteImp_Calc.qParametros_LoteID_SETOR_EST.AsInteger;
end;

procedure TfrmConsLote_Calc.btnConsTalaoClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Talao then
    prc_Consulta_Lote
  else
  if RzPageControl1.ActivePage = TS_Processo then
    prc_ConsProcesso
  else
    prc_ConsTalao_Setor;
end;

procedure TfrmConsLote_Calc.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  //fDMLoteImp_Calc.cdsConsTalao.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid1.Columns.Count - 1 do
  //  if not (SMDBGrid1.Columns.Items[I] = Column) then
  //    SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsLote_Calc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp_Calc.cdsConsulta_LoteDTSAIDA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp_Calc.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsLote_Calc.btnImprimirClick(Sender: TObject);
var
  vArq: String;
begin
  if RzPageControl1.ActivePage = TS_Talao then
  begin
    prc_Monta_Opcao;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Det_Calc.fr3';
    if FileExists(vArq) then
      fDMLoteImp_Calc.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      MessageDlg('*** Relat�rio ' + vArq + ', n�o encontrado!' , mtInformation, [mbOk], 0);
      exit;
    end;
    fDMLoteImp_Calc.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
    fDMLoteImp_Calc.frxReport1.ShowReport;
  end;
  if RzPageControl1.ActivePage = TS_Setor then
  begin
    if RzPageControl2.ActivePage = TS_Setor_Ref then
    begin
      if fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.IsEmpty then
      begin
        ShowMessage('Consulta sem registro, refa�a a consulta!');
        Exit;
      end;
//      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_SetorReferencia.fr3';
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_SetorReferencia2.fr3';
      if FileExists(vArq) then
        fDMLoteImp_Calc.frxReport1.Report.LoadFromFile(vArq)
      else
      begin
        MessageDlg('*** Relat�rio ' + vArq + ', n�o encontrado!' , mtInformation, [mbOk], 0);
        exit;
      end;
      fDMLoteImp_Calc.frxReport1.ShowReport;
    end;
  end;
end;

procedure TfrmConsLote_Calc.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if trim(Edit2.Text) = '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vOpcaoImp := vOpcaoImp + '(N� Remessa: ' + Edit2.Text + ')'
    else
      vOpcaoImp := vOpcaoImp + '(N� O.P.: ' + Edit2.Text + ')';
  end;

  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text + ')'
  else
  if (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Inicial: ' + CurrencyEdit1.Text + ')'
  else
  if (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Final: ' + CurrencyEdit2.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada (Ini): ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada (Fin): ' + DateEdit2.Text + ')';

  if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Sa�da: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
  else
  if (DateEdit3.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Sa�da(Ini): ' + DateEdit3.Text + ')'
  else
  if (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Sa�da (Fin): ' + DateEdit4.Text + ')';
  if trim(RxDBLookupCombo1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Setor: ' + RxDBLookupCombo1.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Refer�ncia: ' + Edit1.Text + ')';
  case cbxOpcao.ItemIndex of
    1: vOpcaoImp := vOpcaoImp + '(Pendente)';
    2: vOpcaoImp := vOpcaoImp + '(Encerrados)';
    3: vOpcaoImp := vOpcaoImp + '(Tal�es Aguardando)';
  end;
end;

procedure TfrmConsLote_Calc.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote_Calc.RzPageControl1Change(Sender: TObject);
begin
  NxLabel10.Visible        := (RzPageControl1.ActivePage = TS_Processo);
  RxDBLookupCombo2.Visible := (RzPageControl1.ActivePage = TS_Processo);
end;

procedure TfrmConsLote_Calc.prc_Consulta_Lote;
var
  vComando: String;
  vNumAux: String;
begin
  vComando := ' WHERE 0 = 0';
  vNumAux := Edit2.Text;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S' then
    vNumAux := Monta_Numero(Edit2.Text,0);
  if trim(vNumAux) <> '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vComando := vComando + '  AND L.NUM_REMESSA = ' + QuotedStr(vNumAux)
    else
      vComando := vComando + '  AND L.NUM_ORDEM = ' + vNumAux ;
  end;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbxOpcao.ItemIndex of
    1: vComando := vComando + ' AND TS.DTSAIDA is null ';
    2: vComando := vComando + ' AND TS.DTSAIDA is not null ';
    3: vComando := vComando + ' AND TS.DTENTRADA is null ';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND T.REFERENCIA LIKE ' + QuotedStr(Edit1.Text+'%');
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND TS.ID_SETOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  fDMLoteImp_Calc.cdsConsulta_Lote.Close;
  fDMLoteImp_Calc.sdsConsulta_Lote.CommandText := fDMLoteImp_Calc.ctConsulta_Lote + vComando;
  fDMLoteImp_Calc.cdsConsulta_Lote.Open;
  fDMLoteImp_Calc.cdsConsulta_Lote.IndexFieldNames := 'ID;NUM_TALAO;ITEM';
end;

procedure TfrmConsLote_Calc.prc_ConsProcesso;
var
  vComando: String;
  vNumAux: String;
begin
  vComando := ' WHERE 0 = 0';
  vNumAux := Edit2.Text;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S' then
    vNumAux := Monta_Numero(Edit2.Text,0);
  if trim(vNumAux) <> '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vComando := vComando + '  AND L.NUM_REMESSA = ' + QuotedStr(vNumAux)
    else
      vComando := vComando + '  AND L.NUM_ORDEM = ' + vNumAux ;
  end;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND B.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND B.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND B.DTBAIXA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND B.DTBAIXA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbxOpcao.ItemIndex of
    1: vComando := vComando + ' AND B.DTBAIXA is null ';
    2: vComando := vComando + ' AND B.DTBAIXA is not null ';
    3: vComando := vComando + ' AND B.DTENTRADA is null ';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr(Edit1.Text+'%');
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND B.ID_SETOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(RxDBLookupCombo2.Text) <> '' then
    vComando := vComando + ' AND B.ID_PROCESSO = ' + IntToStr(RxDBLookupCombo2.KeyValue);
  fDMLoteImp_Calc.cdsConsProcesso.Close;
  fDMLoteImp_Calc.sdsConsProcesso.CommandText := fDMLoteImp_Calc.ctConsProcesso + vComando;
  fDMLoteImp_Calc.cdsConsProcesso.Open;
  fDMLoteImp_Calc.cdsConsProcesso.IndexFieldNames := 'NUM_LOTE;ITEM';
end;

procedure TfrmConsLote_Calc.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp_Calc.cdsConsProcessoDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp_Calc.cdsConsProcessoDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsLote_Calc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vReferencia_Pos := '';
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'P';
    frmSel_Produto.ShowModal;
    FreeAndNil(frmSel_Produto);
    if trim(vReferencia_Pos) <> '' then
      Edit1.Text := vReferencia_Pos;
  end;
end;

procedure TfrmConsLote_Calc.prc_ConsTalao_Setor;
var
  i : Integer;
  vComandoAux, vComandoAux2, vComando : String;
  vNumAux : String;
begin
  if RzPageControl1.ActivePage = TS_Ref then
  begin
    fDMLoteImp_Calc.cdsConsTalao_Ref.Close;
    i := PosEx('GROUP',UpperCase(fDMLoteImp_Calc.ctConsTalao_Ref),0);
    vComandoAux  := copy(fDMLoteImp_Calc.ctConsTalao_Ref,i,Length(fDMLoteImp_Calc.ctConsTalao_Ref) - i + 1);
    vComandoAux2 := copy(fDMLoteImp_Calc.ctConsTalao_Ref,1,i-1);
  end
  else
  if RzPageControl2.ActivePage = TS_Setor_Ref then
  begin
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.Close;
    i := PosEx('GROUP',UpperCase(fDMLoteImp_Calc.ctConsTalao_Setor_Ref),0);
    vComandoAux  := copy(fDMLoteImp_Calc.ctConsTalao_Setor_Ref,i,Length(fDMLoteImp_Calc.ctConsTalao_Setor_Ref) - i + 1);
    vComandoAux2 := copy(fDMLoteImp_Calc.ctConsTalao_Setor_Ref,1,i-1);
  end
  else
  begin
    fDMLoteImp_Calc.cdsConsTalao_Setor.Close;
    i := PosEx('GROUP',UpperCase(fDMLoteImp_Calc.ctConsTalao_Setor),0);
    vComandoAux  := copy(fDMLoteImp_Calc.ctConsTalao_Setor,i,Length(fDMLoteImp_Calc.ctConsTalao_Setor) - i + 1);
    vComandoAux2 := copy(fDMLoteImp_Calc.ctConsTalao_Setor,1,i-1);
  end;

  vComando := ' WHERE 0 = 0 ';
  vNumAux  := Edit2.Text;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S' then
    vNumAux := Monta_Numero(Edit2.Text,0);
  if trim(vNumAux) <> '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vComando := vComando + '  AND L.NUM_REMESSA = ' + QuotedStr(vNumAux)
    else
      vComando := vComando + '  AND L.NUM_ORDEM = ' + vNumAux ;
  end;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbxOpcao.ItemIndex of
    1: vComando := vComando + ' AND TS.DTSAIDA is null ';
    2: vComando := vComando + ' AND TS.DTSAIDA is not null ';
    3: vComando := vComando + ' AND TS.DTENTRADA is null ';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr(Edit1.Text+'%');
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND TS.ID_SETOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);

  if (RzPageControl1.ActivePage = TS_Ref) and (trim(RxDBLookupCombo3.Text) <> '') then
    vComando := vComando + ' AND TS.ID_SETOR = ' + IntToStr(RxDBLookupCombo3.KeyValue);

  if (RzPageControl1.ActivePage = TS_Ref) then
  begin
    fDMLoteImp_Calc.cdsConsTalao_Ref.Close;
    fDMLoteImp_Calc.sdsConsTalao_Ref.CommandText := vComandoAux2 + vComando + vComandoAux;
    fDMLoteImp_Calc.cdsConsTalao_Ref.Open;
    fDMLoteImp_Calc.cdsConsTalao_Ref.IndexFieldNames := 'REFERENCIA';
  end
  else
  if RzPageControl2.ActivePage = TS_Setor_Ref then
  begin
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.Close;
    fDMLoteImp_Calc.sdsConsTalao_Setor_Ref.CommandText := vComandoAux2 + vComando + vComandoAux;
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.Open;
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.IndexFieldNames := 'NOME_SETOR;REFERENCIA';
  end
  else
  begin
    fDMLoteImp_Calc.cdsConsTalao_Setor.Close;
    fDMLoteImp_Calc.sdsConsTalao_Setor.CommandText := vComandoAux2 + vComando + vComandoAux;
    fDMLoteImp_Calc.cdsConsTalao_Setor.Open;
    fDMLoteImp_Calc.cdsConsTalao_Setor.IndexFieldNames := 'NOME_SETOR';
  end;
end;

procedure TfrmConsLote_Calc.SMDBGrid4TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.IndexFieldNames := Column.FieldName;
  if ColunaOrdenada = 'REFERENCIA' then
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.IndexFieldNames := Column.FieldName + ';NOME_SETOR'
  else
  if (ColunaOrdenada = 'NOME_SETOR') or (ColunaOrdenada = 'ID_SETOR') then
    fDMLoteImp_Calc.cdsConsTalao_Setor_Ref.IndexFieldNames := Column.FieldName + ';REFERENCIA';
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00C4FFFF;
end;

end.
