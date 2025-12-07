--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback

Prompt =========================================================
Prompt Iniciando insercion de datos en tablas catalogo modulo cliente
Prompt =========================================================

@02-zonas.sql
@04-tipo_productos.sql
@08-bancos.sql

Prompt =========================================================
Prompt Insercion de datos en tablas catalogo modulo cliente completada
Prompt =========================================================

Prompt =========================================================
Prompt Iniciando creacion de procedimientos modulo cliente
Prompt =========================================================

@01-socios.sql
@03-productores.sql
@05-productor_productos.sql
@06-empresas.sql
@07-compradores.sql
@09-cuentas.sql
@10-llenar_modulo_clientes.sql

Prompt =========================================================
Prompt Creacion de procedimientos modulo cliente completada
Prompt ========================================================= 