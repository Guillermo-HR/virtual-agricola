--@Autor:  Zurita Cámara Juan Pablo y Hernández Ruiz Esparza Guillermo
--@Fecha:  08/12/2025
--@Descripción: TABLA "EMPRESAS" (cliente: pdb)

whenever sqlerror exit rollback

Prompt ++Iniciando creacion de procedimiento insertar_empresas

CREATE OR REPLACE PROCEDURE INSERTAR_EMPRESAS
AS
    v_rfc                empresa.rfc%TYPE;
    v_anio_inicio        empresa.anio_inicio%TYPE;
    v_nombre             empresa.nombre%TYPE;
    v_empresas_faltantes NUMBER;

    -- 100 nombres de empresas
    TYPE t_nombres IS TABLE OF empresa.nombre%TYPE;
    v_nombres t_nombres := t_nombres(
        'Agroindustrias Unidas de México', 'Productos Agrícolas del Valle',
        'Comercializadora de Alimentos Naturales', 'Distribuidora de Frutas y Verduras Frescas',
        'Exportadora de Granos y Semillas', 'Servicios Agrícolas Sustentables',
        'Innovación en Agricultura S.A. de C.V.', 'Agroexportaciones Globales',
        'Comercial Agrícola del Norte', 'Productos Orgánicos del Sur',
        'Distribuciones Rurales Integrales', 'Agroindustria y Tecnología Verde',
        'Comercializadora de Productos del Campo', 'Exportadora de Hortalizas Frescas',
        'Servicios Agrícolas Especializados', 'Innovación y Desarrollo Agrícola S.A. de C.V.',
        'Agroexportaciones del Pacífico', 'Comercial Agrícola del Centro',
        'Productos Orgánicos del Bajío', 'Distribuciones Rurales Avanzadas',
        'Agroindustria y Tecnología Sostenible', 'Comercializadora de Alimentos del Campo',
        'Exportadora de Frutas Tropicales', 'Servicios Agrícolas Profesionales',
        'Innovación en Producción Agrícola S.A. de C.V.', 'Agroexportaciones del Caribe',
        'Tierra Viva Productos', 'Cereales y Granos del Sur',
        'Fertilizantes Orgánicos del Centro', 'Ganadería Sostenible del Norte',
        'Aceites Comestibles y Derivados', 'Avicultura Especializada México',
        'Empacadora de Vegetales Frescos', 'Fibras Naturales del Desierto',
        'Distribuidora de Miel y Derivados', 'Tecnología Post-Cosecha Global',
        'Asociación de Productores de Café', 'Comercializadora de Pescados y Mariscos',
        'Sistema Integral de Invernaderos', 'Frutas Deshidratadas del Pacífico',
        'Servicios de Maquinaria Agrícola Pesada', 'Cultivos Protegidos de México',
        'Harinas y Derivados de Trigo', 'Almacenamiento en Silos y Bodegas',
        'Agropecuaria El Porvenir', 'Exportadora de Flores y Ornamentales',
        'Comercializadora de Cacao Fino', 'Productora de Lácteos Artesanales',
        'Distribuidora de Leguminosas', 'Consultoría en Manejo de Cuencas',
        'BioFertilizantes del Altiplano', 'Mercado Agropecuario Nacional',
        'Semillas de Alto Rendimiento S.A.', 'Centro de Abasto y Logística Frio',
        'Cooperativa Agro-Tecnológica', 'Grupo Productor Ganadero',
        'Acopio y Distribución de Legumbres', 'La Huerta Mexicana de Exportación',
        'Insumos para el Campo Sostenible', 'Servicios de Riego Inteligente',
        'Almacenes Centrales del Agro', 'Exportadora de Maíz y Frijol',
        'Distribuidora Fitosanitaria', 'Tecnología en Empacado de Frutas',
        'La Granja Ecológica del Sur', 'Consultoría en Certificación Orgánica',
        'Agroquímicos de Calidad', 'El Molino de la Sierra',
        'Tierra Fértil Servicios', 'Distribuidora de Alimentos Secos',
        'Hidroponía Avanzada México', 'Viveros y Jardines del Desierto',
        'Procesadora de Alimentos Balanceados', 'Red Nacional de Productores',
        'Servicios de Topografía Agrícola', 'La Cosecha del Mañana',
        'Fuerza Comercial Agropecuaria', 'Logística de Productos Perecederos',
        'Empacadora de Carnes del Norte', 'Asesoría en Crédito Rural',
        'Invernaderos de Alta Tecnología', 'Alimentos Funcionales y Saludables',
        'Distribuidora de Equipos Agrícolas', 'Sistemas de Automatización Rural',
        'Productos Lácteos Puros', 'Comercio Justo y Solidario',
        'Servicios de Control de Plagas', 'Venta de Semillas y Plantas',
        'Exportaciones Marítimas Agro', 'Corporativo de Empacadoras',
        'Agencia de Seguros para el Campo', 'Financiera Rural Próspera',
        'Desarrollo de Biocombustibles', 'Comercializadora de Café Gourmet',
        'Distribuidora Avícola Mayorista', 'Productos de la Pesca Artesanal',
        'Tecnología de Suelos y Agua', 'Asesoría Legal Agraria',
        'Planta Procesadora de Alimentos', 'Red de Proveedores Rurales'
    );

    FUNCTION GENERAR_RFC RETURN empresa.rfc%TYPE
    IS
        v_rfc_temp empresa.rfc%TYPE;
        v_rfc_registrado NUMBER;
    BEGIN
        v_rfc_temp :=  dbms_random.string('X', 12);
        SELECT COUNT(*) INTO v_rfc_registrado
        FROM empresa
        WHERE rfc = v_rfc_temp;
        IF v_rfc_registrado = 0 THEN
            RETURN v_rfc_temp;
        ELSE
            RETURN GENERAR_RFC;
        END IF;
    END GENERAR_RFC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('- Iniciando insercion de registros en la tabla empresa');
    SELECT (
        (SELECT COUNT(*) FROM socio WHERE es_comprador = 1) -
        (SELECT COUNT(*) FROM empresa)
    )
    INTO v_empresas_faltantes;

    FOR i IN 1..v_empresas_faltantes
    LOOP
        v_nombre := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, v_nombres.COUNT + 1)));
        v_rfc :=  GENERAR_RFC;
        v_anio_inicio := TO_DATE('01-01-2000', 'DD-MM-YYYY') + TRUNC(DBMS_RANDOM.VALUE(0, 7300));
        BEGIN
            INSERT INTO empresa (nombre, rfc, anio_inicio)
            VALUES (v_nombre, v_rfc, v_anio_inicio);
        EXCEPTION
            WHEN OTHERS THEN
                dbms_output.put_line('* Error al insertar empresa ' || v_nombre || ': ' || SQLERRM);
        END;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('> Insercion de registros en la tabla empresa completada');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('* Error al insertar registros en empresa: ' || SQLERRM);
        RAISE;
END;
/

Prompt -> Creacion de procedimiento insertar_empresas completada