This script is use to track vCenter database Performance Statistic issues for diagnostic purposes.

To run the sql script
psql -U postgres -d vcdb -H -f vppc.sql -o test.html

Other ways to run it with either text or html.
/opt/vmware/vpostgres/current/bin/psql -U postgres -d VCDB -f vppc.sql -o vppc.diag > vppc1.diag
/opt/vmware/vpostgres/current/bin/psql -U postgres -d VCDB -H -f vppc.sql -o vppc_diag.html > vppc1_diag.html

/opt/vmware/vpostgres/current/bin/psql -U postgres -d VCDB -f vppc.sql -o vppc.diag
/opt/vmware/vpostgres/current/bin/psql -U postgres -d VCDB -H -f vppc.sql -o vppc_diag.html



Example of the report is provided.

###############################################################################

This script contains 2 pieces. When user runs it, there are output from the prompt that reminding user to looking into the storage where commonly an issue for postgresql. The second part, is the vCenter Server performance chart related data such as table counts and stats levels which typically causing overall performance and functional issues to the vCenter.

Since the script is fairly lightweight, user can run it withint he server where the postgresql reside without changing much of the postgres.conf listener and pg_hba.conf permission.
