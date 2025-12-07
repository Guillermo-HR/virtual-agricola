--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_socios

CREATE OR REPLACE PROCEDURE INSERTAR_SOCIOS (
    p_n_productores IN NUMBER,
    p_n_compradores IN NUMBER,
    p_n_productores_compradores IN NUMBER
)
AS
    v_total_registros NUMBER := p_n_productores + p_n_compradores + p_n_productores_compradores;
    v_nombre          socio.nombre%TYPE;
    v_ap_paterno      socio.ap_paterno%TYPE;
    v_ap_materno      socio.ap_materno%TYPE;
    v_email           socio.email%TYPE;
    v_es_productor    socio.es_productor%TYPE;
    v_es_comprador    socio.es_comprador%TYPE;
    v_rand_num        NUMBER(3);
    v_ap_materno_null     NUMBER(1);
    
    TYPE t_nombres IS TABLE OF socio.nombre%TYPE;
    v_nombres t_nombres := t_nombres(
        'Alejandro', 'Valentina', 'Santiago', 'Camila', 'Emilio',
        'Regina', 'Mateo', 'Ximena', 'Nicolás', 'Sofía',
        'Daniel', 'Luciana', 'Javier', 'Valeria', 'Sebastián',
        'Renata', 'Andrés', 'Mariana', 'Ricardo', 'Victoria'
    );

    TYPE t_apellidos IS TABLE OF socio.ap_paterno%TYPE;
    v_apellidos t_apellidos := t_apellidos(
        'García', 'Rodríguez', 'Martínez', 'López', 'González',
        'Pérez', 'Sánchez', 'Ramírez', 'Torres', 'Flores',
        'Rivera', 'Gómez', 'Díaz', 'Reyes', 'Cruz',
        'Morales', 'Jiménez', 'Ruiz', 'Silva', 'Castro',
        'Ortiz', 'Chávez', 'Guerrero', 'Mendoza', 'Vargas',
        'Herrera', 'Peña', 'Acosta', 'Núñez', 'Rojas'
    );
    FUNCTION GENERAR_EMAIL(
        p_nombre IN socio.nombre%TYPE,
        p_ap_paterno IN socio.ap_paterno%TYPE
    ) RETURN socio.email%TYPE
    IS
        v_email_temp socio.email%TYPE;
        v_rand_num_temp NUMBER(3);
        v_email_registrado NUMBER;
    BEGIN
        v_rand_num_temp := TRUNC(DBMS_RANDOM.VALUE(1, 100));
        v_email_temp := LOWER(p_nombre || '.' || p_ap_paterno) || v_rand_num_temp || '@mail.com';
        SELECT COUNT(*) 
        INTO v_email_registrado
        FROM socio
        WHERE email = v_email_temp;
        IF v_email_registrado = 0 THEN
            RETURN v_email_temp;
        ELSE
            RETURN GENERAR_EMAIL(p_nombre, p_ap_paterno);
        END IF;
    END GENERAR_EMAIL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla socio');
    FOR i IN 1..v_total_registros
    LOOP
        v_nombre     := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, v_nombres.COUNT + 1)));
        v_ap_paterno := v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1)));
        v_ap_materno_null := TRUNC(DBMS_RANDOM.VALUE(0, 2));
        IF v_ap_materno_null = 0 THEN
            v_ap_materno := NULL;
        ELSE
            v_ap_materno := v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1)));
        END IF;
        v_email := GENERAR_EMAIL(v_nombre, v_ap_paterno);

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
                dbms_output.put_line('* Error al insertar socio ' || v_nombre || ' ' || v_ap_paterno || ': ' || SQLERRM);
        END;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla socio completada');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar socios: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_socios completada