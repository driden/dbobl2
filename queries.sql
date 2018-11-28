-- 1) Obtener la latitud y la longitud de los puntos limpios donde se depositaron artículos con el mayor peso,
-- considerando los artículos de tipo celular.
-- Si hay más de un punto limpio que cumple las condiciones, mostrarlos a todos.

SELECT pl.latitud, pl.longitud
FROM (deposito d
INNER JOIN PUNTOLIMPIO pl
ON pl.nombrepunto = d.nombrepunto)
INNER JOIN ARTICULO art
ON art.nombre = d.nombre
WHERE art.tipoarticulo = 'Celular'
AND d.pesokg = (SELECT MAX(pesokg) FROM Deposito);


-- 2) Obtener los puntos limpios de Montevideo y Canelones donde se depositaron artículos de tipo laptop o televisores, 
-- pero no ambos tipos. Tener en cuenta solo los depósitos de 2 a 5 kilos.

SELECT distinct pl.nombrepunto
FROM deposito d
INNER JOIN puntolimpio pl
ON d.nombrepunto = pl.nombrepunto
INNER JOIN articulo art
ON art.nombre = d.nombre
WHERE  d.pesokg BETWEEN 2 AND 500
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
        
-- 3) Obtener el código y el nombre de los materiales que SOLO están presentes 
-- en la composición de celulares con un porcentaje mayor a 50%.

SELECT m.codigo, m.nombre 
FROM COMPUESTOPOR c
INNER JOIN MATERIAL m
ON c.codigo = m.codigo
INNER JOIN ARTICULO a
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

-- 4) Obtener el codigo y descripcion de aquellos procesos que son paralelos a mas de un proceso. Tener en
-- cuenta procesos paralelos que se ejecutan entre el primer y quinto lugar, y que insumen mas de 60
-- minutos.

SELECT p.codigo, p.descripcion
FROM proceso p
       INNER JOIN reciclaje r ON r.codigo = p.codigo
WHERE r.tiempo > 60
  AND r.orden BETWEEN 1 AND 5
  AND p.codigo IN(SELECT p1.codigo AS codigo
                  FROM proceso p1
                         INNER JOIN proceso p2 ON p1.codprocparalelo = p2.codigo
                  WHERE p2.codprocparalelo <> p1.codigo
                    AND P2.CODIGO IN
                        (SELECT r1.codigo FROM RECICLAJE r1
                         WHERE r1.NOMBRE = r.nombre AND r1.TIEMPO >60)
                  UNION SELECT p1.codprocparalelo AS codigo
                        FROM proceso p1
                               INNER JOIN proceso p2 ON p1.codprocparalelo = p2.codigo
                        WHERE p2.codprocparalelo <> p1.codigo
                          AND P2.CODIGO IN
                              (SELECT r1.codigo FROM RECICLAJE r1
                               WHERE r1.NOMBRE = r.nombre AND r1.TIEMPO >60)
                  UNION SELECT p2.codigo AS codigo
                        FROM proceso p1
                               INNER JOIN proceso p2 ON p1.codprocparalelo = p2.codigo
                        WHERE p2.codprocparalelo <> p1.codigo
                          AND P2.CODIGO IN
                              (SELECT r1.codigo FROM RECICLAJE r1
                               WHERE r1.NOMBRE = r.nombre AND r1.TIEMPO >60)
                  UNION SELECT p2.codprocparalelo AS codigo
                        FROM proceso p1
                               INNER JOIN proceso p2 ON p1.codprocparalelo = p2.codigo
                        WHERE p2.codprocparalelo <> p1.codigo
                          AND P2.CODIGO IN
                              (SELECT r1.codigo FROM RECICLAJE r1
                               WHERE r1.NOMBRE = r.nombre AND r1.TIEMPO >60)
                 );

--5) Obtener el nombre, superficie e intendencia de los puntos limpios donde se depositaron todos los
--materiales. Considerar aquellos materiales que no están presentes en artculos de tipo laptop.
-- SELECT pl.nombrepunto, pl.superficie, pl.Intendencia
-- FROM puntolimpio pl
-- INNER JOIN deposito d
-- ON pl.nombrepunto = d.nombrepunto
-- INNER JOIN articulo art
-- ON art.nombre = d.nombre
-- INNER JOIN compuestopor cp
-- ON cp.nombre = art.nombre
-- INNER JOIN MATERIAL mat
-- ON mat.codigo = cp.codigo
-- where mat.codigo not in (
--                 -- Materiales usados para laptops
--                 SELECT distinct mat.codigo as materialesLaptop
--                 FROM puntolimpio pl
--                 INNER JOIN deposito d
--                 ON pl.nombrepunto = d.nombrepunto
--                 INNER JOIN articulo art
--                 ON art.nombre = d.nombre
--                 INNER JOIN compuestopor cp
--                 ON cp.nombre = art.nombre
--                 INNER JOIN MATERIAL mat
--                 ON mat.codigo = cp.codigo
--                 WHERE art.tipoarticulo = 'Laptops'
-- )
-- GROUP BY pl.nombrepunto, pl.superficie, pl.Intendencia
-- ;

SELECT * --p.nombrepunto, p.superficie, p.Intendencia
FROM PUNTOLIMPIO p
INNER JOIN DEPOSITO d ON d.NOMBREPUNTO = p.NOMBREPUNTO
INNER JOIN ARTICULO a1 ON a1.NOMBRE = d.NOMBRE
INNER JOIN COMPUESTOPOR cp1 ON cp1.NOMBRE = a1.NOMBRE
INNER JOIN MATERIAL m1 ON m1.CODIGO = cp1.CODIGO
WHERE a1.TIPOARTICULO <> 'Laptops'
AND COUNT (distinct M1.CODIGO) = (
  SELECT COUNT(DISTINCT m2.CODIGO) AS cantMatNotInLaptops FROM MATERIAL m2
  INNER JOIN COMPUESTOPOR cp2 ON m2.CODIGO = cp2.CODIGO
  INNER JOIN ARTICULO a2 ON cp2.NOMBRE = a2.NOMBRE
  WHERE a2.TIPOARTICULO <>  'Laptops');

SELECT m1.CODIGO --p.nombrepunto, p.superficie, p.Intendencia
FROM PUNTOLIMPIO p
INNER JOIN DEPOSITO d ON d.NOMBREPUNTO = p.NOMBREPUNTO
INNER JOIN ARTICULO a1 ON a1.NOMBRE = d.NOMBRE
INNER JOIN COMPUESTOPOR cp1 ON cp1.NOMBRE = a1.NOMBRE
INNER JOIN MATERIAL m1 ON m1.CODIGO = cp1.CODIGO
WHERE a1.TIPOARTICULO <> 'Laptops'
GROUP BY m1.CODIGO;

--6) Obtener el nombre y la descripción de los artculos que tuvieron depósitos en junio de 2018. De estos
--art�culos, mostrar para los que tengan cobre, el código de dicho material y para los que no contengan
--cobre mostrar el texto No contiene cobre.

SELECT a2.nombre, (SELECT 'No contiene cobre' FROM dual) AS cobre
FROM articulo a2
WHERE a2.nombre NOT IN (SELECT art.nombre
                        FROM articulo art
                               INNER JOIN compuestopor cp ON cp.nombre = art.nombre
                               INNER JOIN material mat ON mat.codigo = cp.codigo
                               INNER JOIN deposito d ON art.nombre = d.nombre
                        WHERE mat.codigo = (
-- Codigos que de Cobre
                                           SELECT m.codigo FROM material m WHERE m.nombre = 'Cobre'))
UNION
SELECT art.nombre, (SELECT to_char(m.codigo) FROM material m WHERE m.nombre = 'Cobre') AS cobre
FROM articulo art
       INNER JOIN compuestopor cp ON cp.nombre = art.nombre
       INNER JOIN material mat ON mat.codigo = cp.codigo
       INNER JOIN deposito d ON art.nombre = d.nombre
WHERE mat.codigo IN (
-- Codigos que no son Cobre
                    SELECT m1.codigo
                    FROM material m1
                    WHERE m1.codigo NOT IN (SELECT m.codigo FROM material m WHERE m.nombre = 'Cobre'))
AND TO_CHAR(d.FECHA,'mm') = 6
AND TO_CHAR(FECHA,'yyyy') = 2018;

-- 7. Obtener el nombre y la descripción de los procesos de reciclaje que representaron
-- la mayor cantidad de tiempo en total
-- considerando procesos donde se haya reciclado algún artículo de tipo laptop y
-- que haya sido depositado entre el 10 y 20 de agosto de 2018.


SELECT r.NOMBRE, pr.DESCRIPCION, r.TIEMPO 
FROM reciclaje r
       INNER JOIN proceso pr ON r.codigo = pr.codigo
INNER JOIN ARTICULO ar
ON ar.nombre = r.nombre
INNER JOIN DEPOSITO d
ON d.nombre = ar.nombre
WHERE r.tiempo IN
-- los tiempos maximos
      (SELECT MAX(rpaso.tiempo) tiempo FROM reciclaje rpaso GROUP BY rpaso.nombre)
                  
AND TO_CHAR(d.FECHA,'mm') = 8 
AND TO_CHAR(d.FECHA,'yyyy') = 2018
AND (TO_CHAR(d.FECHA,'dd') >= 10 AND TO_CHAR(d.FECHA,'dd') <=20)
AND ar.tipoarticulo = 'Laptops'
;

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
            HAVING COUNT(1) > 1
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
-- 9. Obtener todos los datos de los materiales que estan presentes en la mayor cantidad de articulos, 
-- considerando solo los articulos que tuvieron la menor cantidad de depositos entre mayo y agosto de 2018.

SELECT codigo, nombre, tipomaterial
FROM MATERIAL 
WHERE codigo in (
            SELECT  m3.codigo 
            FROM ARTICULO a3
            INNER JOIN COMPUESTOPOR cp3
            ON a3.nombre = cp3.nombre
            INNER JOIN MATERIAL m3
            on m3.codigo = cp3.codigo
            GROUP BY m3.codigo
            HAVING count(m3.codigo) > (
                                        SELECT floor(count(distinct a3.nombre) / 2) mayoriaArticulos
                                        FROM ARTICULO a3
                                        INNER JOIN COMPUESTOPOR cp3
                                        ON a3.nombre = cp3.nombre
                                        INNER JOIN MATERIAL m3
                                        on m3.codigo = cp3.codigo
                                        WHERE a3.nombre IN (
                                        --Articulos con la menor cantidad de depositos
                                            SELECT d2.nombre
                                            FROM ARTICULO ar2
                                            INNER JOIN DEPOSITO d2
                                            on ar2.nombre = d2.nombre
                                            WHERE TO_CHAR(d2.FECHA,'mm') >= 1 
                                            AND TO_CHAR(d2.FECHA,'mm') <= 12
                                            AND TO_CHAR(d2.FECHA,'yyyy') = 2018
                                            GROUP BY d2.nombre
                                            HAVING COUNT(d2.nombre) = (
                                                    --Menor cantidad depositos entre mayo y agosto 2018
                                                    SELECT MIN(COUNT(1)) menorCantidad
                                                    FROM ARTICULO ar1
                                                    INNER JOIN DEPOSITO d1
                                                    ON ar1.nombre = d1.nombre
                                                    WHERE TO_CHAR(d1.FECHA,'mm') >= 1 
                                                    AND TO_CHAR(d1.FECHA,'mm') <= 12
                                                    AND TO_CHAR(d1.FECHA,'yyyy') = 2018
                                                    GROUP BY ar1.nombre 
                                            ))
            
                                        )

);

--10. Obtener para las estaciones de invierno y primavera, la cantidad de depósitos por punto limpio, 
--  la cantidad depositada en toneladas en cada punto limpio de artículos que contengan al menos un 50% de plástico, 
--  el promedio de depósitos por hora de cada punto limpio, considerando las 24 horas del día y la cantidad de depósitos por artículo en cada punto limpio. 
--  Mostrar además qué porcentaje representa la cantidad de depósitos totales de cada punto limpio sobre el total de depósitos de cada estación. 
--  Mostrar para cada punto limpio cuál fue el material más depositado. Si hay más de un material más depositado, mostrarlos todos.

--El esquema que se espera de esta consulta es el siguiente (respetar los nombres).
--Estación – Punto Limpio – Cantidad Depósitos – Cantidad Toneladas – Promedio de Depósitos x Hora – Nombre Artículo – 
--Cantidad Depósitos x Artículo – Total Depósitos x Estación – Porcentaje – Material más depositado   

SELECT estaciones.estacion,
       depositos.puntolimpio,
       depositos.cantdepositos,
       cant.cantidadtoneladas,
       hora.promediodedepositosxhora,
       hora.nombrearticulo,
       totaldepositos.cantidaddepositosxarticulo,
       depositoestacion.totaldepositosxestacion,
       depositoestacion.porcentaje,
       masdepo.materialmásdepositado
FROM (SELECT 'INVIERNO' AS estacion FROM dual
      UNION SELECT 'PRIMAVERA' AS estacion FROM dual) estaciones,
     (SELECT d.nombrepunto AS puntolimpio, COUNT(1) AS cantdepositos, 'INVIERNO' estacion
      FROM deposito d
      WHERE ((TO_CHAR(d.fecha, 'mm') = 7 AND TO_CHAR(d.fecha, 'mm') >= 21) OR (TO_CHAR(d.fecha, 'mm') = 8) OR
             (TO_CHAR(d.fecha, 'mm') = 9 AND TO_CHAR(d.fecha, 'mm') <= 21))
      GROUP BY d.nombrepunto, 'INVIERNO'

      UNION

      SELECT d2.nombrepunto AS puntolimpio, COUNT(1) AS cantdepositos, 'PRIMAVERA' estacion
      FROM deposito d2
      WHERE (TO_CHAR(d2.fecha, 'mm') = 12 AND TO_CHAR(d2.fecha, 'mm') <= 21)
         OR (TO_CHAR(d2.fecha, 'mm') = 9 AND TO_CHAR(d2.fecha, 'mm') >= 22)
         OR (TO_CHAR(d2.fecha, 'mm') = 10 OR TO_CHAR(d2.fecha, 'mm') = 11)


      GROUP BY d2.nombrepunto, 'PRIMAVERA') depositos,
--la cantidad depositada en toneladas en cada punto limpio de artículos que contengan al menos un 50% de plástico
     (SELECT SUM(d3.pesokg) / 1000 AS cantidadtoneladas, d3.nombrepunto
      FROM articulo ar3
             INNER JOIN deposito d3 ON ar3.nombre = d3.nombre
             INNER JOIN compuestopor cp3 ON cp3.nombre = ar3.nombre
             INNER JOIN puntolimpio pl3 ON pl3.nombrepunto = d3.nombrepunto
      WHERE cp3.porcentaje > 50
      GROUP BY d3.nombrepunto) cant,
--promedio de depósitos por hora de cada punto limpio, considerando las 24 horas del día y la cantidad de depósitos por artículo en cada punto limpio.
     (SELECT d4.fecha,
             COUNT(1) / 24 AS promediodedepositosxhora,
             d4.nombre     AS nombrearticulo,
             d4.nombrepunto   nombrepunto
      FROM deposito d4
      WHERE d4.nombrepunto IN (SELECT nombrepunto FROM puntolimpio)
      GROUP BY d4.fecha, d4.nombre, d4.nombrepunto) hora,
     (SELECT COUNT(1) AS cantidaddepositosxarticulo, d6.nombre nombre
      FROM deposito d6
      GROUP BY d6.nombre) totaldepositos,
--Mostrar además qué porcentaje representa la cantidad de depósitos totales de cada punto limpio sobre el total de depósitos de cada estación.
     (SELECT COUNT(1) AS                                        totaldepositosxestacion,
             'INVIERNO'                                         estacion,
             (100 * COUNT(1) / (SELECT COUNT(1) FROM deposito)) porcentaje
      FROM deposito d
             INNER JOIN articulo ar ON d.nombre = ar.nombre
      WHERE ((TO_CHAR(d.fecha, 'mm') = 7 AND TO_CHAR(d.fecha, 'mm') >= 21) OR (TO_CHAR(d.fecha, 'mm') = 8) OR
             (TO_CHAR(d.fecha, 'mm') = 9 AND TO_CHAR(d.fecha, 'mm') <= 21))
      GROUP BY 'INVIERNO'

      UNION

      SELECT COUNT(1) AS                                      totaldepositosxestacion,
             'PRIMAVERA'                                      estacion,
             100 * COUNT(1) / (SELECT COUNT(1) FROM deposito) porcentaje
      FROM deposito d2
             INNER JOIN articulo ar2 ON d2.nombre = ar2.nombre
      WHERE (TO_CHAR(d2.fecha, 'mm') = 12 AND TO_CHAR(d2.fecha, 'mm') <= 21)
         OR (TO_CHAR(d2.fecha, 'mm') = 9 AND TO_CHAR(d2.fecha, 'mm') >= 22)
         OR (TO_CHAR(d2.fecha, 'mm') = 10 OR TO_CHAR(d2.fecha, 'mm') = 11)


      GROUP BY 'PRIMAVERA') depositoestacion,
     (SELECT t2.nombrepunto, t2.nombre AS materialmásdepositado
      FROM (SELECT nombrepunto, MAX(cant) maxcant
            FROM (SELECT d7.nombrepunto, m7.nombre, COUNT(m7.nombre) cant
                  FROM material m7
                         INNER JOIN compuestopor cp7 ON m7.codigo = cp7.codigo
                         INNER JOIN articulo ar7 ON ar7.nombre = cp7.nombre
                         INNER JOIN deposito d7 ON d7.nombre = ar7.nombre
                         INNER JOIN puntolimpio pl7 ON pl7.nombrepunto = d7.nombrepunto
                  GROUP BY d7.nombrepunto, m7.nombre)
            GROUP BY nombrepunto)t1
             INNER JOIN (SELECT d7.nombrepunto, m7.nombre, COUNT(m7.nombre) cant
                         FROM material m7
                                INNER JOIN compuestopor cp7 ON m7.codigo = cp7.codigo
                                INNER JOIN articulo ar7 ON ar7.nombre = cp7.nombre
                                INNER JOIN deposito d7 ON d7.nombre = ar7.nombre
                                INNER JOIN puntolimpio pl7 ON pl7.nombrepunto = d7.nombrepunto
                         GROUP BY d7.nombrepunto, m7.nombre)t2
               ON t1.nombrepunto = t2.nombrepunto AND t1.maxcant = t2.cant) masdepo
WHERE estaciones.estacion = depositos.estacion
  AND totaldepositos.nombre = hora.nombrearticulo
  AND cant.nombrepunto = depositos.puntolimpio
  AND cant.nombrepunto = hora.nombrepunto
  AND totaldepositos.nombre = hora.nombrearticulo
  AND depositoestacion.estacion = estaciones.estacion
  AND masdepo.nombrepunto = hora.nombrepunto;

