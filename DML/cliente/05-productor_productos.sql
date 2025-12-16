--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Procedimiento para la TABLA "PRODUCTOR_PRODUCTO" (pdb: cliente)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_productor_productos

CREATE OR REPLACE PROCEDURE INSERTAR_PRODUCTOR_PRODUCTOS
AS
    v_tipo_producto_id     productor_producto.tipo_producto_id%TYPE;
    v_productor_id         productor_producto.productor_id%TYPE;
    v_n_productos          NUMBER(2);
    v_fecha_inicio_es_null NUMBER(1);
    v_fecha_fin_es_null    NUMBER(1);
    v_fecha_inicio         DATE;
    v_fecha_fin            DATE;
    v_count_tipos          NUMBER;
    CURSOR c_productores IS
        SELECT 
            p.productor_id
        FROM 
            productor p
        LEFT JOIN
            productor_producto pp ON p.productor_id = pp.productor_id
        WHERE 
            pp.productor_id IS NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla productor_producto');
    BEGIN
        SELECT COUNT(tipo_producto_id)
        INTO v_count_tipos
        FROM tipo_producto;
    END;

    FOR r_productor IN c_productores
    LOOP
        v_productor_id := r_productor.productor_id;
        v_n_productos := TRUNC(DBMS_RANDOM.VALUE(1, v_count_tipos + 1));
        FOR r_tipo IN (
            SELECT tipo_producto_id
            FROM tipo_producto
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST v_n_productos ROWS ONLY
        )
        LOOP
            v_tipo_producto_id := r_tipo.tipo_producto_id;
            v_fecha_inicio_es_null := TRUNC(DBMS_RANDOM.VALUE(0, 2));
            IF v_fecha_inicio_es_null = 0 THEN
                v_fecha_inicio := TO_DATE('01-01-2020', 'DD-MM-YYYY') + TRUNC(DBMS_RANDOM.VALUE(0, 1461));
                v_fecha_fin_es_null := TRUNC(DBMS_RANDOM.VALUE(0, 2));
                IF v_fecha_fin_es_null = 0 THEN
                    v_fecha_fin := v_fecha_inicio + TRUNC(DBMS_RANDOM.VALUE(30, 365));
                ELSE
                    v_fecha_fin := NULL;
                END IF;
            ELSE
                v_fecha_inicio := NULL;
                v_fecha_fin := NULL;
            END IF;
            
            BEGIN
                INSERT INTO productor_producto (temporada_inicio, temporada_fin, productor_id, tipo_producto_id)
                VALUES (v_fecha_inicio, v_fecha_fin, v_productor_id, v_tipo_producto_id);
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar productor_producto para productor_id ' || v_productor_id || ' y tipo_producto_id ' || v_tipo_producto_id || ': ' || SQLERRM);
            END;
        END LOOP;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla productor_producto completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar registros en productor_producto: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_productor_productos completada