--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Procedimiento para poblar la TABLA "CENTR0_RESGUARDO" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_centro_resguardo

CREATE OR REPLACE PROCEDURE INSERTAR_CENTRO_RESGUARDO
AS
    v_capacidad_maxima   centro_resguardo.capacidad_maxima%TYPE;
    v_espacio_usado        centro_resguardo.espacio_usado%TYPE:= 0;
    v_numero_bodegas     centro_resguardo.numero_bodegas%TYPE;
    v_gerente_id         centro_resguardo.gerente_id%TYPE;
    v_ubicacion_id       centro_resguardo.ubicacion_id%TYPE;
    v_lim_sup_capacidad      NUMBER;
    v_lim_inf_capacidad      NUMBER;
    v_puesto_id_gerente  puesto.puesto_id%TYPE;

    CURSOR c_centros_pendientes IS
        SELECT
            u.ubicacion_id
        FROM
            ubicacion u
        LEFT JOIN
            centro_resguardo c ON u.ubicacion_id = c.ubicacion_id
        WHERE
            u.es_centro_resguardo AND
            c.centro_resguardo_id IS NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla centro_resguardo');
    SELECT puesto_id
    INTO v_puesto_id_gerente
    FROM puesto
    WHERE descripcion = 'Gerente de Centro de resguardo';
    FOR r_centro IN c_centros_pendientes
    LOOP
        v_ubicacion_id := r_centro.ubicacion_id;
        v_numero_bodegas := TRUNC(DBMS_RANDOM.VALUE(1, 31));
        v_lim_sup_capacidad := v_numero_bodegas * 99;
        v_lim_inf_capacidad := v_numero_bodegas * 70;
        v_capacidad_maxima := ROUND(DBMS_RANDOM.VALUE(v_lim_inf_capacidad, v_lim_sup_capacidad), 3);
        SELECT empleado_id
        INTO v_gerente_id
        FROM empleado
        WHERE puesto_id = v_puesto_id_gerente
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;

        BEGIN
            INSERT INTO centro_resguardo (capacidad_maxima, espacio_usado, numero_bodegas, gerente_id, ubicacion_id)
            VALUES (v_capacidad_maxima, v_espacio_usado, v_numero_bodegas, v_gerente_id, v_ubicacion_id);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('* Error al insertar centro_resguardo en ubicacion_id ' || v_ubicacion_id || ': ' || SQLERRM);
        END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla centro_resguardo completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar centro_resguardo: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_centro_resguardo completada
