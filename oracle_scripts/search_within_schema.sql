undef searchme
SET SERVEROUTPUT ON SIZE 100000
    DECLARE
      match_count INTEGER;
    BEGIN
      FOR table_rec IN (select table_name, column_name  from user_tab_columns  where data_type like '%CHAR%') LOOP
        EXECUTE IMMEDIATE
          'SELECT COUNT(*) FROM ' ||  table_rec.table_name || ' WHERE '||table_rec.column_name||' like  :1'
          INTO match_count
          USING '&&searchme%';
                    IF match_count > 0 THEN
            dbms_output.put_line('&searchme found in the following tables and columns');     
            dbms_output.put_line('');
            dbms_output.put_line('Table Name      Column Name     Counts');
            dbms_output.put_line('________________________________________________');
          dbms_output.put_line( table_rec.table_name ||'    '||table_rec.column_name||'      '||match_count );
          END IF;
      END LOOP;
    END;

         /
