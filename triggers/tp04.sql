create or replace trigger num1 

before insert or update of notemin on prerequis

for each row 

begin

if :new.notemin != :old.notemin then 

:new.notemin := :old.notemin ;

raise_application_error(-20000, 'ERROR !');

end if;

end;

/
/***2**/
create or replace trigger n2

before 

insert on inscription 

for each row 

declare 

var module.effecmax %type;

var1 number;

var2 module.codemod %type;

begin 

select effecmax into var from module where codemod=:new.codemod;

select codemod,count(*) into var2,var1 from inscription where codemod=:new.codemod group by codemod;

if var1=var then 

raise_application_error(-20001,'le nombre d''inscription dans ce module est depasse');

end if;

end;

/

/**3**/
create or replace trigger n3 

before 

insert on examen 

for each row

declare 

var1 integer;

var2 inscription.codemod %type;

begin 

if inserting then 

select codemod,count(*) into var2,var1 from inscription where codemod=:new.codemod;

if var1<1 then

raise_application_error(-20002,'dans ce module aucun éleve est inscrit');

end if; 

end if;

end;

/
/**4**/

create or replace trigger n4 

before

insert on resultat 

for each row

declare 

var1 date ;

var2 date;

begin 

if inserting then 

select dateexam into var1 from examen where codexam=:new.codexam;

select dateinsc into var2 from inscription where codemod=:new.codmod and num_etudiant=:new.num_etudiant;

if var2>var1 then 

raise_application_error(-20004,'la date d''inscription est superieur a la date d''examen');

end if;

end if;

end;

/
/****5***/
