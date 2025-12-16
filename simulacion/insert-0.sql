--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  14/12/2025
--@Descripción: Primera insercion

whenever sqlerror exit rollback

connect admin_cliente/1234@cliente

EXEC carga_img_tipo_producto()

EXEC LLENAR_MODULO_CLIENTE(100, 100, 30) 

-- productores, compradores, productores-compradores
connect admin_operacion/1234@operacion

EXEC INSERTAR_EMPLEADOS(100, 40, 30)
EXEC carga_img_licencia()
EXEC INSERTAR_UBICACIONES(70, 130)
EXEC carga_img_fachada()
EXEC INSERTAR_CENTRO_RESGUARDO
EXEC INSERTAR_BODEGAS
EXEC INSERTAR_CAMIONES(70)
EXEC carga_img_camion()

--
INSERT INTO tipo_producto_op(tipo_producto_id,nombre,activo) values(1,'prueba',true);

INSERT INTO cuenta_op(cuenta_id,clabe,titular,banco,activo) values(1,'qwertyuiopasdfghjk','prueba','bancoPrueba',true);
commit; 
--

EXEC INSERTAR_OPERACIONES(100, 0, to_date('1-12-2025', 'DD-MM-YYYY')) 
-- compras, ventas
UPDATE OPERACION SET ESTATUS_OPERACION_ID = 2, FECHA_STATUS=TO_DATE('2-12-2025', 'DD-MM-YYYY');
EXEC INSERTAR_EVIDENCIAS_OPERACION
EXEC carga_img_evidencia()

EXEC INSERTAR_RASTREO_TRANSPORTE(to_date('2-12-2025', 'DD-MM-YYYY'))

exit
