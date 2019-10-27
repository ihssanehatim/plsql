
create or replace procedure print_only_proc_all_users
as 
cursor var_cursor is 
    SELECT OBJECT_NAME,OWNER FROM ALL_OBJECTS where OBJECT_TYPE = 'PROCEDURE';
begin

for var in var_cursor 
loop

 dbms_output.put_line('USER  : ' || var.OWNER || '  PROC :' || var.OBJECT_NAME);

end loop;

end print_only_proc_all_users;
/