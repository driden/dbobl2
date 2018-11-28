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