--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_compra_descarga

CREATE OR REPLACE PROCEDURE INSERTAR_COMPRA_DESCARGA
AS
    v_descarga_faltante NUMBER;
    v_espacio_bodega NUMBER;
    v_ocupado_bodega NUMBER;
    v_cantidad_descargada compra_descarga.cantidad_producto_descargado%TYPE;
    v_nueva_capacidad_bodega bodega.capacidad_maxima%TYPE;
    v_bodega_id bodega.bodega_id%TYPE;

    CURSOR c_operaciones_pendientes IS
        SELECT o.operacion_id, o.cantidad, cr.centro_resguardo_id
        FROM operacion o
        LEFT JOIN venta_extraccion ve ON o.operacion_id = ve.operacion_id
        JOIN ubicacion u ON o.destino_id = u.ubicacion_id
        JOIN centro_resguardo cr ON u.ubicacion_id = cr.ubicacion_id
        WHERE o.tipo_operacion = 'C'
            AND o.estatus_operacion_id = 5
            AND ve.operacion_id IS NULL;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla compra_descarga');
    FOR r_operacion IN c_operaciones_pendientes 
    LOOP
        v_descarga_faltante := r_operacion.cantidad;
        WHILE v_descarga_faltante > 0 LOOP
            SELECT b.bodega_id, (b.capacidad_maxima - b.espacio_usado), b.espacio_usado
            INTO v_bodega_id, v_espacio_bodega, v_ocupado_bodega
            FROM bodega b
            WHERE b.centro_resguardo_id = r_operacion.centro_resguardo_id
            AND (b.capacidad_maxima - b.espacio_usado) > 0;

            IF v_espacio_bodega >= v_descarga_faltante THEN
                v_cantidad_descargada := v_descarga_faltante;
                v_nueva_capacidad_bodega := v_ocupado_bodega + v_cantidad_descargada;
            ELSE
                v_cantidad_descargada := v_espacio_bodega;
                v_nueva_capacidad_bodega := v_ocupado_bodega + v_cantidad_descargada;
            END IF;

            BEGIN
                INSERT INTO compra_descarga (recibo_pdf, cantidad_producto_descargado, bodega_id, operacion_id)
                VALUES (empty_blob(), v_cantidad_descargada, v_bodega_id, r_operacion.operacion_id);
                UPDATE bodega
                SET espacio_usado = v_nueva_capacidad_bodega
                WHERE bodega_id = v_bodega_id;
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar compra_descarga para operacion_id ' || r_operacion.operacion_id || ': ' || SQLERRM);
            END;
            v_descarga_faltante := v_descarga_faltante - v_cantidad_descargada;
            
            COMMIT;

        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla compra_descarga completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar compra_descarga: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_compra_descarga completada