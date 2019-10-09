accept num_dep_lire 'give the num_dep_lire :' ;
declare
-----------------------------DECLARING CURSOR----------------------------
cursor my_cursor(numdep number) is
 select employees.department_id as dep_id,department_name as dep_name,locations.location_id as loc_id,
 city,departments.manager_id as manager,min(salary) as miin, max(salary) as maax
 from employees , departments , locations
 where employees.department_id = departments.department_id 
 and locations.location_id = departments.location_id
 group by employees.department_id,department_name,locations.location_id,city,departments.manager_id
    having count(*) =
  (select count(*) from employees where department_id = &numdep);

-------------------------------ROWTYPE VAR-------------------------------
var_row my_cursor%ROWTYPE;
----------------------------END OF DECLARATION---------------------------
begin
----------NO OPEN
for var_row in my_cursor(&num_dep_lire)
loop
    ------------NO FETCH AND NO TEST OF NOTFOUND DATA
    if var_row.dep_id != &num_dep_lire then
dbms_output.put_line('-------------------------------------------------------------------------------------------------------------');
dbms_output.put_line('DEPARTMENT ID | DEPARTMENT_NAME | LOCATION_ID |    CITY   | DEPARTMENT_MANAGER_ID | MIN SALARY | MAX SALARY  ');
dbms_output.put_line('-------------------------------------------------------------------------------------------------------------');
dbms_output.put_line(var_row.dep_id || '                   '||
 var_row.dep_name||'           ' ||var_row.loc_id ||'      '||var_row.city || '               '
 ||var_row.manager ||'          '||var_row.miin || '          '|| var_row.maax);
end if;
end loop;
-----------NO CLOSE
end;
/