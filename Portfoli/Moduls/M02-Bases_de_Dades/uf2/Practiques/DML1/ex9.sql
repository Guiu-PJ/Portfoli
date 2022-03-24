use plantes;
	select pi.nom_planta 
		from planta_interior pi, planta
			where pi.nom_planta = nom_cientific and floracio='Primavera';