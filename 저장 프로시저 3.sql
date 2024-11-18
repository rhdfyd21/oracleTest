-- 프로시저를 통해서 사원번호를 입력하면 , 사원 이름, 사원월급 , 사원 직책 매개변수를 통해서 전달
create or replace procedure EMP_PROCEDURE_OUTMODE(
    VEMPNO IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    VNAME OUT EMPLOYEES.FIRST_NAME%TYPE,
    VSALARY OUT EMPLOYEES.SALARY%TYPE,
    VJOBID OUT EMPLOYEES.JOB_ID%TYPE)
is

BEGIN
select first_name,salary, job_id into VNAME,VSALARY,VJOBID from employees where employee_id = VEMPNO;


END;
/   
select first_name,salary, job_id from employees where employee_id = 100;
select * from employees;

declare 
    VEMP_ROWTYPE EMPLOYEES%ROWTYPE;

BEGIN
    EMP_PROCEDURE_OUTMODE( 100,
    VEMP_ROWTYPE.FIRST_NAME,
    VEMP_ROWTYPE.SALARY,
    VEMP_ROWTYPE.JOB_ID);
    DBMS_OUTPUT.PUT_LINE('이름: ' ||  VEMP_ROWTYPE.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('봉급: ' ||  VEMP_ROWTYPE.SALARY);
    DBMS_OUTPUT.PUT_LINE('직책: ' ||  VEMP_ROWTYPE.JOB_ID);
END;
/
    
-- 프로시져를 워크시트에서 불러서 사용하겠따.
VARIABLE VNAME VARCHAR2 (100);
VARIABLE VSALARY NUMBER;
VARIABLE VJOBID VARCHAR2(100);
EXECUTE EMP_PROCEDURE_OUTMODE(100,:VNAME,:VSALARY,:VJOBID);
PRINT VNAME;
PRINT VSALARY;

-- procedere in out mode 동시 사용
create or replace procedure PROCEDURE_INOUTMODE(VSALARY IN OUT VARCHAR2)
is

begin
    VSALARY := TO_CHAR(VSALARY, '$999,999,999.99');
    VSALARY := '$' || substr(VSALARY,-9,3) || ',' || substr(VSALARY,-6,3) || ',' || substr(VSALARY,-3,3);
end;
/
declare
    VSALARY VARCHAR2(20) := '123456789';
BEGIN
    PROCEDURE_INOUTMODE(VSALARY);
    DBMS_OUTPUT.PUT_LINE('VSALARY = '||VSALARY);
END;
/
