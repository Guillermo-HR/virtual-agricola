--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_empleados

CREATE OR REPLACE PROCEDURE INSERTAR_EMPLEADOS (
    p_n_empleados IN NUMBER,
    p_n_choferes  IN NUMBER
)
AS
    v_total_registros NUMBER := p_n_empleados + p_n_choferes;
    v_chofer_id       empleado.puesto_id%TYPE;
    v_nombre          empleado.nombre%TYPE;
    v_curp            empleado.curp%TYPE;
    v_es_conductor    empleado.es_conductor%TYPE;
    v_licencia        empleado.licencia%TYPE;
    v_activo          empleado.activo%TYPE;
    v_puesto_id       empleado.puesto_id%TYPE;

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

    FUNCTION GENERAR_CURP RETURN empleado.curp%TYPE IS
        v_curp_temp empleado.curp%TYPE:= '';
        v_curp_registrada NUMBER;
    BEGIN
        v_curp_temp :=  dbms_random.string('X', 18);
        SELECT COUNT(*) INTO v_curp_registrada
        FROM empleado
        WHERE curp = v_curp_temp;
        IF v_curp_registrada = 0 THEN
            RETURN v_curp_temp;
        ELSE
            RETURN GENERAR_CURP;
        END IF;
    END GENERAR_CURP;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla empleado');
    SELECT puesto_id 
    INTO v_chofer_id
    FROM puesto
    WHERE descripcion='Chofer Repartidor';
    dbms_output.put_line(v_total_registros);
    FOR i IN 1..v_total_registros
    LOOP
        v_nombre := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, v_nombres.COUNT + 1))) || ' ' ||
            v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1))) || ' ' ||
            v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, v_apellidos.COUNT + 1)));
        v_curp := GENERAR_CURP;
        IF i <= p_n_choferes THEN
            v_es_conductor := True;
            v_puesto_id := v_chofer_id;
            v_licencia := empty_blob();
        ELSE
            v_es_conductor := False;
            SELECT puesto_id
            INTO v_puesto_id
            FROM puesto
            WHERE puesto_id != v_chofer_id
            ORDER BY DBMS_RANDOM.VALUE
            FETCH FIRST 1 ROWS ONLY;
            v_licencia := null;
        END IF;
        v_activo := True;

        BEGIN
            INSERT INTO empleado (nombre, curp, es_conductor, licencia, activo, puesto_id)
            VALUES (v_nombre, v_curp, v_es_conductor, v_licencia, v_activo, v_puesto_id);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar empleado ' || v_nombre || SQLERRM);
        END;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla empleado completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar empleados: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_empleados completada