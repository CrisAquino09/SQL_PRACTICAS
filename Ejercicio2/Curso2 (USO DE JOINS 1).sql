--USO DE JOINS

--CREACION DE LAS ENTIDADES PADRE E HIJO

CREATE TABLE PADRE(
    ID_PADRE NUMBER,
    NOMBRE NVARCHAR2(100),
    APELLIDO NVARCHAR2(100),
    EDAD NUMBER,
    TRABAJO NVARCHAR2(100),
    CONSTRAINT PADRE_PK PRIMARY KEY(ID_PADRE)
);

CREATE TABLE HIJO(
    ID_HIJO NUMBER,
    NOMBRE NVARCHAR2(100),
    APELLIDO NVARCHAR2(100),
    EDAD NUMBER,
    HOBBIE NVARCHAR2(100),
    PADRE_ID NUMBER,
    CONSTRAINT HIJO_PK PRIMARY KEY(ID_HIJO),
    CONSTRAINT PADRE_FK FOREIGN KEY (PADRE_ID) REFERENCES PADRE(ID_PADRE)
//CONSTRAINT PALABRA_RESERVADA + NOMBRE DE CONSTAINT (UNICO + TIPO DE CONSTRAINT + CAMPO QUE SERA LA CLAVE FORMANEA + REFERENCES PAPLABA RESERVADA
//EL NOMBRE DE LA TABLA + EL ID AL QUE SE HACE REFERENCIA DE LA TABLA PADRE)  
);

INSERT INTO PADRE VALUES(1, 'RICARDO', 'GONZALES',52, 'DOCENTE');
INSERT INTO PADRE VALUES(2, NULL, 'HUERTA', 0, NULL);
INSERT INTO PADRE VALUES(3, 'MIGUEL', 'MARTINEZ',51, 'PINTOR');
INSERT INTO PADRE VALUES(4, 'ABEL', 'SANTIAGO',56, 'AGRICULTOR');
INSERT INTO PADRE VALUES(5, 'LUIS', 'JIMENEZ',48, 'ARQUITECTO');
INSERT INTO PADRE VALUES(6, 'JESUS', 'SANCHEZ', 43, 'DOCTOR');
INSERT INTO PADRE VALUES(7, 'ARTURO', 'ROJO', 29, 'MAESTRO');
INSERT INTO PADRE VALUES(8, 'JAREDT', 'TORRES', 32, 'PLOMERO');
INSERT INTO PADRE VALUES(9, 'MARÍA', 'PÉREZ', 48, 'ENFERMERA');
INSERT INTO PADRE VALUES(10, 'LUIS', 'MARTÍNEZ', 55, 'INGENIERO');
INSERT INTO PADRE VALUES(11, 'ANA', 'LOPEZ', 50, 'ABOGADA');
COMMIT;

INSERT INTO HIJO VALUES(1, 'ABEL', 'GONZALES', 12, 'JUGAR FUTBOL', 1);
INSERT INTO HIJO VALUES(2, 'DANIELA', NULL, 20, NULL, NULL);
INSERT INTO HIJO VALUES(3, 'JUAN', 'MATUS', 10, 'DIBUJAR', 2);
INSERT INTO HIJO VALUES(4, 'ITZEL', 'LOPEZ', 16, 'VIDEOJUEGOS', 4);
INSERT INTO HIJO VALUES(5, 'KARLA', 'AQUINO', 14, 'CANTAR', 1);
INSERT INTO HIJO VALUES(6, 'LUCÍA', 'PÉREZ', 10, 'DIBUJAR', 2);
INSERT INTO HIJO VALUES(7, 'MATEO', 'MARTÍNEZ', 14, 'LEER LIBROS', 3);
INSERT INTO HIJO VALUES(8, 'SOFÍA', 'LOPEZ', 11, 'BAILAR', 4);
INSERT INTO HIJO VALUES(9, 'ARMANDO', 'SANCHEZ', 15, 'GIMNASIO',3);
INSERT INTO HIJO VALUES(10, 'ANGELICA', 'PEREZ', 10, 'COCINAR',9);
INSERT INTO HIJO VALUES(11, 'MICHELLE', 'LOPEZ', 18, 'VER SERIES',11);
COMMIT;


SELECT * FROM PADRE;
SELECT * FROM HIJO;

--USO DE INNER JOIN:
--DEVUELVE REGISTROS QUE TIENEN VALORES COINCIDENTES EN AMBAS TABLAS
SELECT * FROM HIJO H
    INNER JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE;
    
--USO DE LEFT JOIN
--DEVUELVE TODOS LOS EGISTROS DE LA TABLA IZQUIERDA (HIJO)Y LOS REGISTROS COINCIDENTES
--CON LA TABLA DERECHA(PADRE)
SELECT * FROM HIJO H
    LEFT JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE;

SELECT * FROM PADRE P
    LEFT JOIN HIJO H
    ON H.PADRE_ID = P.ID_PADRE;
    
--USO DE LEFT JOIN QUITANDO COINCIDENCIAS
SELECT * FROM HIJO H
    LEFT JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE
    WHERE H.PADRE_ID IS NULL;
    
--USO DE RIGHT JOIN DEVUELVE TODOS LOS REGISTROS DE LA TABLA DERECHA (PADRE) Y LOS REGISTOS COINCIDENTES DE LA TABLA IZQUIERDA (HIJO)
SELECT * FROM HIJO H
    RIGHT JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE;
    
--USO DE RIGTH JOIN SIN COINCIDENCIAS
SELECT * FROM HIJO H
    RIGHT JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE
    WHERE H.PADRE_ID IS NULL;
    
--USO DEL FULL JOIN:
--DEVUELVE TODOS LOS REGISTROS HAY UNA COINCIDENCIA EN LA TABLA IZQUIERDA O DERECHA
SELECT * FROM HIJO H
    FULL JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE;
    
--USO DE FULL JOIN SIN COINCIDENCIAS
SELECT * FROM HIJO H
    FULL JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE
    WHERE H.PADRE_ID IS NOT NULL;
    
SELECT * FROM HIJO H
    FULL JOIN PADRE P
    ON H.PADRE_ID = P.ID_PADRE
    WHERE P.ID_PADRE IS NULL;