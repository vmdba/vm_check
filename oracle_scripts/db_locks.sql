-- db locks with session and serial
select b.inst_id, 'alter system kill session ''' || b.sid || ',' || b.serial# || ''';' 
from gv$locked_object a , gv$session b, dba_objects c where b.sid = a.session_id 
and a.object_id = c.object_id;


-- for node1 
select b.inst_id, 'alter system kill session ''' || b.sid || ',' || b.serial# || ''';' 
from gv$locked_object a , gv$session b, dba_objects c where b.sid = a.session_id 
and a.object_id = c.object_id and b.inst_id=1;

-- transaction 2PC problem
select 'execute DBMS_TRANSACTION.PURGE_LOST_DB_ENTRY(' || LOCAL_TRAN_ID || ')' from dba_2pc_pending;

-- getting sql from the db locks
select inst_id, sql_text from gv$sql where sql_id in (select sql_id from gv$locked_object a , gv$session b, 
dba_objects c where b.sid = a.session_id and a.object_id = c.object_id);


--- revised 
--- tracking sid, serial and OS pid.
select p.spid,  b.username, a.sql_text from gv$sql a, gv$session b, gv$process p
where b.sql_address = a.address AND b.paddr = p.addr
  and b.sql_hash_value= a.hash_value and b.sid = &sid and b.serial# = '&serial';


-- revised- use when necessar - results can be cluttered. 
-- getting sid and serial and sql. compare with db locks sql and analyze if killing is necessary.

set lines 190
select b.sid, b.serial#,d.sql_text
from gv$locked_object a , gv$session b, dba_objects c, 
gv$sql d where b.sid = a.session_id 
and a.object_id = c.object_id and d.sql_id=b.sql_id;

