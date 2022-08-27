-- Найти самый дешевый проект (исходя из cost всех проектов)
SELECT *
FROM projects
WHERE cost IN(
SELECT MIN(cost)as min 
FROM projects
);