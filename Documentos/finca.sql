create table persona(
	id serial primary key,
	nombres varchar(80) not null,
	usuario varchar(40) not null unique,
	clave varchar(32) not null,
	tipo varchar(1) not null
);	
create table producto(
	id serial primary key,
	idPersona int not null references persona(id) on delete restrict on update cascade,
	nombre varchar(80) not null unique,
	etiqueta varchar(80) not null,
	valor int not null,
	cantidad int not null
);
create table compra(
	id serial primary key,
	idPersona int not null references persona(id) on delete restrict on update cascade,
	fecha timeStamp not null,
	nombre varchar(80) not null,
	marca varchar(80) not null,
	valor int not null,
	cantidad int not null
);
create table venta(
	id serial primary key,
	idPersona int not null references persona(id) on delete restrict on update cascade,
	fecha timeStamp not null,
	idNombre int not null references producto(id) on delete restrict on update cascade,
	marca varchar(80) not null,
	valor int not null,
	cantidad int not null
);


insert into persona(nombres, usuario, clave, tipo) values('Manuel Buesaquilo','manuel',md5('123'),'A');
insert into producto(idPersona, nombre, etiqueta, valor, cantidad) values ('1', 'Cafe', 'C-12', '10000', '12');