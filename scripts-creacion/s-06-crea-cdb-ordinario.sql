--@Autor:       Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha creación:  06/12/2025
--@Descripción:    Crea una CDB

connect sys/Hola1234* as sysdba
startup nomount

whenever sqlerror exit rollback

create database free
    user sys IDENTIFIED by system2
    user system IDENTIFIED by system2
    logfile group 1 (
        '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo01a.log',
        '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo01b.log'
    ) size 50m blocksize 512,
    group 2 (
        '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo02a.log',
        '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo02b.log'
    ) size 50m blocksize 512,
    group 3 (
        '/unam/bda/discos/disk1/app/oracle/oradata/FREE/redo03a.log', 
        '/unam/bda/discos/disk2/app/oracle/oradata/FREE/redo03b.log'
    ) size 50m blocksize 512
    maxloghistory 1
    maxlogfiles 16
    maxlogmembers 3
    maxdatafiles 1024
    character set AL32UTF8
    national character set AL16UTF16
    extent management local
        datafile '/unam/bda/discos/disk4/app/oracle/oradata/FREE/system01.dbf' 
            size 500m autoextend on next 10m maxsize UNLIMITED
    sysaux datafile '/unam/bda/discos/disk4/app/oracle/oradata/FREE/sysaux01.dbf' 
        size 300m autoextend on next 10m maxsize UNLIMITED
    default tablespace users
        datafile '/unam/bda/discos/disk4/app/oracle/oradata/FREE/users01.dbf'
        size 50m autoextend on next 10m maxsize unlimited
    default temporary tablespace tempts1
        tempfile '/unam/bda/discos/disk4/app/oracle/oradata/FREE/temp01.dbf'
        size 20m autoextend on next 1m maxsize unlimited
    undo tablespace undotbs1
        datafile '/unam/bda/discos/disk4/app/oracle/oradata/FREE/undotbs01.dbf'
        size 100m autoextend on next 5m maxsize unlimited
    enable pluggable DATABASE
        SEED
            file_name_convert = ('/unam/bda/discos/disk4/app/oracle/oradata/FREE', '/unam/bda/discos/disk4/app/oracle/oradata/FREE/pdbseed')
        system datafiles size 250m autoextend on next 10m maxsize unlimited
        sysaux datafiles size 200m autoextend on next 10m maxsize unlimited
    local undo ON
;

alter user sys identified by system2; 
alter user system identified by system2; 