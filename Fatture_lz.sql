select movmag.* from 
testmag inner join movmag
on tm_tipork=mm_tipork
and tm_anno=mm_anno
and tm_serie=mm_serie
and tm_numdoc=mm_numdoc
where tm_datdoc>='2023-01-01'
and (tm_tipork in ('A','E','N'))

union all

select movmag.* from 
testmag as testmagd inner join 
testmag on testmagd.tm_tipork=testmag.tm_tiporkfat
and testmagd.tm_anno=testmag.tm_annfat
and testmagd.tm_serie=testmag.tm_alffat 
and testmagd.tm_numdoc=testmag.tm_numfat  left join movmag
on testmag.tm_tipork=mm_tipork
and testmag.tm_anno=mm_anno
and testmag.tm_serie=mm_serie
and testmag.tm_numdoc=mm_numdoc
where testmagd.tm_datdoc>='2023-01-01'
and (testmagd.tm_tipork in ('D'))
