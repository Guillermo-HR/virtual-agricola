--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt insertar registros en tabla cuenta
Prompt =========================================================

insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000001', 'Juan Perez', True, True, 1, 1);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000002', 'Juan Perez', False, True, 2, 1);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000003', 'Sofia Martinez Lopez', True, False, 1, 2);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000004', 'Fernando Canchola Cruz', True, True, 3, 3);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000005', 'Mariana Gomez Diaz', True, True, 4, 4);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000006', 'Luis Rodriguez Alonso', True, True, 2, 5);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000007', 'Ana Torres', True, True, 1, 6);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000008', 'Diego Rivera Sanchez', True, True, 3, 7);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000009', 'Camila Vargas', True, True, 4, 8);
insert into cuenta (clabe, titular, es_principal, activa, banco_id, socio_id)
values ('000000000000000010', 'Pablo Mendez Ruiz', True, True, 5, 9);
commit;