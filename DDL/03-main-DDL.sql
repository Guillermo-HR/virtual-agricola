--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt ========================================================
Prompt Iniciando creacion de objetos
Prompt ========================================================

@DDL/01-cliente.sql
@DDL/02-operacion.sql

Prompt ========================================================
Prompt Creacion de objetos completada
Prompt ========================================================

Prompt ========================================================
Prompt Otorgando permisos solobre las tablas creadas
Prompt =======================================================

@scripts-creacion/s-15-crea-usuarios-pdb.sql