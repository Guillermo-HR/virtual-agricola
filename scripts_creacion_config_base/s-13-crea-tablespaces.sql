--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Creación de tablespaces para almacenar los datos del caso de estudio


connect c##sys_modulos_virtualAgricola/1234 as sysdba; 

whenever sqlerror exit rollback


-- Se configuran los tablespaces del modulo "cliente"

alter session set container=cliente;

-- Limpieza

drop tablespace if exists cliente_c2_cat_ts including contents and datafiles; 
drop tablespace if exists cliente_c1_data_ts including contents and datafiles; 
drop tablespace if exists cliente_c0_index_ts including contents and datafiles; 
drop tablespace if exists cliente_c2_lobs_ts including contents and datafiles;

------

create tablespace cliente_c2_cat_ts
    datafile '/unam/bda/discos/disk6/app/oracle/oradata/FREE/cliente/cliente_c2_cat_ts_01.dbf'
    size 50m 
    autoextend on next 15m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace cliente_c1_data_ts
    datafile '/unam/bda/discos/disk8/app/oracle/oradata/FREE/cliente/cliente_c1_data_ts_01.dbf'
    size 100m
    autoextend on next 25m maxsize unlimited 
    extent management local autoallocate
    segment space management auto
;

create tablespace cliente_c0_index_ts
    datafile '/unam/bda/discos/disk7/app/oracle/oradata/FREE/cliente/cliente_c0_index_ts_01.dbf'
    size 100m 
    autoextend on next 50m maxsize unlimited
    extent management local autoallocate
    segment space management auto
; 

create bigfile tablespace cliente_c2_lobs_ts
    datafile '/unam/bda/discos/disk6/app/oracle/oradata/FREE/cliente/cliente_c2_lobs_ts_01.dbf'
    size 2G
    autoextend on next 200m maxsize unlimited
    extent management local
    segment space management auto
; 

-- Se configuran los tablespaces del modulo "operacion"

alter session set container=operacion; 

--Limpieza

drop tablespace if exists operacion_c2_cat_ts including contents and datafiles; 
drop tablespace if exists operacion_c1_data_ts including contents and datafiles;
drop tablespace if exists operacion_c0_data_ts including contents and datafiles;
drop tablespace if exists operacion_c2_coldlob_ts including contents and datafiles;
drop tablespace if exists operacion_c1_hotlob_ts including contents and datafiles;
drop tablespace if exists operacion_c0_index_ts including contents and datafiles;
--

create tablespace operacion_c2_cat_ts
   datafile '/unam/bda/discos/disk6/app/oracle/oradata/FREE/operacion/operacion_c2_cat_ts_01.dbf'
   size 100m 
   autoextend on next 20m maxsize unlimited
   extent management local
   segment space management auto
; 

create tablespace operacion_c1_data_ts
    datafile '/unam/bda/discos/disk8/app/oracle/oradata/FREE/operacion/operacion_c1_data_ts_01.dbf'
    size 50m
    autoextend on next 10m maxsize unlimited
    extent management local
    segment space management auto
; 

create tablespace operacion_c0_data_ts
    datafile '/unam/bda/discos/disk5/app/oracle/oradata/FREE/operacion/operacion_c0_data_ts_01.dbf'
    size 100m
    autoextend on next 20m maxsize unlimited
    extent management local
    segment space management auto
; 

create tablespace operacion_c2_coldlob_ts
    datafile '/unam/bda/discos/disk6/app/oracle/oradata/FREE/operacion/operacion_c2_coldLob_ts_01.dbf'
    size 1G
    autoextend on next 500m maxsize unlimited
    extent management local
    segment space management auto
; 

create bigfile tablespace operacion_c1_hotlob_ts
    datafile '/unam/bda/discos/disk9/app/oracle/oradata/FREE/operacion/operacion_c2_hotLob_ts_01.dbf'
    size 6G
    AUTOEXTEND on next 3G maxsize unlimited
    extent management local
    segment space management auto
; 

create tablespace operacion_c0_index_ts
    datafile '/unam/bda/discos/disk7/app/oracle/oradata/FREE/operacion/operacion_c0_index_ts_01.dbf'
    size 300m
    AUTOEXTEND on next 100
    maxsize unlimited
    extent management local 
    segment space management auto
; 


Prompt > Creacion de tablespaces para la base de datos completada 

exit; 




