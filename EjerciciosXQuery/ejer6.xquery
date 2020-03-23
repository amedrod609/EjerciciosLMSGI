<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
return <superheroe>
<nombre>{data($superheroe/@nombre)}</nombre>
<fuerza>{data($superheroe/@poderes)}</fuerza>
<amigos>{data($superheroe/@amigos)}</amigos>
<nivel>{data($superheroe/@nivel)}</nivel>
</superheroe>
} </marvel>