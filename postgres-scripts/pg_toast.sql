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
   relname like '%toast%' and o.rolname = 'vc' and
  t.oid = CASE
                        WHEN reltablespace <> 0 THEN reltablespace
                        ELSE dattablespace
                END
;



SELECT pgn.nspname, relname, pg_size_pretty(relpages::bigint * 8 * 1024) AS size, 
     CASE WHEN relkind = 't' 
     THEN (SELECT pgd.relname FROM pg_class pgd WHERE pgd.reltoastrelid = pg.oid) 
     WHEN nspname = 'pg_toast' AND relkind = 'i' 
     THEN (SELECT pgt.relname FROM pg_class pgt WHERE SUBSTRING(pgt.relname FROM 10) = REPLACE(SUBSTRING(pg.relname FROM 10), '_index', '')) 
     ELSE (SELECT pgc.relname FROM pg_class pgc WHERE pg.reltoastrelid = pgc.oid) END::varchar AS refrelname, 
     CASE WHEN nspname = 'pg_toast' AND relkind = 'i' 
     THEN (SELECT pgts.relname FROM pg_class pgts WHERE pgts.reltoastrelid = (SELECT pgt.oid FROM pg_class pgt WHERE SUBSTRING(pgt.relname FROM 10) = REPLACE(SUBSTRING(pg.relname FROM 10), '_index', ''))) END AS relidxrefrelname, relfilenode, relkind, reltuples::bigint, relpages FROM pg_class pg, pg_namespace pgn WHERE pg.relnamespace = pgn.oid AND pgn.nspname NOT IN ('information_schema', 'pg_catalog') ORDER BY relpages DESC;
