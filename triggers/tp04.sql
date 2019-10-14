create or replace trigger num1 

before insert or update of notemin on prerequis

for each row 

begin

if :new.notemin != :old.notemin then 

dbms_output.put_line('ERROR !');

end if;

end;
/
------------------------------------------------------

create or replace num2 

before insert on inscription