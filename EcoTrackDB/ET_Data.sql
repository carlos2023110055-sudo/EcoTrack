-- =========================================================================
-- 1. LLENADO DE HORARIOS REALES (Formatos del OOSL Puebla)
-- =========================================================================
INSERT INTO horarios (dias, turno, hora_estimada_inicio) VALUES 
('Lunes, Miércoles y Viernes', 'Diurno', '06:00:00'),
('Lunes, Miércoles y Viernes', 'Nocturno', '20:00:00'),
('Martes, Jueves y Sábado', 'Diurno', '06:00:00'),
('Martes, Jueves y Sábado', 'Nocturno', '20:00:00'),
('Diario (Lunes a Domingo)', 'Nocturno', '21:00:00'),
('Diario (Lunes a Sábado)', 'Diurno', '07:00:00');   

-- =========================================================================
-- 2. LLENADO DE RUTAS POR SECTORES DE LA CIUDAD
-- =========================================================================
INSERT INTO rutas (nombre_ruta, sector, horario_id) VALUES 
('Ruta CH-01 Centro Histórico', 'Centro', 5),
('Ruta CH-02 El Carmen y Huexotitla', 'Centro', 5),
('Ruta N-10 Amalucan-Bosques', 'Norte', 3),
('Ruta N-11 San Jerónimo-Finsa', 'Norte', 1),
('Ruta S-20 San Manuel-Anzures', 'Sur', 2),
('Ruta S-21 Agua Azul-Mayorazgo', 'Sur', 4),
('Ruta P-30 La Paz-Belisario Domínguez', 'Poniente', 3),
('Ruta P-31 Zavaleta-Romero Vargas', 'Poniente', 1);

-- =========================================================================
-- 3. LLENADO DE COLONIAS Y JUNTAS AUXILIARES CON CP
-- =========================================================================
INSERT INTO colonias (nombre_colonia, codigo_postal, ruta_id) VALUES 
-- Sector Centro (Rutas 1 y 2)
('Centro Histórico (Zócalo / Catedral)', '72000', 1),
('Barrio de Ganalco', '72000', 1),
('El Carmen', '72000', 2),
('Huexotitla', '72534', 2),
('Chulavista', '72420', 2),

-- Sector Norte (Rutas 3 y 4)
('Infonavit Amalucan', '72310', 3),
('Bosques de San Sebastián', '72310', 3),
('Rivera Anaya', '72310', 3),
('San Jerónimo Caleras (Junta Auxiliar)', '72100', 4),
('La María', '72100', 4),

-- Sector Sur (Rutas 5 y 6)
('Jardines de San Manuel', '72570', 5),
('Mirador', '72530', 5),
('Anzures', '72530', 5),
('Prados Agua Azul', '72430', 6),
('Mayorazgo', '72450', 6),
('San Francisco Totimehuacan (Junta Auxiliar)', '72595', 6),

-- Sector Poniente (Rutas 7 y 8)
('La Paz', '72160', 7),
('Belisario Domínguez', '72180', 7),
('Santa Cruz Buenavista', '72154', 8),
('Calzada Zavaleta', '72150', 8),
('Ignacio Romero Vargas (Junta Auxiliar)', '72120', 8);

-- =========================================================================
-- 4. LLENADO DE CAMIONES (Simulación de flota activa con nomenclatura real)
-- =========================================================================
INSERT INTO camiones (placas, numero_economico, modelo, capacidad_toneladas, estatus, ruta_actual_id) VALUES 
('SP-45-120', 'OOSL-012', 'McNeilus Heavy Duty 2024', 15.00, 'en_ruta', 1),
('SP-45-121', 'OOSL-015', 'International Durastar 2023', 12.50, 'en_ruta', 2),
('SM-88-943', 'PUE-N301', 'Freightliner M2 2025', 14.00, 'disponible', NULL),
('SM-88-944', 'PUE-N302', 'Freightliner M2 2025', 14.00, 'en_ruta', 3),
('SP-22-711', 'PUE-S501', 'Kenworth KW55 2024', 16.00, 'en_ruta', 5),
('SP-22-712', 'PUE-S502', 'Kenworth KW55 2024', 16.00, 'mantenimiento', NULL),
('SM-11-405', 'PUE-P701', 'Volkswagen Constellation 2023', 12.00, 'disponible', NULL);

-- =========================================================================
-- 5. HISTORIAL DE INCIDENCIAS RECIENTES EN PUEBLA CAPITAL
-- Coordenadas reales obtenidas del mapa de la ciudad
-- =========================================================================
INSERT INTO incidencias (tipo_incidencia, descripcion, estatus, fecha_reporte, colonia_id, camion_id, latitud, longitud) VALUES 
('Contenedor desbordado', 'El contenedor de basura del Parque del Carmen está lleno y la gente está dejando bolsas en el suelo.', 'abierta', NOW() - INTERVAL 2 HOUR, 3, NULL, 19.037532, -98.201445),
('Camión no pasó', 'Reportan vecinos de San Manuel que el camión nocturno no pasó la noche del lunes en la 14 Sur.', 'en_proceso', NOW() - INTERVAL 1 DAY, 11, 5, 19.019815, -98.192450),
('Punto de acumulación clandestino', 'Tiradero de basura en la entrada de la junta auxiliar de San Jerónimo Caleras.', 'abierta', NOW() - INTERVAL 5 HOUR, 9, NULL, 19.091122, -98.214431),
('Obstrucción de contenedor', 'Auto particular mal estacionado bloquea el acceso al camión recolector en la colonia La Paz.', 'resuelta', NOW() - INTERVAL 2 DAY, 17, 7, 19.052341, -98.223412);