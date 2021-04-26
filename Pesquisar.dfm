object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ferramenta de Pesquisa'
  ClientHeight = 349
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333
    3333333333333333333333333333333333333333333333333333333333333333
    3333333333333333333333333333333333FFFFFFFFFFFFFFFFFFFF3333333333
    3FFFFFFFFFFFFFFFFFFFFFF333333333FFFFFFFFFFFFFFFFFFFFFFFF3333333F
    FFFF333333FFFFFFFFFFFFFFF333333FFFFF333333FFFFFFFFFFFFFFF333333F
    FFFF333333FFFFFFFFFFFFFFF333333FFFFF333333FFFFFFFFFFFFFFF333333F
    FFFF333333FFFFFFFFFFFFFFF333333FFFFF333333FF3333FFFFFFFFF333333F
    FFFF33333333333333FFFFFFF333333FFFFF333333333333333FFFFFF333333F
    FFFF333333333333333FFFFFF333333FFFFF3333333FF3333333FFFFF333333F
    FFFF333333FFFF333333FFFFF333333FFFFF333333FFFF333333FFFFF333333F
    FFFF333333FFFF333333FFFFF333333FFFFF333333FFFF333333FFFFF333333F
    FFFF333333FFFF333333FFFFF333333FFFFF3333333FF3333333FFFFF333333F
    FFFF333333333333333FFFFFF333333FFFFF333333333333333FFFFFF333333F
    FFFF33333333333333FFFFFFF333333FFFFF333333FF3333FFFFFFFFF3333333
    FFFFFFFFFFFFFFFFFFFFFFFF333333333FFFFFFFFFFFFFFFFFFFFFF333333333
    33FFFFFFFFFFFFFFFFFFFF333333333333333333333333333333333333333333
    3333333333333333333333333333333333333333333333333333333333330000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 108
    Top = 12
    Width = 70
    Height = 13
    Caption = 'Valor da Busca'
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 79
    Height = 13
    Caption = 'Campo da busca'
  end
  object btnConfirmar: TBitBtn
    Left = 86
    Top = 313
    Width = 94
    Height = 25
    Align = alCustom
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object BitBtn1: TBitBtn
    Left = 186
    Top = 313
    Width = 103
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object edtValor: TEdit
    Left = 108
    Top = 29
    Width = 257
    Height = 21
    AutoSelect = False
    TabOrder = 0
    OnChange = edtValorChange
  end
  object gridBusca: TDBGrid
    Left = 8
    Top = 56
    Width = 357
    Height = 251
    DataSource = dsBusca
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridBuscaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  object cmbIndex: TComboBox
    AlignWithMargins = True
    Left = 8
    Top = 29
    Width = 94
    Height = 21
    DropDownCount = 2
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOrder = 4
    Text = 'Nome'
    OnKeyPress = cmbIndexKeyPress
    Items.Strings = (
      'Codigo'
      'Nome')
  end
  object dsBusca: TDataSource
    DataSet = qryBusca
    Left = 136
    Top = 176
  end
  object qryBusca: TIBQuery
    Database = dmTabelas.Database
    Transaction = dmTabelas.IBTransaction
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from cliente')
    UniDirectional = True
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'G_CODIGO'
    Left = 216
    Top = 152
    object qryBuscaCODIGO: TIntegerField
      DisplayWidth = 12
      FieldName = 'CODIGO'
      Origin = '"CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBuscaNOME: TIBStringField
      DisplayWidth = 49
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Required = True
      Size = 25
    end
  end
  object tmrBusca: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrBuscaTimer
    Left = 88
    Top = 128
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 264
    Top = 184
  end
end
