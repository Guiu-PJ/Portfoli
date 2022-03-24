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
    dni_jefe_de_tienda varchar (9) UNIQUE,
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
    primary key (codi)
);
CREATE TABLE IF NOT EXISTS assignados(
	id_trabajador varchar (10) UNIQUE,
    numero_almacen int UNIQUE,
    numero_vendedor int UNIQUE,
	primary key (numero_almacen, id_trabajador,numero_vendedor),
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
	numero_vendedor int UNIQUE,
    codi_ventas varchar (15) UNIQUE,
    primary key (numero_vendedor, codi_ventas),
    FOREIGN KEY (numero_vendedor) REFERENCES vendedor(numero),
    FOREIGN KEY (codi_ventas) REFERENCES ventas(codi)
);


INSERT INTO ikea VALUES
('asdfg12345'),
('qwert67890'),
('zxcvb09821'),
('lokij85492'),
('bfseg89462');


INSERT INTO jefe_de_tienda (dni) VALUES
('89362548F'),
('09463852G'),
('67503643I'),
('80463846B'),
('36294736M');


INSERT INTO trabajador (id) VALUES
('1234567890'),
('0987654321'),
('5432167890'),
('0987612345'),
('6574839201');


INSERT INTO almacen (numero) VALUES
('01'),
('02'),
('03'),
('04'),
('05');


INSERT INTO vendedor (numero) VALUES
('12'),
('04'),
('07'),
('11'),
('15');


INSERT INTO entregas (codi) VALUES
('jfnvgdrtbf58392'),
('ghncfmlmoi78430'),
('kjmngfrdgt57483'),
('dfergyhjkl23489'),
('mncvbfghtm67593');


INSERT INTO ventas (codi) VALUES
('9857496483hgnvm'),
('0956436943fgbnm'),
('5498732014ghkrd'),
('0945783256erasz'),
('4321764589thñpo');

ALTER TABLE ikea ADD ciudad CHAR(5);
ALTER TABLE ikea MODIFY ciudad CHAR(25);
ALTER TABLE trabajador DROP numtelefon;





