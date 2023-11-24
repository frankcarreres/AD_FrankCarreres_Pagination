CREATE DATABASE  IF NOT EXISTS `Instituto`;
USE `Instituto`;

-- Instituto.Persona definition

CREATE TABLE `Persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Instituto.Profesor definition

CREATE TABLE `Profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `departmento` varchar(20) NOT NULL,
  `jefeDepartamento` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  CONSTRAINT `fk_Pro_Per` FOREIGN KEY (`idProfesor`) REFERENCES `Persona` (`idPersona`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Instituto.Clase definition

CREATE TABLE `Clase` (
  `idClase` int(11) NOT NULL AUTO_INCREMENT,
  `curso` int(11) NOT NULL,
  `grupo` char(1) NOT NULL,
  `nivel` varchar(30) NOT NULL,
  `idTutor` int(11) NOT NULL,
  PRIMARY KEY (`idClase`),
  UNIQUE KEY `idTutor` (`idTutor`),
  CONSTRAINT `fk_Cla_Pro` FOREIGN KEY (`idTutor`) REFERENCES `Profesor` (`idProfesor`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Instituto.Alumno definition

CREATE TABLE `Alumno` (
  `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `ampa` tinyint(1) DEFAULT NULL,
  `clase` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `fk_Alu_Cla` (`clase`),
  CONSTRAINT `fk_Alu_Cla` FOREIGN KEY (`clase`) REFERENCES `Clase` (`idClase`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alu_Per` FOREIGN KEY (`idAlumno`) REFERENCES `Persona` (`idPersona`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Instituto.Docencia definition

CREATE TABLE `Docencia` (
  `idAlumno` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`,`idProfesor`),
  KEY `fk_Doc_Pro` (`idProfesor`),
  CONSTRAINT `fk_Doc_Alu` FOREIGN KEY (`idAlumno`) REFERENCES `Alumno` (`idAlumno`) ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doc_Pro` FOREIGN KEY (`idProfesor`) REFERENCES `Profesor` (`idProfesor`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `Persona` (`nombre`, `apellidos`, `edad`) VALUES
('Juan', 'Pérez', 28),
('María', 'Gómez', 22),
('Carlos', 'Rodríguez', 31),
('Laura', 'Hernández', 27),
('Miguel', 'García', 34),
('Isabel', 'Fernández', 29),
('Pedro', 'López', 33),
('Ana', 'Martínez', 26),
('Javier', 'Sánchez', 30),
('Sofía', 'Díaz', 25),
('Raúl', 'Torres', 32),
('Elena', 'Jiménez', 28),
('Francisco', 'Ruiz', 35),
('Carmen', 'Moreno', 23),
('Alejandro', 'Álvarez', 31),
('Luisa', 'Romero', 29),
('Antonio', 'Navarro', 27),
('Patricia', 'Gutiérrez', 33),
('Roberto', 'Molina', 26),
('Beatriz', 'Ortega', 30),
('Ángel', 'Castillo', 28),
('Lucía', 'Luna', 24),
('Diego', 'Vargas', 32),
('Rosa', 'Salas', 29),
('Fernando', 'Silva', 31),
('Natalia', 'Ramos', 26),
('Julio', 'Peralta', 33),
('Silvia', 'Herrera', 27),
('Víctor', 'Santos', 30),
('Eva', 'Cruz', 25),
('Adrián', 'Flores', 34),
('Monica', 'Ríos', 28),
('Hugo', 'Campos', 31),
('Clara', 'Cabrera', 23),
('Gonzalo', 'Vega', 29),
('Vanessa', 'Mendoza', 27),
('Manuel', 'Guerrero', 32),
('Diana', 'Guzmán', 30),
('Arturo', 'Aguilar', 25),
('Lorena', 'Miranda', 28),
('Gabriel', 'Lara', 33),
('Nadia', 'Ortiz', 26),
('Oscar', 'Pineda', 31),
('Verónica', 'Valdez', 29),
('Mario', 'Reyes', 27),
('Rocío', 'López', 34),
('Jorge', 'Cortés', 30),
('Alicia', 'Zamora', 25),
('José', 'Chávez', 28);




