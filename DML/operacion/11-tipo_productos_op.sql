--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento sinc_tipo_producto_op

CREATE OR REPLACE PROCEDURE SINC_TIPO_PRODUCTO_OP
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando sincronizacion de registros en tabla tipo_producto');
    --
    DBMS_OUTPUT.PUT_LINE('> Sincronizacion de registros en la tabla tipo_producto completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al sincronizar tipo_producto: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento sinc_tipo_producto_op completada