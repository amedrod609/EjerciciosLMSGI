<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'uerza')
return <superheroe><nombre>{data($superheroe/@nombre)}</nombre><fuerza>{$superheroe/@poderes}</fuerza></superheroe>
} </marvel>