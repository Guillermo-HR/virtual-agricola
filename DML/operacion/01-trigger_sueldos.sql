--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: TRIGGER para poblar TABLA "SUELDOS" (pdb: operación)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de trigger para sueldo en tabla puesto

CREATE OR REPLACE TRIGGER TRG_SUELDO_PUESTO
AFTER UPDATE OF sueldo ON puesto
FOR EACH ROW
DECLARE
    v_fecha_fin historico_sueldo.fecha_fin%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registro en la tabla historico_sueldo');
    v_fecha_fin := :NEW.inicio_sueldo - 1;
    
    BEGIN
        INSERT INTO historico_sueldo(sueldo_actualizado, fecha_inicio, fecha_fin, puesto_id)
        VALUES (:OLD.sueldo, :OLD.inicio_sueldo, v_fecha_fin, :NEW.puesto_id);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('* Error al insertar historico_sueldo: ' || SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registro en la tabla historico_sueldo completada');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('* Error en el trigger TRG_SUELDO_PUESTO: ' || SQLERRM);
END TRG_SUELDO_PUESTO;
/

Prompt -> Creacion de trigger para sueldo en tabla puesto completada
