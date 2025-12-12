#!/bin/bash
#@Autor:        Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:        04/12/2025
#@Descripcioń:  Creación del contenedor para el proyecto final. 


echo "Creacion del contenedor para el manejo de la base de datos."

docker run -i -t \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${UNAM_HOME}:${UNAM_HOME} \
--name c-jzc-proy-final \
--hostname h-jzc-proy-final.fi.unam \
--network bda_network --ip 172.22.0.33 \
--expose 1521 \
--shm-size=2gb \
-e DISPLAY=$DISPLAY ol-jzc:1.0 bash

