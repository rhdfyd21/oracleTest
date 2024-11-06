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
drop table EMP01;
desc EMP01;
