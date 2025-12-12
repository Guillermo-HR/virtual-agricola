--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_bodegas

CREATE OR REPLACE PROCEDURE INSERTAR_BODEGAS
AS
    v_numero_bodegas  centro_resguardo.numero_bodegas%TYPE;
    v_capacidad_maxima centro_resguardo.capacidad_maxima%TYPE;
    v_tiene_control_temp bodega.tiene_control_temperatura%TYPE;
    v_capacidad_bodegas  bodega.capacidad_maxima%TYPE;
    v_espacio_usado      bodega.espacio_usado%TYPE:= 0;
    v_centro_resguardo_id bodega.centro_resguardo_id%TYPE;

    CURSOR c_centros_pendientes IS
        SELECT
            cr.centro_resguardo_id, cr.numero_bodegas, cr.capacidad_maxima
        FROM
            centro_resguardo cr
        LEFT JOIN
            bodega b ON cr.centro_resguardo_id = b.centro_resguardo_id
        WHERE
            b.centro_resguardo_id IS NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla bodega');
    for r_centro IN c_centros_pendientes
    LOOP
        v_centro_resguardo_id := r_centro.centro_resguardo_id;
        v_numero_bodegas := r_centro.numero_bodegas;
        v_capacidad_maxima := r_centro.capacidad_maxima;
        v_capacidad_bodegas := TRUNC(v_capacidad_maxima / v_numero_bodegas);

        FOR i IN 1 .. v_numero_bodegas
        LOOP
            v_tiene_control_temp := TRUNC(DBMS_RANDOM.VALUE(0, 2)) = 1;
            BEGIN
                INSERT INTO bodega (numero_bodega, tiene_control_temperatura, capacidad_maxima, espacio_usado, centro_resguardo_id)
                VALUES (i, v_tiene_control_temp, v_capacidad_bodegas, v_espacio_usado, v_centro_resguardo_id);
            EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('* Error al insertar bodega en centro_resguardo_id ' || v_centro_resguardo_id || ': ' || SQLERRM);
            END;
        END LOOP;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla bodega completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar bodega: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_bodegas completada