--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en la tabla zona
Prompt =========================================================

insert into zona (clave, descripcion)
    values ('NTR', 'Zona Norte');
insert into zona (clave, descripcion)
    values ('SUR', 'Zona Sur');
insert into zona (clave, descripcion)
    values ('CTR', 'Zona Centro');

commit;