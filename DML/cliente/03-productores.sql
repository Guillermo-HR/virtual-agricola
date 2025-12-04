--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en tabla productor
Prompt =========================================================

insert into productor (productor_id, semblanza, url, zona_id)
    values (1, 'Productor 1', 'http://juanPerez.com/productor1', 1);
insert into productor (productor_id, semblanza, url, zona_id)
    values (2, 'Productor 2', 'http://sofiaMartinez.com/productor2', 2);
insert into productor (productor_id, semblanza, url, zona_id)
    values (3, 'Productor 3', 'http://fernandoCanchola.com/productor3', 1);
insert into productor (productor_id, semblanza, url, zona_id)
    values (4, null, 'http://marianaGomez.com/productor4', 3);
insert into productor (productor_id, semblanza, url, zona_id)
    values (5, 'Productor 5', 'http://luisRodriguez.com/productor5', 2);
insert into productor (productor_id, semblanza, url, zona_id)
    values (6, 'Productor 6', 'http://anaTorres.com/productor6', 3);

commit;