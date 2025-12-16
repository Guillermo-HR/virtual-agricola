--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta J - Mostrar el detalle de uso de la FRA (Fast Recovery Area).

connect c##sys_modulos_virtualAgricola/1234 as sysdba 



SET LINESIZE 200
SET PAGESIZE 100
COL file_type FORMAT a30

SELECT file_type, percent_space_used, percent_space_reclaimable, number_of_files, con_id
FROM v$flash_recovery_area_usage;