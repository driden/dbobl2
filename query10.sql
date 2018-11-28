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
