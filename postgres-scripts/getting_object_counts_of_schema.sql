/set user xxx
select count(*) from pg_class C left join pg_namespace N on (N.oid = C.relnamespace) where nspname = :'user';



vcdb=# select count(*) from pg_class C left join pg_namespace N on (N.oid = C.relnamespace) where nspname ='vpx';
 count
-------
  2471
(1 row)

