-- ENCRIPTACION: MD5, SHA2

-- Agregar a la tabla: CLIENTE - usuario y clave
alter table cliente
add usuario varchar(100), add clave varchar(100);

select * from cliente;

-- Agregar un usuario y una clave al cliente id=1
update cliente
set usuario='user01', clave='111111'
where id=1;

select * from cliente;
-- Encriptacion:
-- Metodos: MD5 / SHA2

select md5('MOISES'); -- '865ada6b3b3612a2f69586bae291d169'
select SHA2('MOISES',256); -- '153da96bbe069322c97c2973f86db6f0db807c673c6cb58330651858f9e10f33'

-- GUARDAR UNA CLAVE ENCRIPTADA: Cliente 2
update cliente
set usuario='user02', clave=md5('222222') -- 'e3ceb5881a0a1fdaad01296d7554868d'
where id=2;

select * from cliente;

-- VALIDAR UN USUARIO Y CLAVE
-- Cliente 1: sin encriptar
select count(id) from cliente
where (usuario='user01') and (clave='111111');

-- Cliente 2: encriptada
select count(id) from cliente
where (usuario='user02') and (clave=md5('222222'));

-- Ejercicio:
-- Agregar al Cliente 3 un usuario y una clave, encriptadas con SHA2
-- Crear una funcion que ha partir del ingreso del usuario y clave
-- retorne un texto: ACCESO CONCEDIDO / ACCESO DENEGADO

update cliente
set usuario=sha2('user03',256), clave=sha2('333333',256)
where id=3;

select * from cliente;

delimiter //
create function autenticarSHA2(_usuario varchar(100), _clave varchar(100))
returns varchar(20)
begin
	declare resultado varchar(20);
    
    set resultado = (select if(count(id)=0,'DENEGADO','CONCEDIDO') from cliente 
					where (usuario=sha2(_usuario,256)) and (clave=sha2(_clave,256)));
	
    return resultado;
end
// delimiter ;

select autenticarSHA2('user03','333333');



