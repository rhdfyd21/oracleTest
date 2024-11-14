-- 시퀀스 생성
create sequence EMP_SEQ
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
cache 2;
-- USER_TABS, USER_CONSTRAINTS, USER_CONS_COLUMNS, USER_VIEWS, USER_INDEXES, USE_SEQUENCES 시퀀스 설정 보는법

select * from user_sequences;

-- EMPLOEYEES 구조만 복사 EMP01
DROP TABLE EMP01;
CREATE TABLE EMP01
as
select EMPLOYEE_ID, FIRST_NAME, HIRE_DATE FROM EMPLOYEES where 1=0;

select * from EMP01;
desc EMP01;
-- EMP_SEQ.NEXTVAL 입력하기 (현재 시퀀스 값의 다음 값을 반환)
INSERT INTO EMP01 VALUES (EMP_SEQ.NEXTVAL, 'KDJ',SYSDATE);

-- EMP_SEQ.CURRVAL 입력하기 (현재값 반환)
select EMP_SEQ.CURRVAL from dual;

-- SEQUENCE DEPT_SEQ 생성하기, 시작값 10, 증가치 10, 결과치 30
create SEQUENCE DEPT_SEQ
START WITH 10
increment by 10
maxvalue 30;

select * from user_sequences;

-- DEPT02 테이블을 구조 복사하기(부서를 만들자)
drop table DEPT02;
create table DEPT02
as
select department_id, department_name, location_id from departments where 1=0;

insert into DEPT02 values (DEPT_SEQ.NEXTVAL,'인사과',1);
insert into DEPT02 values (DEPT_SEQ.NEXTVAL,'총무과',2);
insert into DEPT02 values (DEPT_SEQ.NEXTVAL,'서무과',3);
insert into DEPT02 values (DEPT_SEQ.NEXTVAL,'교육과',4);
select * from DEPT02;

-- SEQUENCE 수정하기
ALTER SEQUENCE DEPT_SEQ
MAXVALUE 100;

SELECT * FROM USER_SEQUENCES where SEQUENCE_NAME = 'DEPT_SEQ';

-- SEQUENCE 삭제하기
drop sequence DEPT_SEQ;

-- 데이터 딕셔너리에서 인덱스 확인
select * from user_indexes where table_name = 'EMPLOYEES';
select * from user_ind_columns where table_name = 'EMPLOYEES';

select * from EMPLOYEES where employee_id = 100;

drop table EMP10;

create table EMP10
as
select * from employees where 1=1;

select * from EMP10 where employee_id = 100;

-- 인덱스 생성하기
select * from user_ind_columns where table_name = 'EMP10';
create UNIQUE INDEX EMP10_EMPLOYEE_IX
on EMP10(EMPLOYEE_ID);

-- 인덱스 삭제하기
drop index EMP10_EMPLOYEE_IX;