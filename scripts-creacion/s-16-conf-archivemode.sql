--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: Administración de Archive Redo Logs

connect c##sys_modulos_virtualAgricola/1234 as sysdba

whenever sqlerror exit rollback


----- Configuración de parámetros (mínimos)

alter system set log_archive_dest_1='LOCATION=/unam/bda/discos/disk10/archivelogs/';

alter system set log_archive_format = 'arch_%t_%s_%r.arc' scope=spfile;

alter system set log_archive_min_succeed_dest=1; 

----------------------------

----------

shutdown immediate
startup mount; 
alter database archivelog; 
alter database open; 

select log_mode from v$database; 

---------


