--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Inserción de datos para la TABLA "PUESTO" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando insercion de registros en la tabla puesto

INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DGENE', 'Director General', 85500.00, TO_DATE('01-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GVENT', 'Gerente de Ventas', 62150.75, TO_DATE('15-06-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GOPER', 'Gerente de Operaciones', 58000.50, TO_DATE('01-03-2021', 'DD-MM-YYYY'), TO_DATE('31-12-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JCOMP', 'Jefe de Compras', 45200.90, TO_DATE('10-11-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JALMA', 'Jefe de Almacén', 38750.30, TO_DATE('20-05-2022', 'DD-MM-YYYY'), TO_DATE('30-06-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('RTVEN', 'Representante Técnico de Ventas', 31500.45, TO_DATE('05-08-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CLOGI', 'Coordinador de Logística', 29900.80, TO_DATE('12-04-2020', 'DD-MM-YYYY'), TO_DATE('15-01-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CCONT', 'Contador General', 49000.00, TO_DATE('18-02-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ATCOM', 'Asesor Técnico Comercial', 27000.10, TO_DATE('03-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('OPALM', 'Operador de Almacén', 15800.60, TO_DATE('25-10-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CHFRE', 'Chofer Repartidor', 18300.95, TO_DATE('07-01-2022', 'DD-MM-YYYY'), TO_DATE('01-11-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('AUXAD', 'Auxiliar Administrativo', 12550.00, TO_DATE('14-03-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('VCAJE', 'Vendedor de Campo', 24600.25, TO_DATE('22-11-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ICALI', 'Inspector de Calidad', 20100.70, TO_DATE('01-07-2022', 'DD-MM-YYYY'), TO_DATE('01-10-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('TMANA', 'Técnico de Mantenimiento', 19450.35, TO_DATE('29-01-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('IAGRO', 'Ingeniero Agrónomo', 35000.88, TO_DATE('05-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('SUPVS', 'Supervisor de Sucursal', 40500.15, TO_DATE('11-09-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CAJER', 'Cajero/a', 10500.50, TO_DATE('08-04-2022', 'DD-MM-YYYY'), TO_DATE('20-07-2023', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('EPLAG', 'Especialista en Manejo de Plagas', 28800.00, TO_DATE('17-06-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ERHUM', 'Encargado de Recursos Humanos', 37100.65, TO_DATE('02-02-2020', 'DD-MM-YYYY'), TO_DATE('01-04-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('SDIRC', 'Secretaria/o de Dirección', 16900.99, TO_DATE('19-07-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('COMPR', 'Comprador de Productos Agrícolas', 33250.40, TO_DATE('04-05-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('AUDIN', 'Auditor Interno', 51400.77, TO_DATE('13-10-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('TCOMP', 'Técnico de Compras', 21850.12, TO_DATE('21-08-2022', 'DD-MM-YYYY'), TO_DATE('28-02-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('APROY', 'Analista de Proyectos', 43900.55, TO_DATE('09-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GRESP', 'Gerente de Centro de resguardo', 47200.33, TO_DATE('30-03-2020', 'DD-MM-YYYY'), null);

-- Puestos de Dirección/Gerencia (Nivel Alto)
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DMARK', 'Director de Marketing', 75000.00, TO_DATE('01-08-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DLOGS', 'Director de Logística y Cadena', 78000.00, TO_DATE('10-01-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GFINA', 'Gerente de Finanzas', 68500.20, TO_DATE('01-07-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('GTICE', 'Gerente de TI', 65000.50, TO_DATE('15-04-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DRHUM', 'Director de Recursos Humanos', 72000.90, TO_DATE('20-09-2020', 'DD-MM-YYYY'), null);

-- Puestos de Jefatura/Coordinación (Nivel Medio)
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JPRES', 'Jefe de Prensa y Comunicación', 42000.00, TO_DATE('01-03-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CSTOC', 'Coordinador de Stock e Inventario', 34500.75, TO_DATE('10-06-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JSEGU', 'Jefe de Seguridad e Higiene', 39000.10, TO_DATE('25-11-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CDIGT', 'Coordinador de Canales Digitales', 36000.40, TO_DATE('05-01-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JVERN', 'Jefe de Ventas Regional', 48500.60, TO_DATE('12-10-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('CJURI', 'Coordinador Jurídico', 55000.00, TO_DATE('18-05-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('JNGRU', 'Jefe de Negocios Rurales', 41000.80, TO_DATE('03-02-2022', 'DD-MM-YYYY'), null);

-- Puestos Técnicos y Especialistas (Nivel Operativo/Especializado)
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ANFIN', 'Analista Financiero', 32000.95, TO_DATE('01-04-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DESAR', 'Desarrollador de Software Jr.', 30500.30, TO_DATE('20-09-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('SOPTI', 'Técnico de Soporte TI', 25000.15, TO_DATE('11-11-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('DGRFC', 'Diseñador Gráfico', 26500.00, TO_DATE('07-03-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('EPREC', 'Especialista en Pre-cosecha', 38000.50, TO_DATE('14-06-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('EPOCO', 'Especialista Post-cosecha', 39500.10, TO_DATE('29-01-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('AOPER', 'Analista de Operaciones', 31000.70, TO_DATE('03-08-2020', 'DD-MM-YYYY'), TO_DATE('31-05-2024', 'DD-MM-YYYY'));
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ASRHU', 'Asistente de Recursos Humanos', 18500.20, TO_DATE('01-12-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('TMADV', 'Técnico de Mantenimiento Avanzado', 22000.45, TO_DATE('25-05-2020', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('IAGRI', 'Investigador Agrícola', 45000.99, TO_DATE('17-02-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('VSUCL', 'Vendedor de Sucursal', 20500.60, TO_DATE('04-04-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('ACMJR', 'Asesor Comercial Junior', 23000.80, TO_DATE('19-07-2022', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('OPPLA', 'Manejo de Operaciones de Planta', 27500.35, TO_DATE('13-09-2021', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('AYLOG', 'Ayudante de Logística', 14000.00, TO_DATE('02-10-2023', 'DD-MM-YYYY'), null);
INSERT INTO puesto(clave, descripcion, sueldo, inicio_sueldo, fin_sueldo)
    VALUES ('LPROY', 'Líder de Proyecto', 53000.10, TO_DATE('13-03-2020', 'DD-MM-YYYY'), null);

COMMIT;

Prompt -> Insercion de registros en la tabla puesto completada
