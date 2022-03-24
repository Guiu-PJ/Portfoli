use plantes ;
select nom_popular 
	from planta, exemplar_planta ep 
		where nom_planta=nom_cientific 
			group by nom_popular 
				having count(num_exemplar)<2;