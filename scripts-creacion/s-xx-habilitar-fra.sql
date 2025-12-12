--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  11/12/2025
--@Descripción: Habilitar la Fast Recovery Area



connect c##sys_modulos_virtualAgricola/1234 as sysdba

alter database flashback off;
alter system set db_recovery_file_dest=' ';



