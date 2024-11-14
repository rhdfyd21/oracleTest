--부서별에 따라 급여를 인상하도록 하자.(조인: inner join, outer join, self join, cross join)
-- (직원번호, 직원명,직급 급여)
-- 부서 ID에 따라서 'marketing'인 직원은 5%, 'purchasing'인 사원은 10%,
-- 'human resources'인 사원은 15%, 'IT'인 직원은 20%인 인상한다.
select * from departments;
select employee_id, first_name, salary, department_id from employees;
select * from employees inner join departments on employees.department_id = departments.department_id;
select employee_id, first_name, job_id, salary, E.department_id, D.department_name,
        case
        when upper(D.department_name) = upper('Marketing') then salary*1.05
        when upper(D.department_name) = upper('Purchasing') then salary*1.10
        when upper(D.department_name) = upper('Human Resources') then salary*1.15
        when upper(D.department_name) = upper('IT') then salary*1.20
        end NEWSALARY
from employees E inner join departments D on E.department_id = D.department_id
where upper(D.department_name) in (upper('Marketing'),upper('Purchasing'),upper('Human Resources'),upper('IT'))
order by NEWSALARY DESC;
select employee_id,first_name, salary, job_id, A.department_id,B.department_name, case
        when B.DEPARTMENT_name = 'Marketing' then salary*1.05
        when B.DEPARTMENT_name = 'Purchasing' then salary*1.10
        when B.DEPARTMENT_name = ' Human Resources' then salary*1.15
        when DEPARTMENT_name = 'IT' then salary*1.20
end NEWSALARY
from employees A inner join departments B on A.department_id = B.department_id
where A.DEPARTMENT_id IN(20,30,40,60);
-- 2007년에 입사한 사원의 입사일이 오늘로 수정한다
UPDATE EMP03 SET HIRE_DATE = SYSDATE WHERE SUBSTR(HIRE_DATE,1,2)='07';
ROLLBACK;

CREATE TABLE MYCUSTOMER(
    code VARCHAR2(7),
    name VARCHAR2(10) CONSTRAINT MYCUSTOMER_NAME_NN NOT NULL,
    gender CHAR(1) NOT NULL,
    birth VARCHAR2(8)NOT NULL,
    phone VARCHAR2(16)
);

ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_code_PK PRIMARY KEY(code);
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_gender_CK CHECK(gender IN('M','W'));
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_PHONE_UK UNIQUE(PHONE);
DESC MYCUSTOMER;

INSERT INTO MYCUSTOMER VALUES ('2017108','박승대','M','19711430','010-2580-9919');
INSERT INTO MYCUSTOMER VALUES ('2019302','전미래','W','19740812','010-8864-0232');
SELECT * FROM MYCUSTOMER;
SELECT * FROM CUSTOMER;
DESC CUSTOMER;

-- 제약조건 검색기능(반드시 알아둘것)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CUSTOMER';
SELECT * FROM USER_TABLES;
SELECT * FROM user_cons_columns WHERE TABLE_NAME = 'CUSTOMER';
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_EMAIL_UK;
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_GENDER_CK;


-- MERGE  MYCUSTOMER - > CUSTOMER 병합을진행하는데 없으면 INSERT, 있으면 UPDATE
MERGE INTO CUSTOMER C
    USING MYCUSTOMER M
    ON (C.CODE = M.CODE)
    WHEN MATCHED THEN
        UPDATE SET C.NAME = M.NAME, C.GENDER = M.GENDER, C.BIRTH = M.BIRTH, C.PONE = M.PHONE 
    WHEN NOT MATCHED THEN
        INSERT (C.CODE,C.NAME,C.GENDER,C.BIRTH, C.PONE) values(M.CODE,M.NAME,M.GENDER,M.BIRTH, M.PHONE);

SELECT * FROM CUSTOMER;
SELECT * FROM MYCUSTOMER;
UPDATE MYCUSTOMER SET NAME = '박승우' WHERE CODE = '2017108';
--두 테이블 관계 설정하기
CREATE TABLE DEPT01(
    NO VARCHAR2(8),
    NAME VARCHAR2(10) NOT NULL,
    REGION VARCHAR2(10)
);
ALTER TABLE DEPT01 ADD CONSTRAINT DEPT01_NO_PK PRIMARY KEY(NO);
CREATE TABLE MEMBER(
    NO NUMBER(8),
    NAME VARCHAR2(10) NOT NULL,
    JOB_ID VARCHAR2(10),
    DEPT_NO VARCHAR2(8)
    );
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO);
desc DEPT01;

CREATE TABLE DEPT02(
    DEPT_NO NUMBER,
    DEPT_NAME VARCHAR2(10),
    LOCATION VARCHAR2(10)
);

ALTER TABLE DEPT02 ADD CONSTRAINT DEPT02_NO_PK PRIMARY KEY(DEPT_NO);

INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT02 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT02 VALUES(40,'OPERATIONS','BOSTON');

CREATE TABLE MEMBER01(
    MEMBER_NO NUMBER,
    MEMBER_NAME VARCHAR(10),
    JOB_ID VARCHAR(10),
    DEPT_NO NUMBER
);

ALTER TABLE MEMBER01 ADD CONSTRAINT MEMBER01_NO_PK PRIMARY KEY(MEMBER_NO);
ALTER TABLE MEMBER01 ADD CONSTRAINT MEMBER01_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT02(DEPT_NO);

INSERT INTO MEMBER01 VALUES(7499,'ALLEN','SALESMAN',30);
INSERT INTO MEMBER01 VALUES(7566,'JONES','MANAGER',50);
    select * from member;

delete from member where DEPT_NO = 40;
delete from DEPT01 where no = 40;

alter table member drop constraint member_DEPT_NO_FK;
alter table member drop constraint member_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO)ON DELETE CASCADE;