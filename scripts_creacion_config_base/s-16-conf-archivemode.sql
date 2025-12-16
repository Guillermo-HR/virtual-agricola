--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: Administración de Archive Redo Logs (Debido a que se añade a la FRA esta ya debe de estar habilitada)


Prompt ===============================
Prompt ++Configuracion de ARchive Mode 

connect c##sys_modulos_virtualAgricola/1234 as sysdba

whenever sqlerror exit rollback
set feedback off

-- Respaldo de SPILE
create pfile from spfile;

----- Configuración de parámetros (mínimos)

alter system set log_archive_max_processes=2; 

alter system set log_archive_dest_1='LOCATION=/unam/bda/discos/disk10/archivelogs/ MANDATORY';

alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST';

alter system set log_archive_format = 'arch_%t_%s_%r.arc' scope=spfile;

alter system set log_archive_min_succeed_dest=1; 

--- Denter la instancia e iniciar en modo mount ----
shutdown immediate
startup mount; 
-----

alter database archivelog; 
alter database open; 

select log_mode from v$database; 

Prompt -> Configuracion completada
Prompt ===============================


