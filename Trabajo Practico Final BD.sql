drop database if exists negocio_indumentaria;
create database negocio_indumentaria;
use negocio_indumentaria;

set SQL_SAFE_UPDATES = 0;

create table clientes (
	id_cliente int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni	char(8) not null,
    tel_celular	varchar(10),
    email varchar(50),
    primary key(id_cliente)
);

create table vendedores	(
	legajo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8) not null,
    tel_celular varchar(10),
    email varchar(50),
    primary key(legajo)
);

create table articulos (
	codigo int,
    producto varchar(100) not null,
    color varchar(50) not null,
    stock int not null,
    stock_minimo int not null,
    stock_maximo int not null,
    primary key(codigo)
);

create table facturas (
	letra char(1),
    numero int,
    fecha date not null,
    monto	double not null,
    id_cliente int,
    legajo_vendedor int,
    primary key(letra, numero)
);

create table ventas (
	letra char(1),
    numero int,
    codigo int,
    cantidad int not null,
    primary key(letra, numero, codigo)
);


alter table facturas add constraint monto_positivo check (monto > 0);

alter table facturas add constraint FK_facturas_clientes
foreign key (id_cliente) references clientes(id_cliente);


alter table facturas add constraint FK_facturas_vendedores
foreign key (legajo_vendedor) references vendedores(legajo);

alter table ventas add constraint FK_ventas_facturas
foreign key (letra, numero) references facturas(letra, numero);

alter table ventas add constraint FK_ventas_articulos
foreign key	(codigo) references articulos(codigo);


INSERT INTO clientes (nombre, apellido, dni, tel_celular, email) VALUES
	('Juan', 'Perez', '12345678', '987654321', 'juan.perez@gmail.com'),
    ('María', 'Flores', '87654321', '123456789', 'maria.flores@gmail.com'),
    ('Carlos', 'Rodriguez', '23456789', '567890123', 'carlos.rodriguez@hotmail.com'),
    ('Lucía', 'Franco', '34567812', '654321789', 'lucia.franco@outlook.com'),
    ('Martín', 'Díaz', '98765432', '321789456', null),
    ('Carolina', 'López', '45678123', '789456123', 'carolina.lopez@gmail.com'),
    ('Fernando', 'Martínez', '78901234', '456123789', 'fernando.martinez@yahoo.com.ar'),
    ('Valeria', 'García', '12345678', '123789456', null),
    ('Miguel', 'Sánchez', '56781234', '789456123', 'miguel.sanchez@gmail.com'),
    ('Camila', 'Fernández', '12347890', '456789012', 'camila.fernandez@outlook.com'),
    ('Diego', 'Britos', '78904561', '234567890', null),
    ('Brenda', 'Giménez', '34561230', '567890123', 'brenda.gimenez@gmail.com'),
    ('Marcelo', 'Alvarez', '78904561', '234567890', 'marcelo.alvarez@hotmail.com'),
    ('Romina', 'Smith', '34561230', '567890123', null),
    ('Eduardo', 'Romero', '12034567', '678901234', 'eduardo.romero@gmail.com');


INSERT INTO vendedores (nombre, apellido, dni, tel_celular, email) VALUES
    ('Laura', 'Fernandez', '34567890', '789012345', 'laura.fernandez@gmail.com'),
    ('Roberto', 'Ríos', '45678901', '890123456', null),
    ('Ana', 'Iunti', '56789012', '901234567', null),
    ('Luis', 'Sosa', '90876543', '654321098', 'luis.sosa@gmail.com'),
    ('Silvia', 'Ramírez', '76543210', '210987654', 'silvia.ramirez@outlook.com'),
    ('Pablo', 'Torres', '54321098', '987654321', 'pablo.torres@hotmail.com'),
    ('Laura', 'Rojas', '21098765', '876543210', 'laura.rojas@gmail.com'),
    ('Sebastián', 'Pérez', '45678901', '321098765', 'sebastian.perez@gmail.com'),
    ('Melina', 'Cabrera', '12309876', '543210987', 'melina.cabrera@yahoo.com.ar'),
    ('Ana', 'Vargas', '65432109', '987654321', 'ana.vargas@gmail.com');
    
    
INSERT INTO articulos (codigo, producto, color, stock, stock_minimo, stock_maximo) VALUES
    (1, 'Camisa', 'Blanco', 100, 10, 150),
    (2, 'Pantalón', 'Negro', 80, 5, 120),
    (30, 'Zapatos', 'Marrón', 50, 8, 80),
    (40, 'Vestido', 'Rojo', 30, 5, 50),
    (500, 'Corbata', 'Azul', 60, 10, 80),
    (610, 'Bufanda', 'Verde', 40, 8, 60),
    (777, 'Sombrero', 'Negro', 25, 5, 40),
    (8, 'Remera', 'Gris', 20, 5, 30),
    (19, 'Botas', 'Negro', 15, 3, 25),
    (10, 'Gorra', 'Blanco', 35, 7, 55),
    (200, 'Blusa', 'Rosa', 28, 6, 45),
    (128, 'Short', 'Celeste', 22, 4, 35),
    (1000, 'Medias', 'Blanco', 50, 10, 70),
    (235, 'Remera manga larga', 'Verde', 40, 8, 60),
    (755, 'Boina de cuero', 'Negro', 25, 5, 40),
    (828, 'Remera estampada', 'Blanco', 20, 5, 30),
    (99, 'Ojotas', 'Negro', 15, 3, 25),
    (100, 'Vestido de gala', 'Blanco', 35, 7, 55),
    (127, 'Camisa manga corta', 'Gris', 28, 6, 45),
    (14, 'Short de baño', 'Verde', 22, 4, 35),
    (70, 'Saco polar', 'Azul', 50, 10, 70);

INSERT INTO facturas (letra, numero, fecha, monto, id_cliente, legajo_vendedor) VALUES
    ('A', 1, '2022-02-15', 300.00, 1, 1),
    ('B', 1, '2022-02-15', 450.00, 2, 2),
    ('C', 1, '2022-06-10', 200.00, 3, 3),
    ('A', 2, '2022-09-20', 180.00, 4, 4),
    ('B', 2, '2022-09-20', 220.00, 6, 5),
    ('C', 2, '2022-12-15', 350.00, 7, 6),
    ('A', 3, '2023-01-05', 400.00, 1, 1),
    ('B', 3, '2023-03-10', 350.00, 2, 2),
    ('C', 3, '2023-05-18', 500.00, 9, 8),
    ('A', 4, '2023-07-25', 320.00, 10, 10),
    ('B', 4, '2023-07-25', 280.00, 13, 2),
    ('C', 4, '2023-11-20', 220.00, 14, 3),
    ('A', 5, '2024-01-15', 370.00, 1, 4),
    ('B', 5, '2024-02-22', 410.00, 6, 5),
    ('C', 5, '2024-05-10', 300.00, 7, 6),
    ('A', 6, '2024-07-25', 480.00, 8, 7),
    ('B', 6, '2024-07-25', 190.00, 9, 8),
    ('C', 6, '2024-09-15', 260.00, 10, 10),
    ('A', 7, '2024-11-01', 420.00, 13, 2);
    
    INSERT INTO ventas (letra, numero, codigo, cantidad) VALUES
    ('A', 1, 1, 10),
    ('A', 1, 2, 5),
    ('A', 1, 30, 2),
    ('A', 1, 235, 2),
    ('B', 1, 40, 4),
    ('B', 1, 500, 3),
    ('B', 1, 8, 6),
    ('C', 1, 19, 2),
    ('C', 1, 10, 3),
    ('C', 1, 755, 4),
    ('A', 2, 128, 1),
    ('A', 2, 100, 2),
    ('A', 2, 777, 5),
    ('B', 2, 1, 3),
    ('B', 2, 2, 2),
    ('B', 2, 30, 1),
    ('C', 2, 40, 2),
    ('C', 2, 235, 3),
    ('C', 2, 500, 1),
    ('C', 2, 8, 3),
    ('A', 3, 10, 2),
    ('A', 3, 755, 3),
    ('A', 3, 128, 2),
    ('B', 3, 100, 1),
    ('B', 3, 777, 2),
    ('B', 3, 99, 4),
    ('C', 3, 14, 3),
    ('C', 3, 127, 2),
    ('C', 3, 1000, 5),
    ('A', 4, 30, 2),
    ('A', 4, 10, 1),
    ('A', 4, 755, 4),
    ('B', 4, 128, 3),
    ('B', 4, 100, 2),
    ('B', 4, 777, 1),
    ('B', 4, 828, 2),
    ('C', 4, 99, 3),
    ('A', 5, 127, 4),
    ('B', 5, 1000, 6),
    ('C', 5, 14, 2),
    ('A', 6, 1, 3),
    ('B', 6, 2, 5),
    ('C', 6, 30, 1),
    ('A', 7, 19, 4),
    ('A', 7, 10, 2);
    
    --  1 cantidad de clientes y vendedores que tiene el negocio
    

select		count(distinct c.id_cliente) 'cantidad_clientes', count(distinct v.legajo) 'cantidad_vendedores'
from		clientes c
left join	facturas f
on			c.id_cliente=f.id_cliente
right join	vendedores v
on			f.legajo_vendedor=v.legajo;
    
    
	-- 2 Listar los clientes que tienen un email registrado, ordenado por apellido y nombre
    
    select		apellido, nombre
    from		clientes
    where		email is not null;
    
    -- 3 Listar nombre y apellido, tanto de clientes como de vendedores, cuya direccion de email sea de Gmail
    
    select distinct	 	concat(c.nombre, ' ', c.apellido)  'nombre y apellido clientes',  concat(v.nombre, ' ', v.apellido) 'nombre y apellido vendedores'
    from			clientes c
    join			facturas f
    on				c.id_cliente=f.id_cliente
    join			vendedores v
    on				f.legajo_vendedor=v.legajo
    where			c.email like '%@gmail%' or v.email like '%@gmail%';
    
    
-- 4 listar los clientes cuyo apellido contenga al menos una letra e y que termine con z 

select			nombre, apellido
from			clientes
where			apellido like '%e%z';

-- 5 listar los vendedores cuya ultima letra del nombre sea una 'a' y tenga 5 letras en total

select		concat(nombre, ' ', apellido)
from 		vendedores
where		nombre like '____a';

-- 6 listar los articulos cuyo nombre esté compuesto por mas de dos palabras

select		producto
from		articulos
where		producto like '% %';

-- 7 listar la cantidad de facturas que hubo por fecha de facturacion

select		fecha, count(*)
from		facturas
group by	fecha
order by 	fecha desc;

-- 8 informar la suma total de las ventas del negocio por mes, ordenadas de mayor a menor

select		year(fecha) 'anio', month(fecha) 'mes', sum(monto) as 'suma_total'
from 		facturas
group by	year(fecha), month(fecha)
order by	suma_total desc;

-- 9 informar la cantidad de facturas de cada cliente

select		c.nombre, count(letra) as 'cantidad de facturas'
from		facturas f
join		clientes c
on 			c.id_cliente=f.id_cliente
group by	nombre;


-- 10 informar quienes compraron el primer dia de ventas

select		c.nombre, c.apellido
from		clientes c
join		facturas f
on			c.id_cliente=f.id_cliente
where		fecha = ( select min(fecha) from facturas);


-- 11 listar los clientes a los que no se les haya hecho alguna factura

select		c.nombre, c.apellido
from		clientes c
left join	facturas f
on			c.id_cliente=f.id_cliente
where		letra is null;

-- 12 listar que clientes(id_clientes, nombre, apellido) compraron remeras

select		c.id_cliente, c.nombre, c.apellido
from		clientes c
join		facturas f on c.id_cliente=f.id_cliente
join		ventas v on f.letra=v.letra
join		articulos a on v.codigo=a.codigo
where		producto like '%remera%';

-- 13 listar los articulos que aun no fueron vendidos
    
    select		producto
    from		articulos a 
    left join	ventas v 
    on			a.codigo=v.codigo
    where		v.codigo is null;

-- 14 informar cuantas unidades se vendieron de cada articulo

select		a.producto, count(v.letra) 'cantidad de unidades vendidas'
from		articulos a
join	  	ventas v
on			v.codigo=a.codigo
group by	a.producto;


-- 15 listar el o los articulos que tengan la mayor cantidad de stock, siendo la mayor cantidad un unico valor maximo

select		codigo, producto, stock
from 		articulos
where		stock=(select max(stock) from articulos);


-- 16 agregar los campos precio_costo y precio_venta del tipo double a la tabla articulos

alter table articulos add precio_costo double, add precio_venta double;


-- 17 agregar un campo del tipo decimal, llamado sueldo_empleado, a la tabla vendedores. El mismo tendrá un valor inicial para todos de 450.010,00

alter table	vendedores add sueldo_empleado double;

update vendedores set sueldo_empleado = 450010.00;


-- 18 actualizar todos los stock_minimo y stock maximo a 100 y a 500 respectivamente

update articulos set stock_minimo = 100, stock_maximo = 500;


-- 19 eliminar los productos que no se hayan vendido nunca

delete		a
from		articulos a
join		ventas v
on 			a.codigo=v.codigo
where		v.codigo is null;

-- 20 clientes que compraron mas de 5 articulos distintos

select		concat(c.nombre , ' ' , c.apellido) 'cliente', count(distinct v.codigo) 'articulos_distintos_comprados'
from		clientes c
join 		facturas f
on 			c.id_cliente=f.id_cliente
join		ventas v 
on 			f.letra=v.letra and f.numero=v.numero
group by	c.nombre, c.apellido
having		articulos_distintos_comprados > 5;







