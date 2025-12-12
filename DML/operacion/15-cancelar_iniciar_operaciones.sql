--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento cancelar_iniciar_operaciones

CREATE OR REPLACE PROCEDURE CANCELAR_INICIAR_OPERACIONES (
    p_dia IN operacion.fecha_status%TYPE
)
AS
    v_pct_cancelacion NUMBER:=0.1;
    v_random_se_cancela NUMBER;

    CURSOR c_operaciones_activas IS
        SELECT operacion_id, tipo_operacion, cantidad
        FROM operacion
        WHERE estatus_operacion_id=1;

BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando cancelacion o inicio aleatorio de operaciones activas');
    FOR r_operacion IN c_operaciones_activas 
    LOOP
        v_random_se_cancela := ROUND(DBMS_RANDOM.VALUE(0, 1), 1);
        IF v_random_se_cancela <= v_pct_cancelacion THEN
            BEGIN 
                UPDATE operacion
                SET estatus_operacion_id = 4, fecha_status = p_dia
                WHERE operacion_id = r_operacion.operacion_id;
                IF r_operacion.tipo_operacion = 'C' THEN
                    UPDATE centro_resguardo
                    SET espacio_usado = espacio_usado - r_operacion.cantidad
                    WHERE ubicacion_id = v_destino_id;
                ELSE
                    UPDATE centro_resguardo
                    SET espacio_usado = espacio_usado + r_operacion.cantidad
                    WHERE ubicacion_id = v_origen_id;
                END IF;
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('* Error al cancelar operacion ID: ' || r_operacion.operacion_id || ' - ' || SQLERRM);
            END;
        ELSE
            BEGIN
                UPDATE operacion
                SET estatus_operacion_id = 2, fecha_status = p_dia
                    WHERE operacion_id = r_operacion.operacion_id;
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('* Error al iniciar operacion ID: ' || r_operacion.operacion_id || ' - ' || SQLERRM);
            END;
        END IF;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Cancelacion e inicializacion de operaciones activas completada');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('* Error al cancelar o iniciar operaciones: ' || SQLERRM);
END CANCELAR_INICIAR_OPERACIONES;
