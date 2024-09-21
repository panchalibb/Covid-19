select * from covid;

--1
SELECT Country,Confirmed, Deaths, (Deaths * 1.0 /Confirmed) * 100 as mortality_rate
FROM covid
WHERE Country is not NULL
order by 1,2;

--2

SELECT Country,Confirmed, Recovered, (Recovered * 1.0 /Confirmed) * 100 as PercentRecoveredCases
FROM covid
WHERE Country is not NULL
order by 1,2;

--3

SELECT Country, Max(Confirmed) as highestInfectionCount
FROM covid
WHERE Country is not NULL
Group by Country
order by max(Confirmed) desc;


--4

SELECT Country, Max(Deaths) as highestInfectionCount
FROM covid
WHERE Country is not NULL
Group by Country
order by max(Deaths) desc;

--5

SELECT 
  Country, 
  SUM(Confirmed) AS Confirmed, 
  SUM(Active) AS Active, 
  SUM(New_cases) AS New_cases, 
  SUM(Active + New_cases) AS total_cases
FROM covid
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY total_cases DESC;
