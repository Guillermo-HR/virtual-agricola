--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Inserción de datos para la TABLA "MUNICIPIO" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando insercion de registros en la tabla municipio

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Aguascalientes', 1);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Jesús María', 1);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Calvillo', 1);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Mexicali', 2);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Tijuana', 2);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Ensenada', 2);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'La Paz', 3);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Los Cabos', 3);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Comondú', 3);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Campeche', 4);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Carmen', 4);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Calkiní', 4);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Saltillo', 5);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Torreón', 5);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Monclova', 5);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Colima', 6);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Manzanillo', 6);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Villa de Álvarez', 6);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Tuxtla Gutiérrez', 7);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'San Cristóbal de las Casas', 7);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Tapachula', 7);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Chihuahua', 8);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Ciudad Juárez', 8);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Hidalgo del Parral', 8);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Durango', 9);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Gómez Palacio', 9);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Lerdo', 9);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'León', 10);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Guanajuato', 10);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Celaya', 10);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Acapulco de Juárez', 11);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Chilpancingo de los Bravo', 11);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Iguala de la Independencia', 11);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Pachuca de Soto', 12);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Tulancingo de Bravo', 12);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Tizayuca', 12);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Guadalajara', 13);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Zapopan', 13);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Tlaquepaque', 13);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Toluca', 14);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Nezahualcóyotl', 14);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Ecatepec de Morelos', 14);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Morelia', 15);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Uruapan', 15);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Zamora', 15);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Cuernavaca', 16);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Jiutepec', 16);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Cuautla', 16);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Tepic', 17);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Bahía de Banderas', 17);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Santiago Ixcuintla', 17);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Monterrey', 18);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Guadalupe', 18);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'San Nicolás de los Garza', 18);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Oaxaca de Juárez', 19);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Salina Cruz', 19);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Huajuapan de León', 19);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Puebla', 20);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Tehuacán', 20);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'San Martín Texmelucan', 20);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Querétaro', 21);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'San Juan del Río', 21);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Corregidora', 21);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Benito Juárez (Cancún)', 22);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Othón P. Blanco (Chetumal)', 22);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Solidaridad (Playa del Carmen)', 22);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'San Luis Potosí', 23);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Soledad de Graciano Sánchez', 23);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Ciudad Valles', 23);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Culiacán', 24);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Mazatlán', 24);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Ahome', 24);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Hermosillo', 25);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Cajeme', 25);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Nogales', 25);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Centro (Villahermosa)', 26);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Cárdenas', 26);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Comalcalco', 26);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Ciudad Victoria', 27);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Reynosa', 27);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Tampico', 27);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Tlaxcala', 28);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Apizaco', 28);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Huamantla', 28);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Veracruz', 29);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Xalapa', 29);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Coatzacoalcos', 29);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Mérida', 30);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Kanasín', 30);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Umán', 30);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Zacatecas', 31);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Fresnillo', 31);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Guadalupe', 31);

INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (1, 'Cuauhtémoc', 32);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (2, 'Benito Juárez', 32);
INSERT INTO municipio (numero_municipio, nombre, entidad_id)
    VALUES (3, 'Coyoacán', 32);

Prompt -> Insercion de registros en la tabla municipio completada
