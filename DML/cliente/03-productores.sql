--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Procedimiento para poblar a TABLA "PRODUCTORES" (pdb: cliente), es necesario primero ejecutar el procedimiento "INSERTAR_SOCIOS"

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_productores

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
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla productor');
    SELECT COUNT(zona_id)
    INTO v_count_zonas
    FROM zona;
    IF v_count_zonas = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'No hay zonas disponibles para asignar a los productores.');
    END IF;

    FOR r_productor IN c_productores_pendientes
    LOOP
        v_productor_id := r_productor.socio_id;
        v_nombre       := r_productor.nombre;
        v_ap_paterno   := r_productor.ap_paterno;
        v_semblanza := v_semblanzas(TRUNC(DBMS_RANDOM.VALUE(1, v_semblanzas.COUNT + 1)));
        v_url := LOWER('https://www.' ||  v_nombre || v_ap_paterno ||'.com.mx');

        SELECT zona_id 
        INTO v_zona_id
        FROM zona 
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;

        BEGIN
            INSERT INTO productor (productor_id, semblanza, url, zona_id)
            VALUES (v_productor_id, v_semblanza, v_url, v_zona_id);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('* Error al insertar productor ID ' || v_productor_id || ': ' || SQLERRM);
        END;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla productor completada');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar productores: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_productores completada