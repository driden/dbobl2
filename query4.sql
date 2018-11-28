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