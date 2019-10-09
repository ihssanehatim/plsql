
create or replace trigger employe_insert 

before insert on  employees

for each row 

when (NEW.salary < 5000)

begin

if inserting then 

:new.salary := 5000;
dbms_output.put_line('old salary : '|| :old.salary);
end if;

end;

/