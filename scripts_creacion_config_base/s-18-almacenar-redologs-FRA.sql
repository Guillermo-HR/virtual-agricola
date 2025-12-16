--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  13/12/2025
--@Descripción: Almacenar REDOLOGS en la FRA 

Prompt ===============================================
Prompt CHECAR EL SCRIPT PARA SEGUIR LAS INSTRUCCIONES 
Prompt ===============================================

exit 

connect c##sys_modulos_virtualAgricola/1234 as sysdba


-- Creacion de nuevos Grupos (Al omitir sus miembros, se crea un solo miembro y se almacena en la FRA)

alter database add logfile group 4 size 50M blocksize 512; 

alter database add logfile group 5 size 50M blocksize 512; 

alter database add logfile group 6 size 50M blocksize 512; 

--- Se agregan miembros fuera de la FRA para cada grupo nuevo creado 


--- GRUPO 4
alter database add logfile member '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo04a.log' to group 4; 

alter database add logfile member '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo04b.log' to group 4; 


--- GRUPO 5
alter database add logfile member '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo05a.log' to group 5; 

alter database add logfile member '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo05b.log' to group 5; 

-- GRUPO 6

alter database add logfile member '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo06a.log' to group 6; 


alter database add logfile member '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo06b.log' to group 6; 

-- El último paso es poder borrar los grupo REDOLOGS obsoletos. Para eliminarlos los grupos deben de estar en estado INACTIVE. Para lograr eso se deben aplicar log switches y checkpoints.

-- Ver la tabla "SELECT * FROM v$log;"

--alter system switch logfile; 
--alter system checkpoint; 