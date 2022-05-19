for $atraccio in doc("parc.xml")/parc/atraccions/zona/atraccio
where $atraccio/edatMinima <= 10
return concat("Nom atracció: ", $atraccio/@nom )
