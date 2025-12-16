--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_compra_descarga

CREATE OR REPLACE PROCEDURE INSERTAR_COMPRA_DESCARGA(
    p_operacion_id IN operacion.operacion_id%TYPE
)
AS
     v_bodega_id bodega.bodega_id%TYPE;
     v_centro_resguardo_id NUMBER; 
     v_operacion_tipo VARCHAR2(1);

     
BEGIN
    
    SELECT tipo_operacion
    INTO v_operacion_tipo
    FROM operacion
    where operacion_id = p_operacion_id;

    IF v_operacion_tipo = 'V' THEN
        RETURN;
    END IF; 
        

    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla compra_descarga');
    
    SELECT destino_id
    INTO v_centro_resguardo_id
    FROM operacion
    WHERE operacion_id = p_operacion_id;
    
    SELECT bodega_id
    INTO v_bodega_id
    FROM bodega
    WHERE centro_resguardo_id = v_centro_resguardo_id
    FETCH FIRST 1 ROWS ONLY; 

        BEGIN
            INSERT INTO compra_descarga (recibo_pdf, cantidad_producto_descargado, bodega_id, operacion_id)
            VALUES (empty_blob(), 30, v_bodega_id, p_operacion_id);
                
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar compra_descarga para operacion_id. ' || SQLERRM);
        END;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla compra_descarga completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar compra_descarga: ' || SQLERRM);
        RAISE;
END;
/
show errors; 

Prompt > Creacion de procedimiento insertar_compra_descarga completada