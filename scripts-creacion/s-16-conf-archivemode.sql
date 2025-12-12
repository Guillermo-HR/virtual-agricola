--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: Administración de Archive Redo Logs

connect c##sys_modulos_virtualAgricola/1234 as sysdba


----- Configuración de parámetros (mínimos)

alter system set log_archive_dest_1='LOCATION=/unam/bda/discos/disk10/archivelogs/';

alter system set log_archive_format = 'arch_%t_%s_%r.arc';

alter system set log_archive_min_succeed_dest=1; 

----------------------------

----------

alter database mount; 

alter database archivelog; 

alter database open; 

---------


