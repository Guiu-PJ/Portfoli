for $atraccio in doc("parc.xml")/parc/atraccions/zona/atraccio
where $atraccio/servei[1]/text() = PassPreferent
return
insert node <vip>1</vip> into $atraccio/servei[1]