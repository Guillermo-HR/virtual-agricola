--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  16/12/2025
--@Descripción: Simula un dia de insercion

-- Lunes

connect admin_operacion/1234@operacion

EXEC INSERTAR_OPERACIONES(70,50 , to_date('24-12-2025', 'DD-MM-YYYY'))

EXEC CANCELAR_INICIAR_OPERACIONES(to_date('24-12-2025', 'DD-MM-YYYY'))

EXEC INSERTAR_PAGO_VENTAS
EXEC INSERTAR_EVIDENCIAS_OPERACION

exit