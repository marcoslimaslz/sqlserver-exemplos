insert into chamados_tipo_prodserv
 select ROW_NUMBER() OVER(ORDER BY ps.seqprodutoservico ASC) + 4 AS seq_chamadotipo_prodserv, 
        1 as ID_chamadotipo_solicitacao,
		ps.seqprodutoservico,
		getdate() as dt_atu,
		69 as id_operador,
		'S' as fg_abater_horas
 from produtoservico ps
 where ps.seqprodutoservico not in (22, 3065)