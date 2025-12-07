--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Creacion de las tablas para modulo cliente
Prompt =========================================================

-- Limpiar tablas si existen
drop table if exists cuenta;
drop table if exists banco;
drop table if exists comprador;
drop table if exists empresa;
drop table if exists productor_producto;
drop table if exists tipo_producto;
drop table if exists productor;
drop table if exists zona;
drop table if exists socio;

-- Tabla socio
create table socio (
    socio_id        number(5, 0) generated always as identity maxvalue 99999 not null,
    nombre          varchar2(40) not null,
    ap_paterno      varchar2(40) not null,
    ap_materno      varchar2(40),
    email           varchar2(50) not null,
    es_productor    boolean not null,
    es_comprador    boolean not null,
    constraint socio_pk primary key (socio_id),
    constraint socio_email_uk unique (email),
    constraint socio_tipo_chk check (es_productor = 1 or es_comprador = 1)
);

-- Tabla zona
create table zona (
    zona_id         number(3, 0) generated always as identity maxvalue 999 not null,
    clave           varchar2(5) not null,
    descripcion     varchar2(30) not null,
    constraint zona_pk primary key (zona_id),
    constraint zona_clave_uk unique (clave),
    constraint zona_clave_chk check (length(clave)=5),
    constraint zona_descripcion_uk unique (descripcion)
);

-- Tabla productor
create table productor (
    productor_id     not null,
    semblanza        varchar2(300) not null,
    url              varchar2(100),
    zona_id          not null,
    constraint productor_pk primary key (productor_id),
    constraint productor_productor_id_fk foreign key (productor_id) references socio(socio_id),
    constraint productor_zona_id_fk foreign key (zona_id) references zona(zona_id)
);

-- Tabla tipo producto
create table tipo_producto (
    tipo_producto_id    number(3, 0) generated always as identity maxvalue 999 not null,
    clave               varchar2(5) not null,
    nombre              varchar2(40) not null,
    descripcion         varchar2(100) not null,
    foto                blob not null,
    activo              boolean not null,
    constraint tipo_producto_pk primary key (tipo_producto_id),
    constraint tipo_producto_clave_uk unique (clave),
    constraint tipo_producto_clave_chk check (length(clave)=5),
    constraint tipo_producto_nombre_uk unique (nombre)
);

-- Tabla productor_producto
create table productor_producto (
    productor_producto_id   number(4, 0) generated always as identity maxvalue 9999 not null,
    temporada_inicio        date,
    temporada_fin           date,
    tipo_producto_id        not null,
    productor_id            not null,
    constraint productor_producto_pk primary key (productor_producto_id),
    constraint productor_producto_tipo_producto_id_fk foreign key (tipo_producto_id) 
        references tipo_producto(tipo_producto_id),
    constraint productor_producto_productor_id_fk foreign key (productor_id) 
        references productor(productor_id)
);

-- Tabla empresa
create table empresa (
    empresa_id      number(5, 0) generated always as identity maxvalue 99999 not null,
    nombre          varchar2(120) not null,
    rfc             varchar2(12) not null,
    anio_inicio     date not null,
    constraint empresa_pk primary key (empresa_id),
    constraint empresa_rfc_uk unique (rfc),
    constraint empresa_rfc_chk check (length(rfc)=12)
);

-- Tabla comprador
create table comprador (
    comprador_id    not null,
    nombre          varchar2(120) not null,
    aval_id,
    empresa_id      not null,
    constraint comprador_pk primary key (comprador_id),
    constraint comprador_comprador_id_fk foreign key (comprador_id) references socio(socio_id),
    constraint comprador_aval_id_fk foreign key (aval_id) references socio(socio_id),
    constraint comprador_empresa_id_fk foreign key (empresa_id) references empresa(empresa_id)
);

-- Tabla banco
create table banco (
    banco_id        number(3, 0) generated always as identity maxvalue 999 not null,
    clave           varchar2(3) not null,
    nombre          varchar2(30) not null,
    constraint banco_pk primary key (banco_id),
    constraint banco_clave_uk unique (clave),
    constraint banco_clave_chk check (length(clave)=3),
    constraint banco_nombre_uk unique (nombre)
);

-- Tabla cuenta
create table cuenta (
    cuenta_id       number(6, 0) generated always as identity maxvalue 999999 not null,
    clabe           varchar2(18) not null,
    titular         varchar2(120) not null,
    es_principal    boolean not null,
    activa          boolean not null,
    banco_id        not null,
    socio_id        not null,
    constraint cuenta_pk primary key (cuenta_id),
    constraint cuenta_clabe_uk unique (clabe),
    constraint cuenta_clabe_chk check (length(clabe)=18),
    CONSTRAINT cuenta_clabe_chk_num CHECK (REGEXP_LIKE(clabe, '^[0-9]{18}$')),
    constraint cuenta_banco_id_fk foreign key (banco_id) references banco(banco_id),
    constraint cuenta_socio_id_fk foreign key (socio_id) references socio(socio_id)
);

Prompt ==========================================================
Prompt Creacion de tablas para modulo cliente completada
Prompt ===========================================================