-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 18:05:57 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE doctor (
    docid   CHAR(6 CHAR) NOT NULL,
    classid CHAR(6 CHAR) NOT NULL,
    docname VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE doctor ADD CONSTRAINT doctor_pk PRIMARY KEY ( docid );

CREATE TABLE hospital (
    classid CHAR(6 CHAR) NOT NULL,
    c_name  VARCHAR2(10 CHAR) NOT NULL,
    c_place VARCHAR2(30 CHAR) NOT NULL,
    c_phone CHAR(11 CHAR) NOT NULL
);

ALTER TABLE hospital ADD CONSTRAINT hospital_pk PRIMARY KEY ( classid );

CREATE TABLE patient (
    "PATIID "   CHAR(6 CHAR) NOT NULL,
    "PATINAME " CHAR(5 CHAR) NOT NULL,
    resinum     VARCHAR2(14 CHAR) NOT NULL,
    insur       CHAR(2 CHAR) NOT NULL
);

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( "PATIID " );

CREATE TABLE prescription (
    preid    CHAR(6 CHAR) NOT NULL,
    reservid CHAR(6 CHAR) NOT NULL,
    patiid   CHAR(6 CHAR) NOT NULL,
    detail   VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE prescription ADD CONSTRAINT prescription_pk PRIMARY KEY ( preid );

CREATE TABLE reservation (
    reservid   CHAR(6 CHAR) NOT NULL,
    patiid     CHAR(6 CHAR) NOT NULL,
    docid      CHAR(6 CHAR) NOT NULL,
    reservdate DATE NOT NULL,
    status     VARCHAR2(3 CHAR) NOT NULL
);

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reservid );

ALTER TABLE doctor
    ADD CONSTRAINT doctor_hospital_classid_fk FOREIGN KEY ( classid )
        REFERENCES hospital ( classid );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_patient_patid_fk FOREIGN KEY ( patiid )
        REFERENCES patient ( "PATIID " );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_reservation_fk FOREIGN KEY ( reservid )
        REFERENCES reservation ( reservid );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_doctor_docid_fk FOREIGN KEY ( docid )
        REFERENCES doctor ( docid );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_patient_patid_fk FOREIGN KEY ( patiid )
        REFERENCES patient ( "PATIID " );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
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
