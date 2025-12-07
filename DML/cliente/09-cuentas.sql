--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_cuentas

CREATE OR REPLACE PROCEDURE INSERTAR_CUENTAS
AS
    v_clabe              cuenta.clabe%TYPE;
    v_titular            cuenta.titular%TYPE;
    v_es_principal       cuenta.es_principal%TYPE;
    v_activa             cuenta.activa%TYPE;
    v_banco_id           cuenta.banco_id%TYPE;
    v_socio_id           socio.socio_id%TYPE;
    v_n_bancos           NUMBER;
    v_n_cuentas_extras   NUMBER;

    CURSOR c_socios_pendientes IS
        SELECT
            s.socio_id, s.nombre, s.ap_paterno, s.ap_materno
        FROM
            socio s
        LEFT JOIN
            cuenta c ON s.socio_id = c.socio_id
        WHERE
            c.socio_id IS NULL;
    FUNCTION GENERAR_CLABE RETURN cuenta.clabe%TYPE IS
        v_clabe_temp cuenta.clabe%TYPE:= '';
        v_clabe_registrada NUMBER;
    BEGIN
        FOR i IN 1..18 LOOP
            v_clabe_temp := v_clabe_temp || TRUNC(DBMS_RANDOM.VALUE(0,10));
        END LOOP;
        SELECT COUNT(*) 
        INTO v_clabe_registrada
        FROM cuenta
        WHERE clabe = v_clabe_temp;
        IF v_clabe_registrada = 0 THEN
            RETURN v_clabe_temp;
        ELSE
            RETURN GENERAR_CLABE;
        END IF;
    END GENERAR_CLABE;
    PROCEDURE INSERTAR_CUENTA(
        p_clabe IN cuenta.clabe%TYPE,
        p_titular IN cuenta.titular%TYPE,
        p_es_principal IN cuenta.es_principal%TYPE,
        p_activa IN cuenta.activa%TYPE,
        p_banco_id IN cuenta.banco_id%TYPE,
        p_socio_id IN socio.socio_id%TYPE
    ) IS
    BEGIN
        INSERT INTO cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
        VALUES (p_clabe, p_titular, p_es_principal, p_activa, p_banco_id, p_socio_id);
    END INSERTAR_CUENTA;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla cuenta');
    SELECT COUNT(b.banco_id)
    INTO v_n_bancos
    FROM banco b;
    IF v_n_bancos = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No hay bancos disponibles para asignar a las cuentas.');
    END IF;
    FOR r_socio IN c_socios_pendientes
    LOOP
        v_clabe := GENERAR_CLABE;
        v_titular := r_socio.nombre || ' ' || r_socio.ap_paterno || ' ' || NVL(r_socio.ap_materno, '');
        v_es_principal := True;
        v_activa := True;
        SELECT banco_id 
        INTO v_banco_id
        FROM banco 
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;
        v_socio_id := r_socio.socio_id;
        INSERTAR_CUENTA(v_clabe, v_titular, v_es_principal, v_activa, v_banco_id, v_socio_id);
        v_n_cuentas_extras := TRUNC(DBMS_RANDOM.VALUE(0,3));
        FOR i IN 1..v_n_cuentas_extras LOOP
            v_clabe := GENERAR_CLABE;
            v_es_principal := False;
            SELECT banco_id 
            INTO v_banco_id
            FROM banco 
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROWS ONLY;
            INSERTAR_CUENTA(v_clabe, v_titular, v_es_principal, v_activa, v_banco_id, v_socio_id);
        END LOOP;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla cuenta completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar cuentas: ' || SQLERRM);
        RAISE;

END INSERTAR_CUENTAS;
/

Prompt > Creacion de procedimiento insertar_cuentas completada