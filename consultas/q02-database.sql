--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta B - Mostrar datos generales de la CDB.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL name FORMAT a10
COL created FORMAT a20
COL log_mode FORMAT a15
COL open_mode FORMAT a15
COL platform_name FORMAT a30

SELECT name, created, log_mode, open_mode, platform_name, current_scn, flashback_on, cdb
FROM v$database;