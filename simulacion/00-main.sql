--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Prepara la base de datos para insertar datos

whenever sqlerror exit rollback

-- Crear tablas
@DDL/03-main-DDL.sql

@Ajustes-Adicionales/s-15_2-crear-dictionary_ordinario.sql
@Ajustes-Adicionales/s-15_3-carga-blobs-cliente.sql
@Ajustes-Adicionales/BLOB-OPERACION/licencia.sql
@Ajustes-Adicionales/BLOB-OPERACION/fachada.sql
@Ajustes-Adicionales/BLOB-OPERACION/camion.sql
@Ajustes-Adicionales/BLOB-OPERACION/evidencia.sql

-- Insertar datos tablas catalogo y crear procedimientos
@DML/01-main-DML.sql
