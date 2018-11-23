Insert into ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Samsung algo','TV 43','Television');
Insert into ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('SamsungS6','Celular Samsung','Celular');
Insert into ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Iphone 5','Celular IPhone','Celular');
Insert into ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Dell Inspiron','Laptop Dell','Laptops');

Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','Samsung algo',to_date('09/05/2018','DD/MM/YYYY'),1415,2.5);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','SamsungS6',to_date('05/11/2018','DD/MM/YYYY'),1000,4);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Iphone 5',to_date('22/02/2018','DD/MM/YYYY'),2300,4);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto2','Iphone 5',to_date('20/11/2018','DD/MM/YYYY'),2300,1);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Dell Inspiron',to_date('04/06/2018','DD/MM/YYYY'),1400,2.5);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','SamsungS6',to_date('04/07/2018','DD/MM/YYYY'),1000,3.5);
Insert into DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Samsung algo',to_date('22/02/2018','DD/MM/YYYY'),2300,4);

Insert into PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto1',213321,1535123,250,'Montevideo');
Insert into PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto2',231121,54431,300,'Canelones');
Insert into PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto3',32131,4533,275,'Montevideo');
Insert into PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto4',11111,22222,280,'Rocha');

Insert into Material values (1,'Cobre','Aprovechable');
Insert into Material values (2,'Platino','Aprovechable');
Insert into Material values (3,'Hierro','Aprovechable');
Insert into Material values (4,'Litio','Aprovechable');
Insert into Material values (5,'Vidrio','Aprovechable');
Insert into Material values (6,'Acero','Aprovechable');
Insert into Material values (7,'Uranio','Contaminante');
Insert into Material values (8,'Plutonio','Contaminante');
Insert into Material values (9,'Nylon','Contaminante');

Insert into CompuestoPor values ('SamsungS6',1,15);
Insert into CompuestoPor values ('SamsungS6',3,25);
Insert into CompuestoPor values ('SamsungS6',7,55);

Insert into CompuestoPor values ('Iphone 5',1,10);
Insert into CompuestoPor values ('Iphone 5',2,15);
Insert into CompuestoPor values ('Iphone 5',3,5);
Insert into CompuestoPor values ('Iphone 5',6,65);

Insert into CompuestoPor values ('Samsung algo',7,60);
Insert into CompuestoPor values ('Samsung algo',1,30);
Insert into CompuestoPor values ('Samsung algo',2,10);

Insert into PROCESO VALUES (1,'desc1',3);
Insert into PROCESO VALUES (2,'desc2',3);
Insert into PROCESO VALUES (3,'desc3',1);
Insert into PROCESO VALUES (4,'desc4',null);
Insert into PROCESO VALUES (5,'desc5',6);
Insert into PROCESO VALUES (6,'desc6',5);
Insert into PROCESO VALUES (7,'desc7',null);
Insert into PROCESO VALUES (8,'desc8',9);
Insert into PROCESO VALUES (9,'desc9',10);
Insert into PROCESO VALUES (10,'desc10',8);

INSERT INTO RECICLAJE VALUES ('Iphone 5',1,1,65);
INSERT INTO RECICLAJE VALUES ('Iphone 5',2,1,65);
INSERT INTO RECICLAJE VALUES ('Iphone 5',3,1,25);
INSERT INTO RECICLAJE VALUES ('Iphone 5',8,2,25);
INSERT INTO RECICLAJE VALUES ('Iphone 5',7,3,40);
INSERT INTO RECICLAJE VALUES ('Iphone 5',4,4,40);
INSERT INTO RECICLAJE VALUES ('Iphone 5',9,5,25);
INSERT INTO RECICLAJE VALUES ('Iphone 5',5,6,40);
INSERT INTO RECICLAJE VALUES ('Iphone 5',6,6,40);

INSERT INTO RECICLAJE VALUES ('SamsungS6',6,1,40);
INSERT INTO RECICLAJE VALUES ('SamsungS6',2,2,50);
INSERT INTO RECICLAJE VALUES ('SamsungS6',3,2,40);