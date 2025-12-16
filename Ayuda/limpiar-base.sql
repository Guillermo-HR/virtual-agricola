
connect admin_cliente/1234@cliente

drop table if exists cuenta;
drop table if exists banco;
drop table if exists comprador;
drop table if exists empresa;
drop table if exists productor_producto;
drop table if exists tipo_producto;
drop table if exists productor;
drop table if exists zona;
drop table if exists socio;

connect admin_operacion/1234@operacion

drop table if exists compra_descarga;
drop table if exists venta_extraccion;
drop table if exists rastreo_transporte;
drop table if exists evidencia_operacion;
drop table if exists pago_venta;
drop table if exists cuenta_op;
drop table if exists historico_estatus_operacion;
drop table if exists operacion;
drop table if exists estatus_operacion;
drop table if exists tipo_producto_op;
drop table if exists camion;
drop table if exists modelo;
drop table if exists bodega;
drop table if exists centro_resguardo;
drop table if exists ubicacion;
drop table if exists municipio;
drop table if exists entidad;
drop table if exists empleado;
drop table if exists historico_sueldo;
drop table if exists puesto;

@scripts_creacion_config_base/s-13-crea-tablespaces_ordinario.sql
@scripts_creacion_config_base/s-14-pdb-admin-user_ordinario.sql

@DDL/03-main-DDL.sql

@Ajustes-Adicionales/s-15_2-crear-dictionary_ordinario.sql
@Ajustes-Adicionales/s-15_3-carga-blobs-cliente.sql
@Ajustes-Adicionales/BLOB-OPERACION/licencia.sql
@Ajustes-Adicionales/BLOB-OPERACION/fachada.sql
@Ajustes-Adicionales/BLOB-OPERACION/camion.sql
@Ajustes-Adicionales/BLOB-OPERACION/evidencia.sql

@DML/01-main-DML.sql

