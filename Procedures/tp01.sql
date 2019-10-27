create or replace procedure comm_employe(
  num in employees.employee_id%type , tauxcomm in decimal) 
  as 
  ---- when we need to declare a variable we must use 'as' ;;
  ---  we use 'is' if no declaration needed !
  variable employees.commission_pct%type;
begin

    select commission_pct
      into variable
      from employees
     where employee_id = num;

    if to_number(variable,'99999') = 0 then 
            dbms_output.put_line('Commission est nulle !');
    else
            dbms_output.put_line('Commission = ' || to_char(variable));
            
            update employees set commission_pct = to_char (to_number(variable,'99999') * (1.00 + tauxcomm)) 
            where employee_id = num;
            commit ;
----------after updating :::
                select commission_pct
                into variable
                        from employees
                where employee_id = num;

            dbms_output.put_line('Commission = ' || to_char(variable));

    end if;

exception

  when no_data_found then

        dbms_output.put_line('No employee Found !') ;

   when others then 
        
        dbms_output.put_line('Other exceptions Found !');

end comm_employe;
/