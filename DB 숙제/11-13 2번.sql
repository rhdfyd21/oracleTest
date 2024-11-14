-- 30번 부서 소속 사원의 이름과 입사일과 부서명을 출력하는 뷰(view_date30)을 작성하라.

select * from loc_copy;

create view VIEW_DATE30
as 
select e.first_name,e.hire_date,d.department_name,e.department_id
from employees e inner join departments d on e.department_id = d.department_id
where e.department_id = 30;


drop view VIEW_DATE30;
select * from view_date30;



