-- Obtener la latitud y la longitud de los puntos limpios donde se depositaron artículos con el mayor peso, 
-- considerando los artículos de tipo celular. 
-- Si hay más de un punto limpio que cumple las condiciones, mostrarlos a todos.

SELECT d.pesokg, pl.latitud, pl.longitud
FROM (deposito d
INNER JOIN PUNTOLIMPIO pl
ON pl.nombrepunto = d.nombrepunto)
INNER JOIN ARTICULO art
ON art.nombre = d.nombre
WHERE art.tipoarticulo = 'Celular'
AND d.pesokg = (SELECT MAX(pesokg) FROM Deposito);


-- Obtener los puntos limpios de Montevideo y Canelones donde se depositaron artículos de tipo laptop o televisores, 
-- pero no ambos tipos. Tener en cuenta solo los depósitos de 2 a 5 kilos.

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

-- Obtener el código y el nombre de los materiales que SOLO están presentes 
-- en la composición de celulares con un porcentaje mayor a 50%.
-- Solo material codigo 6 (Acero)

SELECT m.codigo, m.nombre 
FROM COMPUESTOPOR c
INNER JOIN MATERIAL m
ON c.codigo = m.codigo
INNER JOIN ARtiCULO a
ON a.nombre = c.nombre
WHERE c.porcentaje > 50
AND c.codigo NOT IN (
    SELECT  mat.codigo
    FROM MATERIAL mat
    INNER JOIN COMPUESTOPOR cp
    ON mat.codigo = cp.codigo
    INNER JOIN articulo art
    ON cp.nombre = art.nombre
    WHERE art.tipoarticulo <> 'Celular')
AND a.tipoarticulo = 'Celular';


-- Obtener el código y descripción de aquellos procesos que son paralelos a más de un proceso. 
-- Tener en cuenta procesos paralelos que se ejecutan entre el primer y quinto lugar, y que insumen más de 60 minutos.

