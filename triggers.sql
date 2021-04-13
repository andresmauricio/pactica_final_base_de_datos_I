CREATE OR REPLACE TRIGGER AUDITORIA_PROGRAMA
    AFTER INSERT ON PROGRAMA
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
                SELECT USER INTO V_USERNAME FROM DUAL; 
                SELECT SYSDATE INTO V_FECHA FROM DUAL; 
                INSERT INTO aud_programa(id, accion, fecha, usuario) VALUES ('ID-' || NEW.id, 'SE HA CREADO UN PROGRAMA' || NEW.titulo, V_FECHA, V_USERNAME );
            END;

CREATE TABLE aud_programa (
    id             VARCHAR2(256) NOT NULL,
    accion         VARCHAR2(256) NOT NULL,
    fecha          DATE,
    b_leausuariorning_id  VARCHAR2(256) NOT NULL
);


ALTER TABLE aud_programa ADD CONSTRAINT aud_programa_pk PRIMARY KEY ( id );


INSERT INTO programa   VALUES(5, 'INGENIERIA DE ALIMENTOS');

SELECT * FROM aud_programa;
