-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 14:45:22 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE buy (
    no          NUMBER(10) NOT NULL,
    mobile      CHAR(11 CHAR) NOT NULL,
    froductname CHAR(3 CHAR) NOT NULL,
    frice       NUMBER(7) NOT NULL,
    amount      NUMBER(3) NOT NULL
);

ALTER TABLE buy ADD CONSTRAINT buy_pk PRIMARY KEY ( no );

CREATE TABLE USERDB (
    mobile    CHAR(11 CHAR) NOT NULL,
    name      CHAR(4 CHAR) NOT NULL,
    birthtear NUMBER(4) NOT NULL,
    address   VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE USERDB ADD CONSTRAINT user_pk PRIMARY KEY ( mobile );

ALTER TABLE buy
    ADD CONSTRAINT buy_user_mobile_fk
        FOREIGN KEY ( mobile )
            REFERENCES USERDB ( mobile )
                ON DELETE CASCADE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              3
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
