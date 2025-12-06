--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla banco
Prompt =========================================================

INSERT INTO banco (clave, nombre)
VALUES ('BNA', 'Banco Azteca');
INSERT INTO banco (clave, nombre)
VALUES ('BNM', 'Banamex');
INSERT INTO banco (clave, nombre)
VALUES ('HSB', 'HSBC');
INSERT INTO banco (clave, nombre)
VALUES ('SCO', 'Scotiabank');
INSERT INTO banco (clave, nombre)
VALUES ('BBV', 'BBVA Bancomer');
INSERT INTO banco (clave, nombre)
VALUES ('STN', 'Santander');
INSERT INTO banco (clave, nombre)
VALUES ('INB', 'Inbursa');
INSERT INTO banco (clave, nombre)
VALUES ('BCO', 'BanCoppel');
INSERT INTO banco (clave, nombre)
VALUES ('MIF', 'Mifel');
INSERT INTO banco (clave, nombre)
VALUES ('BX+', 'Banco del Bajío');
INSERT INTO banco (clave, nombre)
VALUES ('AFM', 'Afirme');
INSERT INTO banco (clave, nombre)
VALUES ('AZL', 'Banco Finterra');
INSERT INTO banco (clave, nombre)
VALUES ('PPC', 'Citibanamex');
INSERT INTO banco (clave, nombre)
VALUES ('BAJ', 'Banregio');
INSERT INTO banco (clave, nombre)
VALUES ('FIN', 'Actinver');
INSERT INTO banco (clave, nombre)
VALUES ('BAK', 'Banca Mifel');
INSERT INTO banco (clave, nombre)
VALUES ('BMF', 'BAMSA');
INSERT INTO banco (clave, nombre)
VALUES ('TBC', 'Banco Sabadell');
INSERT INTO banco (clave, nombre)
VALUES ('NVO', 'Intercam Banco');
INSERT INTO banco (clave, nombre)
VALUES ('PAT', 'Bank of America');
INSERT INTO banco (clave, nombre)
VALUES ('DTS', 'Deutsche Bank');
INSERT INTO banco (clave, nombre)
VALUES ('JPM', 'J.P. Morgan');
INSERT INTO banco (clave, nombre)
VALUES ('BCI', 'CI Banco');
INSERT INTO banco (clave, nombre)
VALUES ('SAB', 'Sabadell');
INSERT INTO banco (clave, nombre)
VALUES ('BVA', 'Bancoppel');
INSERT INTO banco (clave, nombre)
VALUES ('UNI', 'Unión de Crédito');
INSERT INTO banco (clave, nombre)
VALUES ('GPM', 'GPM Casa de Bolsa');
INSERT INTO banco (clave, nombre)
VALUES ('CAP', 'Crédito Familiar');
INSERT INTO banco (clave, nombre)
VALUES ('INV', 'Invex Banco');
INSERT INTO banco (clave, nombre)
VALUES ('VTA', 'Ve por Más (BX+)');

COMMIT;

Prompt =========================================================
Prompt Insercion de registros en tabla banco finalizada
Prompt =========================================================