-- 1) Obtener la latitud y la longitud de los puntos limpios donde se depositaron artículos con el mayor peso,
-- considerando los artículos de tipo celular.
-- Si hay más de un punto limpio que cumple las condiciones, mostrarlos a todos.

SELECT pl.latitud, pl.longitud
FROM (deposito d
	INNER JOIN puntolimpio pl
	ON pl.nombrepunto = d.nombrepunto)
			 INNER JOIN articulo art ON art.nombre = d.nombre
WHERE art.tipoarticulo = 'Celular'
	AND d.pesokg = (SELECT MAX(pesokg) FROM deposito);