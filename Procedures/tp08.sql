---- creer une vue ::
create or replace procedure copy_table_to_view(nameoftable varchar2)

as 

nameofview varchar2(50);

begin

 nameofview := CONCAT('View_', nameoftable);

 dbms_output.put_line(nameofview);

--  nameofview := TRIM(BOTH '"' FROM nameofview);

create view  nameofview as (select * from nameoftable);

end copy_table_to_view;

/