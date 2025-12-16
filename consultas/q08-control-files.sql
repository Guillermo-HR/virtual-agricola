--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta H - Mostrar el detalle de las copias de los archivos de control.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL status FORMAT a15
COL name FORMAT a60
COL is_recovery_dest_file FORMAT a20

SELECT con_id, status, name, is_recovery_dest_file
FROM v$controlfile;