--------------------------------------------------------
--  File created - Monday-November-19-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ARTICULO
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."ARTICULO" 
   (	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(100 BYTE), 
	"TIPOARTICULO" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMPUESTOPOR
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."COMPUESTOPOR" 
   (	"NOMBRE" VARCHAR2(100 BYTE), 
	"CODIGO" NUMBER(10,0), 
	"PORCENTAJE" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPOSITO
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."DEPOSITO" 
   (	"NOMBREPUNTO" VARCHAR2(100 BYTE), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"FECHA" DATE, 
	"HORA" NUMBER(4,0), 
	"PESOKG" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MATERIAL
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."MATERIAL" 
   (	"CODIGO" NUMBER(10,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"TIPOMATERIAL" VARCHAR2(12 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROCESO
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."PROCESO" 
   (	"CODIGO" NUMBER(10,0), 
	"DESCRIPCION" VARCHAR2(100 BYTE), 
	"CODPROCPARALELO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PUNTOLIMPIO
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."PUNTOLIMPIO" 
   (	"NOMBREPUNTO" VARCHAR2(100 BYTE), 
	"LATITUD" NUMBER(10,0), 
	"LONGITUD" NUMBER(10,0), 
	"SUPERFICIE" NUMBER(10,0), 
	"INTENDENCIA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECICLAJE
--------------------------------------------------------

  CREATE TABLE "FBERGERET"."RECICLAJE" 
   (	"NOMBRE" VARCHAR2(100 BYTE), 
	"CODIGO" NUMBER(10,0), 
	"ORDEN" NUMBER(10,0), 
	"TIEMPO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into FBERGERET.ARTICULO

Insert into FBERGERET.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Samsung algo','TV 43''''','Television');
Insert into FBERGERET.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('SamsungS6','Celular Samsung','Celular');
Insert into FBERGERET.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Iphone 5','Celular IPhone','Celular');
Insert into FBERGERET.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Dell Inspiron','Laptop Dell','Laptops');
REM INSERTING into FBERGERET.COMPUESTOPOR

REM INSERTING into FBERGERET.DEPOSITO

Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','Samsung algo',to_date('09/05/2018','DD/MM/YYYY'),1415,2.5);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','SamsungS6',to_date('05/11/2018','DD/MM/YYYY'),1000,4);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Iphone 5',to_date('22/02/2018','DD/MM/YYYY'),2300,4);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto2','Iphone 5',to_date('20/11/2018','DD/MM/YYYY'),2300,1);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Dell Inspiron',to_date('04/06/2018','DD/MM/YYYY'),1400,2.5);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','SamsungS6',to_date('04/07/2018','DD/MM/YYYY'),1000,3.5);
Insert into FBERGERET.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Samsung algo',to_date('22/02/2018','DD/MM/YYYY'),2300,4);
REM INSERTING into FBERGERET.MATERIAL

REM INSERTING into FBERGERET.PROCESO

REM INSERTING into FBERGERET.PUNTOLIMPIO

Insert into FBERGERET.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto1',213321,1535123,250,'Montevideo');
Insert into FBERGERET.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto2',231121,54431,300,'Canelones');
Insert into FBERGERET.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto3',32131,4533,275,'Montevideo');
Insert into FBERGERET.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto4',11111,22222,280,'Rocha');
REM INSERTING into FBERGERET.RECICLAJE

--------------------------------------------------------
--  DDL for Index ARTICULO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."ARTICULO_PK" ON "FBERGERET"."ARTICULO" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMPUESTOPOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."COMPUESTOPOR_PK" ON "FBERGERET"."COMPUESTOPOR" ("NOMBRE", "CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPOSITO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."DEPOSITO_PK" ON "FBERGERET"."DEPOSITO" ("NOMBREPUNTO", "NOMBRE", "FECHA", "HORA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MATERIAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."MATERIAL_PK" ON "FBERGERET"."MATERIAL" ("CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007046
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."SYS_C007046" ON "FBERGERET"."MATERIAL" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROCESO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."PROCESO_PK" ON "FBERGERET"."PROCESO" ("CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PUNTOLIMPIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."PUNTOLIMPIO_PK" ON "FBERGERET"."PUNTOLIMPIO" ("NOMBREPUNTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PUNTOLIMPIO_AK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."PUNTOLIMPIO_AK" ON "FBERGERET"."PUNTOLIMPIO" ("LATITUD", "LONGITUD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECICLAJE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FBERGERET"."RECICLAJE_PK" ON "FBERGERET"."RECICLAJE" ("NOMBRE", "CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARTICULO
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."ARTICULO" ADD CONSTRAINT "ARTICULO_PK" PRIMARY KEY ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."ARTICULO" ADD CONSTRAINT "ARTICULO_TIPO" CHECK (TIPOARTICULO IN ('Celular', 'Television', 'Laptops')) ENABLE;
  ALTER TABLE "FBERGERET"."ARTICULO" MODIFY ("TIPOARTICULO" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."ARTICULO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."ARTICULO" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPUESTOPOR
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."COMPUESTOPOR" ADD CONSTRAINT "COMPUESTOPOR_PK" PRIMARY KEY ("NOMBRE", "CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."COMPUESTOPOR" MODIFY ("PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."COMPUESTOPOR" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."COMPUESTOPOR" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPOSITO
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."DEPOSITO" ADD CONSTRAINT "DEPOSITO_PK" PRIMARY KEY ("NOMBREPUNTO", "NOMBRE", "FECHA", "HORA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."DEPOSITO" MODIFY ("PESOKG" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."DEPOSITO" MODIFY ("HORA" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."DEPOSITO" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."DEPOSITO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."DEPOSITO" MODIFY ("NOMBREPUNTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MATERIAL
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."MATERIAL" ADD UNIQUE ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."MATERIAL" ADD CONSTRAINT "MATERIAL_PK" PRIMARY KEY ("CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."MATERIAL" ADD CONSTRAINT "MATERIAL_TIPO" CHECK (TIPOMATERIAL IN ('Aprovechable', 'Contaminante')) ENABLE;
  ALTER TABLE "FBERGERET"."MATERIAL" MODIFY ("TIPOMATERIAL" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."MATERIAL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."MATERIAL" MODIFY ("CODIGO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROCESO
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."PROCESO" ADD CONSTRAINT "PROCESO_PK" PRIMARY KEY ("CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."PROCESO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."PROCESO" MODIFY ("CODIGO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PUNTOLIMPIO
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" ADD CONSTRAINT "PUNTOLIMPIO_AK" UNIQUE ("LATITUD", "LONGITUD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" ADD CONSTRAINT "PUNTOLIMPIO_PK" PRIMARY KEY ("NOMBREPUNTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" MODIFY ("INTENDENCIA" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" MODIFY ("SUPERFICIE" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" MODIFY ("LONGITUD" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" MODIFY ("LATITUD" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."PUNTOLIMPIO" MODIFY ("NOMBREPUNTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECICLAJE
--------------------------------------------------------

  ALTER TABLE "FBERGERET"."RECICLAJE" ADD CONSTRAINT "RECICLAJE_PK" PRIMARY KEY ("NOMBRE", "CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FBERGERET"."RECICLAJE" MODIFY ("TIEMPO" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."RECICLAJE" MODIFY ("ORDEN" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."RECICLAJE" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "FBERGERET"."RECICLAJE" MODIFY ("NOMBRE" NOT NULL ENABLE);
