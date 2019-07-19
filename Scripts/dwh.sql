/* DWH */

-- dim_cliente
CREATE TABLE dim_cliente (
	id_cliente int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	apellido varchar(45) NOT NULL,
	pais varchar(45) NOT NULL,
	ciudad varchar(45) NOT NULL,
	direccion varchar(90) NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_cliente_pk PRIMARY KEY (id_cliente)
);

--dim_personal
CREATE TABLE dim_personal (
	id_personal int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	apellido varchar(45) NOT NULL,
	direccion varchar(90) NOT NULL,
	ciudad varchar(45) NOT NULL,
	pais varchar(45) NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_personal_pk PRIMARY KEY (id_personal)
);


-- dim_sucursal
CREATE TABLE dim_sucursal (
	id_sucursal int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	ciudad varchar(45) NOT NULL,
	direccion varchar(90) NOT NULL,
	pais varchar(45) NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_sucursal_pk PRIMARY KEY (id_sucursal)
);

--dim_categoria
CREATE TABLE dim_categoria (
	id_categoria int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	CONSTRAINT dim_categoria_pk PRIMARY KEY (id_categoria)
);


--dim_lenguaje
CREATE TABLE dim_lenguaje (
	id_lenguaje int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_lenguaje_pk PRIMARY KEY (id_lenguaje)
);


--dim_actor
CREATE TABLE dim_actor (
	id_actor int4 NOT NULL,
	nombre varchar(45) NOT NULL,
	apellido varchar(45) NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_actor_pk PRIMARY KEY (id_actor)
);

--dim_pelicula
CREATE TABLE dim_pelicula (
	id_pelicula int4 NOT NULL,
	descripcion varchar(255) NOT NULL,
	anho_lanzamiento int4 NOT NULL,
	duracion int2 NOT NULL,
	fecha_insercion date NOT NULL,
	fecha_actualizacion date NOT NULL,
	CONSTRAINT dim_pelicula_pk PRIMARY KEY (id_pelicula)
);

-- dim_tiempo
CREATE TABLE dim_tiempo (
	id_tiempo int4 NOT NULL,
	fecha date NOT NULL,
	dia int2 NOT NULL,
	mes int2 NOT NULL,
	mes_texto varchar(20) NOT NULL,
	semana int2 NOT NULL,
	anho int2 NOT NULL,
	dia_semana int2 NOT NULL,
	dia_semana_texto varchar(10) NOT NULL,
	trimestre int2 NOT NULL,
	trimestre_texto varchar(20) NOT NULL,
	cuatrimestre int2 NOT NULL,
	cuatrimestre_texto varchar(20) NOT NULL,
	semestre int2 NOT NULL,
	semestre_texto varchar(20) NOT NULL,
	estacion int2 NOT NULL,
	CONSTRAINT dim_tiempo_pk PRIMARY KEY (id_tiempo)
);

 -- fac_alquiler
CREATE TABLE fac_alquiler (
	cantidad int4 NOT NULL,
	monto_pago numeric(5,2) NOT NULL,
	cliente_id int4 NULL,
	tiempo_id int4 NULL,
	persona_id int4 NULL,
	sucursal_id int4 NULL,
	actor_id int4 NULL,
	pelicula_id int4 NULL,
	lenguaje_id int4 NULL,
	categoria_id int4 NULL,
	CONSTRAINT fac_alquiler_fk FOREIGN KEY (actor_id) REFERENCES "DWH".dim_actor(id_actor),
	CONSTRAINT fac_alquiler_fk_1 FOREIGN KEY (categoria_id) REFERENCES "DWH".dim_categoria(id_categoria),
	CONSTRAINT fac_alquiler_fk_2 FOREIGN KEY (cliente_id) REFERENCES "DWH".dim_cliente(id_cliente),
	CONSTRAINT fac_alquiler_fk_3 FOREIGN KEY (pelicula_id) REFERENCES "DWH".dim_pelicula(id_pelicula),
	CONSTRAINT fac_alquiler_fk_4 FOREIGN KEY (persona_id) REFERENCES "DWH".dim_personal(id_personal),
	CONSTRAINT fac_alquiler_fk_5 FOREIGN KEY (sucursal_id) REFERENCES "DWH".dim_sucursal(id_sucursal),
	CONSTRAINT fac_alquiler_fk_6 FOREIGN KEY (tiempo_id) REFERENCES "DWH".dim_tiempo(id_tiempo),
	CONSTRAINT fac_alquiler_fk_7 FOREIGN KEY (lenguaje_id) REFERENCES "DWH".dim_lenguaje(id_lenguaje)
);



