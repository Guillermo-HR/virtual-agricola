#!/bin/bash
# @Autor: Julian Bolaños y Daniel Galindo
# @Fecha: 15/12/2025
# @Descripción: Ciclos de Backups

# --------------------------------------------------------------------------
# Configuración del Entorno
# --------------------------------------------------------------------------

export ORACLE_SID=free
export ORA_SCRIPTS="/unam/bda/proyectoFinal/virtual-agricola"

# Validar directorios
if [ ! -d "$ORA_SCRIPTS" ]; then
    echo "ERROR: Directorio de scripts no encontrado: $ORA_SCRIPTS"
    exit 1
fi

rman target / <<EOF
DELETE NOPROMPT BACKUP;
EXIT;
EOF

# --------------------------------------------------------------------------
# DOMINGO: INICIO DE CICLO
# --------------------------------------------------------------------------

# Carga inicial de datos
echo "--------- Carga inicial  -------------"
sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-0.sql

echo "--------- Incremental 0  -------------"
# Backup Full (Incremental Level 0) a la FRA 
rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl0.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# LUNES: Operación + Diferencial
# --------------------------------------------------------------------------
echo "--------- 1. Lunes  -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-1.sql

echo "--------- Diferencial 1 -------------"

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Miercoles : Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 1. Miercoles  -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-2.sql

echo "--------- Diferencial 1  -------------"

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base s-xx-backup-lvl1-diff.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# Viernes: Operación + Diferencial
# --------------------------------------------------------------------------

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-3.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Domingo: Operación + Acumulativo
# --------------------------------------------------------------------------

echo "--------- 1. Domingo   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-4.sql


echo "--------- Acumulativo 1   -------------"

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-acum.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# LUNES: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 2. Lunes   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-5.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Miercoles : Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 2. Miercoles   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-6.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# Viernes: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 2. Viernes  -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-7.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman


# --------------------------------------------------------------------------
# Domingo: Operación + Acumulativo
# --------------------------------------------------------------------------

echo "--------- 2. Domingo   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-8.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-acum.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# LUNES: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 3. Lunes   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-9.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Miercoles : Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 3. Miercoles   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-10.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Viernes: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 3. Viernes   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-11.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Domingo: Operación + Acumulativo
# --------------------------------------------------------------------------

echo "--------- 3. Domingo   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-12.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-acum.rman

# --------------------------------------------------------------------------
# LUNES: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 4. Lunes   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-13.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

# --------------------------------------------------------------------------
# Miercoles : Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 4. Miercoles  -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-14.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

# --------------------------------------------------------------------------
# Viernes: Operación + Diferencial
# --------------------------------------------------------------------------

echo "--------- 4. Viernes   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-15.sql

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl1-diff.rman


# --------------------------------------------------------------------------
# Domingo: Operación  + FULL BACKUP + Nivel 0
# --------------------------------------------------------------------------

echo "--------- 4. Domingo   -------------"

sqlplus -S /nolog @${ORA_SCRIPTS}/simulacion/insert-16.sql


rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-full-backup.rman

rman target / cmdfile=${ORA_SCRIPTS}/scripts_creacion_config_base/s-xx-backup-lvl0.rman

sqlplus -S /nolog @${ORA_SCRIPTS}/consultas/q12-backup-summary.sql

