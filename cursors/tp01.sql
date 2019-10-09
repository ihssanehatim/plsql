declare
-----------------------------DECLARING CURSOR----------------------------
cursor my_cursor is
 select employees.department_id as dep_id,department_name as dep_name,locations.location_id as loc_id,
 city,departments.manager_id as manager,min(salary) as miin, max(salary) as maax
 from employees , departments , locations
 where employees.department_id = departments.department_id 
 and locations.location_id = departments.location_id
 group by employees.department_id,department_name,locations.location_id,city,departments.manager_id
    having count(*) =
  (select count(*) from employees where department_id = 30);

-------------------------------ROWTYPE VAR-------------------------------
var_row my_cursor%ROWTYPE;
----------------------------END OF DECLARATION---------------------------
begin

OPEN my_cursor;

fetch my_cursor into var_row;

loop
    exit when my_cursor%notfound;
    if var_row.dep_id != 30 then
dbms_output.put_line('-------------------------------------------------------------------------------------------------------------');
dbms_output.put_line('DEPARTMENT ID | DEPARTMENT_NAME | LOCATION_ID |    CITY   | DEPARTMENT_MANAGER_ID | MIN SALARY | MAX SALARY  ');
dbms_output.put_line('-------------------------------------------------------------------------------------------------------------');
dbms_output.put_line(var_row.dep_id || '                   '||
 var_row.dep_name||'           ' ||var_row.loc_id ||'      '||var_row.city || '               '
 ||var_row.manager ||'          '||var_row.miin || '          '|| var_row.maax);
end if;
fetch my_cursor into var_row;
end loop;

CLOSE my_cursor ;
end;
/