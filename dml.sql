-- INSEERT UNIDADES --
INSERT INTO unidad(id_unidad, codigo, nombre)
VALUES  (NULL, 1001, 'Brigada Contra el Narcotrafico'),
        (NULL, 1002, 'Brigada de Fuerzas Especiales'),
        (NULL, 1003, 'Asalto Aereo');

-- INSEERT COMPAÑIAS --
INSERT INTO compania(id_compania, numero, actividad)
VALUES  (NULL, 2001, 'Compania Uno'),
        (NULL, 2002, 'Compania Dos'),
        (NULL, 2003, 'Compania Tres');
        
-- INSEERT UBICACION --
INSERT INTO ubicacion(id_ubicacion, ciudad)
VALUES  (NULL, 'Duitama'),
        (NULL, 'Bogota'),
        (NULL, 'Tolemaida');

-- INSEERT CUARTEL --
INSERT INTO cuartel(id_cuartel, codigo, nombre, ubicacion_id_ubicacion)
VALUES  (NULL, 3001, 'Cuartel Genral', 3),
        (NULL, 3002, 'Cuartel de Presidente', 2),
        (NULL, 3002,'Cuartel Aereo', 2);

-- INSEERT GRADO --
INSERT INTO grado(id_grado, grado)
VALUES  (NULL, 'Razo'),
        (NULL, 'Profesional');

-- INSEERT SOLDADO --
INSERT INTO soldado(id_soldado, codigo, nombre, apellido, unidad_id_unidad, compania_id_compania, cuartel_id_cuartel, grado_id_grado)
VALUES  (NULL, 4001, 'Andres', 'Acelas', 1, 1, 2, 2),
        (NULL, 4002, 'Maurico', 'Arevalo', 2, 1, 2, 2),
        (NULL, 4003, 'Felipe', 'Garcia', 1, 2, 1, 2),
        (NULL, 4004, 'Daniel', 'Torres', 1, 3, 3, 1);

-- INSEERT SERVICIO --
INSERT INTO servicio(id_servicio, codigo, nombre)
VALUES  (NULL, 6001, 'Centinela'),
        (NULL, 6002, 'Guardia de Honor'),
        (NULL, 7002,'Servicio de Porteria');

-- INSEERT MANY CUARTEL - COMPANIA --
INSERT INTO compania_has_cuartel(id, compania_id_compania, cuartel_id_cuartel)
VALUES  (NULL, 1, 1),
        (NULL, 1, 1),
        (NULL, 2, 3);

-- INSEERT MANY SOLDADO - servicio --
INSERT INTO soldado_has_servicio(id, soldado_id_soldado, servicio_id_servicio)
VALUES  (NULL, 1, 1),
        (NULL, 1, 2),
        (NULL, 3, 2);

        

