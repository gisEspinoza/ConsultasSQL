USE academica;

SELECT * FROM registroAcademico.alumno;

SELECT * FROM registroAcademico.inscripcion;

INSERT INTO registroAcademico.alumno
VALUES (
	2, 'Camila', 'Fernandez', 25, 'SMIS0001'
);

INSERT INTO registroAcademico.inscripcion VALUES(2, 1, 'Inscripcion alumno Camila');

DELETE FROM registroAcademico.inscripcion WHERE idInscripcion=1;

UPDATE registroAcademico.inscripcion SET detalle='Alumno2' WHERE idInscripcion=2;


---ejemplos con insert
INSERT INTO registroAcademico.alumno(
	idAlumno, nombres, apellidos, edad, codCarnet
) OUTPUT inserted.nombres, inserted.apellidos  --muestra un salida despues de realizar una insercion
VALUES
(
	3, 'Fabian', 'Gonzalez', 22, 'SMIS00003'
);

--INSERTAR MULTIPLES REGISTROS
INSERT INTO registroAcademico.alumno(
	idAlumno, nombres, apellidos, edad, codCarnet
)
VALUES
(4, 'Camila', 'Salamanca', 21, 'SMIS00004'),
(5, 'Fredy', 'Cruz', 20, 'SMIS00005'),
(6, 'Jose', 'Perez', 19, 'SMIS00006')


CREATE TABLE registroAcademico.alumnos(idAlumno int, nombres varchar(20), apellidos varchar(20));


SELECT * FROM registroAcademico.alumnos;

--poblar datos en tabla alumnos a partir de tabla alumno
INSERT INTO registroAcademico.alumnos(idAlumno, nombres, apellidos)
SELECT
	idAlumno, nombres, apellidos
FROM 
	registroAcademico.alumno
WHERE idAlumno=6;


--insertar 3 registros
INSERT TOP(3) INTO registroAcademico.alumnos(idAlumno, nombres, apellidos)
SELECT
	idAlumno, nombres, apellidos
FROM 
	registroAcademico.alumno;