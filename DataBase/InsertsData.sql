USE `banco`;

INSERT INTO `Tipos_Movimientos` (`descripcion`)
VALUES
('Alta de cuenta'),
('Alta de prestamo'),
('Pago de prestamo'),
('Transferencia Entrada'),
('Transferencia Salida');

INSERT INTO `Tipos_Cuentas` (`descripcion`)
 VALUES
('Caja de ahorro'),
('Cuenta corriente');


INSERT INTO
    Roles (nombre_rol)
VALUES
    ('Administrador'),
    ('Cliente');
    
INSERT INTO `Paises` (`nombre`) VALUES
('Argentina'),
('Bolivia'),
('Brasil'),
('Chile'),
('Colombia'),
('Ecuador'),
('Guyana'),
('Paraguay'),
('Perú'),
('Uruguay'),
('Venezuela'),
('México');

INSERT INTO `Provincias` (`nombre`, `id_pais`) VALUES
-- inserto solo de Arg
('Buenos Aires', 1),
('Catamarca', 1),
('Chaco', 1),
('Chubut', 1),
('Córdoba', 1),
('Corrientes', 1),
('Entre Ríos', 1),
('Formosa', 1),
('Jujuy', 1),
('La Pampa', 1),
('La Rioja', 1),
('Mendoza', 1),
('Misiones', 1),
('Neuquén', 1),
('Río Negro', 1),
('Salta', 1),
('San Juan', 1),
('San Luis', 1),
('Santa Cruz', 1),
('Santa Fe', 1),
('Santiago del Estero', 1),
('Tierra del Fuego', 1),
('Tucumán', 1);

-- Uso Buenos Aires Id 1 y Santa Fe Id 20
INSERT INTO `Localidades` (`nombre`, `id_provincia`) VALUES
('Tres de Febrero', 1),
('Pacheco', 1),
('La Plata', 1),
('Lomas de Zamora', 1),
('Mar del Plata', 1),
('Bahía Blanca', 1),
('Tandil', 1),
('San Nicolás', 1),
('Santa Fe', 20),
('Rosario', 20),
('Rafaela', 20),
('Venado Tuerto', 20),
('Reconquista', 20);

INSERT INTO `Usuarios` (`nombre_usuario`, `contrasenia`, `id_rol`, `estado`) 
VALUES
('admin', 'admin', 1, TRUE),  -- admin
('user1', 'user1', 2, TRUE), -- clientes
('user2', 'user2', 2, TRUE),
('user3', 'user3', 2, TRUE),
('user4', 'user4', 2, FALSE),
('user5', 'user5', 2, TRUE),
('user6', 'user6', 2, TRUE),
('user7', 'user7', 2, FALSE),
('user8', 'user8', 2, FALSE),
('user9', 'user9', 2, TRUE),
('user10', 'user10', 2, TRUE),
('user11', 'user11', 2, FALSE);


INSERT INTO `Domicilios` (`direccion`, `id_localidad`, `id_provincia`) 
VALUES
('Pedro Goyena 1543', 1, 1),             -- Tres de Febrero
('Av. Boulogne Sur Mer 837', 2, 1),      -- Pacheco
('Calle 49 entre 8 y 9 Nº1023', 3, 1),   -- La Plata
('Oliden 1190', 4, 1),                   -- Lomas de Zamora
('Calle Rivadavia 2234', 5, 1),          -- Mar del Plata
('Donado 1200', 6, 1),                   -- Bahía Blanca
('Paz 731', 7, 1),                       -- Tandil
('España 416', 8, 1),                    -- San Nicolás
('Av. Aristóbulo del Valle 4800', 9, 20),-- Santa Fe
('Av. Pellegrini 1032', 10, 20),         -- Rosario
('Bv. Lehmann 1470', 11, 20),            -- Rafaela
('Calle Belgrano 236', 12, 20),          -- Venado Tuerto
('Gral. Obligado 889', 13, 20);          -- Reconquista


INSERT INTO `Clientes` 
(`dni`, `cuil`, `nombre`, `apellido`, `sexo`, `id_nacionalidad`, `fecha_nacimiento`, `id_domicilio`, `correo_electronico`, `telefono`, `id_usuario`) 
VALUES
('30111222', '20-30111222-5', 'Lucía', 'Giménez', 'F', 1, '1990-04-15', 1, 'lucia.gimenez@mail.com', '1122334455', 1),
('28444555', '20-28444555-7', 'Carlos', 'Lopez', 'M', 1, '1985-09-10', 2, 'carlos.lopez@mail.com', '1177889944', 2),
('31222333', '27-31222333-3', 'Martina', 'Ruiz', 'F', 1, '1993-01-22', 3, 'martina.ruiz@mail.com', '1147856985', 3),
('27666111', '23-27666111-4', 'Pablo', 'Fernandez', 'M', 1, '1980-07-30', 4, 'pablo.fernandez@mail.com', '1125369694', 4),
('32555123', '20-32555123-9', 'Natalia', 'Soria', 'F', 1, '1995-11-05', 5, 'natalia.soria@mail.com', '1154879865', 5),
('29888999', '20-29888999-1', 'Emiliano', 'Peralta', 'M', 1, '1992-03-18', 6, 'emiliano.peralta@mail.com', '1125468978', 6),
('31111777', '20-31111777-0', 'Mariela', 'Nuñez', 'F', 1, '1987-12-01', 7, 'mariela.nunez@mail.com', '1130205060', 7),
('30999111', '20-30999111-2', 'Julieta', 'Ramírez', 'F', 1, '1991-06-23', 8, 'julieta.ramirez@mail.com', '1164568975', 8),
('27777333', '20-27777333-5', 'Leonardo', 'Mendoza', 'M', 1, '1982-02-14', 9, 'leonardo.mendoza@mail.com', '1166553397', 9),
('32222444', '27-32222444-6', 'Camila', 'Vega', 'F', 1, '1996-10-09', 10, 'camila.vega@mail.com', '1145454545', 10),
('28888555', '20-28888555-8', 'Matías', 'Ibarra', 'M', 1, '1990-05-17', 11, 'matias.ibarra@mail.com', '1178956987', 11),
('30000333', '23-30000333-4', 'Florencia', 'Benítez', 'F', 1, '1989-11-28', 12, 'florencia.benitez@mail.com', '1147586932', 11),
('26666111', '20-26666111-3', 'Gonzalo', 'Herrera', 'M', 1, '1984-08-05', 13, 'gonzalo.herrera@mail.com', '1124587541', 10);

INSERT INTO `Cuentas` 
(`id_cliente`, `fecha_creacion`, `numero_de_cuenta`, `id_tipo_cuenta`, `cbu`, `saldo`, `estado`)
VALUES
(1, '2025-04-15', '12345678-0001', 1, '98765432101', 150045.00, TRUE),
(1, '2025-04-15', '12345678-0201', 2, '98765432201', 10000.00, TRUE),
(2, '2020-02-10', '12345678-0002', 1, '98765432102', 275000.50, TRUE),
(2, '2020-02-10', '12345678-0202', 2, '98765432202', 500000.50, TRUE),
(3, '2023-09-30', '12345678-0003', 1, '98765432103', 0.00, TRUE),
(4, '2024-03-13', '12345678-0004', 2, '98765432104', 98000.75, TRUE),
(5, '2025-01-20', '12345678-0005', 1, '98765432105', 12500.00, TRUE),
(6, '2020-12-14', '12345678-0006', 1, '98765432106', 34000.62, TRUE),
(7, '2024-04-11', '12345678-0007', 2, '98765432107', 210000.00, TRUE),
(8, '2024-04-06', '12345678-0008', 2, '98765432108', 425000.60, TRUE),
(9, '2023-08-11', '12345678-0009', 1, '98765432109', 750098.30, TRUE),
(10, '2023-03-01', '12345678-0010', 1, '98765432110', 195000.00, TRUE),
(10, '2022-07-15', '12345678-0011', 2, '98765432111', 83500.00, TRUE),
(11, '2021-09-20', '12345678-0012', 1, '98765432112', 12000.50, TRUE),
(11, '2020-11-11', '12345678-0013', 2, '98765432113', 600230.00, TRUE);


INSERT INTO Opciones_Plazo (cantidad_cuotas, tasaAnual) VALUES
(3, 40.00),
(6, 42.00),
(9, 44.00),
(12, 46.00),
(18, 48.00),
(24, 50.00),
(30, 52.00),
(36, 54.00),
(42, 56.00),
(48, 58.00),
(60, 60.00);

INSERT INTO Prestamos (id_cliente, id_cuenta, fecha_alta, importe_pedido, id_opcion_plazo, estado)
VALUES 
(1, 1, null, 30000000.00, 2, 0),
(2, 2, null, 45000000.00, 4, 0), 
(3, 3, null, 500000000.00, 3, 2); 

CALL AutorizarPrestamo(1);
CALL AutorizarPrestamo(2);
