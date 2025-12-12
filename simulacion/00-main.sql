--@Autor: 
--@Fecha creación: 
--@Descripción:
-- Ejecutar el script estando en terminal en la ruta /unam/bda/virtual-agricola

whenever sqlerror exit rollback

-- Crear tablas
@DDL/03-main-DDL.sql

-- Insertar datos tablas catalogo y crear procedimientos
@DML/01-main-DML.sql

-- Insertar datos tablas cliente
@simulacion/01-simular_dias.sql