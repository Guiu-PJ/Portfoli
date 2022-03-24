drop database if exists multinacional;
CREATE DATABASE IF NOT EXISTS multinacional;
USE multinacional;

CREATE TABLE IF NOT EXISTS ikea(
	id varchar (10) UNIQUE,
    primary key (id)
);
CREATE TABLE IF NOT EXISTS jefe_de_tienda(
	dni varchar (9) UNIQUE,
    primary key (dni),
    nom varchar (20),
    cognoms varchar (20),
    id_ikea varchar (10) UNIQUE,
    FOREIGN KEY (id_ikea) REFERENCES ikea(id)
);
CREATE TABLE IF NOT EXISTS trabajador(
	id varchar (10) UNIQUE,
    primary key (id),
    nom varchar (20),
    cognoms varchar (20),
    numtelefon varchar (20),
    añost int,
    dni_jefe_de_tienda varchar (9),
    FOREIGN KEY (dni_jefe_de_tienda) REFERENCES jefe_de_tienda(dni)
);
CREATE TABLE IF NOT EXISTS almacen(
	numero int UNIQUE,
    primary key (numero)
);
CREATE TABLE IF NOT EXISTS vendedor(
	numero int UNIQUE,
    primary key (numero)
);
CREATE TABLE IF NOT EXISTS entregas(
	codi varchar (15) UNIQUE,
    primary key (codi)
);
CREATE TABLE IF NOT EXISTS ventas(
	codi varchar (15) UNIQUE,
    numero_vendedor int,
    primary key (codi)
);
CREATE TABLE IF NOT EXISTS assignados(
	id_trabajador varchar (10) UNIQUE,
    numero_almacen int,
    numero_vendedor int UNIQUE,
	primary key (numero_almacen, id_trabajador, numero_vendedor),
    FOREIGN KEY (id_trabajador) REFERENCES trabajador(id),
    FOREIGN KEY (numero_almacen) REFERENCES almacen(numero),
    FOREIGN KEY (numero_vendedor) REFERENCES vendedor(numero)
);
CREATE TABLE IF NOT EXISTS cuantas(
	numero_almacen int UNIQUE,
    codi_entregas varchar (15) UNIQUE,
    primary key (numero_almacen, codi_entregas),
    FOREIGN KEY (numero_almacen) REFERENCES almacen(numero),
    FOREIGN KEY (codi_entregas) REFERENCES entregas(codi)
);
CREATE TABLE IF NOT EXISTS cantidad(
	numero_vendedor int,
    codi_ventas varchar (15) UNIQUE,
    primary key (numero_vendedor, codi_ventas),
    FOREIGN KEY (numero_vendedor) REFERENCES vendedor(numero),
    FOREIGN KEY (codi_ventas) REFERENCES ventas(codi)
);


INSERT INTO ikea (id) VALUES
('asdfg12345'),
('qwert67890'),
('zxcvb09821'),
('lokij85492'),
('bfseg89462');


INSERT INTO jefe_de_tienda (dni,nom,id_ikea) VALUES
('89362548F','IVAN','asdfg12345'),
('09463852G','GERARD','qwert67890'),
('67503643I','POL','zxcvb09821'),
('80463846B','DAVID','lokij85492'),
('36294736M','GUILLEM','bfseg89462');


INSERT INTO trabajador (id, nom, dni_jefe_de_tienda) VALUES
('1234567890','Alex','80463846B'),
('0987654321','Maria','80463846B'),
('5432167890','Dylan','36294736M'),
('0987612345','Ruben','67503643I'),
('6574839201','Alexa','09463852G');


update trabajador set añost='1' where id in(1234567890);
update trabajador set añost='2' where id in(0987654321);
update trabajador set añost='1' where id in(5432167890);
update trabajador set añost='2' where id in(0987612345);
update trabajador set añost='2' where id in(6574839201);

INSERT INTO almacen (numero) VALUES
('1'),
('2'),
('3'),
('4'),
('5');

INSERT INTO vendedor (numero) VALUES
('12'),
('04'),
('07'),
('11'),
('15');

insert into assignados (id_trabajador,numero_almacen,numero_vendedor) values
('1234567890','1','12'),
('0987654321','2','04'),
('5432167890','3','07'),
('0987612345','4','11'),
('6574839201','1','15');



INSERT INTO entregas (codi) VALUES
('jfnvgdrtbf58392'),
('ghncfmlmoi78430'),
('kjmngfrdgt57483'),
('dfergyhjkl23489'),
('mncvbfghtm67593');


INSERT INTO ventas (codi, numero_vendedor) VALUES
('9857496483hgnvm','12'),
('0956436943fgbnm','04'),
('5498732014ghkrd','07'),
('0945783256erasz','11'),
('4321764589thñpo','12');

INSERT INTO cantidad (codi_ventas, numero_vendedor) VALUES
('9857496483hgnvm','12'),
('0956436943fgbnm','04'),
('5498732014ghkrd','07'),
('0945783256erasz','11'),
('4321764589thñpo','12');

INSERT INTO cuantas (codi_entregas, numero_almacen) VALUES
('jfnvgdrtbf58392','1'),
('ghncfmlmoi78430','2'),
('kjmngfrdgt57483','3'),
('dfergyhjkl23489','4'),
('mncvbfghtm67593','5');

ALTER TABLE ikea ADD ciudad CHAR(5);
ALTER TABLE ikea MODIFY ciudad CHAR(25);
ALTER TABLE trabajador DROP numtelefon;






