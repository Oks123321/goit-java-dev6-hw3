-- Добавить поле (cost - стоимость) в таблицу Projects
ALTER TABLE projects ADD COLUMN cost int;
SELECT projects_id, SUM (salary)
FROM developers
LEFT JOIN projects_developers ON developers.id = projects_developers.developers_id
GROUP BY projects_id
;
UPDATE projects 
	SET cost = 3000
	WHERE id = 1;
	
UPDATE projects 
	SET cost = 2400
	WHERE id = 2;

UPDATE projects 
	SET cost = 2900
	WHERE id = 3;
	
UPDATE projects 
	SET cost = 1900
	WHERE id = 4;
	
UPDATE projects 
	SET cost = 1200
	WHERE id = 5;
	
UPDATE projects 
	SET cost = 1200
	WHERE id = 6;