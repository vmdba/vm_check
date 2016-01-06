/**
1.0: Initial - tracking schema's priv. Aug12, 2012. kliew
1.1: comestic. Aug30, 2012. kliew

**/
set serveroutput on;
set feedback off;
spool vpoc.diag append
alter session set nls_date_format = 'MM/DD/YY HH24:MI:SS';
declare 
module_name varchar2(100);
action_name varchar2(100);
cursor c_priv is
 select privilege from session_privs;
v_priv c_priv%ROWTYPE;

begin 
dbms_application_info.read_module(module_name, action_name);
dbms_output.put_line('script name: ' || module_name);
dbms_output.put_line('########################################################################');
dbms_output.put_line(sys_context('USERENV', 'CURRENT_SCHEMA') || ' has the following priv ');
open c_priv;
loop
fetch c_priv into v_priv;
exit when c_priv%NOTFOUND;
dbms_output.put_line(v_priv.privilege );
end loop;
exception
when no_data_found
then 
 dbms_output.put_line ('Jobs not setup for ' || sys_context('USERENV', 'CURRENT_SCHEMA'));
CLOSE c_priv;
end;
/
spool off


