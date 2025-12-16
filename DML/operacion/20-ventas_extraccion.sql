--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_venta_extraccion

CREATE OR REPLACE PROCEDURE INSERTAR_VENTA_EXTRACCION (
    p_fecha IN venta_extraccion.fecha_extraccion%TYPE
)
AS
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
        
        SELECT b.bodega_id
        INTO v_bodega_id
        FROM bodega b
        WHERE b.centro_resguardo_id = r_operacion.centro_resguardo_id
        FETCH FIRST 1 ROWS ONLY;


        BEGIN
            INSERT INTO venta_extraccion (cantidad_producto_extraido, fecha_extraccion, bodega_id, operacion_id)
            VALUES (30, p_fecha, v_bodega_id, r_operacion.operacion_id);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar venta_extraccion para operacion_id ' || r_operacion.operacion_id || ': ' || SQLERRM);
        END;
            
        COMMIT;
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