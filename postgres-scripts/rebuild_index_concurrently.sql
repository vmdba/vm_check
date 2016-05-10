create index concurrently NEW_INDEX on TABLE_NAME (COLUMN NAME)
BEGIN;
DROP INDEX OLD_IND;
ALTER INDEX NEW_INDEX RENAME TO OLD_INDEX;
COMMIT;


Sample output:
Description: This works sort of a like Oracle Rebuild Index online.
