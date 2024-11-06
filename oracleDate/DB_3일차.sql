select 입사년도, 사원이름 from employees where TO_CHAR(hire_date, 'YY') = '03';
select hire_date, TO_CHAR(hire_date, 'YY/MM/DD HH24:MI:SS'), TO_CHAR(hire_date, 'MI') from employees;
select TO_DATE('20041214', 'YYYY/MM/DD')+1 from dual;

-- 이름이 k로 끝나는 직원을 검색
select first_name from employees;
select first_name from employees where first_name like '%k';
select first_name from employees where upper(substr(first_name, LENGTH(first_name), 1)) = UPPER('k');

--현재시간 표현
select sysdate from dual;
--시간,분,초 까지
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') from dual;
--날짜 더하기,빼기
select FLOOR(sysdate - TO_DATE('2024/11/05','YYYY/MM/DD')) from dual;
--그달의 마지막 날짜를 반환 
SELECT sysdate,LAST_DAY(SYSDATE)
FROM DUAL;
--현재일을 요일까지 표시
select sysdate,TO_CHAR(sysdate,'YYYY/MM/DD HH24:MI:SS'),TO_CHAR(sysdate,'DL')
from dual;
--숫자를 우리가 운하는 형식으로 출력하기 1234567.23 => $1,234,567.23
select trim( to_char(1234567.23,'L999,999,999,999.99'))as money from dual;
select first_name,trim(to_char(salary,'L999,999,999,999.99'))as salary from employees;
--문자+문자 = 숫자
--select '10,000'+'20,000' from dual; X -> ,껴있어서 못바꿈
select TO_NUMBER('10,000','999,999')+ TO_NUMBER('20,000','999,999') from dual;
-- NVL 미적용
select first_name,salary,commission_pct,job_id
from employees
order by job_id;
--NVL(NULL을 0으로 표기)
select first_name,salary,NVL(commission_pct,0),job_id
from employees
order by job_id;
--NVL2(대상, 널이 아닐때 적용될값, 널일대 적용될값)
select first_name,salary,commission_pct,salary+(salary*commission_pct) as total from employees;
select first_name,salary,commission_pct,salary+(salary*NVL(commission_pct,0)) as total from employees;
select first_name,salary,commission_pct,salary+(salary*NVL2(commission_pct,commission_pct,0)) as total from employees;