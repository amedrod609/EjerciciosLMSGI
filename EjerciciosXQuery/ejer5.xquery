<marvel>
{
let $superheroe := doc('superheroes.xml')/marvel/superheroe/@nivel
return <superheroe>{avg($superheroe)}</superheroe>
} </marvel>