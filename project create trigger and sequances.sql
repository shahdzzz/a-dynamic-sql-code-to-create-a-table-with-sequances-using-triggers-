declare
    curr_mx number;
    seq_name varchar2 (30);
    trigger_name varchar2 (30);
    V_SQL VARCHAR2(4000);
    T_SQL VARCHAR2(4000);
    
cursor seq_cursor is
    select * from user_sequences;

    
    cursor table_cursor is 
     select ucc.table_name
                         , ucc.column_name
                  from user_constraints uc
                       join user_cons_columns ucc
                           on ucc.table_name = uc.table_name
                          and ucc.constraint_name = uc.constraint_name
                       join user_tab_columns utc
                          on utc.table_name = ucc.table_name
                          and utc.column_name = ucc.column_name
                  where uc.constraint_type = 'P' 
                  and   utc.data_type = 'NUMBER' ;
begin   
for seq_record in seq_cursor loop
        V_SQL := 'DROP SEQUENCE '||seq_record.sequence_name;

        EXECUTE IMMEDIATE V_SQL;
                   
        end loop;           
     for table_record in table_cursor loop
        execute immediate 'select (max ('|| table_record.column_name ||')+1) from ' ||table_record.table_name 
            into curr_mx;

        IF curr_mx is null THEN
            curr_mx := 0;
        END IF;

     

        /* check length of sequence name, 30 is max */
        IF length(table_record.table_name ||'_'|| table_record.column_name || '_SEQ') > 30 THEN

            IF length(table_record.column_name || '_SEQ') > 30 THEN

                seq_name :=  '_PKA_SEQ';

            ELSE

                seq_name := table_record.column_name || '_SEQ';

            END IF;  

        ELSE

            seq_name := table_record.table_name ||'_'|| table_record.column_name || '_SEQ';

        END IF;
        IF length(table_record.table_name || '_PKA_T') > 30 THEN

            trigger_name :=  '_PKA_T'; 

        ELSE

            trigger_name := table_record.table_name || '_PKA_T';

        END IF; 
               
         execute immediate 'CREATE SEQUENCE "' || seq_name || '"'
          ||' START WITH ' || to_char (curr_mx + 1) ;
          
        dbms_output.put_line('/');
        
        T_SQL:= 'CREATE OR REPLACE TRIGGER "' || trigger_name || '"' 
          || ' BEFORE INSERT ON "' || table_record.table_name || '"' 
          || ' FOR EACH ROW '
          || ' BEGIN '
          || ' :new."' || table_record.column_name || '" := "' || seq_name || '".nextval;'
          || ' END;';
          dbms_output.put_line('/');
        
        execute immediate T_SQL;
        
    end loop;
end;

insert into locations ( STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID)
values('aaaaaaaaaaaaa',0000,'aaa','aaaa','IT');




