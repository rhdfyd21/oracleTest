-- PL/SQL
--내용을 화면에 출력하기
--employee 이름, 사원번호를 가져와서 출력하자
DECLARE --(변수 선언) 
    VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN --(실행부,sql문,제어문,반복문, 커서)
   select first_name, employee_id into VFIRST_NAME,VEMPLOYEE_ID
   from employees where first_name = 'Ellen';
   DBMS_OUTPUT.PUT_LINE('frist_name = ' || VFIRST_NAME);
   DBMS_OUTPUT.PUT_LINE('VEMPLOYEE_ID = ' || VEMPLOYEE_ID);
--EXCEPTION (예외 처리부)

END;
/

select first_name, employee_id from employees where first_name = 'Ellen';

desc employees;

-- table type ( 배열)
-- PL/SQL 
-- 내용을 employee 에 해당된 모든직원 이름, 직업, 사원번호를 출력해주는 프로그램을 작성하시오.
DECLARE -- 배열타입정의(테이블타입정의)
    TYPE FIRST_NAME_ARRAY_TYPE IS TABLE OF EMPLOYEES.FIRST_NAME%TYPE INDEX BY BINARY_INTEGER; 
    TYPE JOB_ID_ARRAY_TYPE IS TABLE OF EMPLOYEES.JOB_ID%TYPE INDEX BY BINARY_INTEGER; 
    TYPE EMPLOYEE_ID_ARRAY_TYPE IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE INDEX BY BINARY_INTEGER; 
    -- 배열타입변수선언
    FIRST_NAME_ARRAY FIRST_NAME_ARRAY_TYPE; 
    JOB_ID_ARRAY JOB_ID_ARRAY_TYPE; 
    EMPLOYEE_ID_ARRAY EMPLOYEE_ID_ARRAY_TYPE;
    ROW_ARRAY EMPLOYEES%ROWTYPE;
    I BINARY_INTEGER := 0; 
    J BINARY_INTEGER; 
BEGIN
    -- 향샹된 포문을 통해서 RESULT SET값을 한개씩 가져와서 각 컬럼배열에 저장한다. 
    FOR ROW_ARRAY IN (SELECT * FROM EMPLOYEES) LOOP
        I := I + 1; 
        FIRST_NAME_ARRAY(I) := ROW_ARRAY.FIRST_NAME; 
        JOB_ID_ARRAY(I) := ROW_ARRAY.JOB_ID; 
        EMPLOYEE_ID_ARRAY(I) := ROW_ARRAY.EMPLOYEE_ID; 
    END LOOP; 
    
    -- 향상된 포문을 이용해서 컬럼 배열값에 저장된 값을 가져와서 출력하시오. 
    FOR J IN 1..I LOOP
        DBMS_OUTPUT.PUT_LINE(FIRST_NAME_ARRAY(J) || '  /  ' || JOB_ID_ARRAY(J) || '  /  '|| EMPLOYEE_ID_ARRAY(J)); 
    END LOOP; 

END; 
/

-- 내용을 employees 'Susan' 이름을 갖는 사원의 사원번호와 사원명과, 부서번호를 출력하시오

DECLARE
    VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    VLAST_NAME EMPLOYEES.LAST_NAME%TYPE;
    VDEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
    into VEMPLOYEE_ID,VFIRST_NAME,VLAST_NAME, VDEPARTMENT_ID
    FROM EMPLOYEES WHERE FIRST_NAME = 'Susan';
    
    DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID ||' / ' || VFIRST_NAME ||' / '|| VLAST_NAME ||' / ' || VDEPARTMENT_ID);
END;
/

select  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID from employees where first_name = 'Susan';

select DBMS_RANDOM.STRING('a',5) from DUAL;

select round(DBMS_RANDOM.value(10,110),-1) from dual;

DECLARE
    -- 부서번호, 최고연봉선언
    VNO number(4);
    vtop_salary number(12,2);
    vresult varchar2 (20);
begin
--임의의 부서번호 생성하기 (random)
VNO := round(DBMS_RANDOM.VALUE(10,110),-1);
select salary into VTOP_SALARY
from (select salary from employees where department_id = VNO order by salary desc)
where rownum = 1;
--평가내리기 연봉이 1~5000 낮음 5000~10000 중간 10000~20000 높음
IF(VTOP_SALARY BETWEEN 1 AND 5000 ) THEN
    VRESULT := '낮음';
    ELSIF (VTOP_SALARY BETWEEN 5001 AND 10000 ) THEN
    VRESULT := '중간';
    ELSIF (VTOP_SALARY BETWEEN 10001 AND 20000 ) THEN
    VRESULT := '높음';
    end if;

    DBMS_OUTPUT.PUT_LINE('부서번호: ' || VNO);
    DBMS_OUTPUT.PUT_LINE('최고연봉: ' || VTOP_SALARY);
    DBMS_OUTPUT.PUT_LINE('최고연봉평가: ' || VRESULT);
    
    EXCEPTION
    when NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('해당부서에 해당되는 사원이 없습니다.');
end;
/


(select salary, department_id, first_name from employees where department_id = 50 order by salary desc);
select rownum,salary, department_id, first_name from (
(select salary, department_id, first_name from employees where department_id = 50 order by salary desc))
where rownum <= 1;

DECLARE 
    VNUM number := 0;
    VCOUNT number := 1;
    
begin
    loop
    VNUM := VNUM+1;
    DBMS_OUTPUT.PUT_LINE(VNUM || ' * ' || VCOUNT || ' = ' || VNUM*VCOUNT);
    VCOUNT := VCOUNT+1;
    if VCOUNT > 9 THEN
    exit;
    end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE(VNUM || ' * ' || VCOUNT || ' = ' || VNUM*VCOUNT);
        
        if VNUM > 9 THEN
        ExiT;
        VCOUNT := 1;  
    end if;
    end loop;
end;
/

-- departments 에서 반복문을 이용하여 부서 10,20,30,40 정보를 출력하시오.

DECLARE
VDEPARTMENTS DEPARTMENTS%ROWTYPE;
BEGIN
    FOR I IN 1..9 LOOP
        select * INTO VDEPARTMENT from departments where department_id = I*10;
        DBMS_OUTPUT.PUT_LINE(VDEPARTMENTS.DEPARTMENT_ID || ' / ' || VDEPARTMENTS.DEPARTMENT_NAME);
END;
/
select * from departments where department_id = 10;
select * from departments where department_id = 20;
select * from departments where department_id = 30;
select * from departments where department_id = 40;