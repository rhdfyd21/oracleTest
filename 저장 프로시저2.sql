CREATE OR REPLACE PROCEDURE EMP_PROC2(VWORD in VARCHAR2)
IS
    -- 한문자 변수 선언
    VEMP_ROWTYPE EMPLOYEES%ROWTYPE;
    CURSOR CURSOR_NAME(VWORD EMPLOYEES.FIRST_NAME%TYPE)
    IS 
    SELECT *FROM EMPLOYEES WHERE UPPER (FIRST_NAME) LIKE UPPER ('%'||VWORD||'%'); 
BEGIN
    for vemp_rowtype in CURSOR_NAME(VWORD) loop
    DBMS_OUTPUT.PUT_LINE(VEMP_ROWTYPE.FIRST_NAME || '/' || VEMP_ROWTYPE.SALARY);
    END LOOP;
    
END;
/
execute  EMP_PROC2('K');

select * from user_tables where table_name = 'emp01';
drop table emp01;
create table emp01
as 
select * from employees where 1=1;
select * from emp01;
--부서별로 월급을 인상하는 프로그램이다. 10번부서 전원 10%인상, 20번 부서 전원 20% 인상, 나머지는 동결
create or replace procedure emp01_proc(VDEPTNO in EMPLOYEES.DEPARTMENT_ID%TYPE)
is
begin
    if VDEPTNO = 10 then
        update emp01 set salary = salary * 1.1 where department_id = 10;
        DBMS_OUTPUT.PUT_LINE(VDEPTNO || '부서는 전원 10% 인상했습니다');
    elsif VDEPTNO = 20 then
        update emp01 set salary = salary * 1.2 where department_id = 20;
        DBMS_OUTPUT.PUT_LINE(VDEPTNO || '부서는 전원 20% 인상했습니다');
    else
        DBMS_OUTPUT.PUT_LINE(VDEPTNO || '부서는 동결입니다.');
    end if;
end;
/

select * from emp01 where department_id = 10;

execute emp01_proc(30);