USE academica;

--el campo idPago es un campo IDENTITY(valor auto incrementable), lo que indica que es un valor
--auto incrementable
INSERT INTO colecturia.pago(idAlumno, total) VALUES(1,22.50);

SELECT * FROM colecturia.pago;

--permitir insertar sobre columnas cuyo valor es identity/autoincrememtable
SET IDENTITY_INSERT colecturia.pago ON;
INSERT INTO colecturia.pago(idPago, idAlumno, total) VALUES(24,2,150);

SET IDENTITY_INSERT colecturia.pago OFF;--deshabilitar la insercion para campo identity

INSERT INTO colecturia.pago(idAlumno, total) VALUES(5,50);

DELETE FROM colecturia.pago WHERE idPago=26;



