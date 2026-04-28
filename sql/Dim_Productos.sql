/*TABLA DE DIMENSION PRODCUTOS*/

/*---Sistema contpaqi comercial premium V 11.5.1----
Creado por Luis Ramos
Fecha de creación 16/04/2026*/

SELECT Pro.CIDPRODUCTO,Pro.CCODIGOPRODUCTO AS CodigoOriginal,
-- Lógica de limpieza para el Código del Producto (quita lo que esté después del '-')
LEFT(Pro.CCODIGOPRODUCTO, 
CASE WHEN CHARINDEX('-', Pro.CCODIGOPRODUCTO) > 0 THEN CHARINDEX('-', Pro.CCODIGOPRODUCTO) - 1 
ELSE LEN(Pro.CCODIGOPRODUCTO) END) AS Producto_Codigo,
    -- Lógica de limpieza para el Nombre (quita lo que esté después de la '/')
LEFT(Pro.CNOMBREPRODUCTO, 
CASE WHEN CHARINDEX('/', Pro.CNOMBREPRODUCTO) > 0 THEN CHARINDEX('/', Pro.CNOMBREPRODUCTO) - 1 
ELSE LEN(Pro.CNOMBREPRODUCTO) END) AS Producto_Nombre,
Uni.CIDUNIDAD,Uni.CNOMBREUNIDAD AS UnidadBase,Uni.CABREVIATURA AS UnidadAbreviada
FROM [dbo].[admProductos] AS Pro
INNER JOIN [dbo].[admUnidadesMedidaPeso] AS Uni ON Uni.CIDUNIDAD = Pro.CIDUNIDADBASE
