--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/20255
-- @Descripcion: Consulta Q - Total de espacio reservado para el proyecto.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 


SET LINESIZE 200
SET PAGESIZE 100

SELECT sum(bytes)/1024/1024 as total_mb
FROM cdb_segments
WHERE owner IN (
    SELECT username FROM cdb_users WHERE oracle_maintained = 'N'
);