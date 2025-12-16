--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  14/12/2025

connect admin_cliente/1234@cliente 


CREATE OR REPLACE PROCEDURE carga_img_tipo_producto IS
  v_bfile            BFILE;
  v_blob             BLOB;
  v_foto             VARCHAR2(20);
  v_img_id           NUMBER;

  CURSOR tipo_producto_sin_foto IS
    SELECT tipo_producto_id
    FROM tipo_producto
    WHERE foto is not null AND DBMS_LOB.GETLENGTH(foto) = 0; 
    
BEGIN
  DBMS_OUTPUT.PUT_LINE('Iniciando carga aleatoria (1-5.jpg) para tipo_producto sin imagen...');

  FOR producto IN tipo_producto_sin_foto LOOP
    
    -- 1. Generar un número aleatorio entre 1 y 5 (para #.jpg)
    v_img_id := TRUNC(DBMS_RANDOM.VALUE(1, 6)); 
    v_foto := v_img_id || '.jpg';
    
    -- Bloque interno para manejar excepciones
    BEGIN
        
        SELECT foto
        INTO v_blob
        FROM tipo_producto
        WHERE tipo_producto_id = producto.tipo_producto_id
        FOR UPDATE;
        
        -- 3. Obtener referencia al archivo en el S.O.
        v_bfile := BFILENAME('FILES_MODULO_CLIENTE', v_foto);
        
        -- 4. Validar existencia del archivo.
        IF DBMS_LOB.FILEEXISTS(v_bfile) = 0 THEN
            RAISE_APPLICATION_ERROR(-20001,
                'El archivo ' || v_foto || ' no existe en el directorio FILE_MODULO_CLIENTE'
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
  
  DBMS_OUTPUT.PUT_LINE('Proceso de asignación aleatoria finalizado.');
END carga_img_tipo_producto;
/
SHOW ERRORS

