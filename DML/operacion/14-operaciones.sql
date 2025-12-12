--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_operaciones

CREATE OR REPLACE PROCEDURE INSERTAR_OPERACIONES (
    p_n_compras IN NUMBER,
    p_n_ventas IN NUMBER,
    p_fecha_inicio IN DATE
)
AS
    v_total_operaciones NUMBER := p_n_compras + p_n_ventas;
    v_tipo_operacion  operacion.tipo_operacion%TYPE;
    v_cantidad operacion.cantidad%TYPE;
    v_precio_unitario operacion.precio_unitario%TYPE;
    v_pct_comision NUMBER;
    v_comision operacion.comision%TYPE;
    v_total operacion.total%TYPE;
    v_camion_id operacion.camion_id%TYPE;
    v_chofer_id operacion.chofer_id%TYPE;
    v_origen_id operacion.origen_id%TYPE;
    v_destino_id operacion.destino_id%TYPE;
    v_tipo_producto_id operacion.tipo_producto_id%TYPE;
    v_puesto_id_chofer puesto.puesto_id%TYPE;
    v_estatus_id_programada estatus_operacion.estatus_operacion_id%TYPE;
    v_cantidad_maxima NUMBER;
    v_cantidad_minima NUMBER;

BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla operacion');
    SELECT puesto_id
    INTO v_puesto_id_chofer
    FROM puesto
    WHERE descripcion = 'Chofer Repartidor';

    SELECT estatus_operacion_id
    INTO v_estatus_id_programada
    FROM estatus_operacion
    WHERE descripcion = 'Programada';
    FOR i IN 1 .. v_total_operaciones
    LOOP
        IF i <= p_n_compras THEN
            v_tipo_operacion := 'C';
            SELECT ubicacion_id 
            INTO v_origen_id
            FROM ubicacion
            WHERE not es_centro_resguardo
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROW ONLY;

            SELECT ubicacion_id 
            INTO v_destino_id
            FROM ubicacion
            WHERE es_centro_resguardo AND
                (capacidad_maxima - espacio_usado) > 0
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROW ONLY;
            
            IF SQL%NOTFOUND THEN
                RAISE_APPLICATION_ERROR(-20003, 'No hay centros de resguardo disponibles');
            END IF;

            SELECT ROUND((capacidad_maxima - espacio_usado)*0.4, 3)
            INTO v_cantidad_maxima
            FROM centro_resguardo 
            WHERE ubicacion_id = v_destino_id;
        ELSE
            v_tipo_operacion := 'V';
            SELECT ubicacion_id 
            INTO v_origen_id
            FROM ubicacion
            WHERE es_centro_resguardo AND
                espacio_usado > 0
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROW ONLY;

            IF SQL%NOTFOUND THEN
                RAISE_APPLICATION_ERROR(-20003, 'No hay centros de resguardo disponibles');
            END IF;

            SELECT ubicacion_id 
            INTO v_destino_id
            FROM ubicacion
            WHERE not es_centro_resguardo
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROW ONLY;

            SELECT ROUND(espacio_usado*0.4, 3)
            INTO v_cantidad_maxima
            FROM centro_resguardo 
            WHERE ubicacion_id = v_destino_id;
        END IF;

        v_cantidad_minima := ROUND(v_cantidad_maxima * 0.3, 3);
        v_cantidad := ROUND(DBMS_RANDOM.VALUE(v_cantidad_minima, v_cantidad_maxima), 3);
        v_precio_unitario := ROUND(DBMS_RANDOM.VALUE(500, 3000), 2);
        v_pct_comision := ROUND(DBMS_RANDOM.VALUE(0.05, 0.1), 2);
        v_comision := ROUND(v_cantidad * v_precio_unitario * v_pct_comision, 2);
        v_total := ROUND((v_cantidad * v_precio_unitario) + v_comision, 2);
        SELECT camion_id
        INTO v_camion_id
        FROM camion
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROW ONLY;

        SELECT empleado_id
        INTO v_chofer_id
        FROM empleado
        WHERE puesto_id = v_puesto_id_chofer
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROW ONLY;

        SELECT tipo_producto_id
        INTO v_tipo_producto_id
        FROM tipo_producto_op
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROW ONLY;

        BEGIN
            IF v_tipo_operacion = 'C' THEN
                UPDATE centro_resguardo
                SET espacio_usado = espacio_usado + v_cantidad
                WHERE ubicacion_id = v_destino_id;
            ELSE
                UPDATE centro_resguardo
                SET espacio_usado = espacio_usado - v_cantidad
                WHERE ubicacion_id = v_origen_id;
            END IF;
            INSERT INTO operacion (fecha_inicio, fecha_fin, tipo_operacion, cantidad, precio_unitario, comision, total, 
                                   fecha_status, camion_id, chofer_id, estatus_operacion_id, origen_id, destino_id, tipo_producto_id)
            VALUES (p_fecha_inicio, null, v_tipo_operacion, v_cantidad, v_precio_unitario, v_comision, v_total, 
                    p_fecha_inicio, v_camion_id, v_chofer_id, v_estatus_id_programada, v_origen_id, v_destino_id, v_tipo_producto_id);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar operacion tipo ' || v_tipo_operacion || ': ' || SQLERRM);
        END;
    END LOOP;
                
    COMMIT;
        
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla operacion completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar operacion: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_operaciones completada