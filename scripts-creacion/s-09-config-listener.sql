--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  07/12/2025
--@Descripción: Connfiguracion del listener


connect sys/system2 as sysdba; 

whenever sqlerror exit rollback

-- Modo compartido

alter system set dispatchers='(dispatchers=2)(protocol=tcp)'; 
alter system set shared_servers=10;
alter system register;

-- Pool de conexiones

exec dbms_connection_pool.start_pool();
exec dbms_connection_pool.alter_param ('','MAXSIZE','50');
exec dbms_connection_pool.alter_param ('','MINSIZE','40');
exec dbms_connection_pool.alter_param('','INACTIVITY_TIMEOUT','1800');
exec dbms_connection_pool.alter_param('','MAX_THINK_TIME','1800');

Prompt > Diferentes modos de conexions habilitados

exit


