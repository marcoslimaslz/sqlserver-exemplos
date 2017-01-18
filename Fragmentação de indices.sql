----------------------------------------------------------------------------------------------------------------------
DECLARE @TableName SYSNAME
DECLARE cur_showfragmentation CURSOR FOR

SELECT table_name  FROM information_schema.tables WHERE table_type = 'base table' and TABLE_SCHEMA = 'dbo'

OPEN cur_showfragmentation
FETCH NEXT FROM cur_showfragmentation INTO @TableName
WHILE @@FETCH_STATUS = 0 
    BEGIN
        SELECT  'Show fragmentation for the ' + @TableName + ' table'
        DBCC SHOWCONTIG (@TableName)
        FETCH NEXT FROM cur_showfragmentation INTO @TableName
    END
CLOSE cur_showfragmentation
DEALLOCATE cur_showfragmentation

----------------------------------------------------------------------------------------------------------------------
 DBCC SHOWCONTIG ('CRGOPERACOES_INFO')
----------------------------------------------------------------------------------------------------------------------