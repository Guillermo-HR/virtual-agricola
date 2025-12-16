--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Inserción de datos para la TABLA "ZONA" (pdb: cliente)

whenever sqlerror exit rollback
set feedback off

Prompt ++Iniciando insercion de registros en la tabla zona

-- Zonas de la Ciudad de México y alrededores
INSERT INTO zona (clave, descripcion) VALUES ('CMX_N', 'Zona Metropolitana Norte');
INSERT INTO zona (clave, descripcion) VALUES ('CMX_S', 'Zona Metropolitana Sur');
INSERT INTO zona (clave, descripcion) VALUES ('MEX_E', 'Estado de México Este');
INSERT INTO zona (clave, descripcion) VALUES ('MOR_C', 'Morelos Central');

-- Zonas del Bajío y Centro-Occidente
INSERT INTO zona (clave, descripcion) VALUES ('JAL_C', 'Jalisco Centro - Guadalajara');
INSERT INTO zona (clave, descripcion) VALUES ('JAL_N', 'Jalisco Norte - Cañones');
INSERT INTO zona (clave, descripcion) VALUES ('JAL_S', 'Jalisco Sur y Costa');
INSERT INTO zona (clave, descripcion) VALUES ('MICH_C', 'Michoacán Central - Morelia');
INSERT INTO zona (clave, descripcion) VALUES ('MICH_O', 'Michoacán Oeste - Costa');
INSERT INTO zona (clave, descripcion) VALUES ('GTO_B', 'Guanajuato - Bajío');
INSERT INTO zona (clave, descripcion) VALUES ('GTO_N', 'Guanajuato - Norte');
INSERT INTO zona (clave, descripcion) VALUES ('QRO_M', 'Querétaro - Metropolitano');
INSERT INTO zona (clave, descripcion) VALUES ('QRO_S', 'Querétaro - Sierra Gorda');

-- Zonas del Sureste y Golfo
INSERT INTO zona (clave, descripcion) VALUES ('PUE_V', 'Puebla - Valle de Puebla');
INSERT INTO zona (clave, descripcion) VALUES ('PUE_S', 'Puebla - Sierra Sur');
INSERT INTO zona (clave, descripcion) VALUES ('OAX_C', 'Oaxaca - Valles Centrales');
INSERT INTO zona (clave, descripcion) VALUES ('OAX_O', 'Oaxaca - Costa');
INSERT INTO zona (clave, descripcion) VALUES ('CHIS_A', 'Chiapas - Altos');
INSERT INTO zona (clave, descripcion) VALUES ('CHIS_C', 'Chiapas - Costa y Frontera');
INSERT INTO zona (clave, descripcion) VALUES ('VER_C', 'Veracruz - Centro');
INSERT INTO zona (clave, descripcion) VALUES ('VER_N', 'Veracruz - Norte');
INSERT INTO zona (clave, descripcion) VALUES ('VER_S', 'Veracruz - Sur');
INSERT INTO zona (clave, descripcion) VALUES ('TAB_V', 'Tabasco - La Venta');

-- Zonas del Norte y Pacífico Norte
INSERT INTO zona (clave, descripcion) VALUES ('NL_M', 'Nuevo León - Metropolitano');
INSERT INTO zona (clave, descripcion) VALUES ('NL_S', 'Nuevo León - Sierra y Citrícola');
INSERT INTO zona (clave, descripcion) VALUES ('BC_N', 'Baja California - Norte');
INSERT INTO zona (clave, descripcion) VALUES ('BC_S', 'Baja California - Sur');
INSERT INTO zona (clave, descripcion) VALUES ('SIN_C', 'Sinaloa - Centro');

COMMIT;

Prompt -> Insercion de registros en la tabla zona completada