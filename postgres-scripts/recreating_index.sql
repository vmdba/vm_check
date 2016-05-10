select pg_get_indexdef(indexrelid) from pg_index where indrelid::regclass::text = 'table_name_here';



Sample output:

vcdb=# select indexrelid::regclass::text , indrelid::regclass, indisvalid, indisready from pg_index where indexrelid::regclass::text = 'pk_vpx_entity';
  indexrelid   |  indrelid  | indisvalid | indisready
---------------+------------+------------+------------
 pk_vpx_entity | vpx_entity | t          | t
(1 row)


vcdb=> select pg_get_indexdef(indexrelid) from pg_index where indrelid::regclass::text = 'vpx_entity';
                           pg_get_indexdef
----------------------------------------------------------------------
CREATE UNIQUE INDEX pk_vpx_entity ON vpx_entity USING btree (id)
CREATE INDEX vpx_entity_f1 ON vpx_entity USING btree (parent_id)
CREATE INDEX vpxi_entity_type_id ON vpx_entity USING btree (type_id)
(3 rows)
