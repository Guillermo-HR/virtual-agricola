--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta A - Mostrar datos generales de la instancia.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 

SET LINESIZE 200
SET PAGESIZE 100
COL host_name FORMAT a30
COL instance_name FORMAT a15
COL version FORMAT a15
COL status FORMAT a15
COL database_status FORMAT a15
COL active_state FORMAT a15


SELECT host_name, instance_name, version, status, database_status, active_state, con_id
FROM v$instance;