
SELECT tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name,  
ccu.column_name AS foreign_column_name fROM information_schema.table_constraints AS tc JOIN 
information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name  JOIN 
information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name
WHERE constraint_type = 'FOREIGN KEY'  and tc.constraint_name='FK_SYMTOM_RKATTRIBUTE';

Sample output:
Description: I didn't come up with this script. Forgotten where I got it from. This works like ORacle DBA_CONSTRAINTS join DBA_CONS_COLUMNS.

vcdb=# SELECT tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name,  
ccu.column_name AS foreign_column_name fROM information_schema.table_constraints AS tc JOIN 
information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name  JOIN 
information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE 
constraint_type = 'FOREIGN KEY'  and tc.constraint_name LIKE '%vpx_event%';

       constraint_name       |  table_name   |     column_name      | foreign_table_name | foreign_column_name
-----------------------------+---------------+----------------------+--------------------+---------------------
 fk_vpx_event_arg_ref_event  | vpx_event_arg | event_id             | vpx_event          | event_id
 fk_vpx_event_arg_ref_entity | vpx_event_arg | obj_type             | vpx_object_type    | id
 fk_vpx_event_ref_computeres | vpx_event     | computeresource_type | vpx_object_type    | id
(3 rows)

