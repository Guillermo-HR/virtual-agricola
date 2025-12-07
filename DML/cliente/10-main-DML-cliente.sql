--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

@DML/cliente/01-socios.sql
@DML/cliente/02-zonas.sql
@DML/cliente/03-productores.sql
@DML/cliente/04-tipo_productos.sql
@DML/cliente/05-productor_productos.sql
@DML/cliente/06-empresas.sql
@DML/cliente/07-compradores.sql
@DML/cliente/08-bancos.sql
@DML/cliente/09-cuentas.sql

CREATE OR REPLACE PROCEDURE LLENAR_MODULO_CLIENTE (
    p_n_productores IN NUMBER,
    p_n_compradores IN NUMBER,
    p_n_productores_compradores IN NUMBER
)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('=========================================================');
    DBMS_OUTPUT.PUT_LINE('Insertar registros modulo cliente');
    DBMS_OUTPUT.PUT_LINE('=========================================================');
    INSERTAR_SOCIOS(p_n_productores, p_n_compradores, p_n_productores_compradores);
    INSERTAR_PRODUCTORES;
    INSERTAR_PRODUCTOR_PRODUCTOS;
    INSERTAR_EMPRESAS;
    INSERTAR_COMPRADORES;
    INSERTAR_CUENTAS;
    DBMS_OUTPUT.PUT_LINE('=========================================================');
    DBMS_OUTPUT.PUT_LINE('Insertar registros modulo cliente terminado');
    DBMS_OUTPUT.PUT_LINE('=========================================================');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END LLENAR_MODULO_CLIENTE;
/