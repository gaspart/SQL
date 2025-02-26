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
where tm_datdoc>='2023-01-01'
and (tm_tipork in ('A','E','N'))

union all

select testmagd.tm_anno AS 'Anno',
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
from 
testmag as testmagd inner join 
testmag on testmagd.tm_tipork=testmag.tm_tiporkfat
and testmagd.tm_anno=testmag.tm_annfat
and testmagd.tm_serie=testmag.tm_alffat 
and testmagd.tm_numdoc=testmag.tm_numfat  left join movmag
on testmag.tm_tipork=mm_tipork
and testmag.tm_anno=mm_anno
and testmag.tm_serie=mm_serie
and testmag.tm_numdoc=mm_numdoc
      LEFT JOIN dbo.tabcage
     ON testmagd.tm_codagen = dbo.tabcage.tb_codcage
      left join commess on testmagd.tm_commeca=co_comme
  LEFT JOIN dbo.anagra
     ON co_conto = an_conto
left join artico on mm_codart=ar_codart
left join tabcfam on ar_famprod=tb_codcfam
left join tabcove on mm_controp=tb_codcove
where testmagd.tm_datdoc>='2023-01-01'
and (testmagd.tm_tipork in ('D'))
