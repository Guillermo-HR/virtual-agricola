--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta G - Mostrar el detalle de cada uno de los miembros de los grupos de Redo Logs.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL status FORMAT a15
COL type FORMAT a10
COL member FORMAT a60
COL is_recovery_dest_file FORMAT a20

SELECT group#, status, type, member, is_recovery_dest_file, con_id
FROM v$logfile
ORDER BY group#;