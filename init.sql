-- Este script no se debe ejecutar, es solo para .github--


CREATE DATABASE IF NOT EXISTS universidad;
USE universidad;

CREATE TABLE IF NOT EXISTS test (
  id_unidad INT AUTO_INCREMENT PRIMARY KEY ,
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS test2 (
  id_compania INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL,
  actividad VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS test3 (
  id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(45) NOT NULL
);
