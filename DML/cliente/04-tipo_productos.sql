--@Autor: 
--@Fecha creación: 
--@Descripción:

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Insertar registros en la tabla tipo producto
Prompt =========================================================

INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('maz_b', 'Maíz Blanco', 'Grano básico utilizado para tortillas, harinas y forraje.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('trig', 'Trigo', 'Cereal fundamental para la elaboración de pan, pastas y cervezas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('arroz_i', 'Arroz Integral', 'Grano de cereal entero, con cáscara, rico en fibra.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('frij_n', 'Frijol Negro', 'Leguminosa rica en proteínas y hierro, base de la dieta.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lente', 'Lenteja', 'Legumbre pequeña y nutritiva, usada en sopas y guisos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('papa_b', 'Papa Blanca', 'Tubérculo versátil, fuente de carbohidratos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('zanah', 'Zanahoria', 'Hortaliza de raíz anaranjada, rica en betacarotenos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('toma_r', 'Tomate Rojo', 'Fruto comestible, usado en ensaladas y salsas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cebo_b', 'Cebolla Blanca', 'Bulbo comestible, usado como condimento.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('aji_v', 'Chile Verde', 'Fruto picante, ingrediente esencial en muchas cocinas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lech_r', 'Lechuga Romana', 'Hortaliza de hoja crujiente, base para ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('broco', 'Brócoli', 'Hortaliza de la familia de las crucíferas, rica en vitaminas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('manza_r', 'Manzana Roja', 'Fruta pomácea, crujiente y dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('naran_v', 'Naranja Valencia', 'Cítrico jugoso y dulce, fuente de vitamina C.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lima_p', 'Limón Persa', 'Cítrico ácido, usado para sazonar y bebidas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('aguac_h', 'Aguacate Hass', 'Fruta con alto contenido de grasas saludables, muy cremoso.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('mango_m', 'Mango Manila', 'Fruta tropical dulce y fibrosa.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('uva_v', 'Uva Verde', 'Baya pequeña y dulce, consumida fresca o para pasas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('fres_c', 'Fresa de Campo', 'Baya roja y dulce, usada en postres y mermeladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('melon_c', 'Melón Cantalupo', 'Fruta de pulpa anaranjada y sabor dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sand_r', 'Sandía Rayada', 'Fruta grande y jugosa, de pulpa roja.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('acei_n', 'Aceituna Negra', 'Fruto del olivo, conservado en salmuera.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('algod_b', 'Algodón Blanco', 'Fibra vegetal utilizada en la industria textil.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cania_a', 'Caña de Azúcar', 'Tallo del que se extrae el azúcar y la melaza.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cafe_g', 'Grano de Café', 'Semilla tostada y molida para preparar la bebida.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cacao_s', 'Semilla de Cacao', 'Materia prima del chocolate.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pimien_n', 'Pimienta Negra', 'Baya seca utilizada como especia y condimento.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('vain_l', 'Vaina de Vainilla', 'Fruto de orquídea, usado como saborizante.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('jeng_r', 'Raíz de Jengibre', 'Rizoma aromático usado como especia y medicinal.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('aju_c', 'Ajo Criollo', 'Bulbo con dientes, usado como condimento fuerte.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('calab_v', 'Calabacín Verde', 'Fruto tierno de la familia de las cucurbitáceas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('espin', 'Espinaca', 'Hortaliza de hoja verde, rica en hierro.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('remola', 'Remolacha (Betabel)', 'Raíz comestible de color púrpura, dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pepin_l', 'Pepino Liso', 'Fruto cilíndrico, refrescante, usado en ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('apio_t', 'Apio en Tallo', 'Tallo crujiente, usado en caldos y ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('beren_m', 'Berenjena Morada', 'Fruto de cáscara púrpura, usado en cocina mediterránea.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('seta_c', 'Seta Común', 'Hongo comestible cultivado, versátil en la cocina.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pina_m', 'Piña Miel', 'Fruta tropical de pulpa amarilla, agridulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('coco_a', 'Coco de Agua', 'Fruta tropical, con agua y pulpa comestible.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('almend_p', 'Almendra Pelada', 'Fruto seco, alto en grasas saludables.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('nuez_c', 'Nuez de Castilla', 'Fruto seco, usado en repostería y como snack.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('miel_ab', 'Miel de Abeja', 'Sustancia dulce producida por abejas, de floración.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('har_tr', 'Harina de Trigo', 'Polvo fino molido, base de panadería y repostería.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('acei_oli', 'Aceite de Oliva', 'Grasa vegetal extraída de la aceituna.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('jugo_na', 'Jugo de Naranja Natural', 'Bebida cítrica, extraída del prensado de la fruta.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sem_gir', 'Semilla de Girasol', 'Pipa comestible, rica en aceites.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sorgo_g', 'Grano de Sorgo', 'Cereal usado para forraje y alimentos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('beterr', 'Betabel Forrajero', 'Raíz grande usada para alimentación animal.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('tapioca', 'Tapioca', 'Fécula extraída de la raíz de yuca (mandioca).', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('kiwi_v', 'Kiwi Verde', 'Fruta ovalada con pulpa verde y semillas negras.', empty_blob(), True);

COMMIT;

Prompt =========================================================
Prompt Insercion de registros en la tabla tipo producto finalizada
Prompt =========================================================