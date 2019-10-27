create or replace procedure supprimer_employe(
    num_to_delete in employees.employee_id%type) is 

begin
        --- delete an employee ::
        delete from employees
         where employee_id = num_to_delete; 
         ---- it won't be deleted because of foreign key :: child record

end supprimer_employe;
/