
-- Ejecutar Database.


create database nodomobiliario;
use nodomobiliario;

show create table activo;

 CREATE TABLE acta_asignacion (
    id_acta_asignacion bigint NOT NULL,
    id_usuario_asignado bigint NOT NULL,
    fecha_acta date NOT NULL,
    id_usuario_elabora bigint NOT NULL,
	fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    observacion character varying(80) NOT NULL
);
 

  CREATE TABLE activo (
    id_activo bigint NOT NULL,
    id_articulo bigint NOT NULL,
    descripcion_activo text NOT NULL,
    codigo character varying(80) NOT NULL,
    serial character varying(80) NOT NULL,
    fecha_compra date NOT NULL,
    fecha_garantia date NOT NULL,
    avaluo numeric(15,2) NOT NULL,
    requiere_mantenimiento character(1) DEFAULT 'S' NOT NULL,
    periodicidad_mantenimiento character varying(10) NOT NULL,
    id_usuario_registra integer NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    id_usuario_actualiza bigint NOT NULL,
    fecha_actualiza DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    asignado_a bigint NOT NULL
);

 CREATE TABLE articulo (
    id_articulo bigint NOT NULL,
    id_categoria bigint NOT NULL,
    descripcion text NOT NULL,
    estado character(1) DEFAULT 'A' NOT NULL
);

  CREATE TABLE bodega (
    id_bodega bigint NOT NULL,
    descripcion character varying(80) NOT NULL,
    estado character(1) DEFAULT 'A' NOT NULL,
    prefijo character(4) NOT NULL
);

 CREATE TABLE categoria_articulo (
    id_categoria bigint NOT NULL,
    descripcion character varying(80) NOT NULL,
    estado character(1) DEFAULT 'A'
);

  CREATE TABLE centro_costo (
    id_centro_costo bigint NOT NULL,
    descripcion character varying(80) NOT NULL,
    estado character(1) DEFAULT 'A'
);

  CREATE TABLE detalle_acta_asignacion (
    id_detalle_asignacion bigint NOT NULL,
    id_acta_asignacion bigint NOT NULL,
    id_activo bigint NOT NULL
);

 CREATE TABLE detalle_orden_inventario (
    id_detalle_orden_inventario bigint NOT NULL,
    id_orden_inventario bigint NOT NULL,
    id_centro_costo bigint NOT NULL,
    id_articulo bigint NOT NULL,
    descripcion_articulo text NOT NULL,
    cantidad integer NOT NULL
);

 CREATE TABLE orden_inventario (
    id_orden_inventario bigint NOT NULL,
    id_tipo_movimiento bigint NOT NULL,
    id_bodega bigint NOT NULL,
    id_usuario_registra bigint NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    orden_no varchar(240),
    id_bodega_destino bigint NOT NULL,
    observacion text NOT NULL
);


CREATE TABLE tipo_documento (
    id_tipo_documento bigint NOT NULL,
    descripcion character varying(80) NOT NULL
);

  CREATE TABLE tipo_movimiento (
    id_tipo_movimiento bigint NOT NULL,
    descripcion character varying(80) NOT NULL,
    signo character(1) DEFAULT '+' NOT NULL
);
######################################################
  CREATE TABLE usuario (
    id_usuario bigint NOT NULL,
    id_tipo_documento bigint NOT NULL,
    identificacion bigint NOT NULL,
    nombres character varying(80) NOT NULL,
    apellidos character varying(80) NOT NULL,
    genero character(1) DEFAULT 'M' NOT NULL,
    direccion character varying(80) NOT NULL,
    telefono character varying(45) NOT NULL,
    email character varying(80) NOT NULL,
    password character varying(80) NOT NULL
);

 CREATE TABLE perfil (
    id_perfil bigint NOT NULL,
    tipo_usuario character varying(20) NOT NULL,
    id_usuario bigint NOT NULL
);


 CREATE TABLE stock (
    id_articulo bigint NOT NULL,
    id_centro_costo bigint NOT NULL,
    id_bodega bigint NOT NULL,
    cantidad numeric(15,2) DEFAULT 0 NOT NULL
);
