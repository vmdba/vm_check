prompt "###########  tablespaces #########################"

column "Tablespace" format a50
column "Used MB"    format 99,999,999
column "Free MB"    format 99,999,999
column "Total MB"   format 99,999,999
select fs.tablespace_name "Tablespace",(df.totalspace - fs.freespace) "Used MB",fs.freespace "Free MB",
df.totalspace  "Total MB",round(100 * (fs.freespace / df.totalspace)) "Pct. Free"
from (select tablespace_name, round(sum(bytes) / 1048576) TotalSpace from
dba_data_files group by tablespace_name) df,(select tablespace_name,
round(sum(bytes) / 1048576) FreeSpace from dba_free_space
group by tablespace_name) fs where df.tablespace_name = fs.tablespace_name;

col file_name format a60
select file_id, file_name, round(bytes/1024/1024, 2) MB, status, autoextensible, round(maxbytes/1024/1024,2)
max_mb from dba_data_files where tablespace_name in (select tablespace_name from dba_tablespaces) order by file_id;
