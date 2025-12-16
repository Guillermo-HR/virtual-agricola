#!/bin/bash
#@Autor:    Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:    07/12/2025
#@Descripción:  Configura el archivo tnsnames para las conexiones a la base de datos. 

echo "Configurando el archivo tnsnames.ora"

archivo=${ORACLE_HOME}/network/admin/tnsnames.ora

if [ -f "${archivo}" ];then
    touch ${archivo}
    chmod 755 ${archivo}
fi; 

echo \
"
LISTENER_FREE =
  (ADDRESS = (PROTOCOL = TCP)(HOST = h2-bda-jzc.fi.unam)(PORT = 1521))

FREE =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = free.fi.unam)
    )
  )

FREE_SHARED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = SHARED)
      (SERVICE_NAME = free.fi.unam)
    )
  )

FREE_POOLED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = POOLED)
      (SERVICE_NAME = free.fi.unam)
    )
  )


CLIENTE =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = cliente.fi.unam)
    )
  )

CLIENTE_SHARED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = SHARED)
      (SERVICE_NAME = cliente.fi.unam)
    )
  )

CLIENTE_POOLED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = POOLED)
      (SERVICE_NAME = cliente.fi.unam)
    )
  )

OPERACION =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = operacion.fi.unam)
    )
  )

OPERACION_SHARED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = SHARED)
      (SERVICE_NAME = operacion.fi.unam)
    )
  )

OPERACION_POOLED =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = h-jzc-proy-final.fi.unam)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = POOLED)
      (SERVICE_NAME = operacion.fi.unam)
    )
  )
">${archivo}

echo "Archivo configurado, ya se pueden utlizar diferentes alias de servicio"