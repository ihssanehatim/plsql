-------recuperer le nombre d employes par departement ::
create or replace procedure dep_nbremp( dep in employees.department_id%type,
                                        outnbremp out number
                                        )
is 
begin

 select count(*) into outnbremp from employees where department_id = dep;

end;
/

-----------------SQL*PLUS console ::----------------
sql>variable nombre number;
sql>execute dep_nbremp(50,:nombre);
sql>print nombre;