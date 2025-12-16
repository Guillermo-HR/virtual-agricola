--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  06/12/2025

whenever sqlerror exit rollback

Prompt =======================================
Prompt Configuracion de los objetos directories

----- MODULO CLIENTE 
connect admin_cliente/1234@cliente

define dir_path = 'files_cliente'
create or replace directory files_modulo_cliente as '&dir_path';
grant read, write  on directory files_modulo_cliente to cliente_app;
------------


------- MODULO OPERACION
connect admin_operacion/1234@operacion

define dir_path = 'files_operacion'
create or replace directory files_modulo_operacion as '&dir_path';
grant read, write  on directory files_modulo_operacion to operacion_app;

Prompt -> Listo
Prompt =======================================

exit