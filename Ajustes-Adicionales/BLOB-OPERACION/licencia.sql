
connect admin_operacion/1234@operacion

CREATE OR REPLACE PROCEDURE carga_img_licencia IS
    v_bfile            BFILE;
    v_blob             BLOB;
    v_foto             VARCHAR2(20);
    v_img_id           NUMBER;

    CURSOR empleado_licencia IS
    SELECT empleado_id
    FROM empleado
    WHERE licencia is not null AND DBMS_LOB.GETLENGTH(licencia) = 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Iniciando carga de las fotos de las fachadas...');

   FOR carga IN empleado_licencia
   LOOP
      -- 1. Generar un número aleatorio entre 1 y 2
      v_img_id := trunc(dbms_random.value(1,3));
      v_foto := 'licencia_'|| v_img_id|| '.jpg';

      -- Bloque interno para manejar excepciones
    BEGIN
        
        SELECT licencia
        INTO v_blob
        FROM empleado
        WHERE empleado_id = carga.empleado_id
        FOR UPDATE;
        
        -- 3. Obtener referencia al archivo en el S.O.
        v_bfile := BFILENAME('FILES_MODULO_OPERACION', v_foto);
        
        -- 4. Validar existencia del archivo.
        IF DBMS_LOB.FILEEXISTS(v_bfile) = 0 THEN
            RAISE_APPLICATION_ERROR(-20001,
                'El archivo ' || v_foto || ' no existe en el directorio FILES_MODULO_OPERACION'
            );
        END IF;

        -- 5. Abrir el archivo
        DBMS_LOB.FILEOPEN(v_bfile, DBMS_LOB.FILE_READONLY);
        
        -- 6. Cargar los bytes del archivo al BLOB
        DBMS_LOB.LOADFROMFILE(
            dest_lob => v_blob,
            src_lob => v_bfile,
            amount => DBMS_LOB.GETLENGTH(v_bfile)
        );
        
        -- 8. Cerrar el archivo
        DBMS_LOB.FILECLOSE(v_bfile);
        
    EXCEPTION
        WHEN OTHERS THEN
            -- Asegurar que el BFILE se cierre en caso de cualquier error
            IF DBMS_LOB.ISOPEN(v_bfile) = 1 THEN
                DBMS_LOB.FILECLOSE(v_bfile);
            END IF;
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            -- Re-lanzar el error para detener el proceso si es un fallo crítico
            RAISE; 
    END;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Proceso de asignación finalizado.');
END carga_img_licencia;
/
SHOW ERRORS

