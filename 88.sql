--Gurjeev Singh
--Intern at Sparks Foundation 
--Task 8 
--Covid 19 Data Exploration 


--Created database with name " Pronew ". Then Importing data into the database. since I am importing a dataset so I’ll be using database name to execute my table.

--using table which is

--CovidDeaths

--Keywords:  Select, From, Where, Group by, Order by, is Null, is not Null, And, Like, As, Desc, Cast Aggregate Functions, Converting Data Types

--Viewing data from both tables

select* 
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
order by 3,4


--selecting the data which we are going to use

select location,date,total_cases,new_cases,total_deaths,population
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
order by 1,2

--now looking at total cases vs total deaths
--SHOWS LIKELIHOOD OF DYING BY CONTRACT OF COVID IN YOUR COUNTRY

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percent
from Pronew..CovidDeaths
where location LIKE '%India%' 
AND CONTINENT IS NOT NULL
order by 1,2

--[ when total number of cases were 62 we have obsereved first death  of 1.612% death percent ]



--now looking at total cases vs POPULATION
--SHOWS WHAT PERCENT OF POPULATION ARE GETTING INFECTED

select location,date,total_cases,POPULATION, (total_CASES/POPULATION)*100 as Case_Percent
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
and location LIKE '%India%' 
order by 1,2

--[when total cases were 13 million then case percent was 1%.]


--NOW LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE TO POPULATION

select location,POPULATION,MAX(total_cases)AS HIGHLY_INFECTED_COUNT, MAX(TOTAL_CASES/POPULATION)*100 AS PERCENT_POPULATION_INFECTED
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
GROUP BY LOCATION,POPULATION
order by HIGHLY_INFECTED_COUNT DESC

--[United states has highest number of infection rate]

--NOW LOOKING AT COUNTRIES WITH HIGHEST DEATH RATE TO POPULATION

select location, MAX(total_DEATHS) AS HIGHDEATHED
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
GROUP BY LOCATION,POPULATION
order by HIGHDEATHED DESC

select location, MAX(CAST(total_DEATHS AS INT)) HIGHDEATHED
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
GROUP BY LOCATION,POPULATION
order by HIGHDEATHED DESC

--[united states has the highest number of deaths]

--LETS BREAK THIS zDOWN BY CONTINENT
--SELECT CONTINENTS WITH THE HIGHEST DEATH COUNT PER POPULATION

select Continent, MAX(CAST(total_DEATHS AS INT)) High_Deaths
from Pronew..CovidDeaths
WHERE CONTINENT IS NOT NULL
GROUP BY Continent
order by High_Deaths DESC

--[north america continent has the highest number of deaths]

--GLOBAL NUMBERS

select sum(new_cases)Total_Case, sum (cast(new_deaths as int))Total_Deaths,sum (cast(new_deaths as int))/ ( sum (new_cases)) * 100 AS Death_Percent
from Pronew..CovidDeaths
where CONTINENT IS NOT NULL


--global stats
--total_cases;- 150574977
--total_deaths;- 3180206
--death-percent;- 2.11%