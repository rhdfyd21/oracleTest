-- 순위 함수 RANK(), DENSE_RANK(), ROWNUM
-- ROWNUM으로 구하는 순위 (ROWNUM은 공동 순위를 만들수 없다.)- 게시판, 공지사항,자료실.. 등등에서 쓰인다
DROP TABLE EMP02;
create table EMP02 
AS
SELECT * FROM EMPLOYEES where 1=1;

select * from emp02;

select rownum, first_name, salary from employees order by salary desc; -- select를먼저 찾아서 순서가 꼬임
select ROWNUM, first_name, salary from (select first_name, salary from employees order by salary desc);

--공동 순위를 구하는 방법 (RANK(),DENSE_RANK())

select RANK()OVER(ORDER BY SALARY DESC) AS RANK, FIRST_NAME,SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

select ROWNUM, RANK()OVER(ORDER BY SALARY DESC) AS RANK, FIRST_NAME,SALARY 
FROM (select FIRST_NAME,salary from EMPLOYEES ORDER BY SALARY DESC) order by salary desc;

select ROWNUM, DENSE_RANK()OVER(ORDER BY SALARY DESC) AS DENSE_RANK, FIRST_NAME,SALARY 
FROM (select FIRST_NAME,salary from EMPLOYEES ORDER BY SALARY DESC) order by salary desc;

select ROWNUM,RANK()OVER(ORDER BY SALARY DESC) AS RANK, DENSE_RANK()OVER(ORDER BY SALARY DESC) AS DENSE_RANK, FIRST_NAME,SALARY 
FROM (select FIRST_NAME,salary from EMPLOYEES ORDER BY SALARY DESC) order by salary desc;

-- 중복 순위를 없애기
SELECT RANK() OVER(ORDER BY SALARY DESC,COMMISTION_PCT DESC) AS RANK  
, FIRST_NAME, SALARY ,COMMISTION_PCT from employess ORDER BY SALARY DESC;

-- 부서별 순위 구하기
SELECT DEPARTMENT_ID, 
       RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC, COMMISSION_PCT DESC,DEPARTMENT_ID DESC) AS RANK,
       FIRST_NAME, 
       SALARY, 
       COMMISSION_PCT
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC, COMMISSION_PCT DESC;

-- ROWNUM 규칙 중요(조심)
-- 2 PAGE 구하기
-- start := ((num_page_no-1) * num_page_size) + 1 # 출력 페이지 시작행 ex.11
-- end := (num_page_no * num_page_size)      # 출력 페이지 마지막 행 ex.20

select rownum , E.* from employees E where rownum between 11 and 20;
select rownum, E.* FROM EMPLOYEES E;
-- 순위 구하는 방법 (비추)
select RNUM, FIRST_NAME,SALARY, DEPARTMENT_ID from (select rownum as RNUM, E.* FROM EMPLOYEES E)
where RNUM BETWEEN 11 AND 20;

-- 순위 구하는 법 (강추)
select RNUM, FIRST_NAME,SALARY, DEPARTMENT_ID from 
(select rownum as RNUM, E.* FROM EMPLOYEES E where ROWNUM <= 110 )
where RNUM >=100;