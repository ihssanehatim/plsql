declare
---------------------------------
cursor my_cursor is 
select *
  from employees;
----------------------------------
var_row my_cursor%rowtype ;
num number(3) ;
----------------------------------
begin

open my_cursor;
--- this won't execute :p cz even if the cursor is opened it needs to be fetched first
if my_cursor%found then
    dbms_output.put_line('this is : '|| my_cursor%rowcount);
end if;
num := 1 ;
loop
  fetch my_cursor into var_row;
  exit when my_cursor%NotFound;
  dbms_output.put_line('this is the id of the employee number ' || my_cursor%rowcount || ' :'|| var_row.employee_id);
  num := num + 1;
end loop;
    dbms_output.put_line('this is the number of employees : '|| my_cursor%rowcount);
close my_cursor;
end;
/