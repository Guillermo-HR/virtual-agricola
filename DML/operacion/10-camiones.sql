--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Procedimiento para poblar la TABLA "CAMION" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_camiones

CREATE OR REPLACE PROCEDURE INSERTAR_CAMIONES (
    p_n_camiones IN NUMBER
)
AS
    v_placa        camion.placa%TYPE;
    v_anio        camion.anio%TYPE;
    v_activo      camion.activo%TYPE;
    v_modelo_id   camion.modelo_id%TYPE;

    FUNCTION GENERAR_PLACA RETURN camion.placa%TYPE
    IS
        v_placa_temp camion.placa%TYPE := '';
        v_placa_registrada NUMBER;
    BEGIN
        v_placa_temp := DBMS_RANDOM.STRING('U', 2) || '-' ||DBMS_RANDOM.STRING('X', 4);
        SELECT COUNT(*)
        INTO v_placa_registrada
        FROM camion
        WHERE placa = v_placa_temp;
        IF v_placa_registrada = 0 THEN
            RETURN v_placa_temp;
        ELSE
            RETURN GENERAR_PLACA;
        END IF;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla camiones');
    FOR i IN 1..p_n_camiones
    LOOP
        v_placa := GENERAR_PLACA;
        v_anio := TRUNC(DBMS_RANDOM.VALUE(2000, 2024));
        v_activo := TRUE;
        SELECT modelo_id
        INTO v_modelo_id
        FROM modelo
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;

        BEGIN
            INSERT INTO camion (placa, anio, foto, activo, modelo_id)
            VALUES (v_placa, v_anio, empty_blob(), v_activo, v_modelo_id);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar camión con placa ' || v_placa || ': ' || SQLERRM);
        END;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla camiones completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar camiones: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_camiones completada
