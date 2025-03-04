SELECT
      tm_anno AS 'Anno',
      tm_datdoc AS 'Data',
      tm_numdoc AS 'Numero',
      an_descr1 AS 'Cliente',
      tb_descage AS 'Agente',
      mm_commeca AS 'Commessa',
      mm_riga AS 'Riga',
      mm_descr AS 'Descrizione',
      mm_quant AS 'Quantità',
      mm_valore AS 'Valore',
      mm_hhmargval AS 'MDC',
      mm_controp AS 'Contropartita',
	  tb_descove AS 'Desc. Contropartita',
      tm_tipobf AS 'Tipo Bolla/Fattura',
	  tb_destpbf as 'Descr. Tipo Bolla/Fattura'
  FROM dbo.testmag
  
  LEFT JOIN dbo.movmag
     ON dbo.testmag.tm_anno = dbo.movmag.mm_anno
     AND dbo.testmag.tm_numdoc = dbo.movmag.mm_numdoc
     AND testmag.tm_serie = movmag.mm_serie
     AND testmag.tm_tipork = movmag.mm_tipork
      
  LEFT JOIN dbo.tabcage
     ON testmag.tm_codagen = dbo.tabcage.tb_codcage
  LEFT JOIN dbo.anagra
     ON tm_conto = an_conto
  LEFT JOIN tabcove on mm_controp=tb_codcove
  left join tabtpbf on tm_tipobf = tb_codtpbf 
  WHERE tm_datdoc >= '2023-01-01'
    AND tm_tipork IN ('B')
  
  ORDER BY tm_datdoc DESC;
