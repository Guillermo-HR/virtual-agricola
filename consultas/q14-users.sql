--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/20255
-- @Descripcion: Consulta N - Mostrar el detalle de los usuarios creados en toda la CDB.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 300
SET PAGESIZE 100
COL username FORMAT a25
COL account_status FORMAT a15
COL default_tablespace FORMAT a25
COL temporary_tablespace FORMAT a25
COL local_temp_tablespace FORMAT a25
COL created FORMAT a17
COL last_login FORMAT a17

SELECT username, account_status, default_tablespace, temporary_tablespace, 
       local_temp_tablespace, 
       TO_CHAR(created, 'DD/MM/YYYY HH24:MI') as created, 
       TO_CHAR(last_login, 'DD/MM/YYYY HH24:MI') as last_login, 
       con_id
FROM cdb_users
WHERE oracle_maintained = 'N'
ORDER BY con_id, username;