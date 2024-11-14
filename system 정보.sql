--사용자 계정만들기 (시스템관리자모드에서 진행해야댐)
alter session set "_ORACLE_SCRIPT"=true;
DROP USER SHOPPINGMALL CASCADE; -- 기존 사용자 삭제
CREATE USER SHOPPINGMALL IDENTIFIED BY 123456 -- 사용자이름 Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS --데이터 저장소
    TEMPORARY TABLESPACE TEMP; --임시 저장 장소
GRANT connect, resource, dba TO SHOPPINGMALL; -- 권한 부여