
create or replace procedure print_objects
as 
cursor var_cursor is 
    SELECT OBJECT_NAME FROM USER_OBJECTS;
begin

for var in var_cursor 
loop

 dbms_output.put_line('Object : ' || var.OBJECT_NAME);

end loop;

end print_objects;
/