--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  16/12/2025
--@Descripción: Simula un dos dias de insercion

-- Sábado

connect admin_operacion/1234@operacion

EXEC INSERTAR_RASTREO_TRANSPORTE(to_date('8-12-2025', 'DD-MM-YYYY'))

EXEC INSERTAR_OPERACIONES(50,70 , to_date('8-12-2025', 'DD-MM-YYYY'))

EXEC CANCELAR_INICIAR_OPERACIONES(to_date('8-12-2025', 'DD-MM-YYYY'))

EXEC INSERTAR_PAGO_VENTAS
EXEC INSERTAR_EVIDENCIAS_OPERACION
EXEC carga_img_evidencia()

-- Domingo

EXEC INSERTAR_RASTREO_TRANSPORTE(to_date('9-12-2025', 'DD-MM-YYYY'))

EXEC INSERTAR_OPERACIONES(65,65 , to_date('9-12-2025', 'DD-MM-YYYY'))

EXEC CANCELAR_INICIAR_OPERACIONES(to_date('9-12-2025', 'DD-MM-YYYY'))

EXEC INSERTAR_PAGO_VENTAS
EXEC INSERTAR_EVIDENCIAS_OPERACION
EXEC carga_img_evidencia()

exit