-- TIENDA
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
-- 4
SELECT p.nombre,
p.precio precioEuros,
(precio*1.14) precioDolares
FROM producto p;
-- 5
SELECT p.nombre nombreProducto,
p.precio Euros,
(precio*1.14) Dolares
FROM producto p;

SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
-- 8
SELECT nombre,
	LEFT(UPPER(nombre),2) as resultado
    FROM fabricante;
-- 9
SELECT nombre,
	ROUND(precio) as redondeado
	FROM producto;
-- 10
SELECT nombre,
	TRUNCATE(precio,0) as truncado
	FROM producto;
-- 11
SELECT f.codigo
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante;
-- 12
SELECT DISTINCT f.codigo
FROM producto as p
INNER JOIN fabricante as f
ON f.codigo = p.codigo_fabricante;
-- 13
SELECT nombre
FROM fabricante
ORDER BY nombre;
-- 14
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;
-- 15
SELECT nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;
-- 16
SELECT *
FROM fabricante
LIMIT 5;
-- 17
SELECT *
FROM fabricante
LIMIT 3,2;
-- 18
SELECT nombre,
precio
FROM producto
ORDER BY precio ASC
LIMIT 1;
-- 19
SELECT nombre,
precio
FROM producto
ORDER BY precio DESC
LIMIT 1;
-- 20
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;
-- 21
SELECT p.nombre as nombreProducto,
p.precio as precio,
f.nombre as nombrefabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;
-- 22
SELECT p.nombre as nombreProducto,
p.precio as precio,
f.nombre as nombrefabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY nombreFabricante;
-- 23
SELECT p.codigo as codigoProducto,
p.nombre as nombreProducto,
f.codigo as codigoFabricante,
f.nombre as nombreFabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;
-- 24
SELECT p.nombre as nombreProducto,
p.precio as precio,
f.nombre as nombrefabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY precio
LIMIT 1;
-- 25
SELECT p.nombre as nombreProducto,
p.precio as precio,
f.nombre as nombrefabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
ORDER BY precio DESC
LIMIT 1;
-- 26
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';
-- 27
SELECT p.nombre, 
p.precio
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' and p.precio > 200;
-- 28
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29
SELECT p.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30
SELECT p.nombre, 
p.precio,
f.nombre as nombreFabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';
-- 31
SELECT p.nombre, 
p.precio,
f.nombre as nombreFabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';
-- 32
SELECT p.nombre as nombreProducto, 
p.precio,
f.nombre as nombreFabricante
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre;
-- 33
SELECT f.codigo,
f.nombre
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;
-- 34
SELECT f.nombre as nombreFabricante,
p.nombre as nombreProducto
FROM producto as p
RIGHT JOIN fabricante as f
ON p.codigo_fabricante = f.codigo;
-- 35

SELECT f.nombre as nombreFabricante,
p.nombre as nombreProducto
FROM producto as p
RIGHT JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE p.nombre IS NULL;
-- 36
SELECT p.nombre as nombreProducto,
f.nombre as nombreFabricante
FROM producto as p
LEFT JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';
-- 37
-- 38
SELECT p.nombre as nombreProducto,
f.nombre as nombreFabricante,
p.precio
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio DESC
LIMIT 1;
-- 39
SELECT p.nombre as nombreProducto,
f.nombre as nombreFabricante,
p.precio
FROM producto as p
INNER JOIN fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo'
ORDER BY p.precio = 'Hewlett-Packard'
LIMIT 1;
-- 40
SELECT p.nombre
FROM producto p
INNER JOIN fabricante f
ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Lenovo' 
ORDER BY p.precio DESC
LIMIT 1;
-- 41
