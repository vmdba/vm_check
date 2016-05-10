select relname as TABLE_NAME,reltuples AS ROW_NUMBERS FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema') and relname ='table_name_here' AND relkind='r'
ORDER BY reltuples DESC;


select relname as TABLE_NAME,reltuples AS ROW_NUMBERS FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema') and relname ='vpx_event_arg' AND relkind='r'
ORDER BY reltuples DESC;

  table_name   | row_numbers
---------------+-------------
 vpx_event_arg | 5.38186e+06
(1 row)
