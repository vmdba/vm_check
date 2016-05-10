select pid , usename, application_name, client_addr, client_hostname, query, state from pg_stat_activity where pid <> pg_backend_pid();

select pid , usename, application_name, client_addr, client_hostname, query, state from pg_stat_activity where pid = ##### ;

select  pid , usename, application_name, client_addr,  client_hostname, query, state from pg_stat_activity where datname='postgres';

select bl.pid as blocked_pid, a.usename as blocked_user,
ka.query as blocking_statement,
now() - ka.query_start as blocking_duration,
kl.pid as blocking_pid,
ka.usename as blocking_user,
a.query as blocked_statement,
now() - a.query_start as blocked_duration
from pg_catalog.pg_locks bl
join pg_catalog.pg_stat_activity a ON a.pid=bl.pid
join pg_catalog.pg_locks kl on kl.transactionid = bl.transactionid and kl.pid != bl.pid
join pg_catalog.pg_stat_activity ka on ka.pid=kl.pid
where not bl.granted;
