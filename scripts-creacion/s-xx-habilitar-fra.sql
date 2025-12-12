--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  11/12/2025
--@Descripción: Habilitar la Fast Recovery Area



connect c##sys_modulos_virtualAgricola/1234 as sysdba

alter database flashback on;
alter system set db_recovery_file_dest='/unam/app/oracle/fast_recovery/FREE';
alter system set db_recovery_file_dest_size=1G;

alter database add logfile group 



