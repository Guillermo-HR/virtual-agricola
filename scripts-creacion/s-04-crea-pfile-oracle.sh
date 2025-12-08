#!/bin/bash
#@Autor:        Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:        06/12/2025
#@Descripción:  Creación de un archivo de parámetros PFILE

echo "1. Creando un archivo de parámetros básico"
export ORACLE_SID=free
pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora

if [ -f "${pfile}" ];then
    read -p "El archivo ${pfile} ya existe, [enter] para sobreescribir"
fi; 

echo \
"db_name=${ORACLE_SID}
memory_target=768M
control_files=(
/unam/bda/discos/disk1/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl, /unam/bda/discos/disk2/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,)
db_domain=fi.unam
enable_pluggable_database=true">$pfile

echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}