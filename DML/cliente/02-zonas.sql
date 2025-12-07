--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set feedback off

Prompt - Iniciando insercion de registros en la tabla zona

INSERT INTO zona (clave, descripcion)
    VALUES ('00NTR', 'Zona Norte');
INSERT INTO zona (clave, descripcion)
    VALUES ('00SUR', 'Zona Sur');
INSERT INTO zona (clave, descripcion)
    VALUES ('00CTR', 'Zona Centro');

COMMIT;

Prompt > Insercion de registros en la tabla zona completada