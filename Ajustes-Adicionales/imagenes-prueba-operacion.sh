#!/bin/bash
#@Autor:        Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
#@Fecha:        14/12/2025
#@Descripcioń:  Copia a servidor de las imagenes para el MODULO OPERACION


# IMAGENES PARA EL MODULO DE OPERACION

absolute_path="/unam/bda/discos/disk4/app/oracle/oradata/FREE/files_operacion"

zip_file="/unam/bda/practicas/16/operacion_images.zip"

sudo -u oracle bash << EOF
echo " ==> Crear el directorio físico en el server"
mkdir -p ${absolute_path}
rm -f ${absolute_path}/*.jpg
unzip -j ${zip_file} -d ${absolute_path}
echo "Verificando archivos copiados"
echo "Fotos en el directorio ${absolute_path} :"
ls -l ${absolute_path} | grep .jpg | wc -l
EOF