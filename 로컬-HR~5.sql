-- emplyoee 에 해당된 모든 직원 이름, 직업, 사원번호를 출력해주는 프로그램 작성

-- 배열 타입 정의(테이블타입 정의)
declare
type first_name_array_type is table of employees.first_name%type index by binary_integer;
type job_id_array_type is table of employees.job_id%type index by binary_integer;
type employee_id_array_type is table of employees.employee_id%type index by binary_integer;
--인덱스 정의
    FIRST_NAME_ARRAY FIRST_NAME_ARRAY_TYPE;
    JOB_ID_ARRAY JOB_ID_ARRAY_TYPE;
    EMPLOYEE_ID_ARRAY EMPLOYEE_ID_ARRAY_TYPE;
i binary_integer := 0;
j binary_integer;
begin
    for ROW_ARRAY in(select * from employees) loop
    i := i+1;
    first_name_array(i) := row_array.first_name;
    job_id_array(i) := row_array.job_id;
    employee_id_array(i) := row_array.employee_id;
    end loop;
end;
/