--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla comprador
Prompt =========================================================

insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (1, 'Juan Perez', null, 1);
insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (2, 'Sofia Martinez Lopez', 1, 2);
insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (3, 'Fernando Canchola Cruz', null, 3);
insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (4, 'Mariana Gomez Diaz', 2, 4);
insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (5, 'Luis Rodriguez Alonso', 4, 5);
insert into comprador (comprador_id, nombre, aval_id, empresa_id)
values (6, 'Ana Torres', null, 6);
commit;