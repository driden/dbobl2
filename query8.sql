-- 8. Obtener los datos de los materiales que estén presenten en más de 45 artículos en una proporción de más del 5% por artículo.
-- No tener en cuenta materiales que no hayan sido depositados en al menos 40% de los puntos limpios.

SELECT mat2.codigo, mat2.nombre, mat2.tipomaterial
FROM ARTICULO ar2
INNER JOIN COMPUESTOPOR cpr2
ON ar2.Nombre = cpr2.Nombre
INNER JOIN DEPOSITO dep2
ON ar2.Nombre = dep2.Nombre
INNER JOIN PUNTOLIMPIO pl2
ON dep2.NombrePunto = pl2.nombrepunto
INNER JOIN MATERIAL mat2
ON mat2.Codigo = cpr2.Codigo
-- articulos con mas de 5% de un material
WHERE cpr2.porcentaje > 5
AND mat2.codigo IN (-- mas de 45 articulos
            SELECT cpr1.CODIGO
            FROM ARTICULO ar1
            INNER JOIN COMPUESTOPOR cpr1
            ON ar1.Nombre = cpr1.Nombre
            INNER JOIN MATERIAL mat1
            ON mat1.Codigo = cpr1.Codigo
            GROUP BY cpr1.CODIGO
            HAVING COUNT(1) > 45
    )
AND mat2.codigo NOT IN (
  --maeriales depositados en menos del 40% de los puntos limpios
    SELECT mat.CODIGO
    FROM ARTICULO ar
    INNER JOIN COMPUESTOPOR cpr
    ON ar.Nombre = cpr.Nombre
    INNER JOIN DEPOSITO dep
    ON ar.Nombre = dep.Nombre
    INNER JOIN PUNTOLIMPIO pl
    ON dep.NombrePunto = pl.nombrepunto
    INNER JOIN MATERIAL mat
    ON mat.Codigo = cpr.Codigo
    GROUP BY mat.CODIGO
    HAVING ((COUNT(distinct dep.NombrepUnto)/(SELECT COUNT(1) FROM PUNTOLIMPIO)) * 100) < 40  
)

GROUP BY mat2.codigo, mat2.nombre, mat2.tipomaterial
;