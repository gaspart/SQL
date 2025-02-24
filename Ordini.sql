SELECT
	mo_anno AS 'Anno',
	td_datord AS 'Data Ordine',
	mo_numord AS 'No. Ordine',
	mo_tipork,
	an_siglaric AS 'Cliente',
	tb_descage AS 'Agente',
	td_commeca AS 'Commessa',
	mo_riga,
	mo_descr AS 'Descrizione',
	mo_valore AS 'Valore',
	mo_datini AS 'Data Inizio',
	mo_datfin AS 'Data Fine',
        mo_hhmargval AS 'MDC'
FROM
	dbo.movord
JOIN
	dbo.testord
	ON mo_anno = td_anno
	AND mo_numord = td_numord

JOIN dbo.tabcage
   ON testord.td_codagen = dbo.tabcage.tb_codcage

Join dbo.anagra
	ON dbo.testord.td_conto = dbo.anagra.an_conto

WHERE
	mo_anno >= 2023
	AND td_codcaua = 0
ORDER BY 
	dbo.movord.mo_anno DESC, mo_numord DESC;
