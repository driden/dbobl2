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

-- Obtener el c�digo y descripci�n de aquellos procesos que son paralelos a m�s de un proceso. Tener en
-- cuenta procesos paralelos que se ejecutan entre el primer y quinto lugar, y que insumen m�s de 60
-- minutos.

SELECT proc.codigo, proc.descripcion FROM 
RECICLAJE rec
INNER JOIN PROCESO proc
ON rec.CODIGO = proc.codigo
WHERE rec.orden between 1 and 5
AND rec.tiempo > 60
AND proc.codprocparalelo is not null;


--Obtener el nombre, superficie e intendencia de los puntos limpios donde se depositaron todos los
--materiales. Considerar aquellos materiales que no est�n presentes en art�culos de tipo laptop.
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

--Obtener el nombre y la descripci�n de los art�culos que tuvieron dep�sitos en junio de 2018. De estos
--art�culos, mostrar para los que tengan cobre, el c�digo de dicho material y para los que no contengan
--cobre mostrar el texto �No contiene cobre�.

SELECT a2.nombre, (SELECT 'No contiene cobre' from Dual) as Cobre
FROM ARTICULO a2
WHERE a2.Nombre NOT IN (
    SELECT art.nombre
    FROM ARTICULO art
    INNER JOIN COMPUESTOPOR cp
    ON cp.nombre = art.nombre
    INNER JOIN MATERIAL mat
    ON mat.codigo = cp.codigo
    INNER JOIN DEPOSITO d
    ON art.nombre = d.nombre
    WHERE mat.codigo = (
            -- Codigos que de Cobre
                SELECT m.codigo FROM MATERIAL m
                WHERE m.nombre = 'Cobre')
)
UNION
SELECT art.nombre, (
            SELECT to_char(m.codigo) FROM MATERIAL m
            WHERE m.nombre = 'Cobre') As Cobre
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
-- WHERE TO_CHAR(d.FECHA,'mm') = '6' AND 
-- TO_CHAR(FECHA,'yyyy') = '2018'
;

