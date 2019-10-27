
create or replace procedure print_n_users
(n in number , dep in employees.department_id%type)
as 
-------SELECT N FIRST EMPLOYEES----
cursor var_cursor is
    select * from employees where department_id = dep 
    and rownum <= n ;
    ---------- if we wanna print them by hire_date order we must do ::
    -- select * from employees where department_id = dep 
    -- and rownum <= n 
    -- order by hire_date;
num number(4);    

begin

dbms_output.put_line('First NAME    |     LAST NAME     |    Department ID      |      HIRE_DATE     |       SALARY     |' );

for var in var_cursor 

loop

 dbms_output.put_line(var.FIRST_NAME||'  |   '|| var.Last_NAME || '     |      ' || var.department_id || '  |       ' || var.hire_date || '     |   ' || var.salary );

end loop;

end print_n_users;
/