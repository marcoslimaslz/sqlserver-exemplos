

declare @SQL nvarchar(max)

set @SQL =        ' set statistics io on  '
set @SQL = @SQL + ' set statistics time on '

set @SQL = @SQL + ' select * from cargas_notas '


set @SQL = @SQL + ' set statistics io off '
set @SQL = @SQL + ' set statistics time off '


exec sp_executesql @SQL 