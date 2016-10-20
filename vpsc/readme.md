A script similar to VPOC but for SQL Server. 

Use at your own risk. Depending on the security of the sql server (OS authentication or mixed), user may need to tweak this to make it to work. Go figure out :)

Instruction
SQLCMD -i d:\vpsc.sql -o d:\vpsc.diag
-assuming script stores in d drive.
