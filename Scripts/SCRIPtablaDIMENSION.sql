-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-beta
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.fact_alquiler | type: TABLE --
-- DROP TABLE IF EXISTS public.fact_alquiler CASCADE;
CREATE TABLE public.fact_alquiler(
	cantida integer,
	monto_pago int2,
	id_sucursal_dim_sucursal bigint,
	id_personal_dim_personal bigint,
	id_lenguaje_dim_lenguaje bigint,
	id_tiempo_dim_tiempo bigint,
	id_pelicula_dim_pelicula bigint,
	id_actor_dim_actor bigint,
	id_categoria_dim_categoria bigint,
	id_cliente_dim_cliente bigint
);
-- ddl-end --
ALTER TABLE public.fact_alquiler OWNER TO postgres;
-- ddl-end --

-- object: public.dim_personal | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_personal CASCADE;
CREATE TABLE public.dim_personal(
	id_personal bigserial NOT NULL,
	nombre varchar(40),
	apellidos varchar(40),
	direccion varchar(40),
	ciudad varchar(40),
	pais varchar(30),
	fecha_insercion integer,
	fecha_actualizacion integer,
	CONSTRAINT dim_personal_pk PRIMARY KEY (id_personal)

);
-- ddl-end --
ALTER TABLE public.dim_personal OWNER TO postgres;
-- ddl-end --

-- object: public.dim_sucursal | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_sucursal CASCADE;
CREATE TABLE public.dim_sucursal(
	nombre varchar(40),
	direccion varchar(40),
	ciudad varchar(40),
	id_sucursal bigserial NOT NULL,
	pais varchar(30),
	fecha_insercion integer,
	fecha_actualizacion integer,
	CONSTRAINT dim_sucursal_pk PRIMARY KEY (id_sucursal)

);
-- ddl-end --
ALTER TABLE public.dim_sucursal OWNER TO postgres;
-- ddl-end --

-- object: public.dim_tiempo | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_tiempo CASCADE;
CREATE TABLE public.dim_tiempo(
	id_tiempo bigserial NOT NULL,
	fecha integer,
	dia integer,
	mes integer,
	mes_texto varchar(20),
	semana integer,
	anho integer,
	dia_semana_texto varchar(40),
	estacion varchar(40),
	dia_semana integer,
	trimestre integer,
	trimestre_texto varchar(40),
	cuatrimestre integer,
	cuatrimestre_texto varchar(40),
	semestre integer,
	semestre_texto varchar(40),
	CONSTRAINT dim_tiempo_pk PRIMARY KEY (id_tiempo)

);
-- ddl-end --
ALTER TABLE public.dim_tiempo OWNER TO postgres;
-- ddl-end --

-- object: public.dim_cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_cliente CASCADE;
CREATE TABLE public.dim_cliente(
	id_cliente bigserial NOT NULL,
	nombre varchar(40),
	apellido varchar(40),
	direccion varchar(40),
	ciudad varchar(40),
	pais varchar(40),
	fecha_insercion varchar(40),
	fecha_actualizacion smallint,
	CONSTRAINT dim_cliente_pk PRIMARY KEY (id_cliente)

);
-- ddl-end --
ALTER TABLE public.dim_cliente OWNER TO postgres;
-- ddl-end --

-- object: public.dim_lenguaje | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_lenguaje CASCADE;
CREATE TABLE public.dim_lenguaje(
	id_lenguaje bigserial NOT NULL,
	name varchar(40),
	fecha_insercion integer,
	fecha_actualizacion integer,
	CONSTRAINT dim_lenguaje_pk PRIMARY KEY (id_lenguaje)

);
-- ddl-end --
ALTER TABLE public.dim_lenguaje OWNER TO postgres;
-- ddl-end --

-- object: public.dim_categoria | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_categoria CASCADE;
CREATE TABLE public.dim_categoria(
	id_categoria bigserial NOT NULL,
	nombre varchar(40),
	CONSTRAINT dim_categoria_pk PRIMARY KEY (id_categoria)

);
-- ddl-end --
ALTER TABLE public.dim_categoria OWNER TO postgres;
-- ddl-end --

-- object: public.dim_actor | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_actor CASCADE;
CREATE TABLE public.dim_actor(
	id_actor bigserial NOT NULL,
	nombre varchar(40),
	apellido varchar(40),
	fecha_insercion integer,
	fecha_actualizacion integer,
	CONSTRAINT dim_actor_pk PRIMARY KEY (id_actor)

);
-- ddl-end --
ALTER TABLE public.dim_actor OWNER TO postgres;
-- ddl-end --

-- object: public.dim_pelicula | type: TABLE --
-- DROP TABLE IF EXISTS public.dim_pelicula CASCADE;
CREATE TABLE public.dim_pelicula(
	id_pelicula bigserial NOT NULL,
	descripcion varchar(40),
	anho_lanzamiento integer,
	duracion integer,
	fecha_insercion integer,
	fecha_actualizacion integer,
	CONSTRAINT dim_pelicula_pk PRIMARY KEY (id_pelicula)

);
-- ddl-end --
ALTER TABLE public.dim_pelicula OWNER TO postgres;
-- ddl-end --

-- object: dim_sucursal_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_sucursal_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_sucursal_fk FOREIGN KEY (id_sucursal_dim_sucursal)
REFERENCES public.dim_sucursal (id_sucursal) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_personal_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_personal_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_personal_fk FOREIGN KEY (id_personal_dim_personal)
REFERENCES public.dim_personal (id_personal) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_lenguaje_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_lenguaje_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_lenguaje_fk FOREIGN KEY (id_lenguaje_dim_lenguaje)
REFERENCES public.dim_lenguaje (id_lenguaje) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_tiempo_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_tiempo_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_tiempo_fk FOREIGN KEY (id_tiempo_dim_tiempo)
REFERENCES public.dim_tiempo (id_tiempo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_pelicula_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_pelicula_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_pelicula_fk FOREIGN KEY (id_pelicula_dim_pelicula)
REFERENCES public.dim_pelicula (id_pelicula) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_actor_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_actor_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_actor_fk FOREIGN KEY (id_actor_dim_actor)
REFERENCES public.dim_actor (id_actor) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_categoria_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_categoria_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_categoria_fk FOREIGN KEY (id_categoria_dim_categoria)
REFERENCES public.dim_categoria (id_categoria) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: dim_cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.fact_alquiler DROP CONSTRAINT IF EXISTS dim_cliente_fk CASCADE;
ALTER TABLE public.fact_alquiler ADD CONSTRAINT dim_cliente_fk FOREIGN KEY (id_cliente_dim_cliente)
REFERENCES public.dim_cliente (id_cliente) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


