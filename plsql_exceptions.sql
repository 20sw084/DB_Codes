DECLARE
total_rows number(2);
BEGIN
UPDATE c
SET sal = sal + 500;
IF SQL%NOTFOUND THEN
dbms_output.put_line('No employees selected');
ELSIF SQL%FOUND THEN
total_rows := SQL%ROWCOUNT;
dbms_output.put_line( total_rows || ' Employees selected ');
END IF;
END;
/ 

DECLARE
e_id c.empno %TYPE;
e_name c.ename %TYPE;
CURSOR emp_cur IS
SELECT empno, ename FROM c;
BEGIN
OPEN emp_cur ;
LOOP
FETCH emp_cur INTO e_id, e_name ;
EXIT WHEN emp_cur %NOTFOUND ;
DBMS_OUTPUT.PUT_LINE (e_id || ' ' || e_name);
END LOOP ;
CLOSE emp_cur ;
END; 

DECLARE
e_id emp.empno%type := 8 ;
e_name emp.ename%type ;
BEGIN
SELECT ename INTO e_name
FROM emp
WHERE empno= e_id;
DBMS_OUTPUT.PUT_LINE ('Name: '|| e_name);
EXCEPTION
WHEN no_data_found THEN
dbms_output.put_line('No such employee!');
WHEN others THEN
dbms_output.put_line('Error!');
END;
/


DECLARE
Hire_date EXCEPTION;
Emp_no NUMBER;
H_date DATE;
BEGIN
Emp_no := 7788;
-- &emp_no ;
SELECT hiredate INTO H_date FROM emp
WHERE empno = emp_no ;
IF h_date != SYSDATE THEN
RAISE hire_date ;
END IF;
EXCEPTION
WHEN hire_date THEN
DBMS_OUTPUT.PUT_LINE ('CHECK DATE') ;
END;


Write a PL/SQL code that throws the DUP_VAL_ON_INDEX and
then handles it with the help of an appropriate message.

CREATE TABLE c AS SELECT * FROM emp;
desc c;
ALTER TABLE c ADD PRIMARY KEY (empno);

BEGIN
INSERT INTO c VALUES(7782,'Musk','ANALYST',7566,null,3280,null,20);
EXCEPTION
WHEN DUP_VAL_ON_INDEX 
THEN 
DBMS_OUTPUT.PUT_LINE('ERROR! Primary Key Constraint Violation');
WHEN others THEN
dbms_output.put_line('Error!');
END;

Write a PL/SQL code that throws the TOO_MANY_ROWS and then
handles it with the help of an appropriate message.

