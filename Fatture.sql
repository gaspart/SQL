SELECT
      tm_anno AS 'Anno',
      tm_datdoc AS 'Data',
      tm_numdoc AS 'Numero',
      tm_tipork,
      an_descr1 AS 'Cliente',
      tb_descage AS 'Agente',
      mm_commeca AS 'Commessa',
      mm_riga AS 'Riga',
      mm_descr AS 'Descrizione',
      mm_quant AS 'Quantità',
      mm_valore AS 'Valore',
      mm_hhmargval AS 'MDC'
  FROM dbo.testmag
  
  LEFT JOIN dbo.movmag
     ON dbo.testmag.tm_anno = dbo.movmag.mm_anno
     AND dbo.testmag.tm_numdoc = dbo.movmag.mm_numdoc
  LEFT JOIN dbo.tabcage
     ON testmag.tm_codagen = dbo.tabcage.tb_codcage
  LEFT JOIN dbo.anagra
     ON tm_conto = an_conto
  
  WHERE tm_datdoc >= '2023-01-01'
    AND tm_tipork IN ('A', 'D', 'E', 'N')
  
  ORDER BY tm_datdoc DESC;"
