#!/bin/bash
#@Autor:    Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:    06/12/2025
#@Descripción:  Variables de entorno para la Base de Datos

echo "Configurando variables de entorno"

archivo=/etc/profile.d/99-custom-env.sh

cat << EOF >> $archivo
#Variables de entorno para Oracle

export ORACLE_HOSTNAME=h2-bda-jzc.fi.unam
export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=$ORACLE_BASE/product/23ai/dbhomeFree
export ORA_INVENTORY=$ORACLE_BASE/oraInventory
export ORACLE_SID=free
export NLS_LANG=American_America.AL32UTF8
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export NLS_DATE_FORMAT='yyyy/mm/dd hh24:mi:ss'

#alias globales

alias sqlplus='rlwrap sqlplus'
alias rman='rlwrap rman'
EOF

echo "Variables de entorno agregadas."
