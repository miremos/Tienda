use tiendagrupo18;
create table clientes(
cedula_cliente integer not null auto_increment primary key,
direccion_cliente varchar(255),
email_cliente varchar(255),
nombre_cliente varchar(255),
telefono_cliente varchar(255)
);

create table clientes(
cedula_cliente bigint(20) not null auto_increment primary key,
direccion_cliente varchar(255),
email_cliente varchar(255),
nombre_cliente varchar(255),
telefono_cliente varchar(255)
);

create table usuarios(
cedula_usuario integer not null auto_increment primary key,
email_usuario varchar(255),
nombre_usuario varchar(255),
password varchar(255),
usuario varchar(255)
);

create table proveedores(
nit_proveedor integer not null auto_increment primary key,
ciudad_proveedor varchar(255),
direccion_proveedor varchar(255),
nombre_proveedor varchar(255),
telefono_proveedor varchar(255)
);


create table ventas(
codigo_venta integer not null auto_increment primary key,
cedula_cliente integer not null,
cedula_usuario integer not null,
iva_venta double,
valor_venta double,
foreign key (cedula_cliente) references clientes(cedula_cliente),
foreign key (cedula_usuario) references clientes(cedula_usuario)
);

create table ventas(
codigo_venta integer not null auto_increment primary key,
cedula_cliente integer not null,
cedula_usuario integer not null,
iva_venta double,
total_venta double,
valor_venta double,
foreign key (cedula_cliente) references clientes(cedula_cliente),
foreign key (cedula_usuario) references usuarios(cedula_usuario)
);

create table login(
login integer not null auto_increment primary key,
login_usuario varchar(255)
);

SELECT * FROM clientes;
SELECT * FROM usuarios;
SELECT * FROM proveedores;
SELECT * FROM login;

INSERT INTO usuarios (cedula_usuario, email_usuario, nombre_usuario, password, usuario)
values(7755775,'tienda@gmail.com', 'Eduardo','admin123456','admininicial');