/**
1.0: Initial - Track topns errors tracking. Aug15,2012. kliew

**/

spool vpoc.diag append
set serveroutput on
declare
err_cnt number;
descripted vpx_topn_error_log.description%type;

begin

select count(1)  into err_cnt 
from vpx_topn_error_log where event_type != 'I' and rownum < 2;

if ( err_cnt > 0 ) then
dbms_output.put_line ('There is an indication that TOPN has some issue. Please check vpx_topn_error_log');
dbms_output.new_line;


--one row is enough is error most likely the same
execute immediate 'select description from vpx_topn_error_log where event_type != ''I'' and rownum < 2'
into descripted;
dbms_output.put_line ('Example of errors :  ' ||  descripted);


end if;
end;
/
spool off;
