/**
Author:kliew
description: check if MV index exists, if not create it and notify vmware dba.
Date: 6/6/03

**/
SET serveroutput ON

spool vpoc.diag append
DECLARE
   already_exists EXCEPTION;
   PRAGMA EXCEPTION_INIT( already_exists, -955 );
 BEGIN
   EXECUTE IMMEDIATE 'create index VPXI_DEVICE_COUNT_IDX on VPXV_DEVICE_COUNTER(entity_id, device_name, stat_id)';
   dbms_output.put_line ('VPXI_DEVICE_COUNT_IDX has been created successfully');
 EXCEPTION
   WHEN already_exists THEN
   dbms_output.put_line ('VPXI_DEVICE_COUNT_IDX index already exist, no action required');
     NULL;
 END;
 /
 
 spool off;