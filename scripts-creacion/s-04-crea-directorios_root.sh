#!/bin/bash
#@Autor:        Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:        06/12/2025
#@Descripcioń:  Creación de directorios para gestionar la base de datos. 


# Para almacenar los controlfiles y redologs. 

cd ${UNAM_HOME}/bda/discos/disk1
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app

cd ${UNAM_HOME}/bda/discos/disk2
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app

# Disco para la FRA

cd ${UNAM_HOME}/bda/discos/disk3
mkdir -p app/oracle/fast_recovery/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app

# Para almacenar los datafiles tablspaces obligatorios (system,sysaux,undo y temp)

cd ${UNAM_HOME}/bda/discos/disk4
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app

cd ${UNAM_HOME}/bda/discos/disk4/app/oracle/oradata/${ORACLE_SID^^}
mkdir pdbseed
chown oracle:oinstall pdbseed
chmod 750 pdbseed

# Ruta para almacenar tablespaces del disk5

cd ${UNAM_HOME}/bda/discos/disk5
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/cliente
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/operacion
chown -R oracle:oinstall app
chmod -R 750 app

# Ruta para almacenar tablespaces del disk6

cd ${UNAM_HOME}/bda/discos/disk6
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/cliente
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/operacion
chown -R oracle:oinstall app
chmod -R 750 app


# Ruta para almacenar tablespaces del disk7

cd ${UNAM_HOME}/bda/discos/disk7
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/cliente
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/operacion
chown -R oracle:oinstall app
chmod -R 750 app


# Ruta para almacenar tablespaces del disk8

cd ${UNAM_HOME}/bda/discos/disk8
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/cliente
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/operacion
chown -R oracle:oinstall app
chmod -R 750 app


# Ruta para almacenar tablespaces del disk9

cd ${UNAM_HOME}/bda/discos/disk9
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/cliente
mkdir -p app/oracle/oradata/${ORACLE_SID^^}/operacion
chown -R oracle:oinstall app
chmod -R 750 app 


# Disco para backups

cd ${UNAM_HOME}/bda/discos/disk10
mkdir -p archivelogs/
chown -R oracle:oinstall archivelogs 
chmod -R 750 archivelogs
mkdir -p backups/
chown -R oracle:onistall backups
chmod -R 750 backups





