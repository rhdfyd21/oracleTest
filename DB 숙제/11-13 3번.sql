-- 부서별 최대 급여 정보를 가지는 뷰(view_dept_maxsal)를 생성하라.

select * from loc_copy;

create or replace view VIEW_DEPT_MAXSAL
as
select * from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);

select * from VIEW_DEPT_MAXSAL;

drop view VIEW_DEPT_MAXSAL;
