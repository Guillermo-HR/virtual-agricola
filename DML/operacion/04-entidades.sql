--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Inserción de datos para la TABLA "ENTIDAD" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando insercion de registros en la tabla entidad

INSERT INTO entidad (clave, nombre) 
    VALUES ('00AGS', 'Aguascalientes');
INSERT INTO entidad (clave, nombre) 
    VALUES ('000BC', 'Baja California');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00BCS', 'Baja California Sur');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00CAM', 'Campeche');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00COA', 'Coahuila');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00COL', 'Colima');
INSERT INTO entidad (clave, nombre) 
    VALUES ('0CHIS', 'Chiapas');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00CHH', 'Chihuahua');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00DUR', 'Durango');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00GTO', 'Guanajuato');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00GRO', 'Guerrero');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00HGO', 'Hidalgo');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00JAL', 'Jalisco');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00MEX', 'México');
INSERT INTO entidad (clave, nombre) 
    VALUES ('0MICH', 'Michoacán');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00MOR', 'Morelos');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00NAY', 'Nayarit');
INSERT INTO entidad (clave, nombre) 
    VALUES ('000NL', 'Nuevo León');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00OAX', 'Oaxaca');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00PUE', 'Puebla');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00QRO', 'Querétaro');
INSERT INTO entidad (clave, nombre) 
    VALUES ('000QR', 'Quintana Roo');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00SLP', 'San Luis Potosí');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00SIN', 'Sinaloa');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00SON', 'Sonora');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00TAB', 'Tabasco');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00TAM', 'Tamaulipas');
INSERT INTO entidad (clave, nombre) 
    VALUES ('0TLAX', 'Tlaxcala');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00VER', 'Veracruz');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00YUC', 'Yucatán');
INSERT INTO entidad (clave, nombre) 
    VALUES ('00ZAC', 'Zacatecas');
INSERT INTO entidad (clave, nombre) 
    VALUES ('0CDMX', 'Ciudad de México');

Prompt -> Insercion de registros en la tabla entidad completada
