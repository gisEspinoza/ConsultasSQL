SELECT
	s.name,
	u.name
FROM
	sys.schemas s
INNER JOIN sys.sysusers u ON u.uid = s.principal_id;


USE academica;
CREATE SCHEMA colecturia; 

DROP SCHEMA contabilidad; --elimina un esquema


--CREAR LOS INICIOS DE SESION PARA NUESTRA BASE DE DATOS
--login me permite establecer conexion a una de instancia de SQL
CREATE LOGIN AsistenteAcademica WITH PASSWORD='ugb2020';
CREATE LOGIN EncargadaColecturia WITH PASSWORD='ugb2020';


--CREACION DE USUARIOS PARA LA BASE DE DATOS
-- CREATE USER nombreUsuario FOR LOGIN loginAsignado WITH DEFAULT_SCHEMA= nombreEsquema
CREATE USER gisela FOR LOGIN AsistenteAcademica WITH DEFAULT_SCHEMA=registroAcademico;
CREATE USER gis FOR LOGIN EncargadaColecturia WITH DEFAULT_SCHEMA=colecturia;


--crear tabla en esquema colecturia
CREATE TABLE colecturia.pago (idPago int IDENTITY(1,1) NOT NULL, idAlumno int, total money );



--EL PERMISO ASIGNADO AL ESQUEMA, SE ASIGNARA A TODOS LOS OBJETOS
--DE LA BASE DE DATOS CORRESPONDIENTE AL ESQUEMA
--asignando permisos sobre los esquemas
GRANT SELECT
ON SCHEMA::registroAcademico
TO gisela WITH GRANT OPTION;

GRANT DELETE
ON SCHEMA::registroAcademico TO gisela WITH GRANT OPTION;

--PERMISOS INDIVIDUALES A LOS OBJETOS DE LA BASE DE DATOS QUE CORRESPONDEN
--AL ESQUEMA
--asignar permiso de insercion sobre tabla alumno, 
GRANT INSERT ON OBJECT::registroAcademico.alumno TO gisela;
GRANT INSERT ON OBJECT::registroAcademico.inscripcion TO gisela;
GRANT UPDATE ON OBJECT::registroAcademico.inscripcion TO gisela;

--REVOCAR PERMISOS
REVOKE DELETE ON SCHEMA::registroAcademico TO gisela CASCADE;

REVOKE INSERT ON OBJECT::registroAcademico.alumno TO gisela CASCADE;

--asignar permisos de creacion de tabla a la base de datos
GRANT CREATE TABLE TO gisela;
GRANT ALTER, INSERT ON SCHEMA::registroAcademico TO gisela;


--asginar permisos a esquema colecturia al usuario gisela
GRANT SELECT, INSERT, UPDATE, DELETE
ON SCHEMA::colecturia TO gis;

GRANT INSERT ON OBJECT::colecturia.pago TO gis;
GRANT ALTER, INSERT ON SCHEMA::colecturia TO gis;

--chequear el valor identity de la tabla pago
DBCC CHECKIDENT('colecturia.pago');

--reset del identity
DBCC CHECKIDENT('colecturia.pago', RESEED,1);
