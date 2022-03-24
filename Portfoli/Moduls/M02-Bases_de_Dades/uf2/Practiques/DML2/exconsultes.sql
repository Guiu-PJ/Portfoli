/*1-Consulta con group by para ver el numero de trabajadores agrupados por años en la empresa*/
select t.añost, count(a.numero_almacen) total_trabajadores
from trabajador t
join assignados a on t.id = a.id_trabajador
join almacen l on a.numero_almacen = l.numero
group by t.añost;


/*2-Group by para saber la id del trabajador su numero de vendedor y su numero de ventas y solo mostrar si tienen 2 o mas ventas*/
select id_trabajador, a.numero_vendedor, count(*) cuantitat_ventes
from  assignados a
join vendedor v on a.numero_vendedor = v.numero
join cantidad c on v.numero = c.numero_vendedor
group by c.numero_vendedor
HAVING count(*) >= 2;


/*3-Subconsulta para ver la id y el numero de vendedor de los trabajadores del almacen 1*/
select t.id, s.numero_almacen, s.numero_vendedor
from trabajador t
join assignados s on t.id = s.id_trabajador
join (select * from almacen a where a.numero='1')a on s.numero_almacen = a.numero;


/*4-Subconsulta para ver la id y el numero de almacen de los trabajadores que se llaman Alex*/
select t.id, t.nom, s.numero_almacen
from almacen a
join assignados s on a.numero = s.numero_almacen
join (select * from trabajador t where t.nom='Alex')t on s.id_trabajador = t.id;


/*5-Muestra la id del trabajador y su numero de vendedor si es igual o superior a 10 y los ordena*/
select t.id, s.numero_vendedor
from trabajador t
join assignados s on t.id = s.id_trabajador
where s.numero_vendedor >='10'
order by s.numero_vendedor;


/*6-Muestra los codigos de entrega del almacen 3*/
select c.codi_entregas, l.numero
from assignados a
join almacen l on l.numero = a.numero_almacen
join cuantas c on c.numero_almacen = l.numero
where c.numero_almacen = '3';


/*7-Muestra el nombre y la id de los trabajadores assignados en el almacen 2*/
select t.nom, t.id
from trabajador t
join assignados a on a.id_trabajador = t.id
where a.numero_almacen ='2';


/*8-Muestra id del trabajador, su nombre, el dni del jefe de la tienda donde trabaja su nombre y la id del ikea*/
select t.id, t.nom, t.dni_jefe_de_tienda, j.nom, j.id_ikea
from ikea i
join jefe_de_tienda j on i.id = j.id_ikea
join trabajador t on j.dni = t.dni_jefe_de_tienda
where t.nom='Maria';


/*9-Muestra el nombre del trabajador y el almacen en el que trabaja si es menor que 3*/
select t.nom, a.numero_almacen
from trabajador t
join assignados a on t.id = a.id_trabajador
where numero_almacen<'3';


/*10-Muestra el codigo de las entregas el numero de almacen y la id del trabajador y con la union lo hace sobre el almacen 2 y el 3*/
select c.codi_entregas, l.numero, a.id_trabajador
from assignados a
join almacen l on l.numero = a.numero_almacen
join cuantas c on c.numero_almacen = l.numero
where c.numero_almacen = '2'
union
select c.codi_entregas, l.numero, a.id_trabajador
from assignados a
join almacen l on l.numero = a.numero_almacen
join cuantas c on c.numero_almacen = l.numero
where c.numero_almacen = '3';
