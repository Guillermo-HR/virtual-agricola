---@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025


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

@scripts_creacion_config_base/s-15-crea-usuarios-pdb_ordinario.sql