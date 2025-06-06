--EJERCICIO;
--1. REALIZAR EL TRIGGER PARA ACTUALIZAR Y PARA ELIMINAR EN LA MISMA BITACORA 
--HACER 5 PRUEBAS

--PRUEBA DE INSERCION
INSERT INTO COMPUTADORA VALUES(1, 'HP', 'PAVILION', 16, 'INTEL CORE i9 12th', 18000);
INSERT INTO COMPUTADORA VALUES(2, 'LENOVO', 'IDEAPAD 5', 16, 'AMD Ryzen 7 5800U', 16500);
INSERT INTO COMPUTADORA VALUES(3, 'ACER', 'ASPIRE 3', 8, 'Intel Core i5-1135G7', 9500);
INSERT INTO COMPUTADORA VALUES(4, 'DELL', '5570', 64, 'Intel Xeon W-11955M', 45000);
INSERT INTO COMPUTADORA VALUES(5, 'APPLE', 'MACBOOK AIR M2', 16, 'Apple M2', 23999);
INSERT INTO COMPUTADORA VALUES(6, 'ASUS', 'ROG G14', 32, 'AMD Ryzen 9 6900HS', 32900);
COMMIT;
--PRUEBA DE ACTUALIZACION
--PRUEBA DE ELIMINACION


--MOSTRAR INFORMACION
SELECT * FROM COMPUTADORA;
SELECT * FROM BIT_COMPUTADORA;

SELECT USER FROM DUAL;

--MUESTRA LA FECHA
SELECT SYSDATE FROM DUAL;

--MODIFICA EL FORMATO DE COMO SE MUESTRA LA FECHA
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';