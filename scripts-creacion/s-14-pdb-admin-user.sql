--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  09/12/2025
--@Descripción: Creación de usuarios administradores de los modulos


connect c##sys_modulos_virtualAgricola/1234 as sysdba; 

whenever sqlerror exit rollback
set feedback off

-----
-- Módulo "cliente"
----

alter session set container=cliente; 


-- Limpieza
drop user if exists admin_cliente cascade; 

--- Usuario administrador

create user admin_cliente identified by 1234; 
grant create session, create table,create procedure,create view,create sequence to admin_cliente; 



-- Administración de quotas

alter user admin_cliente quota unlimited on cliente_c2_cat_ts; 
alter user admin_cliente quota unlimited on cliente_c1_data_ts; 
alter user admin_cliente quota unlimited on cliente_c0_index_ts; 
alter user admin_cliente quota unlimited on cliente_c2_lobs_ts; 

-- DEFAULT TABLESPACES

alter user admin_cliente default tablespace cliente_c1_data_ts; 

------
-- Modulo "operacion"
-------

alter session set container=operacion; 


-- Limpieza
drop user if exists admin_operacion cascade; 

-- Usuario administrador

create user admin_operacion identified by 1234; 
grant create session,create table,create procedure,create view,create sequence to admin_operacion; 


-- Administracion de quotas

alter user admin_operacion quota unlimited on operacion_c2_cat_ts; 
alter user admin_operacion quota unlimited on operacion_c1_data_ts;
alter user admin_operacion quota unlimited on operacion_c0_data_ts;
alter user admin_operacion quota unlimited on operacion_c2_coldLob_ts;
alter user admin_operacion quota unlimited on operacion_c1_hotLob_ts;
alter user admin_operacion quota unlimited on operacion_c0_index_ts; 

-- DEFAULT TABLESPACE

alter user admin_operacion default tablespace operacion_c0_data_ts; 

Prompt > Usuarios administradores de las pdbs creados! 

exit
