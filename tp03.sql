--- declaring a session variable
variable var_session char(12);
declare
--var_session employees.hire_date%type ;
-----------------
begin
-----------------
select to_char(MIN(hire_date),'yyyy/mm/dd') into :var_session from employees;
dbms_output.put_line('the old date is :' || :var_session);
-----------------
end;
/