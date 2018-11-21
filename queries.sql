-- Obtener la latitud y la longitud de los puntos limpios donde se depositaron artÃ­culos con el mayor peso, 
-- considerando los artÃ­culos de tipo celular. 
-- Si hay mÃ¡s de un punto limpio que cumple las condiciones, mostrarlos a todos.

SELECT d.pesokg, pl.latitud, pl.longitud
FROM (deposito d
INNER JOIN PUNTOLIMPIO pl
ON pl.nombrepunto = d.nombrepunto)
INNER JOIN ARTICULO art
ON art.nombre = d.nombre
WHERE art.tipoarticulo = 'Celular'
AND d.pesokg = (SELECT MAX(pesokg) FROM Deposito);


-- Obtener los puntos limpios de Montevideo y Canelones donde se depositaron artÃ­culos de tipo laptop o televisores, 
-- pero no ambos tipos. Tener en cuenta solo los depÃ³sitos de 2 a 5 kilos.

SELECT *
FROM (deposito d
INNER JOIN puntolimpio pl
ON d.nombrepunto = pl.nombrepunto)
INNER JOIN articulo art
ON art.nombre = d.nombre
WHERE d.pesokg BETWEEN 2 AND 5
AND pl.intendencia IN ('Montevideo', 'Canelones')
AND 1 = (
        SELECT COUNT(a1.tipoarticulo)
        FROM DEPOSITO d1 
        INNER JOIN ARTICULO a1 
        ON d1.nombre = a1.nombre 
        WHERE a1.tipoarticulo IN ('Television', 'Laptops')
        and d1.nombrepunto = d.nombrepunto -- IMPORTANTE: Necesito usar el mismo deposito que por el que joineo
        GROUP BY d1.nombrepunto
        );
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
-- Obtener el código y descripción de aquellos procesos que son paralelos a más de un proceso. Tener en
-- cuenta procesos paralelos que se ejecutan entre el primer y quinto lugar, y que insumen más de 60
-- minutos.

SELECT proc.codigo, proc.descripcion FROM 
RECICLAJE rec
INNER JOIN PROCESO proc
ON rec.CODIGO = proc.codigo
WHERE rec.orden between 1 and 5
AND rec.tiempo > 60
AND proc.codprocparalelo is not null;
