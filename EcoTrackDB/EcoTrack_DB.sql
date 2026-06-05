-- 1. TABLA: HORARIOS
CREATE TABLE horarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dias VARCHAR(100) NOT NULL, 
    turno VARCHAR(20) NOT NULL, 
    hora_estimada_inicio TIME NOT NULL
);

-- 2. TABLA: RUTAS
CREATE TABLE rutas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ruta VARCHAR(100) NOT NULL,
    sector VARCHAR(30) NOT NULL,       
    horario_id INT,
    FOREIGN KEY (horario_id) REFERENCES horarios(id) ON DELETE SET NULL
);

-- 3. TABLA: COLONIAS
CREATE TABLE colonias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_colonia VARCHAR(150) NOT NULL, 
    codigo_postal CHAR(5) NOT NULL,       
    ruta_id INT,                     
    FOREIGN KEY (ruta_id) REFERENCES rutas(id) ON DELETE SET NULL
);

-- 4. TABLA: CAMIONES
CREATE TABLE camiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placas VARCHAR(15) UNIQUE NOT NULL,   
    numero_economico VARCHAR(20) UNIQUE NOT NULL, 
    modelo VARCHAR(50),
    capacidad_toneladas DECIMAL(5,2) NOT NULL,
    estatus VARCHAR(20) DEFAULT 'disponible',
    ruta_actual_id INT,             
    FOREIGN KEY (ruta_actual_id) REFERENCES rutas(id) ON DELETE SET NULL
);

-- 5. TABLA: INCIDENCIAS
CREATE TABLE incidencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_incidencia VARCHAR(50) NOT NULL,  
    descripcion TEXT NOT NULL,
    estatus VARCHAR(20) DEFAULT 'abierta', 
    fecha_reporte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    colonia_id INT,                   
    camion_id INT NULL,                    
    latitud DECIMAL(10, 8) NULL,       
    longitud DECIMAL(11, 8) NULL,
    FOREIGN KEY (colonia_id) REFERENCES colonias(id) ON DELETE CASCADE,
    FOREIGN KEY (camion_id) REFERENCES camiones(id) ON DELETE SET NULL
);