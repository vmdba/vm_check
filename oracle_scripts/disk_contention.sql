set linesize 160 pages 120
col name format a75
col phyrds format 999,999,999
col phywrts format 999,999,999
col readtim format 999,999,999
col writetim format 9,999,999,999
ttitle "Disk Contentions"
select  name, phyrds, phywrts, readtim, writetim
from v$filestat a, v$dbfile b
where a.file#=b.file#
order by readtim desc; 
