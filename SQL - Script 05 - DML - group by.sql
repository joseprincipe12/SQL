-- GROUP BY: AGRUPAMIENTO
-- Funciones Agregadas: SUM, COUNT, AVG, MAX, MIN

-- SUM: sumar todos los valores de la columna
select sum(precio)
from producto;

-- COUNT; contar los valores de la columna
select count(precio)
from producto;

-- AVG: contar los valores de la columna
select avg(precio)
from producto;

-- MAX: maximo valor de la columna
select max(precio)
from producto;

-- MIN: minimo valor de la columna
select min(precio)
from producto;

-- GROUP BY: Funciones
select categoria, sum(precio) as total
from producto
group by categoria;

-- Mayor precio por categoria
select categoria, max(precio) as mayorPrecio
from producto
group by categoria;

-- Ejercicio: Cuantos clientes se tiene por cada ciudad.

select direccion, count(id) as cantidad
from cliente
group by direccion;

-- Ejercicio: Que ciudad tiene la mayor cantidad de clientes
-- (1):
select direccion, count(id) as cantidad
from cliente
group by direccion
order by cantidad desc
limit 1;

-- (2):
select * from
	(select direccion, count(id) as cantidad
	from cliente
	group by direccion) as t
order by t.cantidad desc
limit 1;

-- Ejercicio: 
-- Calcular el promedio de los precios de las CARNES, LACTEOS y BEBIDAS

select categoria, avg(precio) as promedio
from producto
where categoria in ('CARNES', 'LACTEOS', 'BEBIDAS')
group by categoria;

-- Ejercicio:
-- Mostrar la categoria y la cantidad de productos
-- siempre y cuando esa cantidad sea mayor o igual a 10
-- Solucion 1
select * from
	(select categoria, count(id) as cantidad
	from producto
	group by categoria) as t
where t.cantidad>=10;

-- Solucion 2
-- HAVING: WHERE DEL GROUP BY

select categoria, count(id) as cantidad
from producto
group by categoria
having count(id)>=10;

-- Ejercicio:
-- Mostrar el nombre del cliente y la cantidad de compras realizadas
-- solucion 1:
select 
	(select nombre from cliente where id=idCliente) as cliente, 
    count(idCliente)
from venta
group by idCliente;

-- solucion 2:
select nombre, count(idCliente) as cantidad 
from cliente inner join venta 
on cliente.id=venta.idCliente 
group by nombre;

-- Mostrar la cantidad de productos vendidos por cada producto.
-- ¿Cual es el producto mas vendido?
-- Solucion 1:
select 
	(select descripcion from producto where id=idProducto) as producto,
    sum(cantidad) as cantidad
from detalle
group by idProducto
order by cantidad desc;

-- Solucion 2:
select descripcion, sum(cantidad) as cantidad 
from producto inner join detalle
on producto.id=detalle.idProducto
group by producto.descripcion
order by cantidad desc;

-- Ejercicio:
-- Mostrar la descripcion del producto 
-- y el monto total vendido por cada producto.
-- Forma 1:
select
	(select descripcion from producto where id=idproducto) as descripcion,
	sum((select precio from producto where id=idproducto)*cantidad) as total
from detalle
group by idProducto
order by total desc;

-- Forma 2:
select
	descripcion,
    sum(precio*cantidad) as Total
from producto inner join detalle
on producto.id=detalle.idProducto
group by descripcion
order by total desc

-- Mostrar el nombre del cliente y el monto total que compro cada uno
-- sumar(precio*cantidad)
-- Forma 1:
select t.cliente, sum(t.total) as total from
	(select
		(select nombre from cliente where id=(select idCliente from venta where id=idVenta)) as cliente,
		(select precio from producto where id=idProducto)*cantidad as total
	from detalle) as t
group by t.cliente;

-- Forma 2:
select cliente.nombre, sum(producto.precio*detalle.cantidad) as total from
producto inner join detalle
on producto.id = detalle.idProducto
inner join venta
on venta.id=detalle.idVenta
inner join cliente
on cliente.id=venta.idCliente
group by cliente.nombre
order by total desc;













