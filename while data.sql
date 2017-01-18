




create table #temp
(
  cont int,
  data varchar(30)
)

declare @cont int = 100

while @cont < 200
begin 
  insert into #temp values(@cont, convert(varchar(10), getdate(),  @cont) + ' 00:00:00.000')
  
  set @cont = @cont + 1
end

select * from #temp

drop table #temp

102	2016.12.28 00:00:00.000
111	2016/12/28 00:00:00.000