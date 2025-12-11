--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento insertar_pago_ventas

CREATE OR REPLACE PROCEDURE INSERTAR_PAGO_VENTAS
AS
    v_fecha_pago  pago_venta.fecha_pago%TYPE;
    v_importe      pago_venta.importe%TYPE;
    v_n_pagos      pago_venta.numero_pago%TYPE;
    v_operacion_id pago_venta.operacion_id%TYPE;
    v_cuenta_id    pago_venta.cuenta_id%TYPE;

    CURSOR c_pagos_pendientes IS
        SELECT
            o.operacion_id, o.total, o.fecha_inicio
        FROM
            operacion o
        LEFT JOIN
            pago_venta pv ON o.operacion_id = pv.operacion_id
        WHERE
            o.tipo_operacion = 'V' AND
            o.estatus_operacion_id != 4 AND
            pv.operacion_id IS NULL;

BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en tabla pago_venta');
    FOR r_pago IN c_pagos_pendientes
    LOOP
        v_fecha_pago := r_pago.fecha_inicio;
        v_n_pagos := TRUNC(DBMS_RANDOM.VALUE(1, 13));
        v_importe := ROUND(r_pago.total / v_n_pagos, 2);
        v_operacion_id := r_pago.operacion_id;
        SELECT cuenta_id 
        INTO v_cuenta_id
        FROM cuenta
        ORDER BY DBMS_RANDOM.VALUE
        FETCH FIRST 1 ROWS ONLY;
        FOR i IN 1..v_n_pagos
        LOOP
            BEGIN
                INSERT INTO pago_venta (fecha_pago, importe, numero_pago, operacion_id, cuenta_id)
                VALUES (v_fecha_pago, v_importe, i, v_operacion_id, v_cuenta_id);
            EXCEPTION
                WHEN OTHERS THEN
                    dbms_output.put_line('* Error al insertar pago_venta para operacion_id ' || v_operacion_id || ': ' || SQLERRM);
            END;
            v_fecha_pago := ADD_MONTHS(v_fecha_pago, 1);
        END LOOP;
    END LOOP;

    COMMIT;
        
    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla pago_venta completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar pago_venta: ' || SQLERRM);
        RAISE;
END;
/

Prompt > Creacion de procedimiento insertar_pago_ventas completada