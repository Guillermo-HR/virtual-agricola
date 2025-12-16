--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/20255
-- @Descripcion: Consulta P - Resumen de segmentos por tablespace/owner.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 



SET LINESIZE 200
SET PAGESIZE 100
COL tablespace_name FORMAT a30
COL owner FORMAT a30

SELECT tablespace_name, owner, count(*) as total_segmentos, sum(extents) as total_extensiones, 
       sum(bytes)/1024/1024 as total_mb, con_id
FROM cdb_segments
WHERE owner IN (
    SELECT username FROM cdb_users WHERE oracle_maintained = 'N'
)
GROUP BY tablespace_name, owner, con_id
ORDER BY con_id, owner, tablespace_name;