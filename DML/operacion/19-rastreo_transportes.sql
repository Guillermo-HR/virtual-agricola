--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  10/12/2025
--@Descripción: PROCEDIMIENTO para poblar la TABLA "RASTREO_TRANSPORTE" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_rastreo_transporte

CREATE OR REPLACE PROCEDURE INSERTAR_RASTREO_TRANSPORTE (
    p_dia IN DATE
)
AS
    v_latitud_origen   ubicacion.latitud%TYPE;
    v_longitud_origen  ubicacion.longitud%TYPE;
    v_latitud_destino  ubicacion.latitud%TYPE;
    v_longitud_destino ubicacion.longitud%TYPE;
    v_observaciones   rastreo_transporte.observaciones%TYPE;
    v_folio_gps       rastreo_transporte.folio_gps%TYPE;
    v_operacion_id   rastreo_transporte.operacion_id%TYPE;
    v_paso           number:=0.05;
    v_latitud_actual  ubicacion.latitud%TYPE;
    v_longitud_actual ubicacion.longitud%TYPE;
    v_sentido_latitud  number;
    v_sentido_longitud number;
    v_fecha_hora_actual  rastreo_transporte.fecha_hora%TYPE;
    v_random_minutos_inicio NUMBER;

    CURSOR c_operaciones_pendientes IS
        SELECT
            o.operacion_id,
            o.fecha_status,
            u_o.latitud AS latitud_origen,
            u_o.longitud AS longitud_origen,
            u_d.latitud AS latitud_destino,
            u_d.longitud AS longitud_destino
        FROM
            operacion o
        JOIN
            ubicacion u_o ON o.origen_id = u_o.ubicacion_id
        JOIN
            ubicacion u_d ON o.destino_id = u_d.ubicacion_id
        LEFT JOIN
            rastreo_transporte rt ON o.operacion_id = rt.operacion_id
        WHERE
            o.estatus_operacion_id = 2 AND
            rt.operacion_id IS NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla rastreo_transporte');
    FOR r_operacion IN c_operaciones_pendientes
    LOOP
        v_operacion_id := r_operacion.operacion_id;
        v_latitud_origen := r_operacion.latitud_origen;
        v_longitud_origen := r_operacion.longitud_origen;
        v_latitud_destino := r_operacion.latitud_destino;
        v_longitud_destino := r_operacion.longitud_destino;
        v_folio_gps := 'GPS-' || dbms_random.string('X', 6);

        v_latitud_actual := v_latitud_origen;
        v_longitud_actual := v_longitud_origen;
        v_random_minutos_inicio := TRUNC(DBMS_RANDOM.VALUE(7*60, 13*60));
        v_fecha_hora_actual := p_dia + NUMTODSINTERVAL(v_random_minutos_inicio, 'MINUTE');

        BEGIN
            UPDATE operacion
            SET estatus_operacion_id = 3, fecha_status = v_fecha_hora_actual
            WHERE operacion_id = v_operacion_id;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al actualizar operacion ID ' || v_operacion_id || ': ' || SQLERRM);
        END;

        v_sentido_latitud := CASE
                                WHEN v_latitud_destino > v_latitud_origen THEN 1
                                ELSE -1
                             END;
        v_sentido_longitud := CASE
                                WHEN v_longitud_destino > v_longitud_origen THEN 1
                                ELSE -1
                              END;

        WHILE (v_latitud_actual != v_latitud_destino OR
               v_longitud_actual != v_longitud_destino)
        LOOP
            v_fecha_hora_actual := v_fecha_hora_actual + NUMTODSINTERVAL(10, 'MINUTE');
            IF ABS(v_latitud_actual - v_latitud_destino) > v_paso THEN
                v_latitud_actual := v_latitud_actual + (v_paso * v_sentido_latitud);
            ELSE
                v_latitud_actual := v_latitud_destino;
            END IF;
            IF ABS(v_longitud_actual - v_longitud_destino) > v_paso THEN
                v_longitud_actual := v_longitud_actual + (v_paso * v_sentido_longitud);
            ELSE
                v_longitud_actual := v_longitud_destino;
            END IF;
            v_observaciones := 'En ruta';

            BEGIN
                INSERT INTO rastreo_transporte (fecha_hora, latitud, longitud, observaciones, folio_gps, operacion_id)
                VALUES (v_fecha_hora_actual, v_latitud_actual, v_longitud_actual, v_observaciones, v_folio_gps, v_operacion_id);
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar rastreo_transporte para operacion_id ' || v_operacion_id || ': ' || SQLERRM);
            END;
        END LOOP;

        v_fecha_hora_actual := v_fecha_hora_actual + NUMTODSINTERVAL(10, 'MINUTE');
        v_observaciones := 'En destino';

            BEGIN
                INSERT INTO rastreo_transporte (fecha_hora, latitud, longitud, observaciones, folio_gps, operacion_id)
                VALUES (v_fecha_hora_actual, v_latitud_actual, v_longitud_actual, v_observaciones, v_folio_gps, v_operacion_id);
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar rastreo_transporte para operacion_id ' || v_operacion_id || ': ' || SQLERRM);
            END;

        BEGIN
            UPDATE operacion
            SET estatus_operacion_id = 5, fecha_status = v_fecha_hora_actual
            WHERE operacion_id = v_operacion_id;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al actualizar operacion ID ' || v_operacion_id || ': ' || SQLERRM);
        END;


    END LOOP;

        
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla rastreo_transporte completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar rastreo_transporte: ' || SQLERRM);
        RAISE;
END;
/

Prompt ->Creacion de procedimiento insertar_rastreo_transporte completada