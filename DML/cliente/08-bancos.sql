--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Inserción de datos para la TABLA "BANCO" (pdb: cliente)

whenever sqlerror exit rollback
set feedback off

Prompt ++Iniciando insercion de registros en tabla banco

INSERT INTO banco (clave, nombre) VALUES ('BNA', 'Banco Azteca');
INSERT INTO banco (clave, nombre) VALUES ('BNM', 'Banamex');
INSERT INTO banco (clave, nombre) VALUES ('HSB', 'HSBC');
INSERT INTO banco (clave, nombre) VALUES ('SCO', 'Scotiabank');
INSERT INTO banco (clave, nombre) VALUES ('BBV', 'BBVA Bancomer');
INSERT INTO banco (clave, nombre) VALUES ('STN', 'Santander');
INSERT INTO banco (clave, nombre) VALUES ('INB', 'Inbursa');
INSERT INTO banco (clave, nombre) VALUES ('BCO', 'BanCoppel');
INSERT INTO banco (clave, nombre) VALUES ('MIF', 'Mifel');
INSERT INTO banco (clave, nombre) VALUES ('BX+', 'Banco del Bajío');
INSERT INTO banco (clave, nombre) VALUES ('AFM', 'Afirme');
INSERT INTO banco (clave, nombre) VALUES ('AZL', 'Banco Finterra');
INSERT INTO banco (clave, nombre) VALUES ('PPC', 'Citibanamex');
INSERT INTO banco (clave, nombre) VALUES ('BAJ', 'Banregio');
INSERT INTO banco (clave, nombre) VALUES ('FIN', 'Actinver');
INSERT INTO banco (clave, nombre) VALUES ('BAK', 'Banca Mifel');
INSERT INTO banco (clave, nombre) VALUES ('BMF', 'BAMSA');
INSERT INTO banco (clave, nombre) VALUES ('TBC', 'Banco Sabadell');
INSERT INTO banco (clave, nombre) VALUES ('NVO', 'Intercam Banco');
INSERT INTO banco (clave, nombre) VALUES ('PAT', 'Bank of America');
INSERT INTO banco (clave, nombre) VALUES ('DTS', 'Deutsche Bank');
INSERT INTO banco (clave, nombre) VALUES ('JPM', 'J.P. Morgan');
INSERT INTO banco (clave, nombre) VALUES ('BCI', 'CI Banco');
INSERT INTO banco (clave, nombre) VALUES ('SAB', 'Sabadell');
INSERT INTO banco (clave, nombre) VALUES ('BVA', 'Bancoppel');
INSERT INTO banco (clave, nombre) VALUES ('UNI', 'Unión de Crédito');
INSERT INTO banco (clave, nombre) VALUES ('GPM', 'GPM Casa de Bolsa');
INSERT INTO banco (clave, nombre) VALUES ('CAP', 'Crédito Familiar');
INSERT INTO banco (clave, nombre) VALUES ('INV', 'Invex Banco');
INSERT INTO banco (clave, nombre) VALUES ('VTA', 'Ve por Más (BX+)');
INSERT INTO banco (clave, nombre) VALUES ('BDI', 'Banco Daimler');
INSERT INTO banco (clave, nombre) VALUES ('PIB', 'Banco Pibank');
INSERT INTO banco (clave, nombre) VALUES ('PRD', 'Prudential Bank');
INSERT INTO banco (clave, nombre) VALUES ('ALF', 'Alfa Crédito');
INSERT INTO banco (clave, nombre) VALUES ('ZNA', 'Zenith Bank');
INSERT INTO banco (clave, nombre) VALUES ('CSB', 'Credit Suisse');
INSERT INTO banco (clave, nombre) VALUES ('BCH', 'Banco Chinameca');
INSERT INTO banco (clave, nombre) VALUES ('COB', 'CODI Banco Digital');
INSERT INTO banco (clave, nombre) VALUES ('GFT', 'Grupofinanzas');
INSERT INTO banco (clave, nombre) VALUES ('LNR', 'Línea de Negocios Rural');
INSERT INTO banco (clave, nombre) VALUES ('CAJ', 'Caja Solidaria Mexicana');
INSERT INTO banco (clave, nombre) VALUES ('REG', 'Banco Regional del Norte');
INSERT INTO banco (clave, nombre) VALUES ('PAC', 'Financiera del Pacífico');
INSERT INTO banco (clave, nombre) VALUES ('AGR', 'Banco Agrario de México');
INSERT INTO banco (clave, nombre) VALUES ('MET', 'Metropolitano Financiero');
INSERT INTO banco (clave, nombre) VALUES ('TLA', 'Banco Tlaxcala');
INSERT INTO banco (clave, nombre) VALUES ('PUM', 'Patrimonio Universal Mexicano');
INSERT INTO banco (clave, nombre) VALUES ('OPO', 'Oportunidad Crédito');
INSERT INTO banco (clave, nombre) VALUES ('AUR', 'Aurum Banca Privada');
INSERT INTO banco (clave, nombre) VALUES ('CMN', 'Comercial Mexicana Banco');
INSERT INTO banco (clave, nombre) VALUES ('BVL', 'Banca Virtual Líder');
INSERT INTO banco (clave, nombre) VALUES ('BNC', 'Banco Nuevo Capital');
INSERT INTO banco (clave, nombre) VALUES ('AEX', 'Agroexportaciones Financiamiento');
INSERT INTO banco (clave, nombre) VALUES ('SER', 'Servicios Crediticios S.A.');
INSERT INTO banco (clave, nombre) VALUES ('COF', 'Cofide Financiamiento');
INSERT INTO banco (clave, nombre) VALUES ('EKO', 'EcoBank Verde');
INSERT INTO banco (clave, nombre) VALUES ('PRV', 'Providencia Financiera');
INSERT INTO banco (clave, nombre) VALUES ('MEX', 'Banco de México Digital');
INSERT INTO banco (clave, nombre) VALUES ('GLO', 'Global Trust Bank');
INSERT INTO banco (clave, nombre) VALUES ('TEC', 'Tecnología Financiera Ban');
INSERT INTO banco (clave, nombre) VALUES ('SOL', 'Solidez Patrimonial');
INSERT INTO banco (clave, nombre) VALUES ('RPL', 'Rápida Liquidez');
INSERT INTO banco (clave, nombre) VALUES ('DEX', 'Desarrollo Xpress');
INSERT INTO banco (clave, nombre) VALUES ('CFG', 'Crédito Fácil Garantizado');
INSERT INTO banco (clave, nombre) VALUES ('INT', 'Intermediario Financiero');
INSERT INTO banco (clave, nombre) VALUES ('BCA', 'Banca Comunitaria Agrícola');
INSERT INTO banco (clave, nombre) VALUES ('FUT', 'Futuro Financiero');
INSERT INTO banco (clave, nombre) VALUES ('AHO', 'Caja de Ahorro Popular');
INSERT INTO banco (clave, nombre) VALUES ('VLS', 'Valores Seguros');
INSERT INTO banco (clave, nombre) VALUES ('BPP', 'Banca Personal Plus');
INSERT INTO banco (clave, nombre) VALUES ('ZAA', 'Zafiro Asset Management');
INSERT INTO banco (clave, nombre) VALUES ('TRF', 'Transfiere Banca Móvil');
INSERT INTO banco (clave, nombre) VALUES ('NEX', 'Nexum Capital');
INSERT INTO banco (clave, nombre) VALUES ('KPL', 'Kapital Inversiones');
INSERT INTO banco (clave, nombre) VALUES ('BLU', 'BlueSky Bank');
INSERT INTO banco (clave, nombre) VALUES ('OAS', 'Oasis Financiero');
INSERT INTO banco (clave, nombre) VALUES ('FCE', 'Financiamiento Céntrico');
INSERT INTO banco (clave, nombre) VALUES ('BCR', 'Banca de Crédito Rural');
INSERT INTO banco (clave, nombre) VALUES ('GNC', 'Generación Capital');
INSERT INTO banco (clave, nombre) VALUES ('VEX', 'Vanguardia Express');
INSERT INTO banco (clave, nombre) VALUES ('DVM', 'Desarrollo y Vivienda México');
INSERT INTO banco (clave, nombre) VALUES ('CDL', 'Crédito Directo Local');
INSERT INTO banco (clave, nombre) VALUES ('PLT', 'Platino Financial');
INSERT INTO banco (clave, nombre) VALUES ('BNE', 'Banco Nacional Emprendedor');
INSERT INTO banco (clave, nombre) VALUES ('FIP', 'Fideicomiso Patrimonial');
INSERT INTO banco (clave, nombre) VALUES ('ASC', 'Ascenso Financiero');
INSERT INTO banco (clave, nombre) VALUES ('PNT', 'Punto de Inversión');
INSERT INTO banco (clave, nombre) VALUES ('DGT', 'Digital Trust Co.');
INSERT INTO banco (clave, nombre) VALUES ('BRC', 'Banco Rico');
INSERT INTO banco (clave, nombre) VALUES ('PFS', 'Profesionales Financieros');
INSERT INTO banco (clave, nombre) VALUES ('WLT', 'Wallet Virtual');
INSERT INTO banco (clave, nombre) VALUES ('ZET', 'Zeta Banca');
INSERT INTO banco (clave, nombre) VALUES ('GTO', 'Guanajuato Capital');
INSERT INTO banco (clave, nombre) VALUES ('HDS', 'Hacienda Servicios');
INSERT INTO banco (clave, nombre) VALUES ('LUN', 'Luna Soluciones');
INSERT INTO banco (clave, nombre) VALUES ('MRR', 'Maravilla Rural');
INSERT INTO banco (clave, nombre) VALUES ('ORQ', 'Orquídea Bank');
INSERT INTO banco (clave, nombre) VALUES ('RDC', 'Red Crédito Consumo');
INSERT INTO banco (clave, nombre) VALUES ('TLN', 'Talento Nacional');
INSERT INTO banco (clave, nombre) VALUES ('XPL', 'Xplora Inversiones');
INSERT INTO banco (clave, nombre) VALUES ('YUC', 'Yucatán Financiero');
INSERT INTO banco (clave, nombre) VALUES ('ZIT', 'Zitro Banca');

COMMIT;

Prompt -> Insercion de registros en tabla banco completada