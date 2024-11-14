-- 급여를 많이 받는 순서대로 3명만 출력하는 뷰(VIEW_SAL_TOP3)와 인라인 뷰로 작성하라.

create view view_sal_top3
as
select salary, first_name, employee_id from employees order by salary desc;

select rownum, salary, first_name, employee_id from view_sal_top3 where rownum <=3;

select rownum, salary, first_name, employee_id from
(select salary, first_name, employee_id from employees order by salary desc)
where rownum <= 3;