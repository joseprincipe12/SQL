-- JOIN: COMBINAR TABLAS
select * from cliente;
select * from venta;

-- INNER JOIN: interseccion
select * from 
cliente inner join venta 
on cliente.id = venta.idCliente;

-- LEFT JOIN: IZQUIERDA
select * from 
cliente left join venta 
on cliente.id = venta.idCliente;

-- RIGHT JOIN: DERECHA
select * from
detalle right join producto
on detalle.idProducto=producto.id;

-- Ejercicio:
-- Mostrar descripcion del producto, su precio, cantidad y total
select descripcion, precio, cantidad, precio*cantidad as total from
producto inner join detalle
on producto.id=detalle.idProducto;

-- Ejercicio:
-- Mostrar fecha venta, descripcion del producto, 
-- su precio, cantidad y total

select
	venta.fecventa,
    producto.descripcion,
    producto.precio,
    detalle.cantidad,
    producto.precio*detalle.cantidad as total
from
venta inner join detalle
on venta.id=detalle.idVenta
inner join producto
on detalle.idProducto=producto.id;

-- Ejercicio:
-- Mostrar fecha venta, nombre cliente, descripcion del producto, 
-- su precio, cantidad y total

select venta.fecventa,
	cliente.nombre, 
    producto.descripcion,
    producto.precio, 
    detalle.cantidad,
    producto.precio*detalle.cantidad as total
from
cliente inner join venta
on cliente.id = venta.idCliente
inner join detalle
on venta.id=detalle.idVenta
inner join producto
on detalle.idProducto=producto.id;




