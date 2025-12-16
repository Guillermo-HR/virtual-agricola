--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta D - Mostrar datos de los tablespaces generados en toda la CDB.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 300
SET PAGESIZE 100
COL tablespace_name FORMAT a30
COL status FORMAT a10
COL contents FORMAT a15
COL extent_management FORMAT a15
COL segment_space_management FORMAT a15
COL retention FORMAT a15
COL bigfile FORMAT a10
COL encrypted FORMAT a10

SELECT tablespace_name, status, contents, extent_management, segment_space_management, 
       retention, bigfile, encrypted, con_id
FROM cdb_tablespaces
ORDER BY con_id, tablespace_name;