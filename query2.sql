-- 2) Obtener los puntos limpios de Montevideo y Canelones donde se depositaron artículos de tipo laptop o televisores,
-- pero no ambos tipos. Tener en cuenta solo los depósitos de 2 a 5 kilos.

SELECT DISTINCT pl.nombrepunto
FROM deposito d
       INNER JOIN puntolimpio pl ON d.nombrepunto = pl.nombrepunto
       INNER JOIN articulo art ON art.nombre = d.nombre
WHERE d.pesokg BETWEEN 2 AND 500
  AND pl.intendencia IN ('Montevideo', 'Canelones')
  AND 1 = (SELECT COUNT(a1.tipoarticulo)
           FROM deposito d1
                  INNER JOIN articulo a1 ON d1.nombre = a1.nombre
           WHERE a1.tipoarticulo IN ('Television', 'Laptops')
             AND d1.nombrepunto = d.nombrepunto -- IMPORTANTE: Necesito usar el mismo deposito que por el que joineo
           GROUP BY d1.nombrepunto);