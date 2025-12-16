--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: Procedimiento para sincronizar la TABLA "CUENTA_OP" en 
-- en la pdb "OPERACION" con su real "CUENTA" en la pdb "CLIENTE"

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento sinc_cuentas_op

CREATE OR REPLACE PROCEDURE SINC_CUENTAS_OP
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando sincronizacion de registros en tabla cuentas_op');
    --
    DBMS_OUTPUT.PUT_LINE('> Sincronizacion de registros en la tabla cuentas_op completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar cuentas_op: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento sinc_cuentas_op completada