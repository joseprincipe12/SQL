-- PROCEDIMIENTO ALMACENADO --
-- Los stored procedure son instrucciones que 
-- pueden ser invocados dentro o fuera de la BD
-- Pueden o No retornar un valor resultante.
-- Los parametros pueden ser de entrada (in) o de salida (out)

-- Crear un SP:
delimiter //
create procedure listarClientes()
begin
	select * from cliente;
end
// delimiter ;

-- Ejecutar un SP
call listarClientes();

-- SP con parametros:
delimiter //
create procedure buscarClienteById(in idBuscado int)
begin
	select * from cliente where id=idBuscado;
end
// delimiter ;

call buscarClienteById(10);

-- Ejercicio:
-- Buscar productos por similitud de descripcion.

delimiter //
create procedure buscarProductoByDescripcion(in descripcionBuscada varchar(100))
begin
	select * from producto 
    where descripcion like concat('%',descripcionBuscada,'%');
end
// delimiter ;

call buscarProductoByDescripcion('pan');

-- Crear un SP que permita insertar Clientes 
-- con el nombre en MAYUSCULAS
-- con el usuario y la clave encriptada con SHA2

drop procedure insertarCliente;

delimiter //
create procedure insertarCliente(
	in _nombre varchar(100), 
    in _numruc varchar(11), 
    in _direccion varchar(100),
    in _telefono varchar(20),
    in _usuario varchar(100),
    in _clave varchar(100)
    )
begin
	insert into cliente (nombre,numruc,direccion,telefono,usuario,clave)
    values (upper(_nombre),_numruc,upper(_direccion),_telefono,sha2(_usuario,256),sha2(_clave,256));
end
// delimiter ;

call insertarCliente('senatina','20131376502','ancon','999888701','user102','102102');

select * from cliente;

select autenticarSHA2('user102','102102');






