--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta C - Mostrar datos generales de las PDBs.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL name FORMAT a20
COL open_mode FORMAT a15

SELECT con_id, name, open_mode, total_size/1024/1024/1024 as total_size_gb
FROM v$pdbs;