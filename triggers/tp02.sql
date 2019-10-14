---------------Create TRIGGER-----------------
create or replace trigger employe_control_job
---controler les ajouts et les modifs de salaires ::
before insert or update on  jobs

for each row 
-- ------------------DECLARE----- ----------

---------------------------
when (new.job_title != 'President' )  ----
---------------------------
begin
--------------------------MAIN---------------------
-- id_j := :new.job_id;
----it 's forbidden to select in a trigger line :p ---MUTATION TABLE
-- select min(salary), max(salary) into var_min,var_max from jobs; --- forbidden to do it 

    if :new.salary < min_salary or :new.salary > max_salary  then
        raise_application_error(-20800, 'Salary overflow');
    end if;
---------------------------------------------------
end;
/