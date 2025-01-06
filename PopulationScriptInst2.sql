USE DBDistributed;
GO

-- Poblamos Regiones (1-5)
INSERT INTO Regiones (RegionID, NombreRegion)
VALUES 
    (4, 'Oceanía'),
    (5, 'África');
GO

-- Poblamos Usuarios (IDs 1-5000)
DECLARE @i INT = 1;

WHILE @i <= 3000
BEGIN
    INSERT INTO Usuarios (UsuarioID, Correo)
    VALUES (@i, CONCAT('usuario_', @i, '@example.com'));
    SET @i = @i + 1;
END;
GO

-- Poblamos los primeros productos en Instancia 1
DECLARE @i INT = 301;

WHILE @i <= 500
BEGIN
    INSERT INTO Productos (ProductoID, Nombre, Descripcion, Precio)
    VALUES (@i, CONCAT('Producto_', @i), 'Descripción para Instancia 2', FLOOR(10 + RAND() * 100)); -- Precio entre 10 y 110
    SET @i = @i + 1;
END;

GO

-- Poblamos Inventarios para Regiones 4-5
DECLARE @i INT = 2001;

WHILE @i <= 3500
BEGIN
    INSERT INTO Inventarios (InventarioID, ProductoID, RegionID, Cantidad)
    VALUES (@i, FLOOR(301 + RAND() * 200), FLOOR(4 + RAND() * 2), FLOOR(1 + RAND() * 50)); -- Cantidad entre 1 y 50
    SET @i = @i + 1;
END;
GO


-- Poblamos PEDIDOS
DECLARE @i INT = 1;

WHILE @i <= 1000
BEGIN
    DECLARE @ProductoID INT = FLOOR(301 + RAND() * 200);
    DECLARE @UsuarioID INT = FLOOR(1 + RAND() * 3000);
    DECLARE @Cantidad INT = FLOOR(1 + RAND() * 5); -- Cantidad entre 1 y 5
    DECLARE @Precio DECIMAL(10, 2) = (SELECT Precio FROM Productos WHERE ProductoID = @ProductoID);
    DECLARE @Total DECIMAL(10, 2) = @Cantidad * @Precio;

    INSERT INTO Pedidos (PedidoID, UsuarioID, ProductoID, Cantidad, Total)
    VALUES (@i, @UsuarioID, @ProductoID, @Cantidad, @Total);

    SET @i = @i + 1;
END;


