INSERT INTO USUARIO VALUES (98877655,'Jose Raúl Herrero Alarcón',TO_DATE('02/09/2000','DD/MM/YYYY'),'1234567890','joseraulherrero.alu@iespacomolla.es','',722677706,'ADMINISTRADOR','');
INSERT INTO USUARIO VALUES (28877655,'Samuel Hernández Pérez',TO_DATE('07/02/2002','DD/MM/YYYY'),'0987654321','samuelhernandez.alu@iespacomolla.es','',655897412,'ADMINISTRADOR','');
INSERT INTO USUARIO VALUES (48877655,'Paco Díaz López',TO_DATE('01/03/2001','DD/MM/YYYY'),'1122334455','paco.alu@gmail.es','',689552147,'CLIENTE','');
INSERT INTO USUARIO VALUES (88877655,'Jose Rico Matínez',TO_DATE('01/12/1998','DD/MM/YYYY'),'5544332211','pepe.alu@gmail.es','',744589663,'CLIENTE','');
INSERT INTO USUARIO VALUES (55443223,'Daniel Rico Matínez',TO_DATE('01/12/1998','DD/MM/YYYY'),'holabuenastardes','dani.alu@gmail.es','',644120558,'CLIENTE','');
INSERT INTO USUARIO VALUES (11111111,'Cliente',TO_DATE('07/02/2002','DD/MM/YYYY'),'cliente','cliente','',655897412,'CLIENTE','');
INSERT INTO USUARIO VALUES (22222222,'Administrador',TO_DATE('07/02/2002','DD/MM/YYYY'),'admin','admin','',655897412,'ADMINISTRADOR','');

INSERT INTO CATEGORIA VALUES ('Japon');
INSERT INTO CATEGORIA VALUES ('China');
INSERT INTO CATEGORIA VALUES ('Taiwan');
INSERT INTO CATEGORIA VALUES ('Té');
INSERT INTO CATEGORIA VALUES ('Licor');
INSERT INTO CATEGORIA VALUES ('Refresco');


INSERT INTO TARJETA VALUES (97784231);
INSERT INTO TARJETA VALUES (55771946);
INSERT INTO TARJETA VALUES (52846791);
INSERT INTO TARJETA VALUES (48891103);

INSERT INTO CESTA VALUES ('Cesta1paco',48877655);
INSERT INTO CESTA VALUES ('Cesta2paco',48877655);
INSERT INTO CESTA VALUES ('Cesta1jose',88877655);

INSERT INTO DIRECCION VALUES (22855215,'Alicante',03600,'Calle','Río Miño 12',28877655);
INSERT INTO DIRECCION VALUES (44855215,'Barcelona',08001,'Calle','Colón 12',88877655);
INSERT INTO DIRECCION VALUES (11855215,'Madrid',28001,'Calle','Astorga 10',48877655);


INSERT INTO TARJETAS_VINCULADAS VALUES (48877655,97784231);
INSERT INTO TARJETAS_VINCULADAS VALUES (88877655,55771946);
INSERT INTO TARJETAS_VINCULADAS VALUES (55443223,48891103);
/*
INSERT INTO ARTICULO_A_CESTA  VALUES (78865565,'Cesta1paco',48877655,4.35,3);
INSERT INTO ARTICULO_A_CESTA  VALUES (55884411,'Cesta2paco',48877655,4.65,5);
INSERT INTO ARTICULO_A_CESTA  VALUES (99663377,'Cesta1jose',88877655,4.35,2);

INSERT INTO CATEGORIA_DE_ARTICULO   VALUES ('China',78865565);
INSERT INTO CATEGORIA_DE_ARTICULO   VALUES ('Japon',55884411);
INSERT INTO CATEGORIA_DE_ARTICULO   VALUES ('China',99663377);
*/
INSERT INTO PEDIDO VALUES (15975346,TO_DATE('18/02/2023','DD/MM/YYYY'),'Cesta1paco',48877655,11855215);
INSERT INTO PEDIDO VALUES (25814796,TO_DATE('19/02/2023','DD/MM/YYYY'),'Cesta2paco',48877655,11855215);
INSERT INTO PEDIDO VALUES (45612389,TO_DATE('27/02/2023','DD/MM/YYYY'),'Cesta1jose',88877655,44855215);

INSERT INTO FACTURA VALUES (15735984,TO_DATE('18/02/2023','DD/MM/YYYY'),11855215,15975346);
INSERT INTO FACTURA VALUES (41526398,TO_DATE('19/02/2023','DD/MM/YYYY'),11855215,25814796);
INSERT INTO FACTURA VALUES (74859621,TO_DATE('27/02/2023','DD/MM/YYYY'),44855215,45612389);

UPDATE DIRECCION SET CP=28002 WHERE Codigo=11855215;
UPDATE USUARIO SET Email='daniel.alu@gmail.com' WHERE Codigo=55443223;
UPDATE CATEGORIA SET Nombre='Cerveza' WHERE Nombre='Licor';

DELETE FROM CATEGORIA WHERE Nombre='Refresco';
DELETE FROM MARCA WHERE Nombre='Kit Kat';

INSERT INTO MARCA VALUES ('Energy');
INSERT INTO ARTICULO VALUES(00000001,3.99,'Bebida Energética Godzilla Energy II','Te traemos pura energía japonesa. La bebida energética oficial de “Godzilla”, con un diseño espectacular en el que también aparece su enemigo “Destoroyah". Contiene 210 mg de cafeína y 680 mg de arginina por lata y un espectacular color naranja.','./img/ProyectoGodzilla.png',1,'Energy',98877655,98877655,'Bebida');
INSERT INTO MARCA VALUES ('Fanta');
INSERT INTO ARTICULO VALUES(00000002,1.79,'Fanta Exotic | Maracuyá, Melocotón y Naranja','Fanta de maracuyá, melocotón y naranja. Disfruta de esta increíble y refrescante combinación de frutas, ¡ahora sin azúcar!','./img/ProyectoFanta.png',1,'Fanta',98877655,98877655,'Bebida');
INSERT INTO MARCA VALUES ('Matsuri');
INSERT INTO ARTICULO VALUES(00000003,2.69,'Soda Ramune Ichigo | Edición Matsuri Kawaii','La soda Ramune, es un icono en Japón y es consumida generalmente en los festivales tradicionales japoneses. Un refresco muy diferente. ¡Pruébala! ¡Te encantará!','./img/ProyectoSoda.png',1,'Matsuri',98877655,98877655,'Bebida');
INSERT INTO MARCA VALUES ('Coedo');
INSERT INTO ARTICULO VALUES(00000004,7.99,'Cerveza Artesana Coedo Ruri | Cielo Claro','Cerveza japonesa Premium de la variedad pilsner premium, de claridad cristalina, color dorado de sabor suave que combina bien con casi cualquier plato. Su delicado equilibrio de sabor y amargor lupulado es ligero en el paladar y persistentemente placentero.','./img/ProyectoCerveza.png',1,'Coedo',98877655,98877655,'Bebida');
INSERT INTO MARCA VALUES ('Doutor');
INSERT INTO ARTICULO VALUES(00000005,3.99,'Café Black Frío Doutor | Jujutsu Kaisen','Te presentamos un café elaborado con una mezcla única de café negro y granos frescos, cuidadosamente tostados con fuego directo para mantener todo el aroma. ','./img/ProyectoCafe.png',1,'Doutor',98877655,98877655,'Bebida');
INSERT INTO MARCA VALUES ('Kirin The Strong');
INSERT INTO ARTICULO VALUES(00000006,2.99,'Combinado con Yogur estilo Calpis','Refrescante combinado con licor japonés sabor Yogur, estilo Calpis, con Vodka. Sin Azúcar. Grado alcohólico 9% vol.','./img/ProyectoYogurt.png',1,'Kirin The Strong',98877655,98877655,'Bebida');

INSERT INTO MARCA VALUES ('Sautao');
INSERT INTO ARTICULO VALUES(00000011,5.18,'3 Raciones Tallarines Frescos Tan Tan','Los fideos frescos Tan Tan son una variante de los tradicionales fideos Tan Tan que se caracterizan por estar hechos con una masa fresca en lugar de fideos secos. A diferencia de los fideos secos que se pueden encontrar en paquetes, los fideos frescos Tan Tan son preparados a mano o comercialmente en lugares donde se producen fideos frescos.','./img/ProyectoTallarines.png',1,'Sautao',98877655,98877655,'Alimentacion');
INSERT INTO MARCA VALUES ('Kaludon');
INSERT INTO ARTICULO VALUES(00000012,5.27,'Fideos Kaludon con Setas Shiitake','Udon frescos elaborados con sopa y setas shiitake, cebolleta, algas pardas, rábano y guindilla. Receta Tradicional de los puestos callejeros coreanos.','./img/ProyectoFideos.png',1,'Kaludon',98877655,98877655,'Alimentacion');
INSERT INTO MARCA VALUES ('Allgro');
INSERT INTO ARTICULO VALUES(00000013,3.38,'Alga Nori Coreana Premium Gold para Sushi','Alga nori de variedad coreana, sabor intenso y muy sabrosa. Nori es un término japonés usado para referirse a variedades comestibles de alga marina de las diversas especies de alga roja Porphyra.','./img/ProyectoAlga.png',10,'Allgro',98877655,98877655,'Alimentacion');
INSERT INTO MARCA VALUES ('Otafuku');
INSERT INTO ARTICULO VALUES(00000014,8.09,'Preparado de Harina para Okonomiyaki con Kombu','Harina para Okonomiyaki, elaborada con bonito y dos tipos de alga kombu, Hokkaido y Konan konbu dulce se mezclan para resaltar el sabor del Okonomiyaki.','./img/ProyectoHarina.png',1,'Otafuku',98877655,98877655,'Alimentacion');
INSERT INTO MARCA VALUES ('Shih Chuan');
INSERT INTO ARTICULO VALUES(00000015,5.90,'Miso Blanco Molido Grueso','Delicioso Miso blanco elaborado siguiendo la receta de Shih Chuan. Es un miso blanco algo menos dulce, muy apropiado para cocinar diferentes platos, como guisos y ozoni.','./img/ProyectoMiso.png',1,'Shih Chuan',98877655,98877655,'Alimentacion');
INSERT INTO MARCA VALUES ('Tilda');
INSERT INTO ARTICULO VALUES(00000016,3.92,'Arroz Basmati Preparado con Coco, Chili y Citronela','Delicioso plato preparado de arroz Basmati, elaborado con la cremosidad de la salsa de coco, salsa de coco, cilantro y un ligero toque de curry dulzón. Combínalo con langostinos o cualquier marisco o un filete de salmón en salsa Teriyaki.','./img/ProyectoArroz.png',1,'Tilda',98877655,98877655,'Alimentacion');

INSERT INTO MARCA VALUES ('Kaliuri');
INSERT INTO ARTICULO VALUES(00000021,5.99,'Bombones Doraemon Blanco y Negro','Set con caritas de Doraemon de Chocolate con leche y chocolate blanco. ¡La diversión más deliciosa ahora con Doraemon!','./img/ProyectoDoraemon.png',1,'Kaliuri',98877655,98877655,'Dulces_Snacks');
INSERT INTO MARCA VALUES ('Oreo');
INSERT INTO ARTICULO VALUES(00000022,3.20,'Barquillos de Vainilla y Chocolate','Deliciosas y sabrosas barritas Oreo de barquillo de chocolate con un interior de crema de vainilla y de chocolate fondue. ¡No te los pierdas!. 6 Unidades','./img/ProyectoOreo.png',6,'Oreo',98877655,98877655,'Dulces_Snacks');
INSERT INTO MARCA VALUES ('Bandai');
INSERT INTO ARTICULO VALUES(00000023,3.11,'Snack Chocobi Shin Chan Rojo | Ketchup','Disfruta de las populares y deliciosas "galletas" snack de maíz de Shin Chan, ahora con sabor a Ketchup. Edición Limitada.','./img/ProyectoGalletas.png',1,'Bandai',98877655,98877655,'Dulces_Snacks');
INSERT INTO MARCA VALUES ('Pringles');
INSERT INTO ARTICULO VALUES(00000024,5.27,'Pringles Cheeseburger Nueva York','¡Descubre el auténtico sabor de Nueva York en cada bocado con nuestras Pringles Sabor Cheeseburger al Estilo Nueva York de la colección Passport Flavours! Sumérgete en la vibrante cultura culinaria de la Gran Manzana sin salir de casa.','./img/ProyectoPringles.png',1,'Pringles',98877655,98877655,'Dulces_Snacks');
INSERT INTO MARCA VALUES ('Calbee');
INSERT INTO ARTICULO VALUES(00000025,3.29,'Snack estilo Cheetos al Grill Sabor Kabayaki','Crujiente y delicioso snack de maíz tostado al grill con salsa japonesa Kabayaki.','./img/ProyectoCheetos.png',1,'Calbee',98877655,98877655,'Dulces_Snacks');
INSERT INTO MARCA VALUES ('Kalanda');
INSERT INTO ARTICULO VALUES(00000026,4.82,'DIY de Piruletas de Shin Chan','Diviértete en familia con este kit para preparar deliciosas piruletas de chocolate con leche y chocolate rosa, con las caras de Shin Chan y sus amigos.','./img/ProyectoPiruletas.png',1,'Kalanda',98877655,98877655,'Dulces_Snacks');

INSERT INTO MARCA VALUES ('Kilosi');
INSERT INTO ARTICULO VALUES(00000031,7.19,'Big Dorayakis de Crema de Azuki | Kyoto','Deliciosos pasteles Dorayakis tradicionales elaborados con un ligero toque de miel, huevos frescos y rellenos de crema dulce de azuki (Anko). Elaborados según la Receta de Kyoto.','./img/ProyectoDorayakis.png',5,'Kilosi',98877655,98877655,'Postres');
INSERT INTO MARCA VALUES ('Shidosi');
INSERT INTO ARTICULO VALUES(00000032,5.09,'Bizcocho Castella de Melocotón Blanco','Exquisito bizcocho Castella elaborado con zumo de Melocotón Blanco japonés Hakuto, de la prefectura de Okayama. Disfruta de su sabor refrescante, suave y esponjosa textura.','./img/ProyectoBizcocho.png',1,'Shidosi',98877655,98877655,'Postres');
INSERT INTO MARCA VALUES ('Topvalu');
INSERT INTO ARTICULO VALUES(00000033,3.20,'Cake Roll Mil Capas de Matcha de Kyoto','Exquisito Cake Roll esponjoso de mil capas, elaborado con té verde Matcha Uji. Considerado el mejor té verde de Japón. Disfruta de su fragante sabor y de su suave y esponjosa textura.','./img/ProyectoCake.png',1,'Topvalu',98877655,98877655,'Postres');
INSERT INTO MARCA VALUES ('Anko');
INSERT INTO ARTICULO VALUES(00000034,5.39,'Crema Dulce de Judías Rojas.','Pasta de judías dulces lista para preparar tus propios Dorayakis.','./img/ProyectoCrema.png',1,'Anko',98877655,98877655,'Postres');
INSERT INTO MARCA VALUES ('Fitju');
INSERT INTO ARTICULO VALUES(00000035,3.56,'Dulce Tradicional Yokan de Judía Roja','Delicioso Yokan de Judía Roja. Disfruta de este Dulce Tradicional Japonés. El Yokan, es un dulce japonés elaborado a base de gelatina de Agar y pasta dulce de judía.','./img/ProyectoTradicional.png',1,'Fitju',98877655,98877655,'Postres');
INSERT INTO MARCA VALUES ('Bitecone');
INSERT INTO ARTICULO VALUES(00000036,5.27,'Cucuruchos de Chocolate Blanco.','Cucuruchos de barquillo con deliciosas y esponjosas nubes de chocolate blanco.','./img/ProyectoCucurucho.png',1,'Bitecone',98877655,98877655,'Postres');

INSERT INTO MARCA VALUES ('Sanje');
INSERT INTO ARTICULO VALUES(00000041,24.91,'Caja Sorpresa AnpanMan','Disfruta con esta selección de extraordinarios productos de AnpanMan! La merienda favorita de AnpanMan y sus amigos. ','./img/ProyectoAnpan.png',1,'Sanje',98877655,98877655,'Caja_Sorpresa');

INSERT INTO ARTICULO VALUES(00000042,28.91,'Caja Sorpresa Pikachu','Disfruta con esta selección de extraordinarios productos de Pokémon! La merienda favorita de Pikachu y sus amigos. ','./img/ProyectoPikachu.png',1,'Sanje',98877655,98877655,'Caja_Sorpresa');

INSERT INTO ARTICULO VALUES(00000043,26.45,'Caja Sorpresa Doraemon','Disfruta con esta selección de extraordinarios productos de Doraemon! La merienda favorita de Doraemon y sus amigos. ','./img/ProyectoCDoraemon.png',1,'Sanje',98877655,98877655,'Caja_Sorpresa');

INSERT INTO ARTICULO VALUES(00000044,23.76,'Caja Sorpresa Goku','Disfruta con esta selección de extraordinarios productos de Doraemon! La merienda favorita de Goku y sus amigos. ','./img/ProyectoGoku.png',1,'Sanje',98877655,98877655,'Caja_Sorpresa');

INSERT INTO ARTICULO VALUES(00000045,22.20,'Caja Sorpresa Shin Chan','Disfruta con esta selección de extraordinarios productos de Doraemon! La merienda favorita de Shin Chan y sus amigos. ','./img/ProyectoShinChan.png',1,'Sanje',98877655,98877655,'Caja_Sorpresa');

