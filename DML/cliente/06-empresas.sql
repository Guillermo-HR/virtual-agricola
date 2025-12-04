--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla empresa
Prompt =========================================================

insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho 6666', 'RFCGENERICO1', to_date('2000-01-01', 'YYYY-MM-DD'));
insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho La Chula', 'RFCGENERICO2', to_date('2005-05-15', 'YYYY-MM-DD'));
insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho Norteño', 'RFCGENERICO3', to_date('2010-10-20', 'YYYY-MM-DD'));
insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho Yucatan', 'RFCGENERICO4', to_date('2015-03-30', 'YYYY-MM-DD'));
insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho Xochimilco', 'RFCGENERICO5', to_date('2020-07-25', 'YYYY-MM-DD'));
insert into empresa (nombre, rfc, anio_inicio)
values ('Rancho El Sol', 'RFCGENERICO6', to_date('1995-12-12', 'YYYY-MM-DD'));
commit;