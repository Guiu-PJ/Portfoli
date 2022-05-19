let $num_libro := count(doc("parc.xml")/parc/espectacles/zona/espectacle/horari/passi[horaInici = "16:00"])
return concat("Total de passis que comencen a les 16:00: ", $num_libro)