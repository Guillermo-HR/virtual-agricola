--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando insercion de registros en la tabla puesto

INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00DIR', 'Director General', 85500.00, TO_DATE('01-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00GRV', 'Gerente de Ventas', 62150.75, TO_DATE('15-06-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00GOP', 'Gerente de Operaciones', 58000.50, TO_DATE('01-03-2021', 'DD-MM-YYYY'), TO_DATE('31-12-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0JCOM', 'Jefe de Compras', 45200.90, TO_DATE('10-11-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0ALMA', 'Jefe de Almacén', 38750.30, TO_DATE('20-05-2022', 'DD-MM-YYYY'), TO_DATE('30-06-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00RTV', 'Representante Técnico de Ventas', 31500.45, TO_DATE('05-08-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00LOG', 'Coordinador de Logística', 29900.80, TO_DATE('12-04-2020', 'DD-MM-YYYY'), TO_DATE('15-01-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00CNT', 'Contador General', 49000.00, TO_DATE('18-02-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ATCOM', 'Asesor Técnico Comercial', 27000.10, TO_DATE('03-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0OPAL', 'Operador de Almacén', 15800.60, TO_DATE('25-10-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0CHFR', 'Chofer Repartidor', 18300.95, TO_DATE('07-01-2022', 'DD-MM-YYYY'), TO_DATE('01-11-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0AUXA', 'Auxiliar Administrativo', 12550.00, TO_DATE('14-03-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0VEND', 'Vendedor de Campo', 24600.25, TO_DATE('22-11-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00CAL', 'Inspector de Calidad', 20100.70, TO_DATE('01-07-2022', 'DD-MM-YYYY'), TO_DATE('01-10-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0TMTO', 'Técnico de Mantenimiento', 19450.35, TO_DATE('29-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0AGRO', 'Ingeniero Agrónomo', 35000.88, TO_DATE('05-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0SUPV', 'Supervisor de Sucursal', 40500.15, TO_DATE('11-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00CAJ', 'Cajero/a', 10500.50, TO_DATE('08-04-2022', 'DD-MM-YYYY'), TO_DATE('20-07-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0MPLA', 'Especialista en Manejo de Plagas', 28800.00, TO_DATE('17-06-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('000RH', 'Encargado de Recursos Humanos', 37100.65, TO_DATE('02-02-2020', 'DD-MM-YYYY'), TO_DATE('01-04-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00SEC', 'Secretaria/o de Dirección', 16900.99, TO_DATE('19-07-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('COMPR', 'Comprador de Productos Agrícolas', 33250.40, TO_DATE('04-05-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('00AUD', 'Auditor Interno', 51400.77, TO_DATE('13-10-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0TCOM', 'Técnico de Compras', 21850.12, TO_DATE('21-08-2022', 'DD-MM-YYYY'), TO_DATE('28-02-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('0APRO', 'Analista de Proyectos', 43900.55, TO_DATE('09-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GRNBD', 'Gerente de Bodega', 47200.33, TO_DATE('30-03-2020', 'DD-MM-YYYY'), null);

COMMIT;

Prompt > Insercion de registros en la tabla puesto completada