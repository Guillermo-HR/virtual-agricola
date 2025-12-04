--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en tabla socio
Prompt =========================================================

-- Productores
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Juan', 'Perez', null, 'jp01@ejemplo.com', 1, 0);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Sofia', 'Martinez', 'Lopez', 'sm02@ejemplo.com', 1, 0);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Fernando', 'Canchola', 'Cruz', 'fcc03@ejemplo.com', 1, 0);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Mariana', 'Gomez', 'Diaz', 'mg04@ejemplo.com', 1, 0);
-- Productores y compradores
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Luis', 'Rodriguez', 'Alonso', 'lr05@ejemplo.com', 1, 1);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Ana', 'Torres', null, 'at06@ejemplo.com', 1, 1);
-- Compradores
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Diego', 'Rivera', 'Sanchez', 'dr07@ejemplo.com', 0, 1);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Camila', 'Vargas', null, 'cv08@ejemplo.com', 0, 1);
insert into socio (nombre, apellido_paterno, apellido_materno, email, es_productor, es_comprador)
    values ('Pablo', 'Mendez', 'Ruiz', 'pm09@ejemplo.com', 0, 1);

commit;