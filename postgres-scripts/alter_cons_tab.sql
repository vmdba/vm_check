SELECT 'alter table ' || conrelid::regclass ||  ' add constraint ' || conname ||  ' ' || pg_get_constraintdef(c.oid) || ';'   FROM  pg_constraint c JOIN pg_namespace n ON n.oid = c.connamespace;
