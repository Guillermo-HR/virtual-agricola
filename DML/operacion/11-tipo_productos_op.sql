--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: Procedimiento para sincronizar la TABLA "TIPO_PRODUCTO_OP" en 
-- en la pdb "OPERACION" con su real "TIPO_PRODUCOT" en la pdb "CLIENTE"

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento sinc_tipo_producto_op

CREATE OR REPLACE PROCEDURE SINC_TIPO_PRODUCTO_OP
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando sincronizacion de registros en tabla tipo_producto_op');
    --
    DBMS_OUTPUT.PUT_LINE('> Sincronizacion de registros en la tabla tipo_producto_op completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al sincronizar tipo_producto_op: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento sinc_tipo_producto_op completada
