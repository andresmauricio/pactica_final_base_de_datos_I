CREATE TABLE aud_programa (
    id             VARCHAR2(256) NOT NULL,
    accion         VARCHAR2(256) NOT NULL,
    fecha          DATE,
    usuario        VARCHAR2(256) NOT NULL
);


ALTER TABLE aud_programa ADD CONSTRAINT aud_programa_pk PRIMARY KEY ( id );

-- INSERTAR UN REGISTRO DE LA TABLA PROGRAMA

CREATE OR REPLACE TRIGGER AUDITORIA_PROGRAMA
    AFTER INSERT ON programa
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_programa(id, accion, fecha, usuario) VALUES ('ID-' || :NEW.id, 'SE HA CREADO UN PROGRAMA' || :NEW.nombre, V_FECHA, V_USERNAME );
            END;


INSERT INTO programa   VALUES(5, 'INGENIERIA DE ALIMENTOS');
INSERT INTO programa VALUES(6, 'INGENIERIA CIVIL');
INSERT INTO programa VALUES(7, 'MEDICINA');
INSERT INTO programa VALUES(8, 'ARTES');
INSERT INTO programa VALUES(9, 'QUIMICA');
INSERT INTO programa VALUES(10, 'FISICA');





-- ACTUALIZARUN REGISTRO DE LA TABLA PROGRAMA

CREATE OR REPLACE TRIGGER ACTUALIZAR_PROGRAMA
    BEFORE UPDATE ON programa
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_programa(id, accion, fecha, usuario) VALUES ('U-' || :NEW.id, 'SE HA ACTUALZIADO UN PROGRAMA ' || :NEW.nombre, V_FECHA, V_USERNAME );
            END;

SELECT * FROM aud_programa;

UPDATE programa SET nombre = 'INGENIERIA DE SISTEMAS Y COMPUTACION' WHERE id = 1;






-- ELIMINAR UN REGISTRO DE LA TABLA PROGRAMA

CREATE OR REPLACE TRIGGER BORRAR_PROGRAMA
    BEFORE DELETE ON programa
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_programa(id, accion, fecha, usuario) VALUES ('D-' || :OLD.id, 'SE HA BORRADO UN PROGRAMA ' || :OLD.nombre, V_FECHA, V_USERNAME );
            END;

DELETE FROM programa WHERE id = 6;
DELETE FROM programa WHERE id = 8;

SELECT * FROM aud_programa;

-- AUDITORIA CURSOS

CREATE TABLE aud_cursos (
    id             VARCHAR2(256) NOT NULL,
    accion         VARCHAR2(256) NOT NULL,
    fecha          DATE,
    usuario        VARCHAR2(256) NOT NULL
);

ALTER TABLE aud_cursos ADD CONSTRAINT aud_cursos_pk PRIMARY KEY ( id );

CREATE OR REPLACE TRIGGER INSERTAR_CURSOS
    AFTER INSERT ON cursos
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_cursos(id, accion, fecha, usuario) VALUES ('ID-' || :NEW.id, 'SE HA CREADO UN CURSO ' || :NEW.nombre, V_FECHA, V_USERNAME );
            END;

INSERT INTO cursos  VALUES(5, 'BASES DE DATOS II');
INSERT INTO cursos  VALUES(6, 'CALCULO INTEGRAL');
INSERT INTO cursos  VALUES(7, 'METODOS NUMERICOS');
INSERT INTO cursos  VALUES(8, 'ESTADISTICA DESCRIPTIVA');

SELECT * FROM aud_cursos;
SELECT * FROM aud_cursos;
SELECT * FROM aud_cursos;
