--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en la tabla zona
Prompt =========================================================

INSERT INTO zona (clave, descripcion)
    VALUES ('00NTR', 'Zona Norte');
INSERT INTO zona (clave, descripcion)
    VALUES ('00SUR', 'Zona Sur');
INSERT INTO zona (clave, descripcion)
    VALUES ('00CTR', 'Zona Centro');

COMMIT;

Prompt =========================================================
Prompt Insercion de registros en la tabla zona completada
Prompt =========================================================