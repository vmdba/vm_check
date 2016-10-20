
-- objects that locked up.
set lines 220
col object_name format a30
col username format a8
col machine format a9
col spid format a6
col instance format 999
col object_owner format a11
col locked_mode format a10
col logon_time format a25
SELECT b.inst_id as instance,
       b.session_id AS sid,
       s.serial#,
       NVL(b.oracle_username, '(oracle)') AS username,
       a.owner AS object_owner,
       a.object_name,
       Decode(b.locked_mode, 0, 'None',
                             1, 'Null (NULL)',
                             2, 'Row-S (SS)',
                             3, 'Row-X (SX)',
                             4, 'Share (S)',
                             5, 'S/Row-X (SSX)',
                             6, 'Exclusive (X)',
                             b.locked_mode) locked_mode,
       b.os_user_name, s.machine, s.program, p.spid, s.logon_time
FROM   dba_objects a,
       gv$locked_object b, gv$session s, gv$process  p
WHERE  a.object_id = b.object_id
and    s.sid (+)= b.session_id
and    s.inst_id (+) = b.inst_id
and    s.paddr = p.addr
and    s.inst_id = p.inst_id
ORDER BY 1, 2, 3, 4;

