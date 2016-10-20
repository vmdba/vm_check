SELECT pg_catalog.pg_relation_filenode(c.oid) as "Object ID", relname as "Object Name",
case WHEN relkind='r' THEN 'Table'
     when relkind='m' THEN 'Materialized View'
     when relkind='i' THEN 'Index'
     when relkind='S' THEN 'Sequence'
     when relkind='t' THEN 'Toast'
     when relkind='v' THEN 'View'
     when relkind='c' THEN 'Composite'
     when relkind='f' THEN 'Foreign_Table'
     ELSE 'other'
    end
     as "Object Type", o.rolname as "Owner"
FROM pg_catalog.pg_class c
        LEFT JOIN pg_catalog.pg_authid o ON o.oid=c.relowner
        LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
        LEFT JOIN pg_catalog.pg_database d ON d.datname = pg_catalog.current_database(),
        pg_catalog.pg_tablespace t
WHERE
  t.oid = CASE
                        WHEN reltablespace <> 0 THEN reltablespace
                        ELSE dattablespace
                END
;


##############################################
 Object ID |                Object Name                 | Object Type |  Owner
-----------+--------------------------------------------+-------------+----------
     12607 | pg_statistic                               | Table       | postgres
     12613 | pg_type                                    | Table       | postgres
     25303 | vpx_hist_stat1_84                          | Table       | vc
     23972 | cis_kv_keyvalue                            | Table       | vc
     12609 | pg_toast_2619                              | Toast       | postgres
     12611 | pg_toast_2619_index                        | Index       | postgres
     12619 | pg_authid_rolname_index                    | Index       | postgres
     12620 | pg_authid_oid_index                        | Index       | postgres
     12627 | pg_attribute_relid_attnam_index            | Index       | postgres
     12628 | pg_attribute_relid_attnum_index            | Index       | postgres
     12631 | pg_toast_1255                              | Toast       | postgres
     12633 | pg_toast_1255_index                        | Index       | postgres
     23975 | pg_toast_23972                             | Toast       | vc
     12642 | pg_toast_2604                              | Toast       | postgres
     12644 | pg_toast_2604_index                        | Index       | postgres
     12649 | pg_toast_2606                              | Toast       | postgres
     12651 | pg_toast_2606_index                        | Index       | postgres
     12652 | pg_constraint_conname_nsp_index            | Index       | postgres
     12678 | pg_am_name_index                           | Index       | postgres
     12679 | pg_am_oid_index                            | Index       | postgres
     12682 | pg_amop_fam_strat_index                    | Index       | postgres

#############################################
