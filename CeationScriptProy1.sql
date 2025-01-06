CREATE DATABASE DBDistributed;
GO

USE DBDistributed;
GO

CREATE TABLE Regiones (
    RegionID INT PRIMARY KEY,
    NombreRegion NVARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    RegionID INT NOT NULL,
    FOREIGN KEY (RegionID) REFERENCES Regiones(RegionID)
);

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Inventarios (
    InventarioID INT PRIMARY KEY,
    ProductoID INT NOT NULL,
    RegionID INT NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (RegionID) REFERENCES Regiones(RegionID)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    UsuarioID INT NOT NULL,
    ProductoID INT NOT NULL,
    FechaPedido DATETIME NOT NULL DEFAULT GETDATE(),
    Cantidad INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO