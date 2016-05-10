select relid::regclass as table, indexrelid:: regclass as index,
pg_relation_size(indexrelid::regclass) as index_size_bytes
from pg_stat_user_indexes
ORDER BY index_size_bytes desc
LIMIT 10;


Sample output: tracking down super large indexes for VACUUM-ing.


vcdb=# select relid::regclass as table, indexrelid:: regclass as index,
vcdb-# pg_relation_size(indexrelid::regclass) as index_size_bytes
vcdb-# from pg_stat_user_indexes
vcdb-# ORDER BY index_size_bytes desc
vcdb-# LIMIT 10;

     table     |          index          | index_size_bytes
---------------+-------------------------+------------------
 vpx_event_arg | pk_vpx_event_arg        |        120905728
 vpx_event_arg | vpx_event_arg_f1        |        120905728
 vpx_event_arg | vpxi_event_arg_event_id |        120905728
 vpx_event_arg | vpx_event_arg_f2        |        120905728
 vpx_event_arg | vpx_event_arg_f3        |        120905728
 vpx_event     | vpxi_event_event_type   |         63766528
 vpx_event     | vpxi_event_username     |         27369472
 vpx_event     | pk_vpx_event            |         26075136
 vpx_event     | vpxi_change_tag         |         26075136
 vpx_event     | vpx_event_f1            |         26075136
(10 rows)

