for $espectacle in doc("parc.xml")/parc/espectacles/zona/espectacle
where $espectacle/tipus/text() = "Passatge del Terror"
return 
insert node <preu>"5"</preu> before $espectacle/tipus