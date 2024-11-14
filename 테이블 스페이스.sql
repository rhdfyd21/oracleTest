-- 사용자가 정의한 테이블 스페이스 만들기
create TABLESPACE firstdate
datafile 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;
-- 용량 부족시 테이블 스페이스 확장하기
alter tablespace firstdate
add datafile 'C:\oraclexe\oradata\XE\first02.dbf' size 1M;
-- 용량 부족시 테이블 스페이스 용량 확대하기 
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf' resize 10M;
-- 용량이 부족시 자동으로 1M 확장하고 최대 20M 확장하도록 설정
alter database
datafile 'C:\oraclexe\oradata\XE\first01.dbf'
AUTOEXTEND ON
next 1M
MAXSIZE 20M;
-- 자바프로젝트를 위해서 사용자 계정 및 테이블 스페이스(javadata), 파일명 (app_data.dbf) 생성하기
create TABLESPACE javadata 
datafile 'C:\oraclexe\oradata\XE\app_data.dbf' size 20M
AUTOEXTEND on
next 3M
MAXSIZE 500M;
-- 자바 프로젝트 사용자계정 생성하기
alter session set "_ORACLE_SCRIPT"=true;
DROP USER javauser CASCADE; -- 기존 사용자 삭제
CREATE USER javauser IDENTIFIED BY 123456 -- 사용자이름 Model, 비밀번호 : 1234
    DEFAULT TABLESPACE javauser--데이터 저장소
    TEMPORARY TABLESPACE TEMP; --임시 저장 장소
GRANT connect, resource, dba TO javauser; -- 권한 부여