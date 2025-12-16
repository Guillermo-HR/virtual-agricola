--@Autor:       Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha creación:  06/12/2025
--@Descripción:    Creación de las pdb


connect sys/system2 as sysdba


whenever sqlerror exit rollback

create pluggable database cliente
    admin user cliente_admin_fake identified by 1234
    path_prefix = '/unam/bda/discos/disk4/app/oracle/oradata/FREE/'
    file_name_convert = ('/pdbseed/','/cliente/');

prompt abrir la PDB
alter pluggable database cliente open; 

prompt guardar el estado de la PDB
alter pluggable database cliente save state; 

connect sys/system2 as sysdba 

create pluggable database operacion
    admin user operacion_admin_fake identified by 1234
    path_prefix = '/unam/bda/discos/disk4/app/oracle/oradata/FREE/'
    file_name_convert = ('/pdbseed/','/operacion/');

prompt abrir la PDB
alter pluggable database operacion open; 

prompt guardar el estado de la PDB
alter pluggable database operacion save state;

