--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla banco
Prompt =========================================================

insert into banco (clave, nombre)
values ('BNM', 'Banco Nacional de Mexico');
insert into banco (clave, nombre)
values ('BSA', 'Banco Santander');
insert into banco (clave, nombre)
values ('BBV', 'BBVA Bancomer');
insert into banco (clave, nombre)
values ('CIT', 'Citibanamex');
insert into banco (clave, nombre)
values ('HSB', 'HSBC Mexico');

COMMIT;

Prompt =========================================================
Prompt Inserción de registros en tabla banco finalizada
Prompt =========================================================