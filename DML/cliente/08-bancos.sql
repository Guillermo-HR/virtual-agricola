--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla banco
Prompt =========================================================

insert into banco (clave_banco, nombre_banco)
values ('BNM', 'Banco Nacional de Mexico');
insert into banco (clave_banco, nombre_banco)
values ('BSA', 'Banco Santander');
insert into banco (clave_banco, nombre_banco)
values ('BBV', 'BBVA Bancomer');
insert into banco (clave_banco, nombre_banco)
values ('CIT', 'Citibanamex');
insert into banco (clave_banco, nombre_banco)
values ('HSB', 'HSBC Mexico');

COMMIT;

Prompt =========================================================
Prompt Inserción de registros en tabla banco finalizada
Prompt =========================================================