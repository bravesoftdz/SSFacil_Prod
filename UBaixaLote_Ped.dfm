object frmBaixaLote_Ped: TfrmBaixaLote_Ped
  Left = 271
  Top = 177
  Width = 928
  Height = 426
  Caption = 'frmBaixaLote_Ped'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 61
    Top = 15
    Width = 46
    Height = 18
    Alignment = taRightJustify
    Caption = 'Data:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 265
    Top = 15
    Width = 45
    Height = 18
    Alignment = taRightJustify
    Caption = 'Hora:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 20
    Top = 55
    Width = 87
    Height = 18
    Alignment = taRightJustify
    Caption = 'C'#243'd.Barra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 414
    Top = 3
    Width = 321
    Height = 32
    Caption = 
      'Deixar Data e Hora em branco para assumir '#13#10'a hora do sistema au' +
      'tom'#225'tico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DateEdit1: TDateEdit
    Left = 108
    Top = 7
    Width = 144
    Height = 23
    Ctl3D = False
    DefaultToday = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object RzDateTimeEdit1: TRzDateTimeEdit
    Left = 312
    Top = 7
    Width = 95
    Height = 23
    EditType = etTime
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 108
    Top = 49
    Width = 202
    Height = 25
    Color = 16777119
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 897
    Height = 281
    Color = clSilver
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
