--Найти самый дорогой проект (исходя из salary всех разработчиков). 

SELECT MAX(projects_id), SUM(salary) 
FROM developers 
LEFT JOIN projects_developers 
ON developers.id = projects_developers.developers_id
GROUP BY projects_id
LIMIT 1;



