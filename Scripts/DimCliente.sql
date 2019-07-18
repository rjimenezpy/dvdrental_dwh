-- trae todos lo clientes de forma ascendente 
select * from customer order by customer_id asc 

-- selecciona el id, nombre y apellido del cliente de orden ascendente
select customer_id, concat(first_name,', ',last_name) as nombre_apellido from customer order by customer_id asc  


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
)