--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Creación de usuarios que aministren la base de datos


connect sys/system2 as sysdba

whenever sqlerror exit rollback

-------
-- CDB
-------

create user c##sys_modulos_virtualAgricola identified by 1234; 
grant create session to c##sys_modulos_virtualAgricola;
grant sysdba to c##sys_modulos_virtualAgricola container=all; 

create user c##backup_modulos_virtualAgricola identified by 1234; 
grant create session to c##backup_modulos_virtualAgricola; 
grant SYSBACKUP to c##backup_modulos_virtualAgricola container=all; 

EXIT

