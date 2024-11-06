--테이블 설계하기 (사원번호, 사원명 , 급여) : DDL
--class EMP01{
--    public int no;
--    public string name;
--    public int salary;
--}

CREATE TABLE EMP01(
--pramary key에는 not null을 적을 필요가 없다
    no NUMBER(4),
    name VARCHAR2(20) not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_pk primary key(no),
    CONSTRAINT emp01_name_uk UNIQUE(name)
);
-- 테이블 지우기
drop table EMP01;
-- 테이블 보기
desc EMP01;
--테이블 복사 (제약조건복사안됨)
desc employees;
select count(*) from employees;
create table empl02 as select * from employees;
desc empl02;
--제약 조건 걸기 primary key,unique
alter table empl02 add constraint empl02_id_pk primary key(employee_id);
alter table empl02 add constraint eml02_email_uk unique(email);
--제약 조건 삭제하기 unique
alter table empl02 drop CONSTRAINT empl02_email_uk;
select * from user_constraints;
select user_constraints where table_name = upper('empl02');

select * from user_constraints where table_name = 'EMP01';
select owner, constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP01';
-- 있는 테이블 종류 보기
select *from tab;
--컬럼 추가 emp01
alter table emp01 add job varchar2(10) not null;
desc emp01;
--컬럼 제거 emp01
alter table emp01 drop column job;
--컬럼 변경 (주의 : 기존 데이터가 존재할떄는 유의할것 -> 타입 변경 불가, 사이즈 큰것으로는 변경 가능
alter table emp01 modify job number(10) default 0;
--컬럼 이름 변경 
alter table emp01 rename column job to job2;
alter table emp01 rename column job2 to job;
desc emp01;
drop table EMP01;
--휴지통 보기 
select *from recyclebin;
--휴지통 비우기
purge recyclebin;
--테이블명 변경 emp01 -> emp02 (create, alter, drop, rename, truncate)
rename emp01 to emp02;
select * from tab;

create table Customer(
    no char(7),
    name VARCHAR2(10) not null,
    gender char(1) not null,
    bday char(8) not null,
    phone varchar2(16),
    email varchar2(30),
    Accumulated NUMBER(10) default 0  
);
   alter table customer add constraint customer_gender_ck check(gender in('W','M'));
   alter table customer add constraint customer_no_pk primary key(no);
   alter table customer add constraint customer_email_uk unique(email);
desc customer;
drop table customer;
--제약 조건 보기
select * from user_constraints where table_name = 'CUSTOMER';

desc EMP02;

-- INSERT INTO 테이블명(컬럼명,,) VALUES (컬럼값, ,,)
create table IT(
    NO1 number,
    NO2 number,
    NO3 number
);
desc it;
INSERT INTO IT VALUES(1,2,3);
INSERT INTO IT VALUES(1,2,null);
INSERT INTO IT(NO1,NO2) VALUES(11,22);
INSERT INTO IT(NO1,NO2) VALUES(11,'문자');
INSERT INTO IT(NO1,NO2) VALUES(111);
INSERT INTO IT(NO1,NO2) VALUES(111,222,333);
INSERT INTO IT(NO1,NO2,NO3) VALUES(1111,2222,null);
select * from IT;
--NO3 NOT NULL 제약 조건 걸기
alter table IT modify NO3 number not null;
delete from IT where NO3 IS null;

--DEPT 테이블생성 
create table DEPT 
as 
select DEPARTMENT_ID, DEPARTMENT_NAME, KICATION_ID FROM DEPARTMENTS;
SELECT * FROM DEPT;
DELETE FROM DEPT;
TRUNCATE TABLE DEPT;
ROLLBACK;