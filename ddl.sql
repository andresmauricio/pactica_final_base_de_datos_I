CREATE DATABASE IF NOT EXISTS ejercito;
USE ejercito;


CREATE TABLE IF NOT EXISTS unidad (
  id_unidad INT AUTO_INCREMENT PRIMARY KEY ,
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS compania (
  id_compania INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL,
  actividad VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS ubicacion (
  id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS cuartel (
  id_cuartel INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  ubicacion_id_ubicacion INT NOT NULL,
  FOREIGN KEY (ubicacion_id_ubicacion) REFERENCES ubicacion (id_ubicacion)
);

CREATE TABLE IF NOT EXISTS grado (
  id_grado INT AUTO_INCREMENT PRIMARY KEY,
  grado VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS soldado (
  id_soldado INT AUTO_INCREMENT PRIMARY KEY,
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  unidad_id_unidad INT NOT NULL,
  compania_id_compania INT NOT NULL,
  cuartel_id_cuartel INT NOT NULL,
  grado_id_grado INT NOT NULL,
  FOREIGN KEY (unidad_id_unidad) REFERENCES unidad (id_unidad),
  FOREIGN KEY (compania_id_compania) REFERENCES compania (id_compania),
  FOREIGN KEY (cuartel_id_cuartel) REFERENCES cuartel (id_cuartel),
  FOREIGN KEY (grado_id_grado) REFERENCES grado (id_grado)
);

CREATE TABLE IF NOT EXISTS servicio (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS compania_has_cuartel (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compania_id_compania INT NOT NULL,
  cuartel_id_cuartel INT NOT NULL,
  FOREIGN KEY (compania_id_compania) REFERENCES compania (id_compania),
  FOREIGN KEY (cuartel_id_cuartel) REFERENCES cuartel (id_cuartel)
);

CREATE TABLE IF NOT EXISTS soldado_has_servicio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  soldado_id_soldado INT NOT NULL,
  servicio_id_servicio INT NOT NULL,
  FOREIGN KEY (soldado_id_soldado) REFERENCES soldado (id_soldado),
  FOREIGN KEY (servicio_id_servicio) REFERENCES servicio (id_servicio)
);