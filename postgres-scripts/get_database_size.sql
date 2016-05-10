select datname, pg_database_size(datname)/1024/1024 as size_in_Megabytes  from pg_database order by 2 desc;

Sample output:

vcdb=# select datname, pg_database_size(datname)/1024/1024 as size_in_Megabytes  from pg_database order by 2 desc;
  datname  | size_in_megabytes
-----------+-------------------
 vcdb      |              3481
 template1 |                 6
 template0 |                 6
 postgres  |                 6
(4 rows)

