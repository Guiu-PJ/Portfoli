use plantes;
	select distinct nom_planta 
		from reproduccio 
			where metode_reproduccio<>'Esqueix';