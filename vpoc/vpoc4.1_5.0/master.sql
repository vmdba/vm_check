/**
Author:  Kay Liew
Program: VMware Oracle Database Proactive Checker
Purpose: master scripts of VMware Database Proactive Checker.
		 This master script will kick off the follow scripts to perform checking on vCenter Server Database.
		 Scripts will produce a set of diag files where user can send them back to Vmware Support for further diagnostic.
Changes: added vmware_pef_index.sql Aug 28, 2012		
added version check
added vpx_counter index check and creation	 
**/
conn &user/&password
set lines 200
alter session set nls_date_format = 'MM/DD/YY HH24:MI:SS';
@general_chk.sql
--@invalidobj.sql --spool out command for recompilation later on
@procedures_chk.sql
@schedulerchk.sql
@TOPN_error.sql
@statistic_setting.sql
@invalidobj.diag
@vmware_perf_index.sql
@stat_view.sql
@priv_brief.sql
@Create_VPXI_DEVICE_COUNT_IDX.sql
