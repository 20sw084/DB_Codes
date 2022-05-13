DECLARE
e_id emp.empno %type := 7788;
e_name emp.ename %type;
e_sal emp.sal %type;
BEGIN
SELECT ename, sal INTO e_name,
e_sal
FROM emp
WHERE empno = e_id;
dbms_output.put_line ('Employee' ||e_name || ' earns ' ||
e_sal);
END;
/ 



DECLARE
emp_rec emp %ROWTYPE ;
BEGIN
SELECT * INTO emp_rec
FROM emp
WHERE empno = :empNo ;
dbms_output.put_line ('Employee Name' ||emp_rec.ename );
dbms_output.put_line ('Employee Salary' ||emp_rec.sal );
END;
/



DECLARE 
ans INTEGER:=0;
BEGIN 
FOR i IN 1..10 LOOP
ans:=ans+i;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Ans is ' || ans);
END;



BEGIN 
<<outer_loop>>
FOR i IN 1..5 LOOP
<<inner_loop>>
FOR j IN 1..i LOOP
DBMS_OUTPUT.PUT(j);
END LOOP INNER_LOOP;
DBMS_OUTPUT.PUT_LINE(' ');
END LOOP OUTER_LOOP;
END;



BEGIN
FOR i IN 1..10 LOOP
if mod(i,2)=0
THEN
DBMS_OUTPUT.PUT_LINE(i);
END IF;
END LOOP;
END;


DECLARE 
getNum INTEGER:=0;
BEGIN
getNum:= :PLEASE_PROVIDE_A_NUMBER;
IF getNUM<5
THEN
dbms_output.put_line('SMALL NUMBER');
ELSE
dbms_output.put_line('LARGE NUMBER');
END IF;
END;



DECLARE 
ROLLNUMBER VARCHAR(7):='480WS02';
Len INTEGER:=0;
REVERSED VARCHAR(7);
BEGIN
Len:=LENGTH(ROLLNUMBER);
FOR i IN REVERSE 1..Len LOOP
REVERSED:=REVERSED || Substr(ROLLNUMBER , i, 1);
END LOOP;
DBMS_OUTPUT.PUT_LINE(REVERSED);
END;

CREATE TABLE copy AS SELECT * FROM EMP;
SELECT * FROM COPY;


DECLARE 
rows NUMBER:=0;
BEGIN
INSERT INTO copy VALUES(7780,'Rathore','INTERN',7788,sysdate,6434,0,40);
IF SQL%NOTFOUND THEN
dbms_output.put_line('NO Insertion AT ALL');
ELSIF SQL%FOUND THEN
rows:=SQL%ROWCOUNT;
END IF;
dbms_output.put_line(rows||' Employees Inserted');
END;


DECLARE 
e_id copy.empno %type;
e_name copy.ename %type;
CURSOR curse IS SELECT empno,ename FROM copy;
BEGIN
OPEN curse;
LOOP 
FETCH curse INTO e_id, e_name;
EXIT WHEN curse %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(e_id || '  ' || e_name);
END LOOP;
CLOSE curse;
END;





DECLARE
rows number; 
e_id copy.empno %type;
e_name copy.ename %type;
CURSOR curse IS SELECT empno,ename FROM copy;
BEGIN
OPEN curse;
LOOP 
FETCH curse INTO e_id, e_name;
if curse %FOUND
THEN
rows := curse %ROWCOUNT;
END IF;
EXIT WHEN curse %NOTFOUND;
DBMS_OUTPUT.PUT_LINE(e_id || '  ' || e_name);
END LOOP;
IF curse %ISOPEN THEN CLOSE curse;
END IF;
END;
