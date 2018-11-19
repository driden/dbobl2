--------------------------------------------------------
--  File created - Monday-November-19-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ARTICULO
--------------------------------------------------------

  CREATE TABLE "NACHO"."ARTICULO" 
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

  CREATE TABLE "NACHO"."COMPUESTOPOR" 
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

  CREATE TABLE "NACHO"."DEPOSITO" 
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

  CREATE TABLE "NACHO"."MATERIAL" 
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

  CREATE TABLE "NACHO"."PROCESO" 
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

  CREATE TABLE "NACHO"."PUNTOLIMPIO" 
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

  CREATE TABLE "NACHO"."RECICLAJE" 
   (	"NOMBRE" VARCHAR2(100 BYTE), 
	"CODIGO" NUMBER(10,0), 
	"ORDEN" NUMBER(10,0), 
	"TIEMPO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into NACHO.ARTICULO
SET DEFINE OFF;
Insert into NACHO.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Samsung algo','TV 43''''','Television');
Insert into NACHO.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('SamsungS6','Celular Samsung','Celular');
Insert into NACHO.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Iphone 5','Celular IPhone','Celular');
Insert into NACHO.ARTICULO (NOMBRE,DESCRIPCION,TIPOARTICULO) values ('Dell Inspiron','Laptop Dell','Laptops');
REM INSERTING into NACHO.COMPUESTOPOR
SET DEFINE OFF;
REM INSERTING into NACHO.DEPOSITO
SET DEFINE OFF;
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','Samsung algo',to_date('09/05/2018','DD/MM/YYYY'),1415,2.5);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto1','SamsungS6',to_date('05/11/2018','DD/MM/YYYY'),1000,4);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Iphone 5',to_date('22/02/2018','DD/MM/YYYY'),2300,4);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto2','Iphone 5',to_date('20/11/2018','DD/MM/YYYY'),2300,1);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Dell Inspiron',to_date('04/06/2018','DD/MM/YYYY'),1400,2.5);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','SamsungS6',to_date('04/07/2018','DD/MM/YYYY'),1000,3.5);
Insert into NACHO.DEPOSITO (NOMBREPUNTO,NOMBRE,FECHA,HORA,PESOKG) values ('punto3','Samsung algo',to_date('22/02/2018','DD/MM/YYYY'),2300,4);
REM INSERTING into NACHO.MATERIAL
SET DEFINE OFF;
REM INSERTING into NACHO.PROCESO
SET DEFINE OFF;
REM INSERTING into NACHO.PUNTOLIMPIO
SET DEFINE OFF;
Insert into NACHO.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto1',213321,1535123,250,'Montevideo');
Insert into NACHO.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto2',231121,54431,300,'Canelones');
Insert into NACHO.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto3',32131,4533,275,'Montevideo');
Insert into NACHO.PUNTOLIMPIO (NOMBREPUNTO,LATITUD,LONGITUD,SUPERFICIE,INTENDENCIA) values ('punto4',11111,22222,280,'Rocha');
REM INSERTING into NACHO.RECICLAJE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ARTICULO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."ARTICULO_PK" ON "NACHO"."ARTICULO" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMPUESTOPOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."COMPUESTOPOR_PK" ON "NACHO"."COMPUESTOPOR" ("NOMBRE", "CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPOSITO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."DEPOSITO_PK" ON "NACHO"."DEPOSITO" ("NOMBREPUNTO", "NOMBRE", "FECHA", "HORA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MATERIAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."MATERIAL_PK" ON "NACHO"."MATERIAL" ("CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007046
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."SYS_C007046" ON "NACHO"."MATERIAL" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROCESO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."PROCESO_PK" ON "NACHO"."PROCESO" ("CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PUNTOLIMPIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."PUNTOLIMPIO_PK" ON "NACHO"."PUNTOLIMPIO" ("NOMBREPUNTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PUNTOLIMPIO_AK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."PUNTOLIMPIO_AK" ON "NACHO"."PUNTOLIMPIO" ("LATITUD", "LONGITUD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECICLAJE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NACHO"."RECICLAJE_PK" ON "NACHO"."RECICLAJE" ("NOMBRE", "CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARTICULO
--------------------------------------------------------

  ALTER TABLE "NACHO"."ARTICULO" ADD CONSTRAINT "ARTICULO_PK" PRIMARY KEY ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."ARTICULO" ADD CONSTRAINT "ARTICULO_TIPO" CHECK (TIPOARTICULO IN ('Celular', 'Television', 'Laptops')) ENABLE;
  ALTER TABLE "NACHO"."ARTICULO" MODIFY ("TIPOARTICULO" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."ARTICULO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."ARTICULO" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPUESTOPOR
--------------------------------------------------------

  ALTER TABLE "NACHO"."COMPUESTOPOR" ADD CONSTRAINT "COMPUESTOPOR_PK" PRIMARY KEY ("NOMBRE", "CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."COMPUESTOPOR" MODIFY ("PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."COMPUESTOPOR" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."COMPUESTOPOR" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPOSITO
--------------------------------------------------------

  ALTER TABLE "NACHO"."DEPOSITO" ADD CONSTRAINT "DEPOSITO_PK" PRIMARY KEY ("NOMBREPUNTO", "NOMBRE", "FECHA", "HORA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."DEPOSITO" MODIFY ("PESOKG" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."DEPOSITO" MODIFY ("HORA" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."DEPOSITO" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."DEPOSITO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."DEPOSITO" MODIFY ("NOMBREPUNTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MATERIAL
--------------------------------------------------------

  ALTER TABLE "NACHO"."MATERIAL" ADD UNIQUE ("NOMBRE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."MATERIAL" ADD CONSTRAINT "MATERIAL_PK" PRIMARY KEY ("CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."MATERIAL" ADD CONSTRAINT "MATERIAL_TIPO" CHECK (TIPOMATERIAL IN ('Aprovechable', 'Contaminante')) ENABLE;
  ALTER TABLE "NACHO"."MATERIAL" MODIFY ("TIPOMATERIAL" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."MATERIAL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."MATERIAL" MODIFY ("CODIGO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROCESO
--------------------------------------------------------

  ALTER TABLE "NACHO"."PROCESO" ADD CONSTRAINT "PROCESO_PK" PRIMARY KEY ("CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."PROCESO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."PROCESO" MODIFY ("CODIGO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PUNTOLIMPIO
--------------------------------------------------------

  ALTER TABLE "NACHO"."PUNTOLIMPIO" ADD CONSTRAINT "PUNTOLIMPIO_AK" UNIQUE ("LATITUD", "LONGITUD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."PUNTOLIMPIO" ADD CONSTRAINT "PUNTOLIMPIO_PK" PRIMARY KEY ("NOMBREPUNTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."PUNTOLIMPIO" MODIFY ("INTENDENCIA" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."PUNTOLIMPIO" MODIFY ("SUPERFICIE" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."PUNTOLIMPIO" MODIFY ("LONGITUD" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."PUNTOLIMPIO" MODIFY ("LATITUD" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."PUNTOLIMPIO" MODIFY ("NOMBREPUNTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECICLAJE
--------------------------------------------------------

  ALTER TABLE "NACHO"."RECICLAJE" ADD CONSTRAINT "RECICLAJE_PK" PRIMARY KEY ("NOMBRE", "CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "NACHO"."RECICLAJE" MODIFY ("TIEMPO" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."RECICLAJE" MODIFY ("ORDEN" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."RECICLAJE" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "NACHO"."RECICLAJE" MODIFY ("NOMBRE" NOT NULL ENABLE);
