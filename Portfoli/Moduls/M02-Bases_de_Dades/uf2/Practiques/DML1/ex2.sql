use plantes;
	select nom_popular 
		from planta, exemplar_planta ep 
			where nom_cientific 
				not in(select nom_planta from exemplar_planta) group by nom_cientific;


			