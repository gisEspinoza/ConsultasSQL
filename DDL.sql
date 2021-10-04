--consultar bases de datos del sistema
SELECT name
FROM master.sys.databases;

--consultar mediante procedimiento almacenado
EXEC sp_databases;

--crear bases de datos con T-SQL
CREATE DATABASE academic;


--renombrar la base de datos ALTER, solo se puede ejecutar cuando
--no esta en multi usuario
ALTER DATABASE academica MODIFY NAME= acad;


--borrar base de datos
DROP DATABASE IF EXISTS academic;


--CREATE SCHEMA
--son una coleccion de objetos de la base de datos
--se incluyen tablas, vistas, disparadores, procedimientos almacenados,etc
--un esquema se asocia a un nombre de usuario

--esquemas integrados en SQL Server: dbo, guest, sys

--esquema predeterminado para la base de datos es dbo
USE academica; --abre la conexion a la base de datos
CREATE SCHEMA registroAcademico;


--consultar esquemas de la base de datos actual
SELECT
	s.name AS "Nombre del esquema",
	u.name AS "Propietario del esquema"
FROM	
	sys.schemas s
INNER JOIN sys.sysusers u ON u.uid =s.principal_id;


--eliminar schema
DROP SCHEMA registroAcademico;


--CREAR OBJETOS PARA EL ESQUEMA
--- CREATE TABLE [SCHEMA].NOMBRETABLA ();
CREATE TABLE registroAcademico.alumno
(
	idAlumno integer NOT NULL,
	nombres varchar(20) NOT NULL,
	apellidos varchar(20) NOT NULL,
	edad integer NOT NULL
);
CREATE TABLE registroAcademico.inscripcion
(
	idInscripcion integer PRIMARY KEY NOT NULL,
	idAlumno integer NOT NULL
);


--agregar restricciones a los campos d ela tabla alumno
--primary key
ALTER TABLE registroAcademico.alumno
ADD CONSTRAINT pkIdAlumno PRIMARY KEY CLUSTERED(idAlumno);

---definir clave foranea en inscripcion
ALTER TABLE registroAcademico.inscripcion
ADD CONSTRAINT fkIdAlumno FOREIGN KEY(idAlumno) REFERENCES registroAcademico.alumno(idAlumno);


--agregar una columna ala tabla inscripcion
ALTER TABLE registroAcademico.inscripcion
ADD detalle VARCHAR(50);

--agregar campo con las restriccion UNIQUE a la tabla alumno
ALTER TABLE registroAcademico.alumno
ADD codCarnet VARCHAR(10) UNIQUE;