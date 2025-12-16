connect admin_cliente/1234@cliente

TRUNCATE TABLE cuenta;
TRUNCATE TABLE banco;
TRUNCATE TABLE comprador;
TRUNCATE TABLE empresa;
TRUNCATE TABLE productor_producto;
TRUNCATE TABLE tipo_producto;
TRUNCATE TABLE productor;
TRUNCATE TABLE zona;
TRUNCATE TABLE socio;

connect admin_operacion/1234@operacion

TRUNCATE TABLE compra_descarga;
TRUNCATE TABLE venta_extraccion;
TRUNCATE TABLE rastreo_transporte;
TRUNCATE TABLE evidencia_operacion;
TRUNCATE TABLE pago_venta;
TRUNCATE TABLE cuenta_op;
TRUNCATE TABLE historico_estatus_operacion;
TRUNCATE TABLE operacion;
TRUNCATE TABLE estatus_operacion;
TRUNCATE TABLE tipo_producto_op;
TRUNCATE TABLE camion;
TRUNCATE TABLE modelo;
TRUNCATE TABLE bodega;
TRUNCATE TABLE centro_resguardo;
TRUNCATE TABLE ubicacion;
TRUNCATE TABLE municipio;
TRUNCATE TABLE entidad;
TRUNCATE TABLE empleado;
TRUNCATE TABLE historico_sueldo;
TRUNCATE TABLE puesto;


@DML/01-main-DML.sql