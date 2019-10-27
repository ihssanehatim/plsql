begin

-- select * into var from employees;
update employees set employee_id = employee_id + 1
	where 1 < 2 ;

dbms_output.put_line(sql%rowcount);

end;

/