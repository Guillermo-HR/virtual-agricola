--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
-- @Fecha: 16/12/2025
-- @Descripcion: Consulta K - Mostrar el detalle de backup pieces generadas hasta el momento.

connect c##sys_modulos_virtualAgricola/1234 as sysdba 

SET LINESIZE 300
SET PAGESIZE 100
COL recid FORMAT 9999
COL backup_type FORMAT a5
COL tag FORMAT a20
COL controlfile_included FORMAT a7
COL total_pieces FORMAT 999
COL piecen FORMAT 999
COL copyr FORMAT 999
COL device_type FORMAT a10
COL completion_time FORMAT a18
COL mbs FORMAT 99999.99
COL handle FORMAT a60

SELECT bp.recid, bs.backup_type, bp.tag, bs.controlfile_included, bs.pieces as total_pieces, 
       bp.piece# as piecen, bp.copy# as copyr, bp.device_type, 
       TO_CHAR(bp.completion_time, 'DD/MM/YY HH24:MI:SS') as completion_time, 
       bp.bytes/1024/1024 as mbs, bp.handle
FROM v$backup_piece bp
JOIN v$backup_set bs ON bp.set_stamp = bs.set_stamp AND bp.set_count = bs.set_count
ORDER BY bp.recid;