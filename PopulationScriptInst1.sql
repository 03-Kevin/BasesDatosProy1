USE DBDistributed;
GO

-- Poblamos Regiones (1-5)
INSERT INTO Regiones (RegionID, NombreRegion)
VALUES 
    (1, 'Norteamérica'),
    (2, 'Europa'),
    (3, 'Asia');
GO

-- Poblamos Usuarios (IDs 1-5000)
DECLARE @i INT = 1;

WHILE @i <= 3000
BEGIN
    INSERT INTO Usuarios (UsuarioID, Nombre, RegionID)
    VALUES (@i, CONCAT('Usuario_', @i), FLOOR(1 + RAND() * 3)); -- Asigna regiones 1-3 aleatoriamente
    SET @i = @i + 1;
END;

GO

-- Poblamos los primeros productos en Instancia 1
DECLARE @i INT = 1;

WHILE @i <= 300
BEGIN
    INSERT INTO Productos (ProductoID, Nombre, Descripcion, Precio)
    VALUES (@i, CONCAT('Producto_', @i), 'Descripción breve', FLOOR(10 + RAND() * 100)); -- Precio entre 10 y 110
    SET @i = @i + 1;
END;

GO

-- Poblamos Inventarios para Regiones 1-3
DECLARE @i INT = 1;

WHILE @i <= 2000
BEGIN
    INSERT INTO Inventarios (InventarioID, ProductoID, RegionID, Cantidad)
    VALUES (@i, FLOOR(1 + RAND() * 300), FLOOR(1 + RAND() * 3), FLOOR(1 + RAND() * 50)); -- Cantidad entre 1 y 50
    SET @i = @i + 1;
END;
GO


-- Poblamos PEDIDOS
DECLARE @i INT = 1;

WHILE @i <= 1500
BEGIN
    DECLARE @ProductoID INT = FLOOR(1 + RAND() * 300);
    DECLARE @UsuarioID INT = FLOOR(1 + RAND() * 3000);
    DECLARE @Cantidad INT = FLOOR(1 + RAND() * 5); -- Cantidad entre 1 y 5
    DECLARE @Precio DECIMAL(10, 2) = (SELECT Precio FROM Productos WHERE ProductoID = @ProductoID);
    DECLARE @Total DECIMAL(10, 2) = @Cantidad * @Precio;

    INSERT INTO Pedidos (PedidoID, UsuarioID, ProductoID, Cantidad, Total)
    VALUES (@i, @UsuarioID, @ProductoID, @Cantidad, @Total);

    SET @i = @i + 1;
END;

