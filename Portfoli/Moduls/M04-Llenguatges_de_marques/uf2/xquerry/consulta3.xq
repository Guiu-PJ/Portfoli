for $restaurant in doc("parc.xml")/parc/restaurants/zona/restaurant, $botiga in doc("parc.xml")/parc/botigues/zona/botiga
where $restaurant/../@nom = $botiga/../@nom
return
concat($botiga/@nom," esta en la mateixa zona que ", $restaurant/@nom)