--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta L - Mostrar el total de backups y espacio por tipo.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 



SET LINESIZE 200
SET PAGESIZE 100
COL backup_type FORMAT a10

Prompt =============================================
Prompt EVIDENCIA DE LOS BACKUPS

SELECT bs.backup_type, bs.incremental_level, count(distinct bs.set_stamp) as num_backups, 
       sum(bp.bytes)/1024/1024/1024 as total_gb
FROM v$backup_set bs
JOIN v$backup_piece bp ON bs.set_stamp = bp.set_stamp AND bs.set_count = bp.set_count
GROUP BY bs.backup_type, bs.incremental_level
ORDER BY bs.backup_type, bs.incremental_level;

Prompt ==================================================

EXIT; 