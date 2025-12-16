--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Inserción de datos para la TABLA "ESTATUS_OPERACION" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando insercion de registros en la tabla estaus_operacion

INSERT INTO estatus_operacion (clave, descripcion)
    VALUES ('0PROG', 'Programada');
INSERT INTO estatus_operacion (clave, descripcion)
    VALUES ('0INCD', 'Iniciada');
INSERT INTO estatus_operacion (clave, descripcion)
    VALUES ('0ENCU', 'En curso');
INSERT INTO estatus_operacion (clave, descripcion)
    VALUES ('0CANC', 'Cancelada');
INSERT INTO estatus_operacion (clave, descripcion)
    VALUES ('0CONC', 'Concluida');

Prompt -> Insercion de registros en la tabla estatus_operacion completada