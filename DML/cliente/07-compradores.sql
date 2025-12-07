--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_compradores

CREATE OR REPLACE PROCEDURE INSERTAR_COMPRADORES
AS
    v_comprador_id            comprador.comprador_id%TYPE;
    v_nombre                  comprador.nombre%TYPE;
    v_aval_en_nul             NUMBER(1);
    v_aval_id                 comprador.aval_id%TYPE;
    v_empresa_id              comprador.empresa_id%TYPE;
    v_compradores_registrados NUMBER;
    v_n_empresas_disponibles  NUMBER;
    v_n_compradores_faltantes NUMBER;

    CURSOR c_compradores_pendientes IS
        SELECT
            s.socio_id, s.nombre, s.ap_paterno, s.ap_materno
        FROM
            socio s 
        LEFT JOIN
            comprador c ON s.socio_id = c.comprador_id
        WHERE
            es_comprador = 1
            AND c.comprador_id IS NULL;

    CURSOR c_empresas_disponibles IS
        SELECT
            e.empresa_id
        FROM
            empresa e
        LEFT JOIN
            comprador c ON e.empresa_id = c.empresa_id
        WHERE
            c.empresa_id IS NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla comprador');
    SELECT COUNT(e.empresa_id)
    INTO v_n_empresas_disponibles
    FROM empresa e 
    LEFT JOIN comprador c ON e.empresa_id = c.empresa_id
    WHERE c.empresa_id IS NULL;

    SELECT COUNT(s.socio_id)
    INTO v_n_compradores_faltantes
    FROM socio s 
    LEFT JOIN comprador c ON c.comprador_id = s.socio_id
    WHERE s.es_comprador = 1 AND c.comprador_id IS NULL;

    SELECT COUNT(c.comprador_id)
    INTO v_compradores_registrados
    FROM comprador c;

    IF v_n_compradores_faltantes > v_n_empresas_disponibles THEN
        RAISE_APPLICATION_ERROR(-20001, 'No hay suficientes empresas disponibles para asignar a los compradores.');
    END IF;
    OPEN c_empresas_disponibles;
    FOR r_comprador IN c_compradores_pendientes
    LOOP
        v_comprador_id := r_comprador.socio_id;
        v_nombre := r_comprador.nombre || ' ' || r_comprador.ap_paterno || ' ' || NVL(r_comprador.ap_materno, '');
        FETCH c_empresas_disponibles INTO v_empresa_id;
        IF v_compradores_registrados > 0 THEN
            v_aval_en_nul := TRUNC(DBMS_RANDOM.VALUE(0, 2));
            IF v_aval_en_nul = 0 THEN
                v_aval_id := NULL;
            ELSE
                v_aval_id := TRUNC(DBMS_RANDOM.VALUE(1, v_compradores_registrados + 1));
            END IF;
        ELSE
            v_aval_id := NULL;
        END IF;

        BEGIN
            INSERT INTO comprador (comprador_id, nombre, aval_id, empresa_id)
            VALUES (v_comprador_id, v_nombre, v_aval_id, v_empresa_id);
            v_compradores_registrados := v_compradores_registrados + 1;
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar comprador ID ' || v_comprador_id || ': ' || SQLERRM);
        END;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('- Insercion de registros en la tabla comprador completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar compradores: ' || SQLERRM);
        RAISE;
END;
/

Prompt - Creacion de procedimiento insertar_compradores completada