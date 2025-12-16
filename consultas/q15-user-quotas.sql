--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/20255
-- @Descripcion: Consulta O - Cuotas de almacenamiento de usuarios.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL username FORMAT a30
COL tablespace_name FORMAT a30

SELECT u.username, q.tablespace_name, q.bytes/1024/1024 as charged_mb, q.max_bytes, u.con_id
FROM cdb_users u
JOIN cdb_ts_quotas q ON u.username = q.username AND u.con_id = q.con_id
WHERE u.oracle_maintained = 'N'
ORDER BY u.con_id, u.username, q.tablespace_name;