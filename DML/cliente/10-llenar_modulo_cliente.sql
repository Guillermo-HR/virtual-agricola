--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt - Iniciando creacion de procedimiento llenar_modulo_cliente

CREATE OR REPLACE PROCEDURE LLENAR_MODULO_CLIENTE (
    p_n_productores IN NUMBER,
    p_n_compradores IN NUMBER,
    p_n_productores_compradores IN NUMBER
)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros modulo cliente');
    INSERTAR_SOCIOS(p_n_productores, p_n_compradores, p_n_productores_compradores);
    INSERTAR_PRODUCTORES;
    INSERTAR_PRODUCTOR_PRODUCTOS;
    INSERTAR_EMPRESAS;
    INSERTAR_COMPRADORES;
    INSERTAR_CUENTAS;
    DBMS_OUTPUT.PUT_LINE('- Insercion de registros modulo cliente terminado');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END LLENAR_MODULO_CLIENTE;
/

Prompt - Creacion de procedimiento llenar_modulo_cliente completada