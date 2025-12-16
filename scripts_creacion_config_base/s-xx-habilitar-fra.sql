--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  11/12/2025
--@Descripción: Habilitar la Fast Recovery Area

whenever sqlerror exit rollback

set feedback off

Prompt =========================================
Prompt Configurando para habilitar la FRA

connect c##sys_modulos_virtualAgricola/1234 as sysdba

alter system set db_recovery_file_dest_size=2G; 

alter system set db_recovery_file_dest='/unam/bda/discos/disk3/app/oracle/fast_recovery';

alter system set db_flashback_retention_target=2880;


-- Habilta flash back

alter database flashback on;

Prompt FRA habilitada
Prompt ===============================================


