-- susan 부서 아이디 보기
select department_id from employees where first_name = 'susan';

-- 부서 테이블에서 40번 부서명을 조회
select department_name from departments where department_id = 40;

-- susan 소속되어 있는 부서명을 검색하시오.
select * from employees where first_name = 'susan';
select * from departments where department_id = 40;

select E.first_name, D.department_name from departments D inner join employees E on D.department_id = E.department_id
where upper(first_name) = upper('susan');

-- 단일행은 비교,크기, 연산이 가능하다.
-- 다중행은 비교,크기,연산 불가능하다.(in,any,all,exists)
select department_id from employees where first_name = 'Susan';
select * from departments where department_id = 
(select department_id from employees where first_name = 'Susan');

-- employees 테이블 에서 lex와 같은 부서에(10번부서) 있는 모든 사원의 이름과
-- 입사일자(형식: 1981-11-17)를 출력하는 select문을 작성하시오

select * from employees where department_id = 10;
select department_id from employees where first_name = 'Lex';
select department_id from employees where first_name = 'Lex';
select frist_name,to_char( hire_date,'yyyy-mm-dd') from employees where department_id=
(select department_id from employees where first_name = 'Lex');

select * from employees where manager_id = 100;
where manager_id = (select employee_id from employees where manager_id is null);
--상사가 null인 사람은 ceo
select employee_id from employees where manager_id is null;

--고용테이블에서 전체 연봉 평균
select round(Avg(salary)) as salary from employees;
--전체 평균연봉보다 높은 직원 정보 출력
select * from employees where salary > (select round(Avg(salary)) as salary from employees);
-- 다중행이면 비교 가능할가
select * from employees where EXISTS (select round(Avg(salary)) as salary from employees group by department_id);
select * from employees where 1 = 0;
-- 복사할때 쓰는것
create table imsiTBL
as
select * from employees where 1 = 0;

select * from imsiTBL;
drop table imsiTBL;
--제약 조건 not null만 복사
select * from user_constraints where table_name = upper('imsiTBL');

--월급 13000 이상인 사람의 부서를 보여주시오

select distinct department_id from employees where salary >= 13000;

select * from employees where department_id in (90,80,20);

select * from employees where department_id in 
(select distinct department_id from employees where salary >= 13000);

-- EMPLOYEES 테이블에서 Susan 또는 Lex 월급
select first_name, salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex'); 

-- EMPLOYEES 테이블에서 Susan 또는 Lex와 월급이 같은 직원의 이름, 업무 , 급여를 출력(Susan, lex는 제외)
select * from employees where salary in (17000,6500) and first_name <> 'Susan' and first_name <> 'Lex'; --susan을 빼기 <>
select * from employees where salary in (17000,6500) and first_name not in ('Susan','Lex');
select * from employees where salary in
(select salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex'))
and first_name <> 'Susan' and first_name <> 'Lex';

-- 한명 이상으로부터 보고를 받는다 = 나는 매니저로 등록되어있다. null = ceo
select distinct manager_id from employees where manager_id is not null or manager_id is null;
-- order by
select distinct manager_id from employees where manager_id is not null or manager_id is null order by manager_id desc;
select distinct manager_id as "상사" from employees;
-- 한명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 아룸, 업무 ,부서번호를 출력
select employee_id, first_name, job_id, department_id from employees
where manager_id in (select distinct manager_id from employees);

--employees 테이블에서 accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름, 업무명
select * from employees where department_id = 110;
select * from departments where department_name = 'Accounting';
select distinct job_id from employees where department_id = 110;
select first_name, job_id from employees
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in(select distinct job_id from employees where department_id = 110);

select first_name, job_id from employees
where job_id in (select distinct job_id from employees where department_id = 110); 

select first_name, job_id from employees where job_id in(select distinct job_id from employees where department_id = 
(select department_id from departments where department_name = 'Accounting'));

--테이블 복사
drop table emp02;
create table emp02
as 
select employee;
-- 서브 쿼리를 이용해서 테이터 복사
-- 구조만 복사 departments 테이블 생성 (dep01)
drop table dep01;
create table dep01
as 
select * from departments where 1 = 0;

-- 내용을 서브 쿼리를 이용해서 저장하시오.
--insert into dep01(컬럼명..) values(컬럼값..)
insert into dep01 (select * from departments);

--update 서브쿼리를 활용한다.
-- 부서 10번에 지역위치를 부서 40번 지역위치로 수정하시오.
-- update dep01 set location_id = (40번 부서의 위치) where department_id = 10;
update dep01 set location_id = (2400) where department_id = 10;
update dep01 set location_id = (select location_id from departments where department_id = 40)
where department_id = 10; 

-- 직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를 
-- 출력하되 부서번호가 20번인 직원은 제외한다.
select Min(salary) from employees where job_id = 'ST_MAN';
select salary from employees where job_id = 'ST_MAN';

select first_name, salary, department_id from employees 
where salary > any(select Min(salary) from employees where job_id = 'ST_MAN')
and department_id <>20
order by employees.department_id asc; --order by - 정렬

--  EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보 
-- 를 출력하는 SELECT문을 작성하시오. (결과에서 Valli는 제외)

select job_id ,salary from employees where first_name = 'Valli';
select * from employees where job_id = 
(select job_id from employees where first_name = 'Valli')
and salary = (select salary from employees where first_name = 'valli')
and first_name <> 'valli';

-- EMPLOYEES 테이블에서 월급이 자신이(‘Valli’) 속한 부서의 평균 월급보다 높은 사원의 부서번호, 
-- 이름, 급여를 출력하는 SELECT문을 작성하시오. 
select department_id from employees where first_name = 'Valli';
select round(avg(salary)) from employees
where department_id = 60;
--select * from employees where salary > 'Valli 가 속한 평균 월급';
select department_id, first_name, salary from employees 
where salary > (select round(avg(salary)) from employees where department_id = 
(select department_id from employees where first_name ='Valli'));