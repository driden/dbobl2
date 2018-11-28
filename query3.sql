-- 3) Obtener el código y el nombre de los materiales que SOLO están presentes
-- en la composición de celulares con un porcentaje mayor a 50%.
SELECT m.codigo, m.nombre
FROM compuestopor c
       INNER JOIN material m ON c.codigo = m.codigo
       INNER JOIN articulo a ON a.nombre = c.nombre
WHERE c.porcentaje > 50
  AND a.tipoarticulo = 'Celular'
  AND c.codigo NOT IN (SELECT mat.codigo
                       FROM material mat
                              INNER JOIN compuestopor cp ON mat.codigo = cp.codigo
                              INNER JOIN articulo art ON cp.nombre = art.nombre
                       WHERE art.tipoarticulo <> 'Celular');
