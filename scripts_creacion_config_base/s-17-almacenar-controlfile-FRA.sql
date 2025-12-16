--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  11/12/2025
--@Descripción: Almacenar controlfile en la FRA (Este archivo no se debe de ejecutar, se deben de seguir los pasos) (Se debe usar al usuario ORACLE del contenedor para poder acceder a RMAN)

Prompt ===============================================
Prompt CHECAR EL SCRIPT PARA SEGUIR LAS INSTRUCCIONES 
Prompt ===============================================

exit 

connect c##sys_modulos_virtualAgricola/1234 as sysdba

shutdown immediate
startup nomount

alteer system reset control_files scope=spfile; 

shutdown abort
startup nomount

connect c##backup_modulos_virtualAgricola/1234 as sysbackup

HOST rman target /

restore controlfile from '/unam/bda/discos/disk1/app/oracle/oradata/FREE/control01.ctl';

exit 

connect c##sys_modulos_virtualAgricola/1234 as sysdba

shutdown abort
startup nomount

alter system set 

-- Se debe de ejecutar la instruccion "show parameter control_files" y apuntar la ruta &direccion_FRA_controlFile

--alter system set control_files='/unam/bda/discos/disk1/app/oracle/oradata/FREE/control01.ctl','/unam/bda/discos/disk2/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl',&direccion_FRA_controlFile scope =spfile;

shutdown abort
startup 

-- Verificar que las rutas de los controlfile se almacenaron correctamente 
select * from v$controlfile;
