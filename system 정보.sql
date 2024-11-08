alter session set "_ORACLE_SCRIPT"=true;
DROP USER STUDENTDO CASCADE; -- 기존 사용자 삭제
CREATE USER STUDENTDB IDENTIFIED BY 123456 -- 사용자이름 Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS --데이터 저장소
    TEMPORARY TABLESPACE TEMP; --임시 저장 장소
GRANT connect, resource, dba TO STUDENTDB; -- 권한 부여