<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where ends-with($superheroe/@nombre, 'a')
return <superheroe><nombre>{data($superheroe/@nombre)}</nombre></superheroe>
} </marvel>