DECLARE
expt EXCEPTION; 
age NUMBER:=19; 
BEGIN

-- sub-block BEGINs 
DECLARE	
		
	-- this declaration prevails 
	expt EXCEPTION; 
	age NUMBER:=22; 
	var_single employees%rowtype;
	dep departments%rowtype;
BEGIN
	-- IF age > 16 THEN
	-- 	RAISE expt; /* this is not handled*/ 
	-- END IF; 

	select * into var_single from employees; --- may return too_many_rows

	select * into dep from departments where department_id = 'ihssane';

	-- exception

	-- when too_many_rows then 
	-- 	DBMS_OUTPUT.PUT_LINE('too many rows returned');

	-- when expt then
	--   		DBMS_OUTPUT.PUT_LINE('unnamed system defined exception');

	-- when invalid_number then 
	-- 		DBMS_OUTPUT.PUT_LINE('invalid number');

	-- when no_data_found then 
	-- 	DBMS_OUTPUT.PUT_LINE('no data found named system defined exception');

	-- when OTHERS then
	-- 	 DBMS_OUTPUT.PUT_LINE('others');
 
END;		 
-- sub-block ends 

EXCEPTION 
-- Does not handle raised exception 
	-- WHEN expt THEN
	-- 	DBMS_OUTPUT.PUT_LINE('Handling expt exception.'); 

	when too_many_rows then
		DBMS_OUTPUT.PUT_LINE('too many rows returned');

	when expt then
	  		DBMS_OUTPUT.PUT_LINE('unnamed system defined exception');

	when invalid_number then 
			DBMS_OUTPUT.PUT_LINE('invalid number');

	when no_data_found then 
		DBMS_OUTPUT.PUT_LINE('no data found named system defined exception');

	when OTHERS then
		 DBMS_OUTPUT.PUT_LINE('others');
END; 
/