create or replace trigger employe_embauche

before insert on employees

for each row

when (new.hire_date > CURRENT_DATE)

begin

-- dbms_output.put_line(CURRENT_DATE);
-- if inserting then
--     if :new.hire_dat > CURRENT_DATE then
    RAISE_APPLICATION_ERROR (-20501, 'La date d''embauche est superieur a la date systeme !'); 
    -- dbms_output.put_line('La date d''embauche est superieur a la date systeme !');
--    end if;
-- end if;

end;

/