#!/bin/bash
#@Autor         Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha         04/12/2025
#@Descripcion   Creacion del archivo de password

archivoPwd="${ORACLE_HOME}/dbs/orapwfree"

echo "Generando un archivo de passwords nuevo"

orapwd FILE=${archivoPwd} \
FORMAT=12.2 \
SYS=password password=Hola1234*

echo "Validando la existencia del nuevo archivo"
if [ -f "${archivoPwd}" ]; then
    echo "OK. Archivo de password generado"
else
    echo "ERROR: El archivo de passwords no ha sido regenerado"
    exit 1
fi; 