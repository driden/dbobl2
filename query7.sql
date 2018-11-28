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
