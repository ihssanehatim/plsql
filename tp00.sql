accept value prompt 'entrer le matricule : '
declare
r1 employees%rowtype ;
begin
select * into r1 from employees where employee_id = &value;
dbms_output.put_line(r1.last_name || ' '||r1.first_name ||' ' ||r1.email || ' ' || r1.salary );
end;
/