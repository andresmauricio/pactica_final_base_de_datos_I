CREATE OR REPLACE TRIGGER AUDITORIA_PROGRAMA
    AFTER INSERT ON AUDITORIA_PROGRAMA
        FOR EACH ROW 
            DECLARE 
                V_USERNAME VARCHAR(50);
                V_FECHA DATE;
            BEGIN
            END;
