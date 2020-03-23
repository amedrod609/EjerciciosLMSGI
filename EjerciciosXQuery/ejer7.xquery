<marvel>
{
for $superheroe in doc('superheroes.xml')/marvel/superheroe
return 
<html>
    <head></head>
    <body>
    <table>
        <tr>
            <td>{data($superheroe/@nombre)}</td>
        </tr>
        <tr>
            <td>{data($superheroe/@poderes)}</td>
        </tr>
        <tr>
            <td>{data($superheroe/@amigos)}</td>
        </tr>
        <tr>
            <td>{data($superheroe/@nivel)}</td>
        </tr>
        </table>
    </body>
</html>
} </marvel>