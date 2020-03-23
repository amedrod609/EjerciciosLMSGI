<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'uerza') and contains($superheroe/@amigos, 'Iron Man')
return <superheroe>
<nombre>{data($superheroe/@nombre)}</nombre>
<fuerza>{$superheroe/@poderes}</fuerza>
<amigos>{$superheroe/@amigos}</amigos>
</superheroe>
} </marvel>