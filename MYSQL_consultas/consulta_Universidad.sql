-- UNIVERSIDAD
-- 1
SELECT p.apellido1,
p.apellido2,
p.nombre
FROM persona as p
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, p.nombre;
-- 2
SELECT p.nombre,
p.apellido1,
p.apellido2
FROM persona as p
WHERE tipo = 'alumno' and p.telefono IS NULL;
-- 3
SELECT p.nombre,
p.apellido1,
p.apellido2
FROM persona as p
WHERE tipo = 'alumno' AND p.fecha_nacimiento >= '1999/01/01' AND p.fecha_nacimiento <= '1999/12/31';
-- 4
SELECT p.nombre,
p.apellido1,
p.apellido2
FROM persona as p
WHERE tipo = 'profesor' AND telefono IS NULL AND p.nif LIKE '%k';
-- 5
SELECT *
FROM asignatura p
WHERE p.cuatrimestre = 1 AND p.id_grado= 7 AND p.curso = 3;
-- 6
SELECT p.apellido1,
p.apellido2,
p.nombre as nombreProfesor,
d.nombre as nombreDepartamento
FROM profesor as pr
INNER JOIN persona as p
ON p.id = pr.id_profesor
INNER JOIN departamento as d
ON d.id = pr.id_profesor
ORDER BY p.apellido1, p.apellido2, p.nombre;
-- 7
SELECT a.nombre,
ce.anyo_inicio,
ce.anyo_fin
FROM asignatura as a
INNER JOIN alumno_se_matricula_asignatura as al
ON a.id = al.id_asignatura
INNER JOIN persona as p
ON p.id = al.id_alumno
INNER JOIN curso_escolar as ce
ON al.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';
-- 8

SELECT DISTINCT de.nombre
FROM persona as p
JOIN profesor as pr
	ON p.id = pr.id_profesor
JOIN asignatura a
	ON pr.id_profesor = a.id_profesor
JOIN grado g
	ON a.id_grado = g.id
JOIN departamento de
	ON pr.id_departamento = de.id
WHERE g.nombre REGEXP 'Informática';

-- 9
SELECT DISTINCT p.nombre
FROM persona p
INNER JOIN alumno_se_matricula_asignatura as al
ON al.id_alumno = p.id
INNER JOIN asignatura as a
ON al.id_asignatura = a.id
INNER JOIN curso_escolar as c
ON al.id_curso_escolar = c.id
WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019 AND p.tipo = 'alumno';

-- 1
SELECT d.nombre,
p.apellido1,
p.apellido2,
p.nombre
FROM profesor as pr
LEFT JOIN persona as p
ON p.id = pr.id_profesor
RIGHT JOIN departamento as d
ON pr.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 2
SELECT *
FROM profesor pr
INNER JOIN persona p
ON pr.id_profesor = p.id
LEFT JOIN departamento de
ON pr.id_profesor = de.id
WHERE p.tipo = 'profesor' and de.id IS NULL;
-- 3
SELECT de.nombre
FROM departamento de
LEFT JOIN profesor pr
ON de.id = pr.id_departamento
WHERE pr.id_departamento IS NULL;
-- 4
SELECT p.nombre,
p.apellido1,
p.apellido2
FROM profesor pr
INNER JOIN persona p
ON p.id = pr.id_profesor
LEFT JOIN asignatura a
ON pr.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;
-- 5
SELECT a.nombre
FROM asignatura a
LEFT JOIN profesor pr
ON pr.id_profesor = a.id
WHERE a.id_profesor IS NULL;
-- 6
-- 1
SELECT count(id) id_alumno
FROM persona p
WHERE p.tipo = 'alumno';
-- 2
SELECT COUNT(id) id_alumno
FROM persona p 
WHERE p.tipo = 'alumno' 
AND p.fecha_nacimiento >= '1999/01/01' AND p.fecha_nacimiento <= '1999/12/31';
-- 3
SELECT de.nombre,
count(p.nombre) nombreProfe
FROM persona p
INNER JOIN profesor pr
ON p.id = pr.id_profesor
INNER JOIN departamento de
ON de.id = pr.id_departamento
GROUP BY de.nombre
ORDER BY nombreProfe DESC;

-- 4
SELECT de.nombre,
count(p.nombre) total
FROM persona p
INNER JOIN profesor pr
ON p.id = pr.id_profesor
RIGHT JOIN departamento de
ON de.id = pr.id_departamento
GROUP BY de.nombre
ORDER BY total DESC;
-- 5
SELECT g.nombre,
count(a.nombre) totalAsig
FROM grado g
LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY a.nombre 
ORDER BY totalAsig DESC;
-- 6
SELECT g.nombre,
count(a.nombre) totalAsig
FROM grado g
LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.nombre
HAVING totalAsig > 40;
-- 7
SELECT g.nombre,
a.tipo,
SUM(a.creditos) sumaCreditos
FROM grado g
INNER JOIN asignatura a
ON g.id = a.id_grado
GROUP BY a.tipo, g.nombre
ORDER BY sumaCreditos;
-- 8
SELECT c.anyo_inicio,
COUNT(p.id) alumnosMatricu
FROM persona p
INNER JOIN alumno_se_matricula_asignatura al
ON p.id = al.id_alumno
INNER JOIN curso_escolar c
ON c.id = al.id_curso_escolar
GROUP BY c.anyo_inicio;
-- 9
SELECT p.id,
p.nombre,
p.apellido1,
p.apellido2,
COUNT(a.nombre) nombreAsignatura
FROM persona p
INNER JOIN profesor pr
ON p.id = pr.id_profesor
LEFT JOIN asignatura a
ON pr.id_profesor = a.id_profesor
GROUP BY pr.id_profesor
ORDER BY nombreAsignatura DESC;
-- 10
SELECT *
FROM persona p
WHERE p.tipo = 'alumno' 
ORDER BY fecha_nacimiento DESC
LIMIT 1;
-- 11
SELECT p.nombre
FROM persona p
INNER JOIN profesor pr
ON p.id = pr.id_profesor
INNER JOIN departamento de
ON de.id = pr.id_departamento
LEFT JOIN asignatura a
ON pr.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

