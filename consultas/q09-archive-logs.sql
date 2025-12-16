--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta I - Mostrar el detalle de los archived redo logs generados.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL name FORMAT a60
COL completion_time FORMAT a20
COL is_recovery_dest_file FORMAT a20

SELECT recid, name, dest_id, sequence#, completion_time, is_recovery_dest_file, backup_count, con_id
FROM v$archived_log
ORDER BY sequence#;