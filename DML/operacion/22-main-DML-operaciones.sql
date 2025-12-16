--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback


connect admin_operacion/1234@operacion 

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
@DML/operacion/11-tipo_productos_op.sql
@DML/operacion/14-operaciones.sql
@DML/operacion/15-cancelar_iniciar_operaciones.sql
@DML/operacion/16-cuentas_op.sql
@DML/operacion/17-pago_ventas.sql
@DML/operacion/18-evidencias_operacion.sql
@DML/operacion/20-ventas_extraccion.sql
@DML/operacion/21-compras_descarga.sql
@DML/operacion/19-rastreo_transportes.sql

Prompt =========================================================
Prompt Creacion de procedimientos modulo operacion completada
Prompt =========================================================