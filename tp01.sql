accept emp prompt 'entrer le matricule de employee:'
accept salaire prompt 'entrer le nouveau salaire : '
accept email prompt 'entrer le nouveau email :'
declare
---employe employees%rowtype;
begin
if &salaire > 5000 then
    update employees set employees.email = '&email' , employees.salary = '&salaire' where employees.employee_id = &emp;
    --commit;
else
    dbms_output.put_line('salary must be greater than 5000');
end if;
end;
/