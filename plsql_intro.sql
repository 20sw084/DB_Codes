Syntax:
declare
BEGIN
NULL;
END;


declare
BEGIN
DBMS_OUTPUT.PUT_LINE('I Love Pakistan');
END;

declare
message varchar2(20):='I Love Pakistan';
BEGIN
DBMS_OUTPUT.PUT_LINE(message);
END;

-- IF FROM SQL Command Line
declare
message varchar2(20):='I Love Pakistan';
-- I am a Single Line Comment 
/*
I am a MULTI Line Comment 
*/
BEGIN
DBMS_OUTPUT.PUT_LINE(message);
END;
/

declare
intt int:=90;
Marks Number:= 95;
Desimal Decimal:=9.21;
Dessimal Real:=9.21;
Desssimal Float:=9.21;
charr Char(1):='A';
charrr varChar(5):='kdsaA';
charrrr varChar2(2):='A';
charrrrr nvarChar2(1):='A';
counter binary_integer := 0;
greetings varchar2(20) DEFAULT 'Have a Good Day'; 
BEGIN
DBMS_OUTPUT.PUT_LINE(marks);
DBMS_OUTPUT.PUT_LINE(Desimal);
DBMS_OUTPUT.PUT_LINE(Dessimal);
DBMS_OUTPUT.PUT_LINE(Desssimal);
DBMS_OUTPUT.PUT_LINE(charr);
DBMS_OUTPUT.PUT_LINE(charrr);
DBMS_OUTPUT.PUT_LINE(charrrr);
DBMS_OUTPUT.PUT_LINE(charrrrr);
DBMS_OUTPUT.PUT_LINE(counter);
DBMS_OUTPUT.PUT_LINE(greetings);
intt:=intt+marks;
DBMS_OUTPUT.PUT_LINE('VAR'||intt);
END;
/


GLOBAL AND LOCAL VARIABLES
DECLARE
-- Global variables
num1 number := 95;
num2 number := 85;
BEGIN
dbms_output.put_line('Outer Variable num1: ' || num1);
dbms_output.put_line('Outer Variable num2: ' || num2);
DECLARE
-- Local variables
num1 number := 195;
num2 number := 185;
BEGIN
dbms_output.put_line('Inner Variable num1: ' || num1);
dbms_output.put_line('Inner Variable num2: ' || num2);
END;
END;
/

SELECT IN PL/SQL
DECLARE
Bonus INTEGER ;
BEGIN
SELECT sal*0.01 INTO bonus
FROM emp
WHERE empno = 7788 ;
DBMS_OUTPUT.PUT_LINE (bonus) ;
END;

REFERENCE TYPE VARIABLES
DECLARE
e_id emp.empno %type := 7788;
e_name emp.ename %type;
e_sal emp.sal %type;
BEGIN
SELECT ename, sal INTO e_name,
e_sal
FROM emp
WHERE empno = e_id;
dbms_output.put_line ('Employee' ||e_name || ' earns ' ||e_sal);
END; 

REFERENCE TYPE VARIABLE
DECLARE
emp_rec emp %ROWTYPE ;
BEGIN
SELECT * INTO emp_rec
FROM emp
WHERE empno = &EmployeeNo ;
dbms_output.put_line ('Employee Name' ||emp_rec.ename );
dbms_output.put_line ('Employee Salary' ||emp_rec.sal );
END;
/


Control Structures
DECLARE
v_num NUMBER ;
BEGIN
v_num := &Enter_Number;
IF v_num = 1 THEN
DBMS_OUTPUT.PUT_LINE ('WELCOME');
END IF;
END ;
/

DECLARE
v_num NUMBER ;
BEGIN
v_num := &Enter_number;
IF v_num = 1 THEN
DBMS_OUTPUT.PUT_LINE('WELCOME');
ELSE
DBMS_OUTPUT.PUT_LINE ('BYE');
END IF;
END ;
/

FOR LOOP
BEGIN
FOR i IN 1 ..10 LOOP
DBMS_Output.PUT_LINE(i);
END LOOP;
END;

FOR REVERSE LOOP
BEGIN
FOR i IN REVERSE 1 ..10 LOOP
DBMS_Output.PUT_LINE(i);
END LOOP;
END;


DECLARE
i number(1);
j number(1);
BEGIN
<< outer_loop >>
FOR i IN 1..3 LOOP
<< inner_loop >>
FOR j IN 1..3 LOOP
dbms_output.put_line('i is: '|| i || ' and j is: ' || j);
END loop inner_loop;
END loop outer_loop;
END ;


declare 
 x number := 0; 
begin 
for x in 1..10 loop 
if mod(x,2)=0 then 
dbms_output.put_line ( x); 
end if; 
 
end loop; 
end; 

Write a PL/SQL code that takes a digit between 1 to 9 as input from user
and if the digit is < 5 then displays it’s a small number otherwise displays
that it is a large number(make use of loop labels and loop control
statements).


DECLARE 
i number(1);
j number(1);
BEGIN
<< outer_loop >>
FOR i IN 1..10 LOOP
<< inner_loop >>
FOR j IN 1..i LOOP
dbms_output.put(j);
END loop inner_loop;
dbms_output.put_line(j);
END loop outer_loop;
END ;


DECLARE
	-- declare variable str , len
	-- and str1 of datatype varchar
	str VARCHAR(20) := 'skeegrofskeeg';
	len NUMBER;
	str1 VARCHAR(20);
BEGIN
	-- Here we find the length of string
	len := Length(str);

	-- here we starting a loop from max len to 1
	FOR i IN REVERSE 1.. len LOOP
		-- assigning the reverse string in str1			
		str1 := str1
				|| Substr(str, i, 1);
	END LOOP;

	dbms_output.Put_line('Reverse of string is '
						|| str1);
END;
-- Program End
