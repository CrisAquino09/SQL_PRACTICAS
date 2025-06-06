--PROCEDIMIENTOS ALMACENADOS USANDO LA PRACTICA3(ALUMNO - BITACORA_ALUMNO)

CREATE TABLE ALUMNO_PRD(
    ID_ALUMNO NUMBER,
    NOMBRE NVARCHAR2(100),
    APELLIDO NVARCHAR2(100),
    EDAD NUMBER,
    CURSO NVARCHAR2(100),
    GRADO NUMBER,
    CONSTRAINT ALUMNO_PRD_PK PRIMARY KEY (ID_ALUMNO)
);

//INSERCION DE REGISTROS
INSERT INTO ALUMNO VALUES(1, 'LUIS', 'ANGEL', 22, 'CONTABILIDAD', 4);
INSERT INTO ALUMNO VALUES(2, 'DIANA', 'DIAZ', 24, 'ADMINISTRACION', 6);
INSERT INTO ALUMNO VALUES(3, 'KAREN', 'JIMENEZ', 22, 'ENFERMERIA', 4);
INSERT INTO ALUMNO VALUES(4, 'KAREN', 'JIMENEZ', 22, 'ENFERMERIA', 4);

--SENTENCIA INSERT INTO SELECT
--PROCEDIMIENTO ALMACENADO
CREATE OR REPLACE PROCEDURE PR_RESPALDO_ALUMNO
IS 
    --
BEGIN
    --LIMPIAR TABLA ANTES DE AGREGAR LOS REGISTROS PARA QUE NO HAYA CONFLICTOS DE PK
    DELETE FROM ALUMNO_PRD;
    
    INSERT INTO ALUMNO_PRD(ID_ALUMNO, NOMBRE, APELLIDO, EDAD, CURSO, GRADO)
    SELECT ID_ALUMNO, NOMBRE, APELLIDO, EDAD, CURSO, GRADO FROM ALUMNO;
END PR_RESPALDO_ALUMNO;
/

--EJECUTAR EL PROCEDIMIENTO ALMACENADO
EXECUTE PR_RESPALDO_ALUMNO;

DELETE FROM ALUMNO;
SELECT * FROM ALUMNO;
SELECT * FROM ALUMNO_PRD;