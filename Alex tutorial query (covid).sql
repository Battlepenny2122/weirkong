SELECT *
FROM dbo.CovidDeaths$
ORDER BY location, date;

--SELECT *
--FROM dbo.CovidVaccinations$
--ORDER BY location, date;

--SELECT location, date, total_cases, new_cases, total_deaths, population
--FROM DBO.CovidDeaths$
--ORDER BY location, date;



-- Looking at Total cases vs Total deaths
-- Shows likeligood of dying if you contract covid in your country
-- Below is trimming total deaths 



--UPDATE dbo.CovidDeaths$
--SET total_deaths = trim(total_deaths);

--SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
--FROM DBO.CovidDeaths$
--WHERE location = 'Australia'
--ORDER BY location, date DESC;


--Looking at Total Cases vs Population
-- shows what percentage of population got COVID

--SELECT location, date, total_cases, population, (total_cases/population)*100 AS Population_infected
--FROM DBO.CovidDeaths$
--WHERE location = 'Australia'
--ORDER BY location, date DESC;


-- Looking at Countries with Highest Infection Rate compared to Population
--SELECT location, 
--population, 
--max(total_cases) AS Highest_Infection_Count, 
--max((total_cases/population)*100) AS Percent_Population_infected
--FROM dbo.CovidDeaths$
----WHERE location = 'Australia'
--GROUP BY location, population
--ORDER BY Percent_Population_infected DESC

-- Looking at countries with the highest death rate - HIGHEST DEATH RATES BY COUNTRY

--SELECT 
--location, -- issue here is that there is high income, continents, world etc
--max(CAST(total_deaths AS int)) AS Total_Death_Count,
--max((total_deaths/population)*100) AS Percent_Population_Deaths
--FROM DBO.CovidDeaths$
----WHERE location = 'Australia'
--GROUP BY location
--ORDER BY Total_Death_Count DESC

-- Exploring the data, we notice that some of the data has the continent within the location, lets get get rid of it as below (COPY WHERE STATEMENT 'WHERE continent is not null')

--SELECT 
--location, 
--max(CAST(total_deaths AS int)) AS Total_Death_Count,
--max((total_deaths/population)*100) AS Percent_Population_Deaths
--FROM DBO.CovidDeaths$
--WHERE continent is not null
--GROUP BY location
--ORDER BY Total_Death_Count DESC



-- NOW LETS FILTER continent(had to add the not like function otherwise the upper/mid/lower income rows come up)- HIGHEST DEATH RATES BY CONTINENT
--SELECT 
--location,
--max(CAST(total_deaths AS int)) AS Total_Death_Count,
--max((total_deaths/population)*100) AS Percent_Population_Deaths
--FROM DBO.CovidDeaths$
--WHERE continent is null AND location NOT LIKE '%income%'
--GROUP BY location
--ORDER BY Total_Death_Count DESC



-- what you can consider is doing the death rates sumary for each country in a continent so when in tableau, you can "drill down" the information e.g. Oceania --> Australia + NZ + Fiji etc


-- NOW LETS FIND total deaths in the world and its death percentage
--SELECT 
--location,
--max(CAST(total_deaths AS int)) AS Total_Death_Count,
--max((total_deaths/population)*100) AS Percent_Population_Deaths
--FROM DBO.CovidDeaths$
--WHERE location = 'world'
--GROUP BY location
--ORDER BY Total_Death_Count DESC

--SELECT
--sum(cast(new_deaths AS INT))
--from DBO.CovidDeaths$
--WHERE continent is null AND location = (