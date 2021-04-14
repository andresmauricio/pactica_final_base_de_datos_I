
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

-- AUDITORIA CURSOS INSERTAR

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






-- AUDITORIA CURSOS ELIMINAR

CREATE OR REPLACE TRIGGER BORRAR_CURSO
    BEFORE DELETE ON cursos
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_cursos(id, accion, fecha, usuario) VALUES ('D-' || :OLD.id, 'SE HA BORRADO UN CURSO ' || :OLD.nombre, V_FECHA, V_USERNAME );
            END;


DELETE FROM cursos WHERE id = 2;
DELETE FROM cursos WHERE id = 7;



--- psd 1

select * from nomina;

CREATE OR REPLACE PROCEDURE "UNAD_NAL_25"."CALCULAR_SALARIO"
    AS
        salario  INT;
        nombre   VARCHAR (30);
        apellido VARCHAR (30);
    BEGIN
        SELECT salario, nombre, apellido
        INTO   salario,  nombre, apellido
        FROM   nomina
        WHERE nombre='Steven';
    dbms_output.Put_line ('EL SALARIO DE '
    || nombre
    || ' '
    || apellido
    || ' -> '
    || salario);
    salario := salario*12;
    dbms_output.Put_line ('EL SALARIO ANUAL ES DE '
    || nombre
    ||' '
    || apellido
    || ' -> '
    || salario);
    END;

EXECUTE CALCULAR_SALARIO;


--- psd 2


--- psd 3 

CREATE OR REPLACE PROCEDURE "UNAD_NAL_25"."CALCULAR_SALARIO_NETO_MENSUAL"
    AS
        salario  INT;
        nombre   VARCHAR (30);
        apellido VARCHAR (30);
    BEGIN
        SELECT salario, nombre, apellido
        INTO   salario,  nombre, apellido
        FROM   nomina
        WHERE nombre='Steven';
    salario := salario*0.20;
    dbms_output.Put_line ('EL SALARIO NETO DE '
    || nombre
    || ' '
    || apellido
    || ' -> '
    || salario);
    END;

EXECUTE CALCULAR_SALARIO_NETO_MENSUAL;


-- psd 4 

select * from nomina;


CREATE OR REPLACE PROCEDURE "UNAD_NAL_25"."CALCULAR_NOMINA_MENSUAL"
    AS
        cantidad_mensual INT;
		salario INT;
    BEGIN 
        SELECT SUM(salario) INTO salario from nomina;
    	cantidad_mensual := salario;
    	dbms_output.Put_line ('LA SUMA MENSUAL DE LA NOMINA ES DE  -> ' || cantidad_mensual);
    END;

EXECUTE CALCULAR_NOMINA_MENSUAL;

-- psd 5






--https://rqkt18smyf2quxu-eandb20211.adb.us-ashburn-1.oraclecloudapps.com/ords/UNAD_NAL_25/_sdw/?nav=worksheet
