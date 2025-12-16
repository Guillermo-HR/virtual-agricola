--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta E - Mostrar datos de los datafiles generados en toda la CDB.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 

SET LINESIZE 300
SET PAGESIZE 100
COL tablespace_name FORMAT a30
COL file_name FORMAT a60
COL autoextensible FORMAT a15
COL online_status FORMAT a15

SELECT con_id, tablespace_name, file_id, file_name, bytes/1024/1024 as size_mb, 
       autoextensible, online_status
FROM cdb_data_files
ORDER BY con_id, tablespace_name;