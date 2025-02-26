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
      mm_hhmargval AS 'MDC' ,
      mm_datini AS 'Data Inizio',
      mm_datfin AS 'Data Fine',
      tb_descfam as 'Famiglia',
      tb_descove as 'contropartita'
FROM
      dbo.testmag 
INNER JOIN
      movmag
      ON tm_tipork=mm_tipork
      AND tm_anno=mm_anno
      AND tm_serie=mm_serie
      AND tm_numdoc=mm_numdoc
LEFT JOIN
      dbo.tabcage
      ON testmag.tm_codagen = dbo.tabcage.tb_codcage
LEFT JOIN commess
      ON tm_commeca=co_comme
LEFT JOIN dbo.anagra
      ON co_conto = an_conto
LEFT JOIN artico on mm_codart=ar_codart
LEFT JOIN tabcfam on ar_famprod=tb_codcfam
LEFT JOIN tabcove on mm_controp=tb_codcove
WHERE tm_datdoc>='2023-01-01'
AND (tm_tipork in ('A','E','N'))

UNION ALL

SELECT
      testmagd.tm_anno AS 'Anno',
      testmagd.tm_datdoc AS 'Data',
      testmagd.tm_numdoc AS 'Numero',
      testmagd.tm_tipork,
      an_descr1 AS 'Cliente',
      tb_descage AS 'Agente',
      mm_commeca AS 'Commessa',
      mm_riga AS 'Riga',
      mm_descr AS 'Descrizione',
      mm_quant AS 'Quantità',
      mm_valore AS 'Valore',
      mm_hhmargval AS 'MDC',
      mm_datini AS 'Data Inizio',
      mm_datfin AS 'Data Fine',
      tb_descfam as 'Famiglia',
      tb_descove as 'contropartita'
FROM 
      testmag as testmagd 
INNER JOIN
      testmag
      ON testmagd.tm_tipork=testmag.tm_tiporkfat
AND testmagd.tm_anno=testmag.tm_annfat
AND testmagd.tm_serie=testmag.tm_alffat 
AND testmagd.tm_numdoc=testmag.tm_numfat  
LEFT JOIN movmag
on testmag.tm_tipork=mm_tipork
AND testmag.tm_anno=mm_anno
AND testmag.tm_serie=mm_serie
AND testmag.tm_numdoc=mm_numdoc
LEFT JOIN dbo.tabcage
      ON testmagd.tm_codagen = dbo.tabcage.tb_codcage
LEFT JOIN commess on testmagd.tm_commeca=co_comme
LEFT JOIN dbo.anagra
     ON co_conto = an_conto
LEFT JOIN artico on mm_codart=ar_codart
LEFT JOIN tabcfam on ar_famprod=tb_codcfam
LEFT JOIN tabcove on mm_controp=tb_codcove
WHERE testmagd.tm_datdoc>='2023-01-01'
AND (testmagd.tm_tipork in ('D'))
