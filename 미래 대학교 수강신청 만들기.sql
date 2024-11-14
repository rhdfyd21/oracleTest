CREATE TABLE SUBJECT(
    no NUMBER(5),
    S_NUM NUMBER(2) NOT NULL UNIQUE,
    S_NAME VARCHAR2(8) NOT NULL
);
alter table subject add constraint subject_no_pk PRIMARY KEY(no);
CREATE TABLE STUDENT(
    NO NUMBER(5),
    NUM NUMBER(8) NOT NULL UNIQUE,
    NAME VARCHAR2(5) NOT NULL,
    ID VARCHAR2(10) NOT NULL,
    PASSWD VARCHAR2 (12) NOT NULL,
    S_NUM NUMBER(2) NOT NULL,
    JUMIN varchar2 (13) NOT NULL UNIQUE,
    PHONE varchar2(15) NOT NULL UNIQUE,
    ADDRESS VARCHAR2 (20) NOT NULL,
    EMAIL VARCHAR2(50) UNIQUE,
    sd_DATE DATE NOT NULL ,
    CONSTRAINT fk_subject_SNUM FOREIGN KEY (S_NUM) REFERENCES SUBJECT(S_NUM)
);
alter table student add constraint student_no_pk primary key(no);
CREATE TABLE LESSON(
    no NUMBER(5),
    l_num varchar2 (1) NOT NULL UNIQUE,
    l_name varchar2 (7) NOT NULL
);
alter table lesson add constraint lesson_no_pk primary key(no);
create table TRAINEE(
    no number(5),
    NUM NUMBER(8) NOT NULL UNIQUE,
    l_num varchar2 (1),
    t_section varchar2(10) NOT NULL,
    t_date date NOT NULL,
    CONSTRAINT fk_student_num FOREIGN KEY (NUM) REFERENCES STUDENT(NUM),
    CONSTRAINT fk_lesson_lnum FOREIGN KEY(l_num) REFERENCES LESSON(l_num)
);
alter table trainee add constraint trainee_no_pk primary key(no);
drop table trainee;
drop table student;
drop table lesson;
drop table subject;
select * from tab;
