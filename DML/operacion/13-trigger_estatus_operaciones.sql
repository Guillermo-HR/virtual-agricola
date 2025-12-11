--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de trigger para estatus_operacion en tabla operacion

CREATE OR REPLACE TRIGGER TRG_ESTATUS_OPERACION
AFTER INSERT OR UPDATE OF estatus_operacion_id ON operacion
FOR EACH ROW
DECLARE
    v_fecha_fin historico_sueldo.fecha_fin%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registro en la tabla historico_estatus_operacion');

    BEGIN
        INSERT INTO historico_estatus_operacion (fecha_cambio_estatus, estatus_operacion_id, operacion_id)
        VALUES ( :NEW.fecha_status, :NEW.estatus_operacion_id, :NEW.operacion_id );
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('* Error al insertar historico_estatus_operacion: ' || SQLERRM);
    END;
    
    DBMS_OUTPUT.PUT_LINE('> Insercion de registro en la tabla historico_estatus_operacion completada');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('* Error en el trigger TRG_ESTATUS_OPERACION: ' || SQLERRM);
END TRG_ESTATUS_OPERACION;
/

Prompt > Creacion de trigger para estatus_operacion en tabla operacion completada