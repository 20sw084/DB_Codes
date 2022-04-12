SELECT * FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno=20);

Select * FROM emp WHERE sal IN (SELECT max(sal) FROM emp GROUP BY deptno);


SELECT ename, sal FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');


SELECT * FROM emp WHERE sal=(SELECT MAX(sal) FROM emp);

SELECT *
FROM emp
WHERE hiredate <
    (SELECT max(hiredate)
     FROM emp
     WHERE mgr IN
         (SELECT empno
          FROM emp
          WHERE ename = 'KING'));


SELECT sal*12 FROM emp WHERE sal < ALL(SELECT sal FROM emp Where deptno IN (20,30));


SELECT * FROM emp;


SELECT ename, sal FROM emp WHERE sal > (SELECT MIN(sal) FROM (SELECT avg(sal) sal FROM emp GROUP BY deptno) );
