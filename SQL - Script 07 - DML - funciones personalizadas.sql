-- FUNCIONES PERSONALIZADAS --
-- Las funciones permiten realizar operaciones dentro de la BD.
-- Eliminar
drop function igv;

-- Crear
delimiter //
create function igv(valor double)
returns double
begin
	--  CODIGO FUNCION
    declare resultado double; -- Declarar variable
    set resultado = 0.18 * valor; -- Asignacion de valores
    set resultado = round(resultado,2); -- Redondear
    return resultado; -- Retornar el valor resultante
end
// delimiter ;

select *, igv(precio) as IGV from producto;

-- Ejercicio:
-- Crear una funcion que permita calcular el total incluido el IGV
delimiter //
create function totalIgv(valor double)
returns double
begin
	declare resultado double;
    set resultado = valor + igv(valor);
    set resultado = round(resultado,2);
	return resultado;
end
// delimiter ;

select *, igv(precio) as IGV, totalIgv(precio) as TOTAL from producto;

-- Ejercicio:
-- A partir del ID del Cliente
-- se requiere retornar su NOMBRE 
-- concatenado a su numero de RUC

delimiter //
create function clienteRUC(valorID int)
returns varchar(150)
begin
	declare resultado varchar(150);
    set resultado = (select concat(nombre,' - ',numruc) from cliente where id=valorId);
    return resultado;
end
// delimiter ;

select *, clienteRUC(id) from cliente;

select *, clienteRUC(idCliente) as cliente  from venta;

-- Ejercicio:
-- Ingresando el ID del producto
-- retornar la descripcion del precio.

delimiter //
create function prodDescripcion(valorID int)
returns varchar(100)
begin
	declare resultado varchar(100);
    set resultado = (select descripcion from producto where id=valorID);
    return resultado;
end
// delimiter ;

select *, prodDescripcion(id) from producto;

select *, prodDescripcion(idProducto) from detalle;

-- Ejercicio:
-- Ingresando el ID del producto
-- retornar el precio del precio.

delimiter //
create function prodPrecio(valorID int)
returns double
begin
	declare resultado double;
    set resultado = (select precio from producto where id=valorID);
    return resultado;
end
// delimiter ;

select *, prodPrecio(id) as precioF from producto;

select *, 
	prodDescripcion(idProducto) as descripcion, 
    prodPrecio(idProducto) as precio,
    cantidad,
    prodPrecio(idProducto)*cantidad as total
from detalle;

-- Ejercicio:
-- Ingresando el ID de la venta
-- retornar el nombre del cliente.

drop function ventaCliente;

delimiter //
create function ventaCliente(idVenta int)
returns varchar(100)
begin
	declare clienteId int;
    declare resultado varchar(100);
    -- Forma 1:
    set clienteId = (select idCliente from venta where id=idVenta);
    set resultado = (select concat(nombre,' - ',numruc) from cliente where id=clienteId);
    
    -- Forma 2:
    -- set resultado = (select nombre from cliente where id=(select idCliente from venta where id=idVenta));
    
    return resultado;
end
// delimiter ;

select *,
	ventaCliente(idVenta) as cliente,
	prodDescripcion(idProducto) as descripcion, 
    prodPrecio(idProducto) as precio,
    cantidad,
    prodPrecio(idProducto)*cantidad as total
from detalle;

-- Ejercicio:
-- A partir del id del Producto y la cantidad vendida
-- calcular el Total a pagar.
delimiter //
create function pagoTotal(productoId int, cantidadVenta int)
returns double
begin
	declare precioProducto double;
    declare resultado double;
	set precioProducto = (select precio from producto where id=productoId);
    set resultado = precioProducto * cantidadVenta;
    return resultado;
end
// delimiter ;

select *, pagoTotal(idProducto, cantidad) as pagoTotal from detalle;

-- Ejercicio:
-- A partir del id del cliente
-- generar el correo electronico @miempresa.net

delimiter //
create function correoGenerado(clienteId int)
returns varchar(200)
begin
    declare resultado varchar(200);
	
    set resultado = (select concat(numruc,'@miempresa.net') from cliente where id=clienteId);
    
    return resultado;
end
// delimiter ;

select *, correoGenerado(id) as email from cliente

-- Ejercicio:
-- A partir del id del cliente
-- generar una clave predeterminada para el correo
-- de la forma:
-- EJEMPLO: 1	ACS INDUSTRIA METAL MECANICA E.I.R.L.	20458127400	LIMA	999888101
-- CLAVE GENERADA: AC4581MA101

delimiter //
create function claveGenerada(clienteId int)
returns varchar(100)
begin
    declare resultado varchar(100);
	
    set resultado = (select 
						concat(left(nombre,2),
                        substr(numruc,3,4),
                        right(direccion,2),
                        right(telefono,3)) 
					from cliente where id=clienteId);
    
    return resultado;
end
// delimiter ;

select *, correoGenerado(id) as email, claveGenerada(id) as clave from cliente




