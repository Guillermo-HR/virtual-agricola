--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: Inserción de datos para la TABLA "TIPO_PRODUCTO" (pdb: cliente)

whenever sqlerror exit rollback
set feedback off

Prompt ++Iniciando insercion de registros en la tabla tipo producto

INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('maz_b', 'Maíz Blanco', 'Grano básico utilizado para tortillas, harinas y forraje.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('trigo', 'Trigo', 'Cereal fundamental para la elaboración de pan, pastas y cervezas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('arz_i', 'Arroz Integral', 'Grano de cereal entero, con cáscara, rico en fibra.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('frj_n', 'Frijol Negro', 'Leguminosa rica en proteínas y hierro, base de la dieta.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lente', 'Lenteja', 'Legumbre pequeña y nutritiva, usada en sopas y guisos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pap_b', 'Papa Blanca', 'Tubérculo versátil, fuente de carbohidratos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('zanah', 'Zanahoria', 'Hortaliza de raíz anaranjada, rica en betacarotenos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('tmt_r', 'Tomate Rojo', 'Fruto comestible, usado en ensaladas y salsas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('ceb_b', 'Cebolla Blanca', 'Bulbo comestible, usado como condimento.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('aji_v', 'Chile Verde', 'Fruto picante, ingrediente esencial en muchas cocinas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lch_r', 'Lechuga Romana', 'Hortaliza de hoja crujiente, base para ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('broco', 'Brócoli', 'Hortaliza de la familia de las crucíferas, rica en vitaminas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('mnz_r', 'Manzana Roja', 'Fruta pomácea, crujiente y dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('nrn_v', 'Naranja Valencia', 'Cítrico jugoso y dulce, fuente de vitamina C.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('lma_p', 'Limón Persa', 'Cítrico ácido, usado para sazonar y bebidas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('agc_h', 'Aguacate Hass', 'Fruta con alto contenido de grasas saludables, muy cremoso.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('mng_m', 'Mango Manila', 'Fruta tropical dulce y fibrosa.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('uva_v', 'Uva Verde', 'Baya pequeña y dulce, consumida fresca o para pasas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('frs_c', 'Fresa de Campo', 'Baya roja y dulce, usada en postres y mermeladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('mln_c', 'Melón Cantalupo', 'Fruta de pulpa anaranjada y sabor dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('snd_r', 'Sandía Rayada', 'Fruta grande y jugosa, de pulpa roja.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('act_n', 'Aceituna Negra', 'Fruto del olivo, conservado en salmuera.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('alg_b', 'Algodón Blanco', 'Fibra vegetal utilizada en la industria textil.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cna_a', 'Caña de Azúcar', 'Tallo del que se extrae el azúcar y la melaza.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('caf_g', 'Grano de Café', 'Semilla tostada y molida para preparar la bebida.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cco_s', 'Semilla de Cacao', 'Materia prima del chocolate.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pmn_n', 'Pimienta Negra', 'Baya seca utilizada como especia y condimento.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('vnill', 'Vaina de Vainilla', 'Fruto de orquídea, usado como saborizante.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('jngbr', 'Raíz de Jengibre', 'Rizoma aromático usado como especia y medicinal.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('aju_c', 'Ajo Criollo', 'Bulbo con dientes, usado como condimento fuerte.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('clb_v', 'Calabacín Verde', 'Fruto tierno de la familia de las cucurbitáceas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('espin', 'Espinaca', 'Hortaliza de hoja verde, rica en hierro.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('remol', 'Remolacha (Betabel)', 'Raíz comestible de color púrpura, dulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('ppn_l', 'Pepino Liso', 'Fruto cilíndrico, refrescante, usado en ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('apo_t', 'Apio en Tallo', 'Tallo crujiente, usado en caldos y ensaladas.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('ber_m', 'Berenjena Morada', 'Fruto de cáscara púrpura, usado en cocina mediterránea.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sta_c', 'Seta Común', 'Hongo comestible cultivado, versátil en la cocina.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('pna_m', 'Piña Miel', 'Fruta tropical de pulpa amarilla, agridulce.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('cco_a', 'Coco de Agua', 'Fruta tropical, con agua y pulpa comestible.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('almnd', 'Almendra Pelada', 'Fruto seco, alto en grasas saludables.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('nuz_c', 'Nuez de Castilla', 'Fruto seco, usado en repostería y como snack.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('ml_ab', 'Miel de Abeja', 'Sustancia dulce producida por abejas, de floración.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('hr_tr', 'Harina de Trigo', 'Polvo fino molido, base de panadería y repostería.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('ac_ol', 'Aceite de Oliva', 'Grasa vegetal extraída de la aceituna.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('jgo_n', 'Jugo de Naranja Natural', 'Bebida cítrica, extraída del prensado de la fruta.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sm_gr', 'Semilla de Girasol', 'Pipa comestible, rica en aceites.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('sorgo', 'Grano de Sorgo', 'Cereal usado para forraje y alimentos.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('beter', 'Betabel Forrajero', 'Raíz grande usada para alimentación animal.', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('tpica', 'Tapioca', 'Fécula extraída de la raíz de yuca (mandioca).', empty_blob(), True);
INSERT INTO tipo_producto (clave, nombre, descripcion, foto, activo) 
    VALUES ('kiw_v', 'Kiwi Verde', 'Fruta ovalada con pulpa verde y semillas negras.', empty_blob(), True);

COMMIT;

Prompt -> Insercion de registros en la tabla tipo producto completada