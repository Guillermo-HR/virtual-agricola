--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_empresas

CREATE OR REPLACE PROCEDURE INSERTAR_EMPRESAS
AS
    v_rfc                empresa.rfc%TYPE;
    v_anio_inicio        empresa.anio_inicio%TYPE;
    v_nombre             empresa.nombre%TYPE;
    v_empresas_faltantes NUMBER;

    TYPE t_nombres IS TABLE OF empresa.nombre%TYPE;
    v_nombres t_nombres := t_nombres(
        'Agroindustrias Unidas de México', 'Productos Agrícolas del Valle',
        'Comercializadora de Alimentos Naturales', 'Distribuidora de Frutas y Verduras Frescas',
        'Exportadora de Granos y Semillas', 'Servicios Agrícolas Sustentables',
        'Innovación en Agricultura S.A. de C.V.', 'Agroexportaciones Globales',
        'Comercial Agrícola del Norte', 'Productos Orgánicos del Sur',
        'Distribuciones Rurales Integrales', 'Agroindustria y Tecnología Verde',
        'Comercializadora de Productos del Campo', 'Exportadora de Hortalizas Frescas',
        'Servicios Agrícolas Especializados', 'Innovación y Desarrollo Agrícola S.A. de C.V.',
        'Agroexportaciones del Pacífico', 'Comercial Agrícola del Centro',
        'Productos Orgánicos del Bajío', 'Distribuciones Rurales Avanzadas',
        'Agroindustria y Tecnología Sostenible', 'Comercializadora de Alimentos del Campo',
        'Exportadora de Frutas Tropicales', 'Servicios Agrícolas Profesionales',
        'Innovación en Producción Agrícola S.A. de C.V.', 'Agroexportaciones del Caribe'
    );

    FUNCTION GENERAR_RFC RETURN empresa.rfc%TYPE
    IS
        v_rfc_temp empresa.rfc%TYPE;
        v_rfc_registrado NUMBER;
    BEGIN
        v_rfc_temp :=  dbms_random.string('X', 12);
        SELECT COUNT(*) INTO v_rfc_registrado
        FROM empresa
        WHERE rfc = v_rfc_temp;
        IF v_rfc_registrado = 0 THEN
            RETURN v_rfc_temp;
        ELSE
            RETURN GENERAR_RFC;
        END IF;
    END GENERAR_RFC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla empresa');
    SELECT (
        (SELECT COUNT(*) FROM socio WHERE es_comprador = 1) -
        (SELECT COUNT(*) FROM empresa)
    )
    INTO v_empresas_faltantes;

    FOR i IN 1..v_empresas_faltantes
    LOOP
        v_nombre := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, v_nombres.COUNT + 1)));
        v_rfc :=  GENERAR_RFC;
        v_anio_inicio := TO_DATE('01-01-2000', 'DD-MM-YYYY') + TRUNC(DBMS_RANDOM.VALUE(0, 7300));
        BEGIN
            INSERT INTO empresa (nombre, rfc, anio_inicio)
            VALUES (v_nombre, v_rfc, v_anio_inicio);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar empresa ' || v_nombre || ': ' || SQLERRM);
        END;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('- Insercion de registros en la tabla empresa completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar registros en empresa: ' || SQLERRM);
        RAISE;
END;
/

Prompt - Creacion de procedimiento insertar_empresas completada