select * from nomina;

--- PRIMER PROCEDIMIENTO ALMACENADO - CALCULAR SALARIO DE UN EMPLEADO

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


-- SEGUNDO PROCEDIMIENTO ALMACENADO - CALCULAR SALARIO DIARIO DE UN EMPLEADO

CREATE OR REPLACE PROCEDURE "UNAD_NAL_25"."CALCULAR_SALARIO_DIARIO"
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
    salario := salario/30;
    dbms_output.Put_line ('EL SALARIO DIARIO ES DE '
    || nombre
    ||' '
    || apellido
    || ' -> '
    || salario);
    END;

--- TERCER PROCEDIMIENTO ALMACENADO - CALCULAR SALARIO DE UN EMPLEADO CON DEDUCCIONES DEL %

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


-- CUARTO PROCEDIMIENTO ALMACENADO CALCULAR NOMINA MENSUAL DE LOS EMPLEADOS

select * from nomina;

CREATE OR REPLACE PROCEDURE “UNAD_NAL_25”.”CALCULAR_NOMINA_MENSUAL”
    AS
        cantidad_mensual INT;
        salario INT;
    BEGIN 
        SELECT SUM(salario) INTO salario from nomina;
        cantidad_mensual := salario;
        dbms_output.Put_line (‘LA SUMA MENSUAL DE LA NOMINA ES DE  -> ‘ || cantidad_mensual);
    END;

EXECUTE CALCULAR_NOMINA_MENSUAL;

-- QUINTO PROCEDIMIENTO ALMACENADO CALCULAR EL VALOR ANUAL A PAGAR POR TODOS LOS EMPLEADOS

CREATE OR REPLACE PROCEDURE "UNAD_NAL_25"."CALCULAR_NOMINA_ANUAL"
    AS
        cantidad_anual INT;
        salario INT;
    BEGIN 
        SELECT SUM(salario) INTO salario from nomina;
        cantidad_anual := salario*12;
        dbms_output.Put_line ('LA SUMA MENSUAL DE LA NOMINA ES DE  -> ' || cantidad_anual);
    END;

EXECUTE CALCULAR_NOMINA_ANUAL;



--https://rqkt18smyf2quxu-eandb20211.adb.us-ashburn-1.oraclecloudapps.com/ords/UNAD_NAL_25/_sdw/?nav=worksheet

