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