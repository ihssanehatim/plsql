
create or replace procedure print_only_proc
as 
cursor var_cursor is 
    SELECT OBJECT_NAME FROM USER_OBJECTS where OBJECT_TYPE = 'PROCEDURE';
begin

for var in var_cursor 
loop

 dbms_output.put_line('PROC  : ' || var.OBJECT_NAME);

end loop;

end print_only_proc;
/