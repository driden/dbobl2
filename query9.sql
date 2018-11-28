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
                                            WHERE TO_CHAR(d2.FECHA,'mm') >= 5 
                                            AND TO_CHAR(d2.FECHA,'mm') <= 8
                                            AND TO_CHAR(d2.FECHA,'yyyy') = 2018
                                            GROUP BY d2.nombre
                                            HAVING COUNT(d2.nombre) = (
                                                    --Menor cantidad depositos entre mayo y agosto 2018
                                                    SELECT MIN(COUNT(1)) menorCantidad
                                                    FROM ARTICULO ar1
                                                    INNER JOIN DEPOSITO d1
                                                    ON ar1.nombre = d1.nombre
                                                    WHERE TO_CHAR(d1.FECHA,'mm') >= 5 
                                                    AND TO_CHAR(d1.FECHA,'mm') <= 8
                                                    AND TO_CHAR(d1.FECHA,'yyyy') = 2018
                                                    GROUP BY ar1.nombre 
                                            ))
            
                                        )

);
