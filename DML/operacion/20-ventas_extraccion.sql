--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_venta_extraccion

CREATE OR REPLACE PROCEDURE INSERTAR_VENTA_EXTRACCION (
    p_fecha IN venta_extraccion.fecha_extraccion%TYPE
)
AS
    v_extraccion_faltante NUMBER;
    v_cantidad_bodega bodega.espacio_usado%TYPE;
    v_cantidad_extraida venta_extraccion.cantidad_producto_extraido%TYPE;
    v_nueva_capacidad_bodega bodega.capacidad_maxima%TYPE;
    v_bodega_id bodega.bodega_id%TYPE;

    CURSOR c_operaciones_pendientes IS
        SELECT o.operacion_id, o.cantidad, cr.centro_resguardo_id
        FROM operacion o
        LEFT JOIN venta_extraccion ve ON o.operacion_id = ve.operacion_id
        JOIN ubicacion u ON o.origen_id = u.ubicacion_id
        JOIN centro_resguardo cr ON u.ubicacion_id = cr.ubicacion_id
        WHERE o.tipo_operacion = 'V'
            AND o.estatus_operacion_id = 2
            AND ve.operacion_id IS NULL;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla venta_extraccion');
    FOR r_operacion IN c_operaciones_pendientes 
    LOOP
        v_extraccion_faltante := r_operacion.cantidad;
        WHILE v_extraccion_faltante > 0 LOOP
            SELECT b.bodega_id, b.espacio_usado
            INTO v_bodega_id, v_cantidad_bodega
            FROM bodega b
            WHERE b.centro_resguardo_id = r_operacion.centro_resguardo_id
            AND b.espacio_usado > 0;

            IF v_cantidad_bodega >= v_extraccion_faltante THEN
                v_cantidad_extraida := v_extraccion_faltante;
                v_nueva_capacidad_bodega := v_cantidad_bodega - v_cantidad_extraida;
            ELSE
                v_cantidad_extraida := v_cantidad_bodega;
                v_nueva_capacidad_bodega := 0;
            END IF;

            BEGIN
                INSERT INTO venta_extraccion (cantidad_producto_extraido, fecha_extraccion, bodega_id, operacion_id)
                VALUES (v_cantidad_extraida, p_fecha, v_bodega_id, r_operacion.operacion_id);
                UPDATE bodega
                SET espacio_usado = v_nueva_capacidad_bodega
                WHERE bodega_id = v_bodega_id;
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar venta_extraccion para operacion_id ' || r_operacion.operacion_id || ': ' || SQLERRM);
            END;
            v_extraccion_faltante := v_extraccion_faltante - v_cantidad_extraida;
            
            COMMIT;

        END LOOP;
    END LOOP;
        
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla venta_extraccion completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar venta_extraccion: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_venta_extraccion completada