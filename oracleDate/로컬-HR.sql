-- hr resource 에 있는 테이블 정보(이 프로젝트 클래스 종류를 보여주세요)
select * from tab;
-- employees 테이블 구조
desc employees;
-- employees 속에 들어있는 레코드(객체들을)를 보여주세요.
SELECT * FROM employees;
-- departments 테이블 객체(레코드-인스턴스)를 확인
select * from departments;
-- departments의 구조를 보여줘~
desc departments;
--department_id, department_name 만 보여줘
select department_id, department_name from departments;
--필드명 별칭 사용하기
select department_id as "부서번호", department_name as "부서명" from departments;
select department_id as DEPT_NO, department_name as DEPT_NAME from departments;
select department_id as "DEPT_NO", department_name as "DEPT_NAME" from departments;
-- + ||
select '5' + 5 from dual;
select * from dual;
select '5' || 5 from dual;
-- 문자열 기능을 이용해서 필드명을 보여주기
select first_name, job_id from employees;
select first_name || '의 직급은' || job_id ||'입니다' as data from employees;
-- 중복되지 않게 보여주기 distinct
select distinct job_id from employees;
--연봉을 3000 이상 받는 사람의 정보
select * from employees where salary >= 3000;
desc employees;
-- 2008년 이후에 입사한 직원 조사
select * from employees where hire_date >= '2008/01/01';
select * from employees where TO_CHAR(hire_date,'YYYY/MM/DD') >= '2008/01/01';
select * from employees where hire_date >= TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:ss');
-- AND , BETWEEN a AND B
SELECT * FROM EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 3000;
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 3000;
-- OR,IN( , )직원번호가 67이거나 101이거나 184인 사원
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 67 OR EMPLOYEE_ID = 101 OR EMPLOYEE_ID = 184; 
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(67,101,184);
-- NULL 연산, 비교, 할당이 안된다.
SELECT 100 + NULL FROM DUAL;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(67,101,184);
desc employees;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
SELECT * FROM EMPLOYEES;

