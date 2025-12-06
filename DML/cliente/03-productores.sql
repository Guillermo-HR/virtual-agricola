--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en tabla productor
Prompt =========================================================

CREATE OR REPLACE PROCEDURE INSERTAR_PRODUCTORES
AS
    v_productor_id  productor.productor_id%TYPE;
    v_semblanza     productor.semblanza%TYPE;
    v_url           productor.url%TYPE;
    v_zona_id       productor.zona_id%TYPE;
    v_count_zonas   NUMBER;
    v_nombre        socio.nombre%TYPE;
    v_ap_paterno    socio.ap_paterno%TYPE;

    CURSOR c_productores_pendientes IS
        SELECT
            s.socio_id, s.nombre, s.ap_paterno
        FROM
            socio s
        LEFT JOIN
            productor p ON s.socio_id = p.productor_id
        WHERE
            es_productor = 1
            AND p.productor_id IS NULL;

    TYPE t_semblanzas IS TABLE OF productor.semblanza%TYPE;
    v_semblanzas t_semblanzas := t_semblanzas(
        'Líder en agricultura ecológica y sostenible, con más de 20 años de experiencia en cultivos de temporada.',
        'Especializado en el manejo de ganado de pequeña escala y la producción artesanal de lácteos.',
        'Innovador en técnicas de riego por goteo, enfocado en la conservación del agua y la tierra.',
        'Productor de café de alta montaña, certificado en comercio justo y calidad premium.',
        'Experto en apicultura y miel orgánica, promoviendo la biodiversidad local.',
        'Dedicado al cultivo de hortalizas bajo invernadero, asegurando frescura todo el año.',
        'Artesano de alimentos y granos ancestrales, rescatando semillas y métodos tradicionales.'
    );

BEGIN
    SELECT COUNT(zona_id)
    INTO v_count_zonas
    FROM zona;

    FOR r_productor IN c_productores_pendientes
    LOOP
        v_productor_id := r_productor.socio_id;
        v_nombre       := r_productor.nombre;
        v_ap_paterno   := r_productor.ap_paterno;
        v_semblanza := v_semblanzas(TRUNC(DBMS_RANDOM.VALUE(1, v_semblanzas.COUNT + 1)));
        v_url := LOWER('https://www.' ||  v_nombre || v_ap_paterno ||'.com.mx');
        v_zona_id := TRUNC(DBMS_RANDOM.VALUE(1, v_count_zonas + 1));

        BEGIN
            INSERT INTO productor (productor_id, semblanza, url, zona_id)
            VALUES (v_productor_id, v_semblanza, v_url, v_zona_id);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al insertar productor ID ' || v_productor_id || ': ' || SQLERRM);
        END;

    END LOOP;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al insertar productores: ' || SQLERRM);
END;
/

EXEC INSERTAR_PRODUCTORES;

Prompt =========================================================
Prompt Insercion de registros en tabla productor completada
Prompt =========================================================