--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt =========================================================
Prompt Iniciando insercion de datos en tablas catalogo modulo cliente
Prompt =========================================================

@DML/cliente/02-zonas.sql
@DML/cliente/04-tipo_productos.sql
@DML/cliente/08-bancos.sql

Prompt =========================================================
Prompt Insercion de datos en tablas catalogo modulo cliente completada
Prompt =========================================================

Prompt =========================================================
Prompt Iniciando creacion de procedimientos modulo cliente
Prompt =========================================================

@DML/cliente/01-socios.sql
@DML/cliente/03-productores.sql
@DML/cliente/05-productor_productos.sql
@DML/cliente/06-empresas.sql
@DML/cliente/07-compradores.sql
@DML/cliente/09-cuentas.sql
@DML/cliente/10-llenar_modulo_clientes.sql

Prompt =========================================================
Prompt Creacion de procedimientos modulo cliente completada
Prompt ========================================================= 