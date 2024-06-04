-- Funciones Incorporadas
-- Func. Agregadas: sum, count, max, min, avg
select sum(precio) from producto;
select count(precio) from producto;
select max(precio) from producto;
select min(precio) from producto;
select avg(precio) from producto;

-- Ejercicio:
-- Obtener el nuevo ID para el proximo cliente

select max(id)+1 from cliente;

-- select count(id)+1 from cliente;

-- Funcion LAST_INSERT_ID()
-- Devuelve el ultimo id insertado

insert into cliente (nombre, numruc, direccion, telefono)
values ('ADIDAS S.A.','20131340501','LIMA','999888777');

select last_insert_id() from cliente limit 1;

-- FUNCIONES NUMERICAS --
-- round(): Redondear
select precio, round(precio,1) from producto;
-- ceiling(): Entero superior
select precio, ceiling(precio) from producto;
-- floor(): Entero inferior
select precio, floor(precio) from producto;
-- sqrt(): raiz cuadrada
select precio, sqrt(precio) from producto;
-- sqrt() y round(): raiz cuadrada y redondeo
select precio, sqrt(precio), round(sqrt(precio),1) from producto;
-- pow(): potencia
select precio, pow(precio,2) from producto;
-- rand(): numero aleatorio 0..1
select descripcion, rand() from producto;

-- Ejercicio: numero aleatorio entero entre 0 y 9
select descripcion, floor(rand()*10) from producto;
-- Ejercicio: numero aleatorio entero entre 0 y 99
select descripcion, floor(rand()*100) from producto;

-- FUNCIONES TEXTO --
-- length(): logitud
select descripcion, length(descripcion) from producto;
-- concat(): contenar - unir texto
select concat(descripcion,' - ',categoria,' - S/.',precio) from producto;
-- left() / right()  / substr(): Extraccion de texto
select descripcion, left(descripcion,2) from producto;
select descripcion, right(descripcion,2) from producto;
select descripcion, substr(descripcion,5,2) from producto;

-- Ejercicio:
-- En la tabla cliente, utilizar los 2 primeros caracteres
-- del nombre, los 2 ultimos caracteres del telefono 
-- y los 4 caracteres contados a partir del 3ero del RUC 
-- para generar un CODIGO a cada cliente.

select
	concat(left(nombre,2),right(telefono,2),substr(numruc,3,4)) as codigo
from cliente;

-- instr() / locate() Busqueda de texto dentro de otro texto
select nombre, instr(nombre,"E.I.R.L.") from cliente;

select nombre, locate("E.I.R.L.", nombre, 1) from cliente;

-- comparacion: strcmp
select categoria, (categoria='BEBIDAS') from producto;

select categoria, strcmp(categoria,'BEBI') from producto;
select categoria, strcmp(categoria,'DAS') from producto;
select categoria, strcmp(categoria,'BEBIDAS') from producto;
-- Resultados:
-- 1: 	ubica el texto al inicio
-- -1: 	ubica el texto al final
-- 0: texto son iguales







