<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains( lower-case($superheroe/@poderes), 'fuerza') and contains($superheroe/@amigos, 'Iron Man')
return <superheroe>
<nombre>{data($superheroe/@nombre)}</nombre>
<poderes></poderes>
<amigos>{$superheroe/@amigos}</amigos>
</superheroe>
} </marvel>