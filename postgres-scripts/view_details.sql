\dv+ view_name;

select * from pg_views where viewname='view_name_here';



Example:
vcdb=> \dv+ vpxv_alarms
                      List of relations
Schema |    Name     | Type | Owner |  Size   | Description
--------+-------------+------+-------+---------+-------------
vc     | vpxv_alarms | view | vc    | 0 bytes |
(1 row)



vcdb=> select * from pg_views where viewname='vpxv_alarms';
schemaname |  viewname   | viewowner |                                       definition
------------+-------------+-----------+-----------------------------------------------------------------------------------------
vc         | vpxv_alarms | vc        | SELECT vpx_alarm.alarm_id AS alarmid, vpx_alarm.name, vpx_alarm.enabled FROM vpx_alarm;
(1 row)
