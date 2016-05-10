select sum(pg_database_size(datname))/1024/1024/1024 as size_in_gig from pg_database;


Sample output:

vcdb=# select sum(pg_database_size(datname))/1024/1024/1024 as size_in_gig from pg_database;
    size_in_gig
--------------------
 3.4185364171862602
(1 row)
