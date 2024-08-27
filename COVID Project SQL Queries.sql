
--4 QUERIES USED FOR COVID TABLEAU PROJECT


--1. Global Numbers

SELECT SUM(new_cases) AS Total_Cases,SUM(CAST(new_deaths AS BIGINT)) AS Total_Deaths, SUM(CAST(new_deaths AS BIGINT))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 1,2


--2. Total Deaths Per Continent

--Total Death Counts by Continent

SELECT location,SUM(CAST(new_deaths AS BIGINT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
--WHERE location NOT LIKE '%states%'
WHERE continent IS NULL
AND location NOT IN ('World','European Union','International')
AND location NOT LIKE ('%income%')
GROUP BY location
ORDER BY TotalDeathCount DESC


--3. Percent Population Infected Per Country Map

--Looking at countries with highest infection rate compared to population

SELECT location,population,MAX(total_cases) AS HighestInfectionCount,MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE location NOT LIKE '%income%'
GROUP BY location,population
ORDER BY PercentPopulationInfected DESC


--4. Percent Population Infected by Date

SELECT location,population,date,MAX(CAST(total_cases AS BIGINT)) AS HighestInfectionCount,MAX(CAST(total_cases AS BIGINT)/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World','European Union','International')
AND location NOT LIKE ('%income%')
GROUP BY location,population,date
ORDER BY PercentPopulationInfected DESC


--5. Total Cases and Total Deaths by Country

SELECT location,population,date,SUM(CAST(new_deaths AS INT)) AS TotalDeathCount, SUM(CAST(new_cases AS INT)) AS InfectionCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
AND location NOT IN ('World','European Union','International')
AND location NOT LIKE ('%income%')
GROUP BY location,population,date
ORDER BY InfectionCount DESC














--Other COVID Database Explorations


SELECT * FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 3,4

--SELECT * FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

-- Select Data that we are going to be using

SELECT location,date,total_cases,new_cases,total_deaths,population
FROM PortfolioProject..CovidDeaths
WHERE continent is NOT NULL
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
WHERE continent is NOT NULL
ORDER BY 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid
SELECT location,date,population,total_cases,(total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
ORDER BY 1,2


--Global Numbers (By Date)

--SELECT date,SUM(new_cases) AS Total_Cases,SUM(CAST(new_deaths AS BIGINT)) AS Total_Deaths, SUM(CAST(new_deaths AS BIGINT))/SUM(new_cases)*100 AS DeathPercentage
--FROM PortfolioProject..CovidDeaths
--WHERE continent is NOT NULL
--GROUP BY date
--ORDER BY 1,2


-- Showing continents with the highest death count per population

SELECT continent,MAX(CAST(Total_deaths AS BIGINT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%states%'
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC




--Looking at Total Population vs Vaccinations

SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated,
(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3


--USE CTE

WITH PopvsVac (continent,location,date,population,new_vaccinations,RollingPeopleVaccinated)
AS
(
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100 FROM PopvsVac



--TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3

SELECT *, (RollingPeopleVaccinated/Population)*100 FROM #PercentPopulationVaccinated


--Creating VIEW to store data for later visualizations

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3


SELECT * FROM PercentPopulationVaccinated
