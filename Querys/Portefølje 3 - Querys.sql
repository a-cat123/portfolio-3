-- 1
SELECT Name, Population
FROM country
WHERE Population > (SELECT AVG(Population) FROM country);
-- 2
SELECT cl.Language, SUM(c.Population * (cl.Percentage / 100)) AS TotalSpeakers
FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
GROUP BY cl.Language
ORDER BY TotalSpeakers DESC
LIMIT 5;
-- 3
SELECT Name, Population, SurfaceArea, (Population / SurfaceArea) AS PopulationDensity
FROM country
WHERE SurfaceArea > 0;
-- 4
SELECT country.Name
FROM country
LEFT JOIN city ON country.Code = city.CountryCode
WHERE city.ID IS NULL;
-- 5
SELECT Continent, AVG(LifeExpectancy) AS AverageLifeExpectancy
FROM country
GROUP BY Continent;
-- 6 
SELECT city.Name AS City, country.Name AS Country, country.Population AS CountryPopulation
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.Population BETWEEN 
    (SELECT Population * 0.9 FROM country WHERE Name = 'Japan') 
    AND 
    (SELECT Population * 1.1 FROM country WHERE Name = 'Japan');
-- 7
SELECT Name, GNP, RANK() OVER (ORDER BY GNP DESC) AS Rank
FROM country
WHERE GNP IS NOT NULL
ORDER BY GNP DESC;
-- 9
SELECT Language, COUNT(DISTINCT CountryCode) AS CountryCount
FROM countrylanguage
GROUP BY Language
ORDER BY CountryCount DESC;

-- 10 
SELECT city.Name AS City, country.Name AS Country, city.Population AS CityPopulation, AVG(city.Population) OVER (PARTITION BY city.CountryCode) AS AvgCountryPopulation
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE city.Population > (SELECT AVG(c.Population) 
                         FROM city c 
                         WHERE c.CountryCode = city.CountryCode);