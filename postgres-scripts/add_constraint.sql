SELECT 'alter table ' || conrelid::regclass ||  ' add constraint ' || conname ||  ' ' || pg_get_constraintdef(c.oid) || ';'
 FROM  pg_constraint c JOIN pg_namespace n ON n.oid = c.connamespace where conrelid::regclass::text = 'table_name_here';
 
 
 Example:
 SELECT 'alter table ' || conrelid::regclass ||  ' add constraint ' || conname ||  ' ' || pg_get_constraintdef(c.oid) || ';'
 FROM  pg_constraint c JOIN pg_namespace n ON n.oid = c.connamespace where conrelid::regclass::text = 'vpx_entity';

                                                        ?column?
-------------------------------------------------------------------------------------------------------------------------
alter table vpx_entity add constraint pk_vpx_entity PRIMARY KEY (id);
alter table vpx_entity add constraint fk_vpx_ent_ref_vpx_ent_type FOREIGN KEY (type_id) REFERENCES vpx_object_type(id);
alter table vpx_entity add constraint fk_vpx_enti_ref_vpx_enti FOREIGN KEY (parent_id) REFERENCES vpx_entity(id);
(3 rows)

