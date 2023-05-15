CREATE TABLE USUARIO (
Codigo NUMBER(8) PRIMARY KEY,
Nombre_completo VARCHAR2(50) NOT NULL,
Fecha_nacimiento DATE,
Contrase�a VARCHAR2(30) NOT NULL,
Email VARCHAR2(50) UNIQUE NOT NULL,
Foto VARCHAR2(300),
Telefono NUMBER(9) NOT NULL,
Tipo VARCHAR2(20) CHECK (Tipo IN ('CLIENTE','ADMINISTRADOR')),
Ultima_conexion DATE
);

CREATE TABLE MARCA (
Nombre VARCHAR2(20) PRIMARY KEY
);


CREATE TABLE CATEGORIA (
Nombre VARCHAR2(20) PRIMARY KEY
);

CREATE TABLE ARTICULO (
Codigo NUMBER(8) PRIMARY KEY,
Pvp NUMBER (6,2) NOT NULL,
Nombre VARCHAR2(30) NOT NULL,
Descripcion VARCHAR2(200) NOT NULL,
Foto VARCHAR2(300),
Cantidad NUMBER(4) NOT NULL,
Marca VARCHAR2(20),
Creador NUMBER(8),
Modificador NUMBER(8),
Tipo VARCHAR2(20) CHECK (Tipo IN ('Alimentacion','Bebida','Dulces_Snacks','Postres','Caja_Sorpresa')),
CONSTRAINT fk_marca FOREIGN KEY (Marca) REFERENCES MARCA,
CONSTRAINT fk_admin FOREIGN KEY (Creador) REFERENCES USUARIO,
CONSTRAINT fk_admin2 FOREIGN KEY (Modificador) REFERENCES USUARIO
);


CREATE TABLE TARJETA (
Codigo NUMBER(8) PRIMARY KEY
);

CREATE TABLE CESTA (
Nombre VARCHAR2(30),
Cliente NUMBER(8),
CONSTRAINT fk_cli1 FOREIGN KEY (Cliente) REFERENCES USUARIO,
PRIMARY KEY (Nombre,Cliente)
);

CREATE TABLE DIRECCION (
Codigo NUMBER(8) PRIMARY KEY,
Provincia VARCHAR2(30),
CP NUMBER(5) NOT NULL,
Tipo VARCHAR2(20) NOT NULL,
Direccion VARCHAR2(50) NOT NULL,
Cliente NUMBER(8) NOT NULL,
CONSTRAINT fk_cli2 FOREIGN KEY (Cliente) REFERENCES USUARIO
);

CREATE TABLE TARJETAS_VINCULADAS (
Cliente NUMBER(8),
Tarjeta NUMBER(8),
CONSTRAINT fk_cli3 FOREIGN KEY (Cliente) REFERENCES USUARIO,
CONSTRAINT fk_tarj1 FOREIGN KEY (Tarjeta) REFERENCES TARJETA,
PRIMARY KEY (Cliente,Tarjeta)
);

CREATE TABLE ARTICULO_A_CESTA (
Articulo NUMBER(8),
Cesta VARCHAR2(20),
Cliente NUMBER(8),
Precio NUMBER(6,2) NOT NULL,
Cantidad NUMBER(4) NOT NULL,
CONSTRAINT fk_arti1 FOREIGN KEY (Articulo) REFERENCES ARTICULO,
CONSTRAINT fk_cesta1 FOREIGN KEY (Cesta,Cliente) REFERENCES CESTA,
PRIMARY KEY (Articulo,Cesta,Cliente)
);

CREATE TABLE CATEGORIA_DE_ARTICULO (
Categoria VARCHAR2(20),
Articulo NUMBER(8),
CONSTRAINT fk_cat1 FOREIGN KEY (Categoria) REFERENCES CATEGORIA,
CONSTRAINT fk_arti2 FOREIGN KEY (Articulo) REFERENCES ARTICULO,
PRIMARY KEY (Categoria,Articulo)
);

CREATE TABLE PEDIDO (
Codigo NUMBER(8) PRIMARY KEY,
Fecha DATE NOT NULL,
Cesta VARCHAR2(20),
Cliente NUMBER(8),
Direccion NUMBER(8) NOT NULL,
CONSTRAINT fk_cesta2 FOREIGN KEY (Cesta,Cliente) REFERENCES CESTA,
CONSTRAINT fk_direc1 FOREIGN KEY (Direccion) REFERENCES DIRECCION
);

CREATE TABLE FACTURA (
Codigo NUMBER(8) PRIMARY KEY,
Fecha DATE NOT NULL,
Direccion NUMBER(8) NOT NULL,
Pedido NUMBER(8) UNIQUE NOT NULL,
CONSTRAINT fk_direc FOREIGN KEY (Direccion) REFERENCES DIRECCION,
CONSTRAINT fk_pedido FOREIGN KEY (Pedido) REFERENCES PEDIDO
);

ALTER TABLE PEDIDO ADD (CONSTRAINT fecha CHECK (Fecha > TO_DATE ('11/02/2023','DD/MM/YYYY')));
ALTER TABLE ARTICULO_A_CESTA ADD (CONSTRAINT canti_art_a_cest CHECK (Cantidad BETWEEN 0 AND 9999));


DROP TABLE FACTURA;
DROP TABLE PEDIDO;
DROP TABLE CATEGORIA_DE_ARTICULO;
DROP TABLE ARTICULO_A_CESTA;
DROP TABLE TARJETAS_VINCULADAS;
DROP TABLE DIRECCION;
DROP TABLE CESTA;
DROP TABLE TARJETA;
DROP TABLE ARTICULO;
DROP TABLE CATEGORIA;
DROP TABLE MARCA;
DROP TABLE USUARIO;
