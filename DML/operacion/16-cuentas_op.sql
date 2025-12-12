--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento ***

CREATE OR REPLACE PROCEDURE ***
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla ***');
    --
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla *** completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar ***: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento *** completada