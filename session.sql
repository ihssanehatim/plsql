declare
h number(3):=300;
begin
:g_compteur:=1;
h:= :g_compteur+200;
dbms_output.put_line(h);
end;
/