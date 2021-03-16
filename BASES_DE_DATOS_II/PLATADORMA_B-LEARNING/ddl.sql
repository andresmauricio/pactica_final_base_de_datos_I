CREATE TABLE administrativos (
    id         INTEGER NOT NULL,
    nombres    VARCHAR2(256) NOT NULL,
    apellidos  VARCHAR2(256) NOT NULL,
    documento  INTEGER NOT NULL,
    direccion  VARCHAR2(256) NOT NULL,
    correo     VARCHAR2(50) NOT NULL,
    celuar     VARCHAR2(50) NOT NULL,
    centro_id  INTEGER NOT NULL
);

ALTER TABLE administrativos ADD CONSTRAINT administrativos_pk PRIMARY KEY ( id );

CREATE TABLE asistencia (
    id             INTEGER NOT NULL,
    sesion         VARCHAR2(256) NOT NULL,
    fecha          DATE,
    b_learning_id  INTEGER NOT NULL
);

ALTER TABLE asistencia ADD CONSTRAINT asistencia_pk PRIMARY KEY ( id );

CREATE TABLE b_learning (
    id             INTEGER NOT NULL,
    estudiante_id  INTEGER NOT NULL,
    docente_id     INTEGER NOT NULL,
    cursos_id      INTEGER NOT NULL
);

ALTER TABLE b_learning ADD CONSTRAINT b_learning_pk PRIMARY KEY ( id );

CREATE TABLE centro (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(256) NOT NULL
);

ALTER TABLE centro ADD CONSTRAINT centro_pk PRIMARY KEY ( id );

CREATE TABLE cursos (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(256) NOT NULL
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id );

CREATE TABLE docente (
    id           INTEGER NOT NULL,
    nombres      VARCHAR2(256) NOT NULL,
    apellidos    VARCHAR2(256) NOT NULL,
    documento    INTEGER NOT NULL,
    direccion    VARCHAR2(256) NOT NULL,
    correo       VARCHAR2(50) NOT NULL,
    celuar       VARCHAR2(50) NOT NULL,
    programa_id  INTEGER NOT NULL,
    escuela_id   INTEGER NOT NULL,
    cursos_id    INTEGER NOT NULL,
    centro_id    INTEGER NOT NULL
);

ALTER TABLE docente ADD CONSTRAINT docente_pk PRIMARY KEY ( id );


CREATE TABLE escuela (
    id           INTEGER NOT NULL,
    nombre       VARCHAR2(256) NOT NULL,
    programa_id  INTEGER NOT NULL
);

ALTER TABLE escuela ADD CONSTRAINT escuela_pk PRIMARY KEY ( id );

CREATE TABLE estudiante (
    id           INTEGER NOT NULL,
    nombres      VARCHAR2(256) NOT NULL,
    apellidos    VARCHAR2(256) NOT NULL,
    documento    INTEGER NOT NULL,
    direccion    VARCHAR2(256) NOT NULL,
    correo       VARCHAR2(50) NOT NULL,
    codigo       VARCHAR2(20) NOT NULL,
    celular      VARCHAR2(50) NOT NULL,
    programa_id  INTEGER NOT NULL,
    zona_id      INTEGER NOT NULL,
    centro_id    INTEGER NOT NULL,
    escuela_id   INTEGER NOT NULL,
    cursos_id    INTEGER NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( id );

CREATE TABLE programa (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(256) NOT NULL
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( id );

CREATE TABLE zona (
    id         INTEGER NOT NULL,
    nombre     VARCHAR2(256) NOT NULL,
    centro_id  INTEGER NOT NULL
);
ALTER TABLE zona ADD CONSTRAINT zona_pk PRIMARY KEY ( id );

ALTER TABLE administrativos
    ADD CONSTRAINT administrativos_centro_fk FOREIGN KEY ( centro_id )
        REFERENCES centro ( id );

ALTER TABLE asistencia
    ADD CONSTRAINT asistencia_b_learning_fk FOREIGN KEY ( b_learning_id )
        REFERENCES b_learning ( id );

ALTER TABLE b_learning
    ADD CONSTRAINT b_learning_cursos_fk FOREIGN KEY ( cursos_id )
        REFERENCES cursos ( id );

ALTER TABLE b_learning
    ADD CONSTRAINT b_learning_docente_fk FOREIGN KEY ( docente_id )
        REFERENCES docente ( id );

ALTER TABLE b_learning
    ADD CONSTRAINT b_learning_docente_fk FOREIGN KEY ( docente_id )
        REFERENCES docente ( id );

ALTER TABLE b_learning
    ADD CONSTRAINT b_learning_estudiante_fk FOREIGN KEY ( estudiante_id )
        REFERENCES estudiante ( id );

ALTER TABLE docente
    ADD CONSTRAINT docente_centro_fk FOREIGN KEY ( centro_id )
        REFERENCES centro ( id );

ALTER TABLE docente
    ADD CONSTRAINT docente_cursos_fk FOREIGN KEY ( cursos_id )
        REFERENCES cursos ( id );

ALTER TABLE docente
    ADD CONSTRAINT docente_escuela_fk FOREIGN KEY ( escuela_id )
        REFERENCES escuela ( id );

ALTER TABLE docente
    ADD CONSTRAINT docente_programa_fk FOREIGN KEY ( programa_id )
        REFERENCES programa ( id );

ALTER TABLE escuela
    ADD CONSTRAINT escuela_programa_fk FOREIGN KEY ( programa_id )
        REFERENCES programa ( id );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_centro_fk FOREIGN KEY ( centro_id )
        REFERENCES centro ( id );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_cursos_fk FOREIGN KEY ( cursos_id )
        REFERENCES cursos ( id );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_escuela_fk FOREIGN KEY ( escuela_id )
        REFERENCES escuela ( id );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_programa_fk FOREIGN KEY ( programa_id )
        REFERENCES programa ( id );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_zona_fk FOREIGN KEY ( zona_id )
        REFERENCES zona ( id );

ALTER TABLE zona
    ADD CONSTRAINT zona_centro_fk FOREIGN KEY ( centro_id )
        REFERENCES centro ( id );


CREATE TABLE ADMINISTRATIVOS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombres VARCHAR2 (256) NOT NULL
 ,apellidos VARCHAR2 (256) NOT NULL
 ,documento INTEGER NOT NULL
 ,direccion VARCHAR2 (256) NOT NULL
 ,correo VARCHAR2 (50) NOT NULL
 ,celuar VARCHAR2 (50) NOT NULL
 ,CENTRO_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER ADMINISTRATIVOS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ADMINISTRATIVOS for each row 
 Declare 
  rec ADMINISTRATIVOS_JN%ROWTYPE; 
  blank ADMINISTRATIVOS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombres := :NEW.nombres; 
      rec.apellidos := :NEW.apellidos; 
      rec.documento := :NEW.documento; 
      rec.direccion := :NEW.direccion; 
      rec.correo := :NEW.correo; 
      rec.celuar := :NEW.celuar; 
      rec.CENTRO_id := :NEW.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombres := :OLD.nombres; 
      rec.apellidos := :OLD.apellidos; 
      rec.documento := :OLD.documento; 
      rec.direccion := :OLD.direccion; 
      rec.correo := :OLD.correo; 
      rec.celuar := :OLD.celuar; 
      rec.CENTRO_id := :OLD.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ADMINISTRATIVOS_JN VALUES rec; 
  END; 

CREATE TABLE ASISTENCIA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,sesion VARCHAR2 (256) NOT NULL
 ,fecha DATE
 ,B_LEARNING_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER ASISTENCIA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ASISTENCIA for each row 
 Declare 
  rec ASISTENCIA_JN%ROWTYPE; 
  blank ASISTENCIA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.sesion := :NEW.sesion; 
      rec.fecha := :NEW.fecha; 
      rec.B_LEARNING_id := :NEW.B_LEARNING_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.sesion := :OLD.sesion; 
      rec.fecha := :OLD.fecha; 
      rec.B_LEARNING_id := :OLD.B_LEARNING_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ASISTENCIA_JN VALUES rec; 
  END; 


CREATE TABLE B_LEARNING_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,ESTUDIANTE_id INTEGER NOT NULL
 ,DOCENTE_id INTEGER NOT NULL
 ,CURSOS_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER B_LEARNING_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON B_LEARNING for each row 
 Declare 
  rec B_LEARNING_JN%ROWTYPE; 
  blank B_LEARNING_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.ESTUDIANTE_id := :NEW.ESTUDIANTE_id; 
      rec.DOCENTE_id := :NEW.DOCENTE_id; 
      rec.CURSOS_id := :NEW.CURSOS_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.ESTUDIANTE_id := :OLD.ESTUDIANTE_id; 
      rec.DOCENTE_id := :OLD.DOCENTE_id; 
      rec.CURSOS_id := :OLD.CURSOS_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into B_LEARNING_JN VALUES rec; 
  END; 

CREATE TABLE CENTRO_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombre VARCHAR2 (256) NOT NULL
 );

CREATE OR REPLACE TRIGGER CENTRO_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON CENTRO for each row 
 Declare 
  rec CENTRO_JN%ROWTYPE; 
  blank CENTRO_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into CENTRO_JN VALUES rec; 
  END; 

CREATE TABLE CURSOS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombre VARCHAR2 (256) NOT NULL
 );

CREATE OR REPLACE TRIGGER CURSOS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON CURSOS for each row 
 Declare 
  rec CURSOS_JN%ROWTYPE; 
  blank CURSOS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into CURSOS_JN VALUES rec; 
  END;

CREATE TABLE DOCENTE_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombres VARCHAR2 (256) NOT NULL
 ,apellidos VARCHAR2 (256) NOT NULL
 ,documento INTEGER NOT NULL
 ,direccion VARCHAR2 (256) NOT NULL
 ,correo VARCHAR2 (50) NOT NULL
 ,celuar VARCHAR2 (50) NOT NULL
 ,PROGRAMA_id INTEGER NOT NULL
 ,ESCUELA_id INTEGER NOT NULL
 ,CURSOS_id INTEGER NOT NULL
 ,CENTRO_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER DOCENTE_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON DOCENTE for each row 
 Declare 
  rec DOCENTE_JN%ROWTYPE; 
  blank DOCENTE_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombres := :NEW.nombres; 
      rec.apellidos := :NEW.apellidos; 
      rec.documento := :NEW.documento; 
      rec.direccion := :NEW.direccion; 
      rec.correo := :NEW.correo; 
      rec.celuar := :NEW.celuar; 
      rec.PROGRAMA_id := :NEW.PROGRAMA_id; 
      rec.ESCUELA_id := :NEW.ESCUELA_id; 
      rec.CURSOS_id := :NEW.CURSOS_id; 
      rec.CENTRO_id := :NEW.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombres := :OLD.nombres; 
      rec.apellidos := :OLD.apellidos; 
      rec.documento := :OLD.documento; 
      rec.direccion := :OLD.direccion; 
      rec.correo := :OLD.correo; 
      rec.celuar := :OLD.celuar; 
      rec.PROGRAMA_id := :OLD.PROGRAMA_id; 
      rec.ESCUELA_id := :OLD.ESCUELA_id; 
      rec.CURSOS_id := :OLD.CURSOS_id; 
      rec.CENTRO_id := :OLD.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into DOCENTE_JN VALUES rec; 
  END; 

CREATE TABLE ESCUELA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombre VARCHAR2 (256) NOT NULL
 ,PROGRAMA_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER ESCUELA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ESCUELA for each row 
 Declare 
  rec ESCUELA_JN%ROWTYPE; 
  blank ESCUELA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.PROGRAMA_id := :NEW.PROGRAMA_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.PROGRAMA_id := :OLD.PROGRAMA_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ESCUELA_JN VALUES rec; 
  END;

CREATE TABLE ESTUDIANTE_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombres VARCHAR2 (256) NOT NULL
 ,apellidos VARCHAR2 (256) NOT NULL
 ,documento INTEGER NOT NULL
 ,direccion VARCHAR2 (256) NOT NULL
 ,correo VARCHAR2 (50) NOT NULL
 ,codigo VARCHAR2(50) NOT NULL
 ,celular VARCHAR2 (50) NOT NULL
 ,PROGRAMA_id INTEGER NOT NULL
 ,ZONA_id INTEGER NOT NULL
 ,CENTRO_id INTEGER NOT NULL
 ,ESCUELA_id INTEGER NOT NULL
 ,CURSOS_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER ESTUDIANTE_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ESTUDIANTE for each row 
 Declare 
  rec ESTUDIANTE_JN%ROWTYPE; 
  blank ESTUDIANTE_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombres := :NEW.nombres; 
      rec.apellidos := :NEW.apellidos; 
      rec.documento := :NEW.documento; 
      rec.direccion := :NEW.direccion; 
      rec.correo := :NEW.correo; 
      rec.codigo := :NEW.codigo; 
      rec.celular := :NEW.celular; 
      rec.PROGRAMA_id := :NEW.PROGRAMA_id; 
      rec.ZONA_id := :NEW.ZONA_id; 
      rec.CENTRO_id := :NEW.CENTRO_id; 
      rec.ESCUELA_id := :NEW.ESCUELA_id; 
      rec.CURSOS_id := :NEW.CURSOS_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombres := :OLD.nombres; 
      rec.apellidos := :OLD.apellidos; 
      rec.documento := :OLD.documento; 
      rec.direccion := :OLD.direccion; 
      rec.correo := :OLD.correo; 
      rec.codigo := :OLD.codigo; 
      rec.celular := :OLD.celular; 
      rec.PROGRAMA_id := :OLD.PROGRAMA_id; 
      rec.ZONA_id := :OLD.ZONA_id; 
      rec.CENTRO_id := :OLD.CENTRO_id; 
      rec.ESCUELA_id := :OLD.ESCUELA_id; 
      rec.CURSOS_id := :OLD.CURSOS_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ESTUDIANTE_JN VALUES rec; 
  END; 

CREATE TABLE PROGRAMA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombre VARCHAR2 (256) NOT NULL
 );

CREATE OR REPLACE TRIGGER PROGRAMA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON PROGRAMA for each row 
 Declare 
  rec PROGRAMA_JN%ROWTYPE; 
  blank PROGRAMA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into PROGRAMA_JN VALUES rec; 
  END; 

CREATE TABLE ZONA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id INTEGER NOT NULL
 ,nombre VARCHAR2 (256) NOT NULL
 ,CENTRO_id INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER ZONA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ZONA for each row 
 Declare 
  rec ZONA_JN%ROWTYPE; 
  blank ZONA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.CENTRO_id := :NEW.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.CENTRO_id := :OLD.CENTRO_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ZONA_JN VALUES rec; 
  END;