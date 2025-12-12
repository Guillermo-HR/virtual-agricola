--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_evidencias_operacion

CREATE OR REPLACE PROCEDURE INSERTAR_EVIDENCIAS_OPERACION
AS
    v_operacion_id    evidencia_operacion.operacion_id%TYPE;
    v_n_evidencias    NUMBER;

    CURSOR c_evidencias_pendientes IS
        SELECT
            o.operacion_id
        FROM
            operacion o
        LEFT JOIN
            evidencia_operacion eo ON o.operacion_id = eo.operacion_id
        WHERE
            o.estatus_operacion_id = 2
            AND eo.operacion_id IS NULL;

BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla evidencia_operacion');
    FOR r_evidencia IN c_evidencias_pendientes
    LOOP
        v_operacion_id := r_evidencia.operacion_id;
        v_n_evidencias := TRUNC(DBMS_RANDOM.VALUE(1, 11));
        FOR i IN 1 .. v_n_evidencias
        LOOP
            BEGIN
                INSERT INTO evidencia_operacion (numero_evidencia, foto, operacion_id)
                VALUES (i, empty_blob(), v_operacion_id);
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    DBMS_OUTPUT.PUT_LINE('* Error al insertar evidencia_operacion: ' || SQLERRM);
                    RAISE;
            END;
        END LOOP;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla evidencia_operacion completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar evidencia_operacion: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_evidencias_operacion completada