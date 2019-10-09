accept num prompt 'entrer num de l employé '
declare

type emp is record
(
    num employees.employee_id%type ,
    firstname employees.first_name%type,
    lastname employees.last_name%type,
    salaire employees.salary%type,
    dep employees.department_id%type
);

var emp;

begin

select employee_id,first_name,last_name,salary,department_id
 into  var from employees where employee_id = &num;

DBMS_OUTPUT.PUT_LINE('id = '|| var.num);
DBMS_OUTPUT.PUT_LINE('firstname ='|| var.firstname);
DBMS_OUTPUT.PUT_LINE('lastname = '|| var.lastname);
DBMS_OUTPUT.PUT_LINE('salary = ' ||var.salaire);

exception
  when no_data_found then
    DBMS_OUTPUT.PUT_LINE('NO DATA FOUND EXCEPTION');
  when others then 
    DBMS_OUTPUT.PUT_LINE('No Exception Found .');  
end;
/