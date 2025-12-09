--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set feedback off

Prompt - Iniciando creacion de objetos para modulo operacion

-- Limpiar tablas si existen
drop table if exists compra_descarga;
drop table if exists venta_extraccion;
drop table if exists rastreo_transporte;
drop table if exists evidencia_operacion;
drop table if exists pago_venta;
drop table if exists cuenta_op;
drop table if exists historico_estatus_operacion;
drop table if exists operacion;
drop table if exists estatus_operacion;
drop table if exists tipo_producto_op;
drop table if exists camion;
drop table if exists modelo;
drop table if exists bodega;
drop table if exists centro_resguardo;
drop table if exists ubicacion;
drop table if exists municipio;
drop table if exists entidad;
drop table if exists empleado;
drop table if exists historico_sueldo;
drop table if exists puesto;

-- Tabla puesto
create table puesto (
    puesto_id       number(3, 0) generated always as identity maxvalue 999 not null,
    clave           varchar2(5) not null,
    descripcion     varchar2(40) not null,
    sueldo          number(7, 2) not null,
    inicio_sueldo   date not null,
    fin_sueldo      date,
    constraint puesto_pk primary key (puesto_id),
    constraint puesto_clave_uk unique (clave),
    constraint puesto_clave_chk check (length(clave)=5)
);

-- Tabla historico_sueldo
create table historico_sueldo (
    historico_sueldo_id   number(5, 0) generated always as identity maxvalue 99999 not null,
    sueldo_actualizado    number(7, 2) not null,
    fecha_inicio          date not null,
    fecha_fin             date,
    puesto_id             not null,
    constraint historico_sueldo_pk primary key (historico_sueldo_id),
    constraint historico_sueldo_puesto_id_fk foreign key (puesto_id) references puesto(puesto_id)
);

-- Tabla empleado
create table empleado (
    empleado_id      number(3, 0) generated always as identity maxvalue 999 not null,
    nombre           varchar2(120) not null,
    curp             varchar2(18) not null,
    es_conductor     boolean not null,
    licencia         blob,
    activo           boolean not null,
    puesto_id        not null,
    constraint empleado_pk primary key (empleado_id),
    constraint empleado_curp_uk unique (curp),
    constraint empleado_curp_chk check (length(curp)=18),
    constraint empleado_conductor_licencia_chk check (
        es_conductor and licencia is not null
    ),
    constraint empleado_puesto_id_fk foreign key (puesto_id) references puesto(puesto_id)
);

-- Tabla entidad
create table entidad (
    entidad_id      number(2, 0) generated always as identity maxvalue 99,
    clave           varchar(5) not null,
    nombre          varchar2(40) not null,
    constraint entidad_pk primary key (entidad_id),
    constraint entidad_clave_uk unique (clave),
    constraint entidad_clave_chk check (length(clave)=5),
    constraint entidad_nombre_uk unique (nombre)
);

-- Tabla municipio
create table municipio (
    municipio_id     number(4, 0) generated always as identity maxvalue 9999,
    numero_municipio number(3, 0) not null,
    nombre           varchar2(40) not null,
    entidad_id       not null,
    constraint municipio_pk primary key (municipio_id),
    constraint municipio_numero_uk unique (numero_municipio, entidad_id),
    constraint municipio_entidad_id_fk foreign key (entidad_id) references entidad(entidad_id)
);

-- Tabla ubicacion
create table ubicacion (
    ubicacion_id     number(5, 0) generated always as identity maxvalue 99999 not null,
    clave            varchar2(10) not null,
    calle            varchar2(40) not null,
    numero           varchar2(10) not null,
    colonia          varchar2(40) not null,
    codigo_postal    varchar2(5) not null,
    latitud          number(8,6) not null,
    longitud         number(9,6) not null,
    es_centro_resguardo boolean not null,
    fachada          blob not null,
    activo           boolean not null,
    municipio_id     not null,
    constraint ubicacion_pk primary key (ubicacion_id),
    constraint ubicacion_clave_uk unique (clave),
    constraint ubicacion_clave_chk check (length(clave)=10),
    constraint ubicacion_codigo_postal_chk check (length(codigo_postal)=5),
    constraint ubicacion_codigo_postal_chk_num check (regexp_like(codigo_postal, '^[0-9]{5}$')),
    constraint ubicacion_latitud_chk check (latitud between -90 and 90),
    constraint ubicacion_longitud_chk check (longitud between -180 and 180),
    constraint ubicacion_municipio_id_fk foreign key (municipio_id) references municipio(municipio_id)
);

-- Tabla centro_resguardo
create table centro_resguardo (
    centro_resguardo_id   number(4, 0) generated always as identity maxvalue 9999 not null,
    capacidad_maxima      number(6, 3) not null,
    numero_bodegas        number(3, 0) not null,
    gerente_id            not null,
    ubicacion_id          not null,
    constraint centro_resguardo_pk primary key (centro_resguardo_id),
    constraint centro_resguardo_capacidad_chk check (capacidad_maxima > 0),
    constraint centro_resguardo_numero_bodegas_chk check (numero_bodegas > 0),
    constraint centro_resguardo_gerente_id_fk foreign key (gerente_id) references empleado(empleado_id),
    constraint centro_resguardo_ubicacion_id_fk foreign key (ubicacion_id) references ubicacion(ubicacion_id)
);

-- Tabla bodega
create table bodega (
    bodega_id          number(5, 0) generated always as identity maxvalue 99999 not null,
    numero_bodega     number(3, 0) not null,
    tiene_control_temperatura boolean not null,
    capacidad_maxima   number(5, 3) not null,
    capacidad_actual   number(5, 3) not null,
    centro_resguardo_id not null,
    constraint bodega_pk primary key (bodega_id),
    constraint bodega_numero_uk unique (numero_bodega, centro_resguardo_id),
    constraint bodega_capacidad_maxima_chk check (capacidad_maxima > 0),
    constraint bodega_capacidad_actual_chk check (capacidad_actual >= 0 and capacidad_actual <= capacidad_maxima),
    constraint bodega_centro_resguardo_id_fk foreign key (centro_resguardo_id) references centro_resguardo(centro_resguardo_id)
);

-- Tabla modelo
create table modelo (
    modelo_id      number(3, 0) generated always as identity maxvalue 999 not null,
    marca          varchar2(40) not null,
    modelo        varchar2(40) not null,
    constraint modelo_pk primary key (modelo_id),
    constraint modelo_marca_modelo_uk unique (marca, modelo)
);

-- Tabla camion
create table camion (
    camion_id      number(4, 0) generated always as identity maxvalue 9999 not null,
    placa          varchar2(7) not null,
    anio           varchar2(4) not null,
    foto           blob,
    activo         boolean not null,
    modelo_id      not null,
    constraint camion_pk primary key (camion_id),
    constraint camion_placa_uk unique (placa),
    constraint camion_placa_chk check (length(placa)=7),
    constraint camion_anio_chk check (length(anio)=4),
    constraint camion_anio_chk_num check (regexp_like(anio, '^[0-9]{4}$')),
    constraint camion_modelo_id_fk foreign key (modelo_id) references modelo(modelo_id)
);

-- Tabla tipo_producto_op
create table tipo_producto_op (
    tipo_producto_id  number(4, 0) generated always as identity maxvalue 9999 not null,
    nombre            varchar2(40) not null,
    activo            boolean not null,
    constraint tipo_producto_op_pk primary key (tipo_producto_id),
    constraint tipo_producto_op_nombre_uk unique (nombre)
);

-- Tabla estatus_operacion
create table estatus_operacion (
    estatus_operacion_id   number(1, 0) generated always as identity maxvalue 9 not null,
    clave                  varchar2(5) not null,
    descripcion            varchar2(15) not null,
    constraint estatus_operacion_pk primary key (estatus_operacion_id),
    constraint estatus_operacion_clave_uk unique (clave),
    constraint estatus_operacion_clave_chk check (length(clave)=5)
);

-- Tabla operacion
create table operacion (
    operacion_id        number(6, 0) generated always as identity maxvalue 999999 not null,
    socio_id_r          number(5, 0) not null,
    fecha_inicio        date not null,
    fecha_fin           date,
    tipo_operacion      varchar2(1) not null,
    cantidad            number(6, 3) not null,
    precio_unitario    number(6, 2) not null,
    comision            number(7, 2) not null,
    total              number(10, 2) not null,
    fecha_status       date not null,
    camion_id          not null,
    chofer_id          not null,
    estatus_operacion_id not null,
    origen_id         not null,
    destino_id        not null,
    tipo_producto_id   not null,
    constraint operacion_pk primary key (operacion_id),
    constraint operacion_tipo_operacion_chk check (tipo_operacion in ('C', 'V')),
    constraint operacion_cantidad_chk check (cantidad > 0),
    constraint operacion_precio_unitario_chk check (precio_unitario > 0),
    constraint operacion_comision_chk check (comision >= 0),
    constraint operacion_total_chk check (total = (cantidad * precio_unitario) + comision),
    constraint operacion_origen_destino_chk check (origen_id != destino_id),
    constraint operacion_camion_id_fk foreign key (camion_id) references camion(camion_id),
    constraint operacion_chofer_id_fk foreign key (chofer_id) references empleado(empleado_id),
    constraint operacion_estatus_operacion_id_fk foreign key (estatus_operacion_id) references estatus_operacion(estatus_operacion_id),
    constraint operacion_origen_id_fk foreign key (origen_id) references ubicacion(ubicacion_id),
    constraint operacion_destino_id_fk foreign key (destino_id) references ubicacion(ubicacion_id),
    constraint operacion_tipo_producto_id_fk foreign key (tipo_producto_id) references tipo_producto_op(tipo_producto_id)
);

-- Tabla historico_estatus_operacion
create table historico_estatus_operacion (
    historico_estatus_operacion_id  number(7, 0) generated always as identity maxvalue 9999999 not null,
    fecha_cambio_estatus            date not null,
    estatus_operacion_id            not null,
    operacion_id                    not null,
    constraint historico_estatus_operacion_pk primary key (historico_estatus_operacion_id),
    constraint historico_estatus_operacion_estatus_operacion_id_fk foreign key (estatus_operacion_id) 
        references estatus_operacion(estatus_operacion_id),
    constraint historico_estatus_operacion_operacion_id_fk foreign key (operacion_id) 
        references operacion(operacion_id)
);

-- Tabla cuenta_op
create table cuenta_op (
    cuenta_id      number(6, 0) generated always as identity maxvalue 999999 not null,
    clabe          varchar2(18) not null,
    titular        varchar2(120) not null,
    banco          varchar2(40) not null,
    activo         boolean not null,
    constraint cuenta_op_pk primary key (cuenta_id),
    constraint cuenta_op_clabe_uk unique (clabe),
    constraint cuenta_op_clabe_chk check (length(clabe)=18)
);

-- Tabla pago_venta
create table pago_venta (
    pago_venta_id   number(7, 0) generated always as identity maxvalue 9999999 not null,
    fecha_pago      date not null,
    importe         number(10, 2) not null,
    numero_pago     number(2, 0) not null,
    operacion_id    not null,
    cuenta_id       not null,
    constraint pago_venta_pk primary key (pago_venta_id),
    constraint pago_venta_importe_chk check (importe > 0),
    constraint pago_venta_numero_pago_chk check (numero_pago > 0),
    constraint pago_venta_numero_pago_operacion_uk unique (numero_pago, operacion_id),
    constraint pago_venta_operacion_id_fk foreign key (operacion_id) references operacion(operacion_id),
    constraint pago_venta_cuenta_id_fk foreign key (cuenta_id) references cuenta_op(cuenta_id)
);

-- Tabla evidencia_operacion
create table evidencia_operacion (
    evidencia_operacion_id   number(7, 0) generated always as identity maxvalue 9999999 not null,
    numero_evidencia        number(2, 0) not null,
    foto                  blob not null,
    operacion_id          not null,
    constraint evidencia_operacion_pk primary key (evidencia_operacion_id),
    constraint evidencia_operacion_numero_evidencia_chk check (numero_evidencia > 0 and numero_evidencia <=10),
    constraint evidencia_operacion_numero_evidencia_operacion_uk unique (numero_evidencia, operacion_id),
    constraint evidencia_operacion_operacion_id_fk foreign key (operacion_id) references operacion(operacion_id)
);

-- Tabla rastreo_transporte
create table rastreo_transporte (
    rastreo_transporte_id   number(10, 0) generated always as identity maxvalue 9999999999 not null,
    fecha_hora              date not null,
    latitud                 number(8,6) not null,
    longitud                number(9,6) not null,
    observaciones            varchar2(200),
    folio_gps                varchar2(10) not null,
    operacion_id            not null,
    constraint rastreo_transporte_pk primary key (rastreo_transporte_id),
    constraint rastreo_transporte_latitud_chk check (latitud between -90 and 90),
    constraint rastreo_transporte_longitud_chk check (longitud between -180 and 180),
    constraint rastreo_transporte_folio_gps_chk check (length(folio_gps)=10),
    constraint rastreo_transporte_operacion_id_fk foreign key (operacion_id) references operacion(operacion_id)
);

-- Tabla venta_extraccion
create table venta_extraccion (
    venta_extraccion_id   number(7, 0) generated always as identity maxvalue 9999999 not null,
    cantidad_producto_extraido  number(6, 3) not null,
    fecha_extraccion          date not null,
    bodega_id                not null,
    operacion_id            not null,
    constraint venta_extraccion_pk primary key (venta_extraccion_id),
    constraint venta_extraccion_cantidad_producto_extraido_chk check (cantidad_producto_extraido > 0),
    constraint venta_extraccion_bodega_id_fk foreign key (bodega_id) references bodega(bodega_id),
    constraint venta_extraccion_operacion_id_fk foreign key (operacion_id) references operacion(operacion_id)
);

-- Tabla compra_descarga
create table compra_descarga (
    compra_descarga_id   number(7, 0) generated always as identity maxvalue 9999999 not null,
    recibo_pdf         blob not null,
    cantidad_producto_descargado  number(6, 3) not null,
    bodega_id                not null,
    operacion_id            not null,
    constraint compra_descarga_pk primary key (compra_descarga_id),
    constraint compra_descarga_cantidad_producto_descargado_chk check (cantidad_producto_descargado > 0),
    constraint compra_descarga_bodega_id_fk foreign key (bodega_id) references bodega(bodega_id),
    constraint compra_descarga_operacion_id_fk foreign key (operacion_id) references operacion(operacion_id)
);

Prompt > Creacion de objetos para modulo operacion completada