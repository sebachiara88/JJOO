--Data Set URL: https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results

--Skills utilizados: SELECT, FROM, WHERE, COUNT, GROUP BY, ORDER BY, AND, CASE WHEN, TOP, SUBQUERY, IN, TRIM

--Data Set

SELECT *
FROM PortfolioProjects..juegos_olimpicos
ORDER BY Year


--Cantidad total de paises, atletas, y deportes por tipo de juego olimpico

SELECT Season, COUNT(DISTINCT NOC) AS Paises, COUNT(DISTINCT Name) as Deportistas, COUNT(DISTINCT Sport) AS Deporte
FROM PortfolioProjects..juegos_olimpicos
GROUP BY Season


--Filtrado por Argentina y columna de Medallas que no tenga valores nulos

SELECT *
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina' AND NOT Medal = 'NA'
AND Medal IS NOT NULL
ORDER BY Name


--Conteo total de medallas para ARG

SELECT Team, Medal, COUNT(Medal) AS Total_Medallas
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina' AND NOT Medal = 'NA'
GROUP BY Team, Medal, Medal;


--Cantidad total de atletas por Sexo

SELECT Team, Sex AS Sexo, COUNT(Sex) AS Cantidad_Participantes
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina'
GROUP BY Team, Sex;


--Conteo por tipo de medalla para ARG y sexo de participantes

SELECT Team, Sex, Medal, COUNT(Medal) AS Medallero
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina' AND NOT Medal = 'NA'
GROUP BY Team, Sex, Sex, Medal, Medal;


--Medallas por deporte y año. Utilize un CASE WHEN para que el resultado del COUNT no traiga como resultado la suma de total de medallas equivalente al total de jugadores de un deporte

SELECT Team, Year, Sport, Event, Medal,
CASE WHEN COUNT(Medal) > 1 Then 1
ELSE 1
END AS Cantidad_Medallas
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina' AND NOT Medal = 'NA'
GROUP BY Team, Year, Sport, Event, Medal, Medal
ORDER BY Year;


--Top 10 Deportistas argentinos con mas medallas

SELECT TOP 10 Name, Sport, Medal, COUNT(Medal) as Cantidad_Medallas
FROM PortfolioProjects..juegos_olimpicos
WHERE Team = 'Argentina' AND NOT Medal = 'NA'
GROUP BY Name, Sport, Medal
ORDER BY COUNT(Medal) DESC


--Practica de Subquery, mediante la seleccion de atletas con edad entre 18 y 30 años, y que edad tenian al participar en cada JJOO

SELECT ID, TRIM(Name) AS Name, Age, Games 
FROM PortfolioProjects..juegos_olimpicos
WHERE Age IN (SELECT Age 
FROM PortfolioProjects..juegos_olimpicos
Where Age BETWEEN 18 AND 30)
GROUP BY ID, Name, Age, Games
ORDER BY Name