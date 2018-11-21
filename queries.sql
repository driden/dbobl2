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


--Obtener el nombre, superficie e intendencia de los puntos limpios donde se depositaron todos los
--materiales. Considerar aquellos materiales que no están presentes en artículos de tipo laptop.
SELECT pl.nombrepunto, pl.superficie, pl.Intendencia 
FROM puntolimpio pl
INNER JOIN deposito d
ON pl.nombrepunto = d.nombrepunto
INNER JOIN articulo art
ON art.nombre = d.nombre
INNER JOIN compuestopor cp
ON cp.nombre = art.nombre
INNER JOIN MATERIAL mat
ON mat.codigo = cp.codigo
where mat.codigo not in (
                -- Materiales usados para laptops
                SELECT distinct mat.codigo as materialesLaptop 
                FROM puntolimpio pl
                INNER JOIN deposito d
                ON pl.nombrepunto = d.nombrepunto
                INNER JOIN articulo art
                ON art.nombre = d.nombre
                INNER JOIN compuestopor cp
                ON cp.nombre = art.nombre
                INNER JOIN MATERIAL mat
                ON mat.codigo = cp.codigo
                WHERE art.tipoarticulo = 'Laptops'
)
GROUP BY pl.nombrepunto, pl.superficie, pl.Intendencia
;

--Obtener el nombre y la descripción de los artículos que tuvieron depósitos en junio de 2018. De estos
--artículos, mostrar para los que tengan cobre, el código de dicho material y para los que no contengan
--cobre mostrar el texto “No contiene cobre”.
SELECT art.nombre, art.descripcion, 'No contiene cobre'
FROM ARTICULO art
INNER JOIN COMPUESTOPOR cp
ON cp.nombre = art.nombre
INNER JOIN MATERIAL mat
ON mat.codigo = cp.codigo
INNER JOIN DEPOSITO d
ON art.nombre = d.nombre
WHERE mat.codigo IN (
        -- Codigos que no son Cobre
        SELECT m1.codigo FROM MATERIAL m1
        WHERE m1.codigo not in (
            SELECT m.codigo FROM MATERIAL m
            WHERE m.nombre = 'Cobre')
)

--WHERE TO_CHAR(d.FECHA,'mm') = '6' AND 
--  TO_CHAR(FECHA,'yyyy') = '2018'

GROUP BY art.nombre, art.descripcion
;

-- Codigos que no son Cobre
SELECT mat.codigo FROM MATERIAL mat
WHERE mat.codigo not in (
    SELECT m.codigo FROM MATERIAL m
    WHERE m.nombre = 'Cobre');