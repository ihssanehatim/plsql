accept dep prompt 'le numero de departement : ';

declare
excep EXCEPTION;
pragma exception_init(excep,-2292);
dep_num departments.department_id%type := &dep;

begin

delete from departments where department_id = dep_num;

commit;

exception
when excep then 
dbms_output.put_line('Impossible de supprimer le dep : ' 
||to_char(dep_num) || ' il y a encore des employees qui sont affectes a ce dep');


end;
/