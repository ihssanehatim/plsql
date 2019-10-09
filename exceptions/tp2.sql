accept num prompt 'entrer num de l employe'

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

var_num char(3);

ID_empty exception ;

begin

var_num := &num;

-- DBMS_OUTPUT.PUT_LINE(var_num);

if var_num is null then

    raise ID_empty;

else 

select employee_id,first_name,last_name,salary,department_id
 into  var from employees where employee_id = &num;

DBMS_OUTPUT.PUT_LINE('id = '|| var.num);
DBMS_OUTPUT.PUT_LINE('firstname = '|| var.firstname);
DBMS_OUTPUT.PUT_LINE('lastname = '|| var.lastname);
DBMS_OUTPUT.PUT_LINE('salary = ' ||var.salaire);
end if;

exception
  when ID_empty then
        DBMS_OUTPUT.PUT_LINE('Empty ID ERROR'); 
  when no_data_found then
        DBMS_OUTPUT.PUT_LINE('NO DATA FOUND EXCEPTION');
  when others then 
        DBMS_OUTPUT.PUT_LINE('An Other Exception Found .');  
end;
/
