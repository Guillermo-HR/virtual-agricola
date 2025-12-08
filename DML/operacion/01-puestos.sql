--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando insercion de registros en la tabla puesto

INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00DIR', 'Director General', 85500.00, TO_DATE('01-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('01GERV', 'Gerente de Ventas', 62150.75, TO_DATE('15-06-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('02GOP', 'Gerente de Operaciones', 58000.50, TO_DATE('01-03-2021', 'DD-MM-YYYY'), TO_DATE('31-12-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('03JCOM', 'Jefe de Compras', 45200.90, TO_DATE('10-11-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('04ALMA', 'Jefe de Almacén', 38750.30, TO_DATE('20-05-2022', 'DD-MM-YYYY'), TO_DATE('30-06-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('05RTV', 'Representante Técnico de Ventas', 31500.45, TO_DATE('05-08-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('06LOG', 'Coordinador de Logística', 29900.80, TO_DATE('12-04-2020', 'DD-MM-YYYY'), TO_DATE('15-01-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('07CONT', 'Contador General', 49000.00, TO_DATE('18-02-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('08ATCOM', 'Asesor Técnico Comercial', 27000.10, TO_DATE('03-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('09OPAL', 'Operador de Almacén', 15800.60, TO_DATE('25-10-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('10CHFR', 'Chofer Repartidor', 18300.95, TO_DATE('07-01-2022', 'DD-MM-YYYY'), TO_DATE('01-11-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('11AUXA', 'Auxiliar Administrativo', 12550.00, TO_DATE('14-03-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('12VEND', 'Vendedor de Campo', 24600.25, TO_DATE('22-11-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('13CAL', 'Inspector de Calidad', 20100.70, TO_DATE('01-07-2022', 'DD-MM-YYYY'), TO_DATE('01-10-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('14MTTO', 'Técnico de Mantenimiento', 19450.35, TO_DATE('29-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('15AGRO', 'Ingeniero Agrónomo', 35000.88, TO_DATE('05-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('16SUPV', 'Supervisor de Sucursal', 40500.15, TO_DATE('11-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('17CAJ', 'Cajero/a', 10500.50, TO_DATE('08-04-2022', 'DD-MM-YYYY'), TO_DATE('20-07-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('18MPLA', 'Especialista en Manejo de Plagas', 28800.00, TO_DATE('17-06-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('19RH', 'Encargado de Recursos Humanos', 37100.65, TO_DATE('02-02-2020', 'DD-MM-YYYY'), TO_DATE('01-04-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('20SEC', 'Secretaria/o de Dirección', 16900.99, TO_DATE('19-07-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('21COMPR', 'Comprador de Productos Agrícolas', 33250.40, TO_DATE('04-05-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('22AUD', 'Auditor Interno', 51400.77, TO_DATE('13-10-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('23TCOM', 'Técnico de Compras', 21850.12, TO_DATE('21-08-2022', 'DD-MM-YYYY'), TO_DATE('28-02-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('24APRO', 'Analista de Proyectos', 43900.55, TO_DATE('09-12-2021', 'DD-MM-YYYY'), null);

Prompt > Insercion de registros en la tabla puesto completada