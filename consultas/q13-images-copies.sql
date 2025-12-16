--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/20255
-- @Descripcion: Consulta M - Backups tipo image copy.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100
COL tag FORMAT a30

SELECT tag, count(*) as num_files, sum(blocks*block_size)/1024/1024 as total_mb
FROM v$datafile_copy
GROUP BY tag
ORDER BY tag;