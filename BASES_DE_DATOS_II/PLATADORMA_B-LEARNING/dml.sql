INSERT INTO centro VALUES(1, 'Boyaca');
INSERT INTO centro VALUES(2, 'Antioquia');
INSERT INTO centro VALUES(3, 'Cundinamarca');

INSERT INTO cursos  VALUES(1, 'BASES DE DATOS I');
INSERT INTO cursos  VALUES(2, 'CALCULO DIFERENCIAL');
INSERT INTO cursos  VALUES(3, 'COMPUTACION GRAFICA');
INSERT INTO cursos  VALUES(4, 'ESTADISTICA');

INSERT INTO programa   VALUES(1, 'INGENIERIA DE SISTEMAS');
INSERT INTO programa   VALUES(2, 'CONTADURIA PUBLICA');
INSERT INTO programa   VALUES(3, 'FILOSOFIA');
INSERT INTO programa   VALUES(4, 'INGENIERIA INDUSTRIAL');

INSERT INTO zona  VALUES(1, 'CCAV DUITAMA', 1);
INSERT INTO zona  VALUES(2, 'CCVA TUNJA', 1);
INSERT INTO zona  VALUES(3, 'CCVA MEDELLIN', 3);
INSERT INTO zona  VALUES(4, 'CCVA MOSQUERA', 2);

INSERT INTO administrativos   VALUES(1, 'LUCIANA VALERIA', 'CORREA FLOREZ', 123456789, 'DIAGONAL 46 A SUR 45 ', 'l@unad.com.co', 987654321 , 3);
INSERT INTO administrativos   VALUES(2, 'MARIA DEL PILAR', 'GOZALEZ MEJIA', 7897574, 'CARRERA 2 # 14- 25', 'm@unad.com.co', 45424235 , 1);
INSERT INTO administrativos   VALUES(3, 'DIANA MILENA', 'JIMENEZ DUARTE', 8243834, 'CALLE 63 # 10 - 12', 'd@unad.com.co', 4642245 , 2);
INSERT INTO administrativos   VALUES(4, 'SAMUEL LEONARDO', 'AVELLA GAMBOA', 245857, 'AVENIDA KENNEDY', 's@unad.com.co', 3645878 , 3);

INSERT INTO escuela VALUES(1, 'Escuela de Ciencias Básicas, Tecnología e Ingeniería - ECBTI', 1);
INSERT INTO escuela VALUES(2, 'Escuela de Ciencias Administrativas, Contables, Económicas y de Negocios - ECACEN', 2);
INSERT INTO escuela VALUES(3, 'Escuela de Ciencias Sociales, Artes y Humanidades - ECSAH', 3);

INSERT INTO estudiante   VALUES(1, 'JHONATAN ', 'CASAS NORTES', 123456789, 'CARRERA 45 89 74', 'jhonatan@unad.com.co', '74102000' , '315636545', 1, 1, 1, 1, 3);
INSERT INTO estudiante   VALUES(2, 'GEERALDINEE', 'VARGAS', 123456789, 'AVENIDA BOAYCA', 'geraldinee@unad.com.co', '125479634' , '3165487894', 3, 4, 3, 3, 4);
INSERT INTO estudiante   VALUES(3, 'PAOLA', 'CHIVATA', 123456789, 'CALLE 78 #10-23 ', 'paola@unad.com.co', '874231547' , '3175144512', 2, 3, 2, 2, 2);

INSERT INTO docente VALUES(1, 'FELIPE ', 'GARCIA', 123456789, 'CARRERA 12 - 63-64', 'felipe@unad.com.co' , '318546741', 1, 1, 1, 2);
INSERT INTO docente VALUES(2, 'DANIEL', 'AWADS', 123456789, 'AVENIDA CIRCUNVALAR', 'daniel@unad.com.co' , '31963204', 2, 2, 2, 1);
INSERT INTO docente VALUES(3, 'JUAN', 'LEAL', 123456789, 'CALLE 1 # 10 -30', 'juan@unad.com.co' , '3202354145', 3, 3, 3, 1);

INSERT INTO b_learning  VALUES(1, 2, 1, 2);
INSERT INTO b_learning  VALUES(2, 3, 3, 1);
INSERT INTO b_learning  VALUES(3, 1, 2, 3);

INSERT INTO asistencia  VALUES(1, 'PRIMERA SESION', '05-01-2021', 2);
INSERT INTO asistencia  VALUES(2, 'SEGUNDA SESION', '06-02-2021', 1);
INSERT INTO asistencia  VALUES(3, 'PRIMERA SESION', '06-03-2021', 3);

SELECT estudiante.nombres, estudiante.apellidos, estudiante.documento, estudiante.correo, estudiante.codigo, estudiante.celular, programa.nombre, zona.nombre, centro.nombre, escuela.nombre, cursos.nombre
FROM estudiante
INNER JOIN programa ON estudiante.programa_id=programa.id
INNER JOIN zona ON estudiante.zona_id=zona.id
INNER JOIN centro ON estudiante.centro_id=centro.id
INNER JOIN escuela ON estudiante.escuela_id=escuela.id
INNER JOIN cursos ON estudiante.cursos_id=cursos.id;

SELECT COUNT(estudiante.nombres)
FROM estudiante;

SELECT SUM(documento)
FROM docente;

SELECT AVG(documento)
FROM docente;

SELECT MIN(fecha)
FROM asistencia;
