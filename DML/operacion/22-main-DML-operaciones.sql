--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

-- Quitar esto despues de pruebas 
@DDL/02-operacion.sql

Prompt =========================================================
Prompt Iniciando creacion de triggers modulo operacion
Prompt =========================================================

@DML/operacion/01-trigger_sueldos.sql
@DML/operacion/13-trigger_estatus_operaciones.sql

Prompt =========================================================
Prompt Creacion de triggers modulo operacion completada
Prompt =========================================================

Prompt =========================================================
Prompt Iniciando insercion de datos en tablas catalogo modulo operacion
Prompt =========================================================

@DML/operacion/02-puestos.sql
@DML/operacion/04-entidades.sql
@DML/operacion/05-municipios.sql
@DML/operacion/09-modelos.sql
@DML/operacion/12-estatus_operaciones.sql

Prompt =========================================================
Prompt Insercion de datos en tablas catalogo modulo operacion completada
Prompt =========================================================

Prompt =========================================================
Prompt Iniciando creacion de procedimientos modulo operacion
Prompt =========================================================

@DML/operacion/03-empleados.sql
@DML/operacion/06-ubicaciones.sql
@DML/operacion/07-centros_resguardo.sql
@DML/operacion/08-bodegas.sql
@DML/operacion/10-camiones.sql
@DML/operacion/14-operaciones.sql
@DML/operacion/15-cancelar_iniciar_operaciones.sql
@DML/operacion/17-pago_ventas.sql
@DML/operacion/18-evidencias_operacion.sql
@DML/operacion/19-rastreo_transportes.sql

Prompt =========================================================
Prompt Creacion de procedimientos modulo operacion completada
Prompt =========================================================

-- quitar esto despues de pruebas
set SERVEROUTPUT ON
exec INSERTAR_EMPLEADOS(1, 1, 1)
exec INSERTAR_UBICACIONES(1, 1)
exec INSERTAR_CENTRO_RESGUARDO
exec INSERTAR_BODEGAS
exec INSERTAR_CAMIONES(1)
-- En lo que hago la sincronizacion
insert into tipo_producto_op(tipo_producto_id, nombre, activo) 
    values (1, 'Granos', TRUE);
insert into cuenta_op (cuenta_id, clabe, titular, banco, activo)
    values (1, '012345678901234567', 'Juan Perez', 'Banco Ejemplo', TRUE);
--exec INSERTAR_OPERACIONES(1, 0, to_date('10-12-2025', 'DD-MM-YYYY'))
-- exec 
--exec INSERTAR_PAGO_VENTAS
--update operacion set estatus_operacion_id = 2, fecha_status=to_date('11-12-2025', 'DD-MM-YYYY') where operacion_id = 1;
--exec INSERTAR_EVIDENCIAS_OPERACION
--exec INSERTAR_RASTREO_TRANSPORTE(to_date('12-12-2025', 'DD-MM-YYYY'))