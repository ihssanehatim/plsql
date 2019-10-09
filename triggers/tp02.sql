---------------Create TRIGGER-----------------
create or replace trigger employe_controle 
---controler les ajouts et les modifs de salaires ::
before insert or update on  employees

for each row 
-- ------------------DECLARE---
declare 
var_max jobs.min_salary%type;
var_min jobs.max_salary%type;
id_j jobs.job_id%type;

-- ----------
-- id jobs.job_id%type;

---------------------------
when (new.job_id != 'AD_PRES' )  ----
---------------------------
begin
--------------------------MAIN---------------------

id_j := :new.job_id;

select min_salary , max_salary into var_min,var_max from jobs where job_id = id_j;

    if :new.salary < min_salary or :new.salary > max_salary  then
     raise_application_error(-20800, 'Salary overflow');
    end if;
----------------------------------------------------
end;

/