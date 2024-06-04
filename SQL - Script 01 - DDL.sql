-- SQL: DDL (LENGUAJE DE DEFINICION DE DATOS)

-- CREAR BASE DE DATOS
create database bdPIAD303;
-- ELIMINAR BASE DE DATOS
drop database bdPIAD303;
-- ACTIVAR BASE DE DATOS
use bdPIAD303;

-- CREAR TABLA (En la BD Activa)
create table cliente (id int, nombre varchar(200), numruc varchar(11));

create table producto
(
	id int,
    descripcion varchar(200),
    precio double
);

-- ELIMINAR TABLAS
drop table cliente;
drop table producto;

-- MODIFICAR TABLAS --
-- Agregar una columna --
alter table cliente
add direccion varchar(200),
add telefono varchar(20);

alter table producto
add categoria varchar(100);

-- MODIFICAR TABLAS --
-- Eliminar una columna --

alter table cliente
drop direccion;

alter table producto
drop precio;

-- Ejercicio: agregarla direccion al cliente y el precio al producto
alter table cliente
add direccion varchar(200);

alter table producto
add precio double;

-- MODIFICAR TABLAS --
-- Modificar una columna: tipo --
alter table cliente
modify numruc varchar(20);

alter table cliente
modify numruc varchar(11);

-- MODIFICAR TABLAS --
-- Modificar una columna: nombre --
alter table cliente
change numruc numeroRuc varchar(25);

alter table cliente
change numeroRuc numruc varchar(11);

/*
Ejercicio 01: modificar el tipo de dato de la columna
precio de la tabla producto a Float y luego retornarlo
*/
use bdpiad303;

alter table producto
modify precio float;

alter table producto
modify precio double;

/*
Ejercicio:
Agregar la columna stock a la tabla producto con el tipado double
y luego modificarlo a entero.
*/
alter table producto
add stock double;

alter table producto
modify stock int;

-- MODIFICAR TABLAS --
-- Forma 1:
-- Definir una clave primaria (PK) --

alter table cliente
add primary key (id);

alter table producto
add primary key (id);

-- MODIFICAR TABLAS --
-- Quitar una clave primaria (PK) --

alter table cliente
drop primary key;

alter table producto
drop primary key;

-- MODIFICAR TABLAS --
-- Forma 2:
-- Definir una clave primaria (PK) --

alter table cliente
modify id int primary key;

alter table producto
modify id int primary key;

-- MODIFICAR TABLAS --
-- Forma 3:
-- Definir una clave primaria (PK) - Autoincrementable --
-- Observacion: la columna PK debe estar vacia
-- Forma A: Dos Pasos
-- Paso 1: Definir el PK
alter table cliente
add primary key (id);
-- Paso 2: Definir el autoincremento
alter table cliente
change column id 
id int auto_increment;

-- Forma B: Un solo Paso:
alter table producto
change column id
id int auto_increment, add primary key (id);

-- Forma C: Un solo Paso:
alter table producto 
modify id int primary key auto_increment;

/*
Ejercicio #1:
- Crear la tabla Venta: id, fechaVenta.
- Agregar la columna: idCliente
- Definir la clave primaria autoincrementable
*/

create table venta
(
	id int,
    fechaVenta datetime
);

alter table venta
add idCliente int;

alter table venta
change column id
id int auto_increment, add primary key (id);

-- MODIFICAR TABLAS --
-- Definir una clave foranea (FK) --

alter table venta
add foreign key (idCliente) references Cliente (id);

-- ####################
/*
Ejercicio #2:
- Crear la tabla Detalle: id, idVenta, idProducto.
- Definir los PK y FK
- Agregar la columna: cantidad
*/

create table detalle
(
	id int,
	idVenta int,
	idProducto int
);

alter table detalle 
modify id int primary key auto_increment;

alter table detalle 
add foreign key (idVenta) references venta(id);

alter table detalle 
add foreign key (idProducto) references producto(id);

alter table detalle add cantidad int;




