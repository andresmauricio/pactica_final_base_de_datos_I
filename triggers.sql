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
INSERT INTO programa VALUES(8, ARTES

SELECT * FROM aud_programa;

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
