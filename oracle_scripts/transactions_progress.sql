set pages 9999 lines 200
col sess_id for a15
col message for a80
col pct_comp for 999999999
select  inst_id|| ':' || sid || ',' || serial# sess_id, sofar, totalwork, 100-round(( 1-(sofar/totalwork))* 100) pct_comp, message from gv$session_longops where sofar < totalwork;
