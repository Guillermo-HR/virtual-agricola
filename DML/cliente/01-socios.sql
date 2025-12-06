--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en tabla socio
Prompt =========================================================

CREATE OR REPLACE PROCEDURE INSERTAR_SOCIOS (
    p_n_productores IN NUMBER,
    p_n_compradores IN NUMBER,
    p_n_productores_compradores IN NUMBER
)
AS
    TYPE t_nombres IS TABLE OF VARCHAR2(40);
    v_nombres t_nombres := t_nombres(
        'Alejandro', 'Valentina', 'Santiago', 'Camila', 'Emilio',
        'Regina', 'Mateo', 'Ximena', 'Nicolás', 'Sofía',
        'Daniel', 'Luciana', 'Javier', 'Valeria', 'Sebastián',
        'Renata', 'Andrés', 'Mariana', 'Ricardo', 'Victoria'
    );

    TYPE t_apellidos IS TABLE OF VARCHAR2(40);
    v_apellidos t_apellidos := t_apellidos(
        'García', 'Rodríguez', 'Martínez', 'López', 'González',
        'Pérez', 'Sánchez', 'Ramírez', 'Torres', 'Flores',
        'Rivera', 'Gómez', 'Díaz', 'Reyes', 'Cruz',
        'Morales', 'Jiménez', 'Ruiz', 'Silva', 'Castro',
        'Ortiz', 'Chávez', 'Guerrero', 'Mendoza', 'Vargas',
        'Herrera', 'Peña', 'Acosta', 'Núñez', 'Rojas'
    );

    v_total_registros NUMBER := p_n_productores + p_n_compradores + p_n_productores_compradores;
    v_nombre          socio.nombre%TYPE;
    v_ap_paterno      socio.ap_paterno%TYPE;
    v_ap_materno      socio.ap_materno%TYPE;
    v_email           socio.email%TYPE;
    v_es_productor    socio.es_productor%TYPE;
    v_es_comprador    socio.es_comprador%TYPE;
    v_rand_num        NUMBER(3);

BEGIN
    FOR i IN 1..v_total_registros
    LOOP
        v_nombre     := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, v_nombres.COUNT + 1)));
        v_ap_paterno := v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1)));
        v_ap_materno := v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1)));

        v_rand_num   := TRUNC(DBMS_RANDOM.VALUE(1, 100));

        v_email := LOWER(v_nombre || '.' || v_ap_paterno) || v_rand_num || '@mail.com';

        IF i <= p_n_productores THEN
            v_es_productor := TRUE;
            v_es_comprador := FALSE;
        ELSIF i <= (p_n_productores + p_n_compradores) THEN
            v_es_productor := FALSE;
            v_es_comprador := TRUE;
        ELSE
            v_es_productor := TRUE;
            v_es_comprador := TRUE;
        END IF;

        BEGIN
            INSERT INTO socio (nombre, ap_paterno, ap_materno, email, es_productor, es_comprador)
            VALUES (v_nombre, v_ap_paterno, v_ap_materno, v_email, v_es_productor, v_es_comprador);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('Error al insertar socio ' || v_nombre || ' ' || v_ap_paterno || ': ' || SQLERRM);
        END;

    END LOOP;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar socios: ' || SQLERRM);
END;
/

EXEC INSERTAR_SOCIOS(0, 0, 1);

Prompt =========================================================
Prompt Insercion de registros en la tabla socio completada 
Prompt =========================================================