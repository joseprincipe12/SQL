-- SQL: DML (LENGUAJE DE MANIPULACION DE DATOS)
-- READ - select
-- Simples
select * from cliente;
select numruc, nombre from cliente;
select numruc as RUC, nombre from cliente;

-- distinct: valores unicos
select distinct direccion from cliente;

-- order by: ordenamiento
select * from cliente order by direccion; -- Ascendente
select * from cliente order by direccion desc; -- Descendente

-- limit: limitar la salida de registros
select * from cliente limit 5;
select distinct direccion from cliente limit 3;
select distinct direccion from cliente order by direccion limit 3;

-- Ejercicio #1:
-- Mostrar los 3 productos mas caros.

select * from producto
order by precio desc
limit 3;

-- Ejercicio #2:
-- Mostrar la categoria, descripcion y precio de los productos 
-- ordenados por categoria 
-- y a su vez por precio de forma descendente

select categoria, descripcion, precio 
from producto
order by categoria, precio desc;

-- where: condiciones
select * from cliente
where direccion='AREQUIPA';

-- Ejercicio #3:
-- Mostrar la descripcion de las 2 carnes mas caras.

select descripcion from producto
where categoria='CARNES'
order by precio desc
limit 2;

-- AND: INTERSECCION
select *
from producto
where (precio>=20) and (precio<=60);

-- BETWEEN
select *
from producto
where (precio between 20 and 60);

-- OR: UNION
select *
from producto
where (precio<=20) or (precio>=60);

-- Clientes que viven en Lima y en Arequipa
select *
from cliente
where (direccion='LIMA') or (direccion='AREQUIPA');

-- IN: Lista
select *
from cliente
where direccion in ('LIMA','AREQUIPA');

-- Ejercicio:
-- Mostrar los productos cuyo precio es 10, 30 y 40
select *
from producto
where (precio=10) or (precio=30) or  (precio=40);

select *
from producto
where precio in (10,30,40);

-- Ejercicio:
-- Mostrar los productos de las categorias BEBIDAS y LACTEOS
-- cuyos precios sean menores que 40 y mayores que 50.
-- ordernado por categoria.

select *
from producto
where 
(categoria in ('BEBIDAS','LACTEOS'))
and
((precio<40) or (precio>50))
order by categoria;

-- LIKE: similar : Comodin %
select *
from cliente
where nombre like 'FACTORIA%';

select *
from cliente
where numruc like '%1';

select *
from cliente
where nombre like '%METAL%';

-- Ejercicio:
-- Mostrar las empresas de Arequipa y Lima que son EIRL.

select * from cliente
where 
(nombre like '%E.I.R.L.%')
and
(direccion in ('AREQUIPA','LIMA'))

-- Ejercicio:
-- Mostrar las BEBIDAS que sean CERVEZAS.
select * from producto where 
(categoria='BEBIDAS')
and
(descripcion like '%CERVEZA%');

-- Sub-Consultas: una consulta dentro de otra

select 
	*,
    (select nombre from cliente where id=idCliente) as nombreCliente,
    (select numruc from cliente where id=idCliente) as rucCliente
from venta;

-- Ejercicio:
-- Forma 1:
select 
	*,
    (select descripcion from producto where id=idProducto) as descripcion,
    (select precio from producto where id=idProducto) as precio,
    (select precio from producto where id=idProducto)*cantidad as total
from detalle;

-- Forma 2:
select t.descripcion, t.precio, t.cantidad, t.precio*t.cantidad as total from
	(select 
		*,
		(select descripcion from producto where id=idProducto) as descripcion,
		(select precio from producto where id=idProducto) as precio
	from detalle) as t;

-- Ejercicio: Indicar el producto que me dio mas ingresos economicos

select *, t.precio*t.cantidad as total from 
	(select
		(select descripcion from producto where id=idProducto) as descripcion,
		(select precio from producto where id=idProducto) as precio,
		cantidad
	from detalle) as t
order by total desc
limit 1;

-- Ejercicio:
-- Mostrar el nombre del cliente y la descripcion del producto que compro.
-- Forma 1
select 
	(select nombre from cliente where id=t.idCliente) as cliente, 
    t.descripcion
from
	(select
		(select idCliente from venta where id=idVenta) as idCliente,
		(select descripcion from producto where id=idProducto) as descripcion
	from detalle) as t;

-- Forma 2    
select
	(select nombre from cliente where id=(select idCliente from venta where id=idVenta)) as cliente,
	(select descripcion from producto where id=idProducto) as descripcion
from detalle

-- Ejercicio:
-- Mostrar el nombre del cliente y el monto total comprado

-- Forma 1
select 
	(select nombre from cliente where id=t.idCliente) as cliente, 
    t.precio*t.cantidad as total
from
	(select
		(select idCliente from venta where id=idVenta) as idCliente,
		(select precio from producto where id=idProducto) as precio,
        cantidad
	from detalle) as t;

-- Forma 2    
select
	(select nombre from cliente where id=(select idCliente from venta where id=idVenta)) as cliente,
	(select precio from producto where id=idProducto)*cantidad as total
from detalle



























