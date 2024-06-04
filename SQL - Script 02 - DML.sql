-- SQL: DML (LENGUAJE DE MANIPULACION DE DATOS)
-- CRUD: CREATE - READ - UPDATE - DELETE

use bdpiad303;

-- C: CREATE: insertar filas (registros)
insert into cliente (nombre, numruc, telefono, direccion) 
values ('ALBERTO JIMENEZ','10998877661','999888777','SAN JUAN DE MIRAFLORES');

-- R: READ: Visualizar las filas (registros)
select * from cliente;

-- U: UPDATE: Modificar las filas (registros)
update cliente
set nombre='ALBERTO RODRIGUEZ', direccion='CALLAO'
where id=1;

-- D: DELETE: Eliminar filas (registros)
delete from cliente
where id=1;

/*
Ejercicio #01
- Agregar tres productos: INCAKOLA, COCACOLA y FANTA
- Actualizar su categoria a: BEBIDAS
- Actualizar el precio a 10.00, 15.00 y 20.00 respectivamente
- Actualizar el precio de todos los productos en un 50% mas.
- Eliminar la COCACOLA.
*/
insert into producto (descripcion)
values ('INKA COLA');
insert into producto (descripcion)
values ('COCA COLA');
insert into producto (descripcion)
values ('FANTA');

select * from producto;

update producto
set categoria = 'BEBIDAS';

select * from producto;

update producto
set precio = 10.0
where id=1;

update producto
set precio = 15.0
where id=2;

update producto
set precio = 20.0
where id=3;

select * from producto;

update producto
set precio = precio + 0.5*precio;

select * from producto;

delete from producto
where id=2;

select * from producto;
