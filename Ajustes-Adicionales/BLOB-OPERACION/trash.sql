CREATE OR REPLACE PROCEDURE carga_img_recibo(
    compra_descarga_id_insert IN NUMBER
)
IS
    v_bfile            BFILE;
    v_blob             BLOB;
    v_foto             VARCHAR2(20);
    v_img_id           NUMBER;
BEGIN
    v_foto := 'recibo.jpg';
    
    -- 2. Obtener el localizador BLOB y bloquear el registro
    -- Nota: Al ser llamado justo después del INSERT, la foto ya debe ser EMPTY_BLOB() o NULL.
    SELECT foto
    INTO v_blob
    FROM evidencia_operacion
    WHERE compra_descarga_id  = compra_descarga_id_insert
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
END carga_img_recibo;
/
SHOW ERRORS