//TRIGER SENTENCIA
DELETE FROM BIT_ALUMNO;
DELETE FROM ALUMNO;

CREATE OR REPLACE TRIGGER TR_I_U_D_ALUMNO
AFTER INSERT OR UPDATE OR DELETE ON ALUMNO
DECLARE
    LV_ID_BIT NUMBER;
    LV_USUARIO NVARCHAR2(100);
    LV_FECHA DATE;
    LV_MOV NVARCHAR2(100);
BEGIN
    --RECUPERAR ID
    SELECT S_ID_BIT_ALUMNO.NEXTVAL, USER, SYSDATE INTO LV_ID_BIT, LV_USUARIO, LV_FECHA FROM DUAL;
    
    IF INSERTING THEN
        LV_MOV := 'INSERT';
    ELSIF UPDATING THEN
        LV_MOV := 'UPDATE';
    ELSIF DELETING THEN
        LV_MOV := 'DELETE';
    END IF;    
    INSERT INTO BIT_ALUMNO (ID_BIT_ALUMNO, USUARIO, FECHA_MOV, MOVIMIENTO)
    VALUES(LV_ID_BIT, LV_USUARIO, LV_FECHA, LV_MOV);
END TR_I_U_D_ALUMNO;
/

//INSERTAR
INSERT INTO ALUMNO VALUES(1, 'JUAN', 'JIMENEZ', 22, 'CONTABILIDAD', 4);
INSERT INTO ALUMNO VALUES(2, 'CARLOS', 'VICENTE', 24, 'ADMINISTRACION', 6);
COMMIT;

//ACTUALIZAR
UPDATE ALUMNO SET EDAD= 26 WHERE ID_ALUMNO =1;
COMMIT;

//ELIMINAR
DELETE FROM ALUMNO WHERE ID_ALUMNO > 1;
COMMIT;

SELECT S_ID_BIT_ALUMNO.NEXTVAL FROM DUAL;
SELECT * FROM ALUMNO;
SELECT * FROM BIT_ALUMNO;

SELECT ID_BIT_ALUMNO, USUARIO, FECHA_MOV, MOVIMIENTO FROM BIT_ALUMNO;
