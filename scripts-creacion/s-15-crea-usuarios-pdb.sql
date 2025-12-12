--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  09/12/2025
--@Descripción: Creación de usuarios que trabajan con la base de datos


connect c##sys_modulos_virtualAgricola/1234 as sysdba; 
whenever sqlerror exit rollback

alter session set CONTAINER=cliente; 

-- Limpieza 
drop user if exists cliente_app; 

create user cliente_app identified by 1234; 
grant create session to cliente_app; 

alter user cliente_app quota unlimited on users; 


DECLARE
    -- No se necesita un cursor explícito ni variables intermedias.
    v_sql_statement VARCHAR2(500); 
BEGIN
    -- Utiliza el bucle FOR implícito: es más seguro y maneja la lógica de OPEN/FETCH/CLOSE
    FOR table_rec IN (SELECT table_name FROM all_tables where owner='ADMIN_CLIENTE' )
    LOOP 
        -- 1. Se construye la sentencia DDL con concatenación de cadenas (Dynamic SQL)
        v_sql_statement := 
            'GRANT SELECT, INSERT, UPDATE ON admin_cliente.' || table_rec.table_name || ' TO cliente_app';
        
        -- 2. Se ejecuta la sentencia
        EXECUTE IMMEDIATE v_sql_statement;
        
        -- Opcional: Para ver el progreso si tienes DBMS_OUTPUT habilitado
        -- DBMS_OUTPUT.PUT_LINE('Otorgados permisos en: ' || table_rec.table_name);
    END LOOP; 
    
    -- Los GRANTs son DDL y se confirman automáticamente (COMMIT)
END; 
/


alter session set CONTAINER=operacion; 

-- Limpieza 
drop user if exists operacion_app; 

create user operacion_app identified by 1234; 
grant create session to operacion_app;

alter user operacion_app quota unlimited on users; 


DECLARE
    -- No se necesita un cursor explícito ni variables intermedias.
    v_sql_statement VARCHAR2(500); 
BEGIN
    -- Utiliza el bucle FOR implícito: es más seguro y maneja la lógica de OPEN/FETCH/CLOSE
    FOR table_rec IN (SELECT table_name FROM all_tables where owner='ADMIN_OPERACION')
    LOOP 
        -- 1. Se construye la sentencia DDL con concatenación de cadenas (Dynamic SQL)
        v_sql_statement := 
            'GRANT SELECT, INSERT, UPDATE ON admin_operacion.' || table_rec.table_name || ' TO operacion_app';
        
        -- 2. Se ejecuta la sentencia
        EXECUTE IMMEDIATE v_sql_statement;
        
        -- Opcional: Para ver el progreso si tienes DBMS_OUTPUT habilitado
        -- DBMS_OUTPUT.PUT_LINE('Otorgados permisos en: ' || table_rec.table_name);
    END LOOP; 
    
    -- Los GRANTs son DDL y se confirman automáticamente (COMMIT)
END; 
/

    





