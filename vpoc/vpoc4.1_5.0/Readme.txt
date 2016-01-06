Requirement
Run this diagnosis tool under VPX schema

Run the master script 
1) create a directory as you desired
2) copy the scripts over to the directory

EXAMPLE:
created proactive_chk with all the sql scripts inside

cd C:\proactive_chk

C:\proactive_chk>sqlplus "/as sysdba"
SQL*Plus: Release 11.2.0.1.0 Production on Tue Aug 14 13:42:39 2012
Copyright (c) 1982, 2010, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> @master.sql
Enter value for user: vpxadmin
Enter value for password: vpxadmin <please check with your administrator if you have a different password>



Once completed, please send the vpoc.diag back to support.






