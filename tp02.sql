accept emp prompt 'entrer le matricule de employee:'
declare
---declarer un record ::
TYPE emp IS RECORD
( 
    id employees.employee_id%type, 
    mail employees.email%type,
    namef employees.first_name%type,
    namel employees.last_name%type
);
--declarer une var de type emp (record) ::
var1 emp;
-----------------
begin
-----------------
select employee_id , email ,first_name , last_name into var1 from employees
WHERE employee_id = &emp;
dbms_output.put_line(var1.id);
dbms_output.put_line(var1.mail);
dbms_output.put_line(var1.namef);
dbms_output.put_line(var1.namel);
-----------------
end;
/