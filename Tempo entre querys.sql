declare @dt_ini datetime
declare @dt_fim datetime
declare @len int = len('00:00:00.000')
declare @Opcao int = 0


set @dt_ini = getdate()
print 'I = ' + substring(convert(varchar(max), @dt_ini, 121),@len,@len)
  if @opcao = 0
  begin
    print 'select * from UFN_ULTIMA_OPERACAO(17) '
    select * from UFN_ULTIMA_OPERACAO(17) 
  end
  else
  begin
    print 'select * from UFN_ULTIMA_OPERACAO_TEMP(17) '
    select * from UFN_ULTIMA_OPERACAO_TEMP(17) 
  end
set @dt_fim = getdate()
print 'F = ' + substring(convert(varchar(max), @dt_fim, 121),@len,@len)
print 'R = ' + substring(convert(varchar(max), @dt_fim - @dt_ini, 121),@len,@len)