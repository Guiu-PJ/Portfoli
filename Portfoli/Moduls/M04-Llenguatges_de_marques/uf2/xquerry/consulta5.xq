for $botiga in doc("parc.xml")/parc/botigues/zona/botiga/@nom
where $botiga/../producte = $botiga/../producte
(: where $botiga = $botiga :)
return 
concat($botiga, " vende el mismo producto que ", $botiga)