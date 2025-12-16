--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Procedimiento para la TABLA "UBICACION" (pdb:operación)

--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Procedimiento para la TABLA "UBICACION" (pdb:operación)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_ubicaciones


set SERVEROUTPUT on; 
CREATE OR REPLACE PROCEDURE INSERTAR_UBICACIONES (
    p_n_centro_resguardo IN NUMBER,
    p_n_otra_ubicacion   IN NUMBER
)
AS
    v_total_ubicaciones NUMBER := p_n_centro_resguardo + p_n_otra_ubicacion;
    v_clave            ubicacion.clave%TYPE;
    v_calle            ubicacion.calle%TYPE;
    v_numero           ubicacion.numero%TYPE;
    v_colonia          ubicacion.colonia%TYPE;
    v_codigo_postal    ubicacion.codigo_postal%TYPE;
    v_latitud          ubicacion.latitud%TYPE;
    v_longitud         ubicacion.longitud%TYPE;
    v_es_centro_resguardo ubicacion.es_centro_resguardo%TYPE;
    v_activo          ubicacion.activo%TYPE;
    v_municipio_id    municipio.municipio_id%TYPE;
    v_norte           NUMBER := 32.718655;
    v_sur             NUMBER := 14.532866;
    v_este            NUMBER := -86.710571;
    v_oeste           NUMBER := -118.364847;

    TYPE t_calles IS TABLE OF ubicacion.calle%TYPE;
    v_calles t_calles := t_calles(
        'Av. Reforma', 'Calle Juárez', 'Calle Hidalgo', 'Av. Insurgentes', 'Calle Morelos',
        'Av. Independencia', 'Calle Zaragoza', 'Av. Benito Juárez', 'Calle 16 de Septiembre', 'Av. Revolución',
        'Calle Allende', 'Av. Lázaro Cárdenas', 'Calle Madero', 'Av. Miguel Alemán', 'Calle Constitución',
        'Av. Central', 'Calle Guerrero', 'Av. Cuauhtémoc', 'Calle Victoria', 'Av. Niños Héroes',
        'Calle Aquiles Serdán', 'Av. Emiliano Zapata', 'Calle Francisco I. Madero', 'Av. Venustiano Carranza', 'Calle 5 de Mayo',
        'Av. Álvaro Obregón', 'Calle Manuel Acuña', 'Av. Adolfo López Mateos', 'Calle Ignacio Allende', 'Av. Gustavo Baz',
        'Calle Ramón Corona', 'Av. Ejército Nacional', 'Calle José María Morelos', 'Av. Constituyentes', 'Calle Felipe Ángeles',
        'Av. Río San Joaquín', 'Calle Luis Donaldo Colosio', 'Av. Vasco de Quiroga', 'Calle Pedro Moreno', 'Av. Tlalpan',
        'Calle Mariano Matamoros', 'Av. 16 de Septiembre', 'Calle José Vasconcelos', 'Av. Ejército Constitucionalista', 'Calle Ignacio Zaragoza',
        'Av. Plan de Guadalupe', 'Calle Miguel Hidalgo', 'Av. Río Mixcoac', 'Calle Venustiano Carranza', 'Av. División del Norte'
    );

    TYPE t_colonias IS TABLE OF ubicacion.colonia%TYPE;
    v_colonias t_colonias := t_colonias(
        'Centro', 'La Paz', 'El Mirador', 'San Juan', 'Las Américas', 'Los Olivos', 'Villa Alegre', 'Buenavista', 'Santa María', 'La Esperanza',
        'El Progreso', 'Nueva Vida', 'Los Pinos', 'San Pedro', 'La Cañada', 'El Paraíso', 'Los Ángeles', 'San Miguel', 'La Hacienda', 'El Carmen',
        'Los Jardines', 'San Rafael', 'La Florida', 'El Rosario', 'Los Sauces', 'San Antonio', 'La Colina', 'El Edén', 'Los Girasoles', 'San Isidro',
        'La Herradura', 'El Vergel', 'Los Tulipanes', 'San Felipe', 'La Pradera', 'El Molino', 'Los Cipreses', 'San Cristóbal', 'La Loma', 'El Cielo',
        'Los Almendros', 'San Nicolás', 'La Ribera', 'El Castillo', 'Los Robles', 'San Jacinto', 'La Montaña', 'El Lago', 'Los Cedros', 'San Agustín'
    );

    FUNCTION GENERAR_CLAVE(
        p_es_centro_resguardo IN BOOLEAN
    ) RETURN ubicacion.clave%TYPE
    IS
        v_clave_temp ubicacion.clave%TYPE;
        v_clave_registrada NUMBER;
    BEGIN
        IF p_es_centro_resguardo THEN
            v_clave_temp := 'R-' || DBMS_RANDOM.STRING('X', 3);
        ELSE
            v_clave_temp := 'C-' || DBMS_RANDOM.STRING('X', 3);
        END IF;
        SELECT COUNT(*) INTO v_clave_registrada
        FROM ubicacion
        WHERE clave = v_clave_temp;
        IF v_clave_registrada = 0 THEN
            RETURN v_clave_temp;
        ELSE
            RETURN GENERAR_CLAVE(p_es_centro_resguardo);
        END IF;
    END GENERAR_CLAVE;

    FUNCTION GENERAR_CP RETURN ubicacion.codigo_postal%TYPE
    IS
        v_cp ubicacion.codigo_postal%TYPE := '';
    BEGIN
        FOR i IN 1..5 LOOP
            v_cp := v_cp || TRUNC(DBMS_RANDOM.VALUE(0, 10));
        END LOOP;
        RETURN v_cp;
    END GENERAR_CP;

BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla ubicaciones');
    FOR i IN 1..v_total_ubicaciones
    LOOP
        v_clave := GENERAR_CLAVE(i <= p_n_centro_resguardo);
        v_calle := v_calles(TRUNC(DBMS_RANDOM.VALUE(1, v_calles.COUNT + 1)));
        v_numero := TRUNC(DBMS_RANDOM.VALUE(1, 1000));
        v_colonia := v_colonias(TRUNC(DBMS_RANDOM.VALUE(1, v_colonias.COUNT + 1)));
        v_codigo_postal := GENERAR_CP;
        v_latitud := DBMS_RANDOM.VALUE(v_sur, v_norte);
        v_longitud := DBMS_RANDOM.VALUE(v_oeste, v_este);
        v_es_centro_resguardo := i <= p_n_centro_resguardo;
        v_activo := TRUE;
        SELECT municipio_id
        INTO v_municipio_id
        FROM municipio
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;

        BEGIN
            INSERT INTO ubicacion (clave, calle, numero, colonia, codigo_postal, latitud, longitud, es_centro_resguardo, fachada, activo, municipio_id)
            VALUES (v_clave, v_calle, v_numero, v_colonia, v_codigo_postal, v_latitud, v_longitud, v_es_centro_resguardo, empty_blob(), v_activo, v_municipio_id);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('* Error al insertar ubicacion ' || v_clave || ': ' || SQLERRM);
        END;
    END LOOP;

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla ubicaciones completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar ubicaciones: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_ubicaciones completada