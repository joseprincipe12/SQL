-- CONTRAINS : Restricciones

-- Crear una tabla de prueba
create table persona
(
	id int,
    nombre varchar(200),
    edad int
);

select * from persona;
insert into persona (id, nombre, edad) values (10, null, 25);

-- ***********************************
-- NOT NULL: No permitir valores nulos
-- ***********************************
delete from persona;

alter table persona
modify column nombre varchar(200) not null;
-- Tratar de insertar:
insert into persona (id, nombre, edad) values (10, null, 25);
-- Insertar
insert into persona (id, nombre, edad) values (10, 'PEDRO', 25);

-- Ejemplo
alter table persona
modify column edad int not null;

-- Insertar
insert into persona (id, nombre, edad) values (10, 'CARLOS', null);
select * from persona;

-- ***********************************
-- UNIQUE: No permitir valores duplicados
-- ***********************************
delete from persona;

-- Probando:
insert into persona (id, nombre, edad) values (10, 'CARLOS', 50);
insert into persona (id, nombre, edad) values (10, 'MARIA', 30);
select * from persona;

delete from persona;

-- Ejemplo:
alter table persona
add constraint uc_persona_id unique (id);

-- Probando:
insert into persona (id, nombre, edad) values (10, 'CARLOS', 50);
insert into persona (id, nombre, edad) values (10, 'MARIA', 30);

select * from persona;

-- Eliminar
alter table persona
drop constraint uc_persona_id;

-- ***********************************
-- PRIMARY KEY: Definir la clave primaria
-- ***********************************
delete from persona;

alter table persona
modify column id int not null;

-- Ejemplo
alter table persona
add constraint pk_persona_id primary key (id);

-- Probando:
insert into persona (id, nombre, edad) values (10, 'CARLOS', 50);
insert into persona (id, nombre, edad) values (10, 'MARIA', 30);

alter table persona
drop primary key;

-- ***********************************
-- FOREIGN KEY: Definir la clave foranea - Exigir integridad referencial
-- ***********************************
create table nota
(
	id int,
    idPersona int,
    curso varchar(100),
    valor int
)

alter table nota
add constraint fk_nota_idPersona
foreign key (idPersona) references persona (id);

insert into nota (id, idPersona, curso, valor)
values (1,10,'MATEMATICA',20);

insert into persona (id, nombre, edad) values (10, 'CARLOS', 50);

insert into nota (id, idPersona, curso, valor)
values (1,10,'MATEMATICA',20);

