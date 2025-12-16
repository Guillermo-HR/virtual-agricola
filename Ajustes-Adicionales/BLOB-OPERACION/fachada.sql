
CREATE OR REPLACE PROCEDURE carga_img_fachada(
    ubicacion_id_insert IN NUMBER
)
IS
    v_bfile            BFILE;
    v_blob             BLOB;
    v_foto             VARCHAR2(20);
    v_img_id           NUMBER;
BEGIN
    -- 1. Generar un número aleatorio entre 1 y 2
    v_img_id := TRUNC(DBMS_RANDOM.VALUE(1, 3)); 
    v_foto := 'fachada_' || v_img_id || '.jpg';
    
    -- 2. Obtener el localizador BLOB y bloquear el registro
    -- Nota: Al ser llamado justo después del INSERT, la foto ya debe ser EMPTY_BLOB() o NULL.
    SELECT fachada
    INTO v_blob
    FROM ubicacion
    WHERE ubicacion_id = ubicacion_id_insert
    FOR UPDATE;
    
    -- 3. Obtener referencia al archivo externo (BFILE)
    v_bfile := BFILENAME('FILES_MODULO_OPERACION', v_foto);
    
-- 4. Validar existencia del archivo.
    IF DBMS_LOB.FILEEXISTS(v_bfile) = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
           'El archivo ' || v_foto || ' no existe en el directorio FILES_MODULO_OPERACION'
            );
    END IF;

    -- 5. Abrir, cargar y cerrar el archivo
    DBMS_LOB.FILEOPEN(v_bfile, DBMS_LOB.FILE_READONLY);
    
    DBMS_LOB.LOADFROMFILE(
        dest_lob => v_blob,
        src_lob => v_bfile,
        amount => DBMS_LOB.GETLENGTH(v_bfile)
    );
    
    DBMS_LOB.FILECLOSE(v_bfile);
    
    -- El COMMIT se hace implícitamente al finalizar la transacción del INSERT, 
    -- o podría manejarse externamente si se llama desde un trigger.
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Empleado no encontrado');
    WHEN OTHERS THEN
        IF DBMS_LOB.ISOPEN(v_bfile) = 1 THEN
            DBMS_LOB.FILECLOSE(v_bfile);
        END IF;
        -- Re-lanzar el error para que la transacción de INSERT falle si la carga falla
        RAISE; 
END carga_img_fachada;
/
SHOW ERRORS

CREATE OR REPLACE TRIGGER trg_ubicacion_post_insert
AFTER INSERT ON ubicacion
FOR EACH ROW
BEGIN
    carga_img_fachada(:NEW.ubicacion_id);
END;
/
SHOW ERRORS