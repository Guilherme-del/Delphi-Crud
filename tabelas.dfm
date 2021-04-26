object dmTabelas: TdmTabelas
  OldCreateOrder = False
  Height = 254
  Width = 466
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = Database
    Left = 344
    Top = 136
  end
  object Database: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Users\DXE5\Documents\RAD Studio\Projects\CRUD2\BD\CRUD.FDB'
    Params.Strings = (
      'lc_ctype=WIN1252'
      'password=!@ab#$cs2018'
      'user_name=SYSDBA')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    ServerType = 'IBServer'
    Left = 56
    Top = 48
  end
  object qryCliente: TIBDataSet
    Database = Database
    Transaction = IBTransaction
    AfterOpen = qryClienteAfterOpen
    AfterScroll = qryClienteAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from cliente'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into cliente'
      
        '  (BAIRRO, CELULAR, CEP, CIDADE, CODIGO, DATA, ENDERECO, ESTADO,' +
        ' FAX, NOME, '
      '   NUMERO, TELEFONE)'
      'values'
      
        '  (:BAIRRO, :CELULAR, :CEP, :CIDADE, :CODIGO, :DATA, :ENDERECO, ' +
        ':ESTADO, '
      '   :FAX, :NOME, :NUMERO, :TELEFONE)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DATA,'
      '  NOME,'
      '  TELEFONE,'
      '  CELULAR,'
      '  FAX,'
      '  ENDERECO,'
      '  NUMERO,'
      '  BAIRRO,'
      '  CIDADE,'
      '  ESTADO,'
      '  CEP'
      'from cliente '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from cliente'
      'order by codigo')
    ModifySQL.Strings = (
      'update cliente'
      'set'
      '  BAIRRO = :BAIRRO,'
      '  CELULAR = :CELULAR,'
      '  CEP = :CEP,'
      '  CIDADE = :CIDADE,'
      '  CODIGO = :CODIGO,'
      '  DATA = :DATA,'
      '  ENDERECO = :ENDERECO,'
      '  ESTADO = :ESTADO,'
      '  FAX = :FAX,'
      '  NOME = :NOME,'
      '  NUMERO = :NUMERO,'
      '  TELEFONE = :TELEFONE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'G_CODIGO'
    Left = 184
    Top = 152
    object qryClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClienteDATA: TDateField
      FieldName = 'DATA'
      Origin = '"CLIENTE"."DATA"'
    end
    object qryClienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Required = True
      Size = 25
    end
    object qryClienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIENTE"."TELEFONE"'
      Size = 25
    end
    object qryClienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = '"CLIENTE"."CELULAR"'
      Size = 25
    end
    object qryClienteFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CLIENTE"."FAX"'
      Size = 25
    end
    object qryClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CLIENTE"."ENDERECO"'
      Size = 50
    end
    object qryClienteNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"CLIENTE"."NUMERO"'
      Size = 10
    end
    object qryClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"CLIENTE"."BAIRRO"'
      Size = 25
    end
    object qryClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"CLIENTE"."CIDADE"'
      Size = 50
    end
    object qryClienteESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"CLIENTE"."ESTADO"'
      Size = 2
    end
    object qryClienteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"CLIENTE"."CEP"'
      Size = 10
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 128
    Top = 96
  end
end
