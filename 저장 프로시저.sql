-- STOREO PROCEDURE
-- EMPLOYEES에서 사용자 이름을 패턴으로 검색한뒤 해당되는 사용자 정보를 보여주시오.
SELECT *FROM EMPLOYEES WHERE FIRST_NAME LIKE '%p%'; 
select DBMS_RANDOM.STRING('U',1) from dual;
CREATE OR REPLACE PROCEDURE EMP_PROC
IS
    -- 한문자 변수 선언
    VWORD VARCHAR2(1);
    VEMP_ROWTYPE EMPLOYEES%ROWTYPE;
    CURSOR CURSOR_NAME(VNAME EMPLOYEES.FIRST_NAME%TYPE)
    IS 
    SELECT *FROM EMPLOYEES WHERE UPPER (FIRST_NAME) LIKE UPPER ('%'||VNAME||'%'); 
BEGIN
    --임의의 문자를 생성시킨다
    VWORD := DBMS_RANDOM.STRING('U',1);
    for vemp_rowtype in CURSOR_NAME(VWORD) loop
    DBMS_OUTPUT.PUT_LINE(VEMP_ROWTYPE.FIRST_NAME || '/' || VEMP_ROWTYPE.SALARY);
    END LOOP;
    
END;
/
EXECUTE EMP_PROC;

--비밀병기 알아야한다
select * from user_tables; -- 모든 유저의 테이블
select * from user_constraints;
select * from user_cons_columns;
select * from user_indexes;
select * from user_ind_columns;
select * from user_views;
select * from user_source;
select * from user_sequences;