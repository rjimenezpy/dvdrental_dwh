/* DWH */

-- dim_cliente
create table dim_cliente (
	id_cliente int not null,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	pais varchar(45) not null,
	ciudad varchar(45) not null,
	direccion varchar(90) not null,
	fecha_insercion date not null,
	fecha_actualizacion date not NULL
);

--dim_personal
create table dim_personal(
	id_personal int not null,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	direccion varchar(90) not null,
	ciudad varchar(45) not null,
	pais varchar(45) not null,
	fecha_insercion date not null,
	fecha_actualizacion date not null
); 

-- dim_sucursal
create table dim_sucursal(
	id_sucursal int not null,
	nombre varchar(45) not null,
	ciudad varchar(45) not null,
	direccion varchar(90) not null,
	pais varchar(45) not null,
	fecha_insercion date not null,
	fecha_actualizacion date not null
);

--dim_categoria
create table dim_categoria(
	id_categoria int not null,
	nombre varchar(45) not null
);

--dim_lenguaje
create table dim_lenguaje(
	id_lenguaje int not null,
	nombre varchar(45) not null,
	fecha_insercion date not null,
	fecha_actualizacion date not null
);

--dim_actor
create table dim_actor(
	id_actor int not null,
	nombre varchar(45) not null,
	apellido varchar(45) not null,
	fecha_insercion date not null,
	fecha_actualizacion date not null
);

--dim_pelicula
create table dim_pelicula(
	id_pelicula int not null,
	descripcion varchar(255) not null,
	anho_lanzamiento 
	duracion
	fecha_insercion date not null,
	fecha_actualizacion date not null
);


