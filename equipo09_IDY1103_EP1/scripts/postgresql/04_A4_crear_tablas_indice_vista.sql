-- =====================================================
-- EQUIPO_09 - IDY1103 - EP1
-- PASO A.4 (parte 1): Tablas, índice y vista
-- Estructura basada en: Clase_mov.csv, Centros.csv y las columnas
-- de mov_pa1 (cargar_mov_pa1.sql) del proyecto.
-- =====================================================

-- Ejecutamos como APP_ADMIN para que sea el DUEÑO de los objetos
-- (así queda "administrando los objetos del esquema" según pide la pauta).
SET ROLE "APP_ADMIN_EP1_EQUIPO_09";

-- ============ TABLA MAESTRA: CLASE_MOV ============
-- Corresponde a Clase_mov.csv (Codigo;Descripcion) -> catálogo de
-- clases de movimiento (ej: 101 Entrada, 201 Salida, etc.)
CREATE TABLE "CLASE_MOV_EP1_EQUIPO_09" (
    codigo      VARCHAR,
    descripcion VARCHAR
);

-- ============ TABLA MAESTRA: CENTROS ============
-- Corresponde a Centros.csv (Codigo;Descripcion) -> catálogo de
-- centros/plantas.
CREATE TABLE "CENTROS_EP1_EQUIPO_09" (
    codigo      VARCHAR,
    descripcion VARCHAR
);

-- ============ TABLA TRANSACCIONAL: MOV ============
-- Corresponde a la estructura de mov_pa1 (cargar_mov_pa1.sql), con
-- nombres de columna normalizados (sin tildes/espacios).
CREATE TABLE "MOV_EP1_EQUIPO_09" (
    material                VARCHAR,
    texto_breve_material    VARCHAR,
    clase_movimiento        VARCHAR,
    posicion_doc_mat        VARCHAR,
    cuenta                  VARCHAR,
    ctd_um_entrada          VARCHAR,
    un_medida_entrada       VARCHAR,
    centro                  VARCHAR,
    almacen                 VARCHAR,
    documento_material      VARCHAR,
    fecha_contabilizacion   VARCHAR,
    importe_ml              VARCHAR,
    nro_reserva             VARCHAR,
    hora_entrada            VARCHAR,
    referencia              VARCHAR,
    sociedad                VARCHAR,
    texto_clase_mov         VARCHAR,
    clase_operacion         VARCHAR,
    fecha_documento         VARCHAR,
    fecha_entrada           VARCHAR,
    motivo_movimiento       VARCHAR,
    nombre                  VARCHAR
);

-- ============ ÍNDICE OBLIGATORIO (idx_mat) ============
-- Índice por el campo "material", que es el que más se filtra/consulta
-- . Se le agrega el sufijo
-- del equipo para cumplir la convención de nomenclatura obligatoria.
CREATE INDEX idx_mat_ep1_equipo_09 ON "MOV_EP1_EQUIPO_09"("Material");

-- ============ VISTA DE RESUMEN ============
-- Combina el movimiento con la descripción de su clase y de su centro.
CREATE OR REPLACE VIEW "VW_RESUMEN_MOVIMIENTOS_EP1_EQUIPO_09" AS
SELECT
    m."Material",
    m."Texto breve de material",
    cm."Descripcion" AS "Clase_movimiento_desc",
    c."Descripcion" AS "Centro_desc",
    m."Fe.contabilización",
    m."Importe ML"
FROM "MOV_EP1_EQUIPO_09" AS m
INNER JOIN "CLASE_MOV_EP1_EQUIPO_09" AS cm
    ON cm."Codigo" = m."Clase de movimiento"
INNER JOIN "CENTROS_EP1_EQUIPO_09" AS c
    ON c."Codigo" = m."Centro";

RESET ROLE;

-- Verificación:
-- \dt   (lista las 3 tablas)
-- \di   (debe aparecer idx_mat_ep1_equipo_09)
-- \dv   (debe aparecer la vista)
