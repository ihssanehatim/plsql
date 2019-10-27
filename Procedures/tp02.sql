
create or replace procedure afficher_proc
as 
cursor var_cursor is 
(
    SELECT * FROM USER_SOURCE
    WHERE  NAME= 'SUPPRIMER_EMPLOYE'
    AND TYPE='PROCEDURE'
);
begin

for var in var_cursor 
loop

 dbms_output.put_line('LINE ' || var.line|| ' '|| var.text);

end loop;

end afficher_proc;
/