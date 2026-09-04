-- =====================================================
-- EQUIPO_09 - IDY1103 - EP1
-- PASO A.4 (parte 2): Datos de prueba
-- IMPORTANTE: el orden importa por las llaves foráneas.
-- Primero catálogos (CLASE_MOV, CENTROS), después movimientos (MOV).
-- =====================================================
\c db_ep1_equipo_09
SET ROLE "APP_ADMIN_EP1_EQUIPO_09";

-- ============ 1) Catálogo de clases de movimiento ============
-- Ajusta/agrega códigos reales desde tu Clase_mov.csv si lo necesitas.
INSERT INTO "CLASE_MOV_EP1_EQUIPO_09" (codigo, descripcion) VALUES
 ('101', 'Entrada de mercancía por OC'),
 ('201', 'Salida de mercancía a centro de coste'),
 ('261', 'Consumo para orden'),
 ('301', 'Traslado entre centros');

-- ============ 2) Catálogo de centros ============
-- Ajusta/agrega códigos reales desde tu Centros.csv si lo necesitas.
INSERT INTO "CENTROS_EP1_EQUIPO_09" (codigo, descripcion) VALUES
 ('1000', 'Planta Santiago'),
 ('2000', 'Planta Valparaíso'),
 ('3000', 'Bodega Central');

-- ============ 3) Movimientos de material (tabla transaccional) ============
INSERT INTO "MOV_EP1_EQUIPO_09"
 (material, texto_breve_material, clase_movimiento, centro,
  ctd_um_entrada, un_medida_entrada, fecha_contabilizacion, importe_ml, nombre)
VALUES
 ('MAT-001', 'Tornillo hexagonal 8mm', '101', '1000', 500, 'UN', '2026-08-01', 125000, 'Ana Torres'),
 ('MAT-002', 'Placa de acero 2mm',     '201', '2000', 20,  'UN', '2026-08-03', 340000, 'Bruno Silva'),
 ('MAT-001', 'Tornillo hexagonal 8mm', '261', '1000', 50,  'UN', '2026-08-05', 12500,  'Carla Muñoz'),
 ('MAT-003', 'Cable eléctrico 10m',    '301', '3000', 15,  'UN', '2026-08-06', 45000,  'Ana Torres');

RESET ROLE;

-- Verificación / captura de pantalla requerida por la pauta (punto 6):
SELECT * FROM "CLASE_MOV_EP1_EQUIPO_09";
SELECT * FROM "CENTROS_EP1_EQUIPO_09";
SELECT * FROM "MOV_EP1_EQUIPO_09";


--