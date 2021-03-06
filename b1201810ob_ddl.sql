ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
DROP TABLE RECICLAJE;
DROP TABLE PROCESO;
DROP TABLE DEPOSITO;
DROP TABLE PUNTOLIMPIO;
DROP TABLE COMPUESTOPOR;
DROP TABLE MATERIAL;
DROP TABLE ARTICULO;

CREATE TABLE ARTICULO( 
NOMBRE VARCHAR2(100) NOT NULL CONSTRAINT ARTICULO_pk PRIMARY KEY, 
DESCRIPCION VARCHAR2(100) NOT NULL, 
TIPOARTICULO VARCHAR2(10) NOT NULL CONSTRAINT ARTICULO_TIPO CHECK (TIPOARTICULO IN ('Celular', 'Television', 'Laptops')));

CREATE TABLE MATERIAL( 
CODIGO NUMBER(10) NOT NULL CONSTRAINT MATERIAL_pk PRIMARY KEY, 
NOMBRE VARCHAR2(100) UNIQUE NOT NULL,
TIPOMATERIAL VARCHAR2(12) NOT NULL CONSTRAINT MATERIAL_TIPO CHECK (TIPOMATERIAL IN ('Aprovechable', 'Contaminante'))); 

CREATE TABLE COMPUESTOPOR( 
NOMBRE VARCHAR2(100) NOT NULL CONSTRAINT COMPOR_TO_ART_FK REFERENCES ARTICULO,
CODIGO NUMBER(10) NOT NULL CONSTRAINT COMPOR_TO_MATERIAL_FK REFERENCES MATERIAL, 
PORCENTAJE NUMBER(3) NOT NULL, 
CONSTRAINT COMPUESTOPOR_Pk PRIMARY KEY(NOMBRE, CODIGO)); 

CREATE TABLE PUNTOLIMPIO( 
NOMBREPUNTO VARCHAR2(100) NOT NULL CONSTRAINT PUNTOLIMPIO_pk PRIMARY KEY,
LATITUD NUMBER(10) NOT NULL,
LONGITUD NUMBER(10) NOT NULL,
SUPERFICIE NUMBER(10) NOT NULL,
INTENDENCIA VARCHAR2(100) NOT NULL,
CONSTRAINT PUNTOLIMPIO_Ak UNIQUE(LATITUD, LONGITUD)); 

CREATE TABLE DEPOSITO( 
NOMBREPUNTO VARCHAR2(100) NOT NULL CONSTRAINT DEPOSITO_TO_PUNTOLIMPIO_FK REFERENCES PUNTOLIMPIO,
NOMBRE VARCHAR2(100) NOT NULL CONSTRAINT DEPOSITO_TO_ART_FK REFERENCES ARTICULO,
FECHA DATE NOT NULL,
HORA NUMBER(4) NOT NULL,
PESOKG FLOAT NOT NULL,
CONSTRAINT DEPOSITO_Pk PRIMARY KEY(NOMBREPUNTO, NOMBRE, FECHA, HORA)); 

CREATE TABLE PROCESO( 
CODIGO NUMBER(10) NOT NULL CONSTRAINT PROCESO_pk PRIMARY KEY, 
DESCRIPCION VARCHAR2(100) NOT NULL,
CODPROCPARALELO NUMBER(10)); 

CREATE TABLE RECICLAJE( 
NOMBRE VARCHAR2(100) NOT NULL CONSTRAINT RECICLAJE_TO_ART_FK REFERENCES ARTICULO,
CODIGO NUMBER(10) NOT NULL CONSTRAINT RECICLAJE_TO_PROCESO_FK REFERENCES PROCESO, 
ORDEN NUMBER(10) NOT NULL,
TIEMPO NUMBER(10) NOT NULL,
CONSTRAINT RECICLAJE_Pk PRIMARY KEY(NOMBRE, CODIGO));
