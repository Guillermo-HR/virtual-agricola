--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta F - Mostrar las características de cada grupo de redo logs.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL status FORMAT a15

SELECT group#, sequence#, members, archived, status, con_id
FROM v$log;