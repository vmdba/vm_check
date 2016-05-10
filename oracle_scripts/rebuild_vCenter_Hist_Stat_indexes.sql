--rebuild indexes for vCenter 5.1 onwards. Does not work for 5.1 and below
--script may take some time to run as they are many indexes to be rebuild
set serveroutput on;
set feedback off;
spool rebuild.txt
declare
module_name varchar2(100);
action_name varchar2(100);
err_num NUMBER;
err_msg VARCHAR2(500);
begin
dbms_application_info.read_module(module_name, action_name);
dbms_output.put_line('script name: ' || module_name);
dbms_output.put_line('########################################################################');
for index_rec in
--test output
--(select 'alter index ' || index_name || ' rebuild online;' index_str   from user_indexes where table_name in (SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_NAME LIKE 'VPX_HIST_STAT%') and index_name not like '%PK%')
(select index_name as index_str   from user_indexes where (table_name in (SELECT OBJECT_NAME FROM USER_OBJECTS WHERE OBJECT_NAME LIKE 'VPX_HIST_STAT%') OR index_name in ( select index_name from user_indexes where index_name like 'VPX_SAMPLE_TIME%')) and index_name not like '%PK%')
loop
begin
dbms_output.put_line(index_rec.index_str);
execute immediate 'ALTER INDEX '||index_rec.index_str||' rebuild online';
exception
when others then
err_num := sqlcode;
dbms_output.put_line('Error: '||to_char(err_num)||':'||err_msg||':'||index_rec.index_str);
end;
end loop;
dbms_output.put_line('#######################################################################');
dbms_output.new_line;
end;
/
spool off;  
