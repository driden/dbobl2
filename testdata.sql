Insert into ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Samsung algo','TV 43''''','Television');
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