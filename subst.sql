ACCEPT emp_no PROMPT 'entrer le numéro de l employé : '
declare
v_nom emp.ename %type;
begin
select ename into v_nom from rmp where empno=&emp_no;
dbms_output.put_line('le nom est:'||v_nom);
end;
/