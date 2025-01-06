USE DBDistributed;
GO
-- fragmentacion horizontal en los registros de inventarios
SELECT * FROM Inventarios
UNION ALL
SELECT * FROM [DESKTOP-AR6DVUB\INSTANCIA1].DBDistributed.dbo.Inventarios

-- fragmentacion vertical en los registros de Usuarios
SELECT u.UsuarioID, u.Nombre, c.Correo, u.RegionID
FROM DBDistributed.dbo.Usuarios as u 
JOIN [DESKTOP-AR6DVUB\INSTANCIA1].DBDistributed.dbo.Usuarios as c 
ON u.UsuarioID = c.UsuarioID;
