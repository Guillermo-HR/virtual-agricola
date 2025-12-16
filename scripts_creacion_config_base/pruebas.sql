

connect admin_cliente/1234@cliente

drop table if exists tipo_producto;

-- Tabla tipo producto
create table tipo_producto (
    tipo_producto_id    number(3, 0) generated always as identity maxvalue 999 not null,
    clave               varchar2(5) not null,
    nombre              varchar2(40) not null,
    descripcion         varchar2(100) not null,
    foto                blob not null,
    activo              boolean not null,
    constraint tipo_producto_pk primary key (tipo_producto_id) USING INDEX TABLESPACE cliente_c0_index_ts,
    constraint tipo_producto_clave_uk unique (clave) USING INDEX TABLESPACE cliente_c0_index_ts,
    constraint tipo_producto_clave_chk check (length(clave)=5),
    constraint tipo_producto_nombre_uk unique (nombre) USING INDEX TABLESPACE cliente_c0_index_ts
)
segment creation immediate
tablespace cliente_c2_cat_ts
LOB (foto) STORE AS BASICFILE hola(
    TABLESPACE cliente_c2_lobs_ts
    );

drop table if exists tipo_producto; 