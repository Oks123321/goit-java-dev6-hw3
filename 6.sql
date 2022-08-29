
 --Вычислить среднюю ЗП программистов в самом дешевом проекте

SELECT projects_id, MIN(cost),AVG(salary)
FROM developers 
LEFT JOIN projects_developers ON developers.id = projects_developers.developers_id
LEFT JOIN projects ON projects.id =  projects_developers.projects_id 
WHERE cost IN(
SELECT MIN(cost) as min 
FROM projects)
GROUP BY projects_id;