--view 생성하기 (테이블 생성 복사하기 똑같음)
drop view view_EMP02;
create table emp_copy
as 
select * from employees;

create view VIEW_EMP02
as 
select employee_id, first_name, last_name, email, hire_date, job_id from EMP_COPY 
where department_id = 10;

select * from VIEW_EMP02;
insert into VIEW_EMP02 VALUES(1000,'DONG_JIN','KIM','RLAEOGUS@NATE.COM',
TO_DATE('2020/01/01','yyyy/mm/dd'),'IT_DEV');

DESC EMP_COPY;

select * from view_emp02;

select * from emp_copy where employee_id = 1000;

--view 생성하기

create view VIEW_EMP03
as 
select employee_id, first_name, last_name, email, hire_date, job_id from EMP_COPY;

select * from view_emp03 where employee_id = 2000;

insert into VIEW_EMP03 VALUES(2000,'DONG_JIN','KIM','RLAEOGUS@NATE.COM',
TO_DATE('2020/01/01','yyyy/mm/dd'),'IT_DEV');

select * from emp_copy where employee_id = 2000;

-- 가상뷰에서 삭제를 진행하기
delete from view_emp03 where employee_id = 2000;

-- 복합뷰 생성하기 (employees, departments) 두 개의 테이블에서 조인해서 새로운 가상 테이블 만들기
create view VIEW_EMP_DEP
as
select employee_id, first_name, salary, E.department_id,department_name, location_id
from employees E inner join departments D on E.department_id = D.department_id
order by E.department_id desc;
select * from view_emp_dep;
select distinct department_id, department_name from view_emp_dep;

--부서명 it 연봉 평균, 최고값, 최저값을 구해주세요.
select department_name, max(salary),min(salary) from view_emp_dep where department_name = 'IT' group by department_name;

-- view force
create or replace force view view_force
as 
select employee_id, first_name, last_name, department_id from emp20;
drop table emp20;
select * from emp20;

-- ROWNUM (번호 붙이기)
select * from employees;
select rownum,employee_id,department_id, first_name from employees where department_id = 100
order by first_name desc; 
select rownum,employee_id,department_id, first_name from employees where department_id = 100;

-- ROWNUM 정렬하면 순서가 흐트러진것을 다시 순서적으로 보여주고 싶을떄
select rownum,employee_id, first_name, hire_date from employees order by hire_date desc;

create or replace view VIEW_HIREDATE
as 
select employee_id, first_name, hire_date from employees order by hire_date desc;
select rownum,employee_id, first_name, hire_date from VIEW_HIREDATE;

select rownum,employee_id, first_name, hire_date from VIEW_HIREDATE where rownum = 4;

select rownum,employee_id, first_name, hire_date from 
(select employee_id, first_name, hire_date from employees order by hire_date desc)
where rownum <= 4;