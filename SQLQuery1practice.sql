select* from Sap..world_population_23

/*Data Cleaning part*/
round off(total_area_kmsq)
update world_population_23
set total_area_kmsq = round(total_area_kmsq,2)

round off (Land_kmsq)
update world_population_23
set Land_kmsq = round(Land_kmsq,2)

round off (Growth_rate)
update world_population_23
set Growth_rate = round(Growth_rate,2)


round off (Ratio)
update world_population_23
set Ratio = round(Ratio,2)

/*Changing datatype*/
alter table world_population_23
 alter column Population_22 bigint;

 alter table world_population_23
 alter column Population_23 bigint;






--I want to answer the following queations based on the available data 
--1 What are the top 10 populus countries in the world.
--2 Which top 5 countries should take measurable steps to cotrol their population based on their growth rate.
--3 Taking into account Ratio what do you think how many countries constitute world's 40% population.
--4 what are the top 5 densly populated countries.
--5 what is percentage growth in world population since 2022.



-- Ans.1 (Top 10 most populus countries in the world)
select top 10 Country, Population_23 from Sap.. world_population_23
order by Population_23 desc


--Ans.2 (top 5 countries with Highest growth rate)
select top 5 * from world_population_23
order by Growth_rate desc


--Ans.3 (higher ratio countries)
Select top 10 Country, Ratio from world_population_23
SELECT SUM(Top10Ratio) as Top10_Sum
FROM (
  SELECT TOP 6 Ratio as Top10Ratio
  FROM world_population_23
  ORDER BY Ratio DESC
) AS Top10SalesTable
-- The result shows that the top 6 most populus contries contitute 49.18% of the World's population.

--Ans.4 (top 5 densely populated countries)
 select top 5 Country, Density from world_population_23
 order by Density desc
 -- This query results top 5 densely populated countries in the world. They are Monace, Singapore, Hong Kong,Behrain,and Maldives.

 --Ans.5
 -- What is percentage grrowth in world population since 2022.


 Select Sum(Population_22) as popsum22, sum(Population_23) as pop23sum from world_population_23

 select Difference(Sum(Population_22), sum(Population_23)) as popgrowth from world_population_23