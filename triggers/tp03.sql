---create table history (employee_id number(10) NOT NULL, op_date date , op_type char(10));

create or replace trigger history 

after insert or update or delete ON employees 

for each row

begin

if inserting then 

insert into history values (:new.employee_id , sysdate, 'inserting' );

elsif updating then

insert into history values (:new.employee_id , sysdate, 'updating' );

else

insert into history values (:old.employee_id , sysdate, 'deleting' );

end if ;

end;

/