-- 사원 번호와 사원명과 부서명과 부서의 위치를 출력하는 뷰(VIEW_LOC)를 작성하라.
create table LOC_COPY
as 
select * from employees;
select first_name, employee_id,department_name,location_id from employees E inner join
departments D on E.department_id = D.department_id;

select * from LOC_COPY;

create view VIEW_LOC
as
select first_name, employee_id,department_name,location_id from employees E inner join 
departments D on E.department_id = D.department_id;
select * from VIEW_LOC;

drop view VIEW_LOC;