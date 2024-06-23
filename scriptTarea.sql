USE Estudiante_8_202413;
-- Modelo de hecho movimiento

CREATE TABLE Fecha (
ID_Fecha INT,
Fecha DATE, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(ID_Fecha));

CREATE TABLE Producto (
ID_Producto_DWH SMALLINT, 
ID_Producto_T SMALLINT, 
Nombre VARCHAR(100),
Marca VARCHAR(30), 
Paquete_de_compra VARCHAR(20), 
Color VARCHAR(10), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Paquete_de_venta VARCHAR(20), 
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto_DWH));

CREATE TABLE Proveedor(
ID_proveedor_DWH INT,
ID_proveedor_T INT,
Nombre VARCHAR(20),
Categoria VARCHAR(20),
Contacto_principal VARCHAR(30),
Referencia VARCHAR(30),
Dias_pago INT, 
Codigo_postal INT,
PRIMARY KEY(ID_proveedor_DWH));

CREATE TABLE TipoTransaccion(
ID_Tipo_transaccion_DWH TINYINT,
ID_Tipo_transaccion_T TINYINT,  
Tipo VARCHAR(20),
PRIMARY KEY(ID_Tipo_transaccion_DWH));

-- Entregable CREATE

CREATE TABLE Cliente(
ID_cliente_DWH INT,
ID_cliente_T INT,
Nombre VARCHAR(20),
cliente_factura INT,
ID_ciudad_entrega_DWH SMALLINT,
limite_credito FLOAT,
fecha_apertura_cuenta DATE, 
dias_pago INT,
nombre_grupo_compra VARCHAR(20),
nombre_categoria VARCHAR(50),
PRIMARY KEY(ID_cliente_DWH));

CREATE TABLE Movimiento (
ID_Fecha INT, 
ID_Producto_DWH SMALLINT,
ID_proveedor_DWH INT,
ID_cliente_DWH INT,
ID_Tipo_transaccion_DWH TINYINT,
Cantidad FLOAT,
PRIMARY KEY(ID_Fecha, ID_Producto_DWH, ID_proveedor_DWH, ID_cliente_DWH, ID_Tipo_transaccion_DWH));

-- Entregable INSERT
INSERT INTO Fecha (ID_Fecha, Fecha, Dia, Mes, Anio, Numero_semana_ISO) VALUES 
(20230101, '2023-01-01', 1, 'Jan', 2023, 1),
(20230214, '2023-02-14', 14, 'Feb', 2023, 7),
(20230315, '2023-03-15', 15, 'Mar', 2023, 11),
(20230410, '2023-04-10', 10, 'Apr', 2023, 15),
(20230521, '2023-05-21', 21, 'May', 2023, 20);

INSERT INTO Producto (ID_Producto_DWH, ID_Producto_T, Nombre, Marca, Paquete_de_compra, Color, Necesita_refrigeracion, Dias_tiempo_entrega, cantidad_por_salida, Precio_minorista_recomendado, Paquete_de_venta, Precio_unitario) VALUES 
(1, 1001, 'Producto A', 'Marca A', 'Paquete 1', 'Rojo', FALSE, 5, 10, 20.00, 'Paquete 1', 2.00),
(2, 1002, 'Producto B', 'Marca B', 'Paquete 2', 'Verde', TRUE, 7, 5, 50.00, 'Paquete 2', 10.00),
(3, 1003, 'Producto C', 'Marca C', 'Paquete 3', 'Azul', FALSE, 3, 20, 15.00, 'Paquete 3', 5.00),
(4, 1004, 'Producto D', 'Marca D', 'Paquete 4', 'Amarillo', TRUE, 2, 15, 30.00, 'Paquete 4', 3.00),
(5, 1005, 'Producto E', 'Marca E', 'Paquete 5', 'Negro', FALSE, 10, 8, 60.00, 'Paquete 5', 7.00);

INSERT INTO Proveedor (ID_proveedor_DWH, ID_proveedor_T, Nombre, Categoria, Contacto_principal, Referencia, Dias_pago, Codigo_postal) VALUES 
(1, 2001, 'Proveedor A', 'Categoria A', 'Contacto A', 'Referencia A', 30, 12345),
(2, 2002, 'Proveedor B', 'Categoria B', 'Contacto B', 'Referencia B', 45, 23456),
(3, 2003, 'Proveedor C', 'Categoria C', 'Contacto C', 'Referencia C', 60, 34567),
(4, 2004, 'Proveedor D', 'Categoria D', 'Contacto D', 'Referencia D', 15, 45678),
(5, 2005, 'Proveedor E', 'Categoria E', 'Contacto E', 'Referencia E', 90, 56789);

INSERT INTO TipoTransaccion (ID_Tipo_transaccion_DWH, ID_Tipo_transaccion_T, Tipo) VALUES 
(1, 31, 'Reembolso cliente'),
(2, 32, 'Factura proveedor'),
(3, 33, 'Reembolso proveedor'),
(4, 34, 'Recibo de acciones'),
(5, 35, 'Pago al proveedor');

INSERT INTO Cliente (ID_cliente_DWH, ID_cliente_T, Nombre, cliente_factura, ID_ciudad_entrega_DWH, limite_credito, fecha_apertura_cuenta, dias_pago, nombre_grupo_compra, nombre_categoria) VALUES 
(1, 4001, 'Cliente A', 1, 101, 10000.00, '2020-01-01', 30, 'Grupo A', 'Categoria A'),
(2, 4002, 'Cliente B', 2, 102, 20000.00, '2021-02-02', 45, 'Grupo B', 'Categoria B'),
(3, 4003, 'Cliente C', 3, 103, 15000.00, '2022-03-03', 60, 'Grupo C', 'Categoria C'),
(4, 4004, 'Cliente D', 4, 104, 30000.00, '2023-04-04', 15, 'Grupo D', 'Categoria D'),
(5, 4005, 'Cliente E', 5, 105, 25000.00, '2024-05-05', 90, 'Grupo E', 'Categoria E');

INSERT INTO Movimiento (ID_Fecha, ID_Producto_DWH, ID_proveedor_DWH, ID_cliente_DWH, ID_Tipo_transaccion_DWH, Cantidad) VALUES 
(20230101, 1, 1, 1, 1, 100.00),
(20230214, 2, 2, 2, 2, 200.00),
(20230315, 3, 3, 3, 3, 300.00),
(20230410, 4, 4, 4, 4, 400.00),
(20230521, 5, 5, 5, 5, 500.00);

-- Entregable SELECT
-- 
SELECT 
    Cantidad, 
    fechas.Fecha AS fecha,
    clientes.Nombre AS cliente, 
    proveedores.Nombre AS proveedor,
    transacciones.Tipo AS transaccion
FROM 
	Estudiante_8_202413.Movimiento AS movimientos,
    Estudiante_8_202413.Fecha AS fechas,
    Estudiante_8_202413.Cliente AS clientes, 
    Estudiante_8_202413.Proveedor AS proveedores, 
    Estudiante_8_202413.TipoTransaccion AS transacciones
WHERE 
    fechas.Fecha BETWEEN '2023-01-01' AND '2023-05-21' 
    AND movimientos.ID_Fecha = fechas.ID_Fecha
    AND movimientos.ID_cliente_DWH = clientes.ID_cliente_DWH
    AND movimientos.ID_proveedor_DWH = proveedores.ID_proveedor_DWH
    AND movimientos.ID_Tipo_transaccion_DWH = transacciones.ID_Tipo_transaccion_DWH;
