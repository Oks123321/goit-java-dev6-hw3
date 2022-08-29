CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
	age INTEGER,
	gender VARCHAR(10)
	);
	
ALTER TABLE developers
ADD CONSTRAINT gender_enum_values
CHECK (gender IN ('male', 'female', 'unknown'));

ALTER TABLE developers
ALTER COLUMN gender SET NOT NULL;

ALTER TABLE developers owner to postgres;

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    descriptions VARCHAR (200)
);
ALTER TABLE projects owner to postgres;

CREATE TABLE projects_developers (
    projects_id BIGINT NOT NULL,
    developers_id BIGINT NOT NULL,
    FOREIGN KEY(projects_id) REFERENCES projects(id),
    FOREIGN KEY (developers_id) REFERENCES developers(id)
);

ALTER TABLE projects_developers owner to postgres;

CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    branch VARCHAR(200),
    level VARCHAR(150)
);
ALTER TABLE skills owner to postgres;

CREATE TABLE developers_skills (   
    developers_id BIGINT NOT NULL,
	skills_id BIGINT NOT NULL,
    FOREIGN KEY (developers_id) REFERENCES developers(id),
	FOREIGN KEY(skills_id) REFERENCES skills(id)
);
ALTER TABLE developers_skills owner to postgres;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    country VARCHAR(150)
);
ALTER TABLE companies owner to postgres;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    description VARCHAR(150)
);
ALTER TABLE customers owner to postgres;

CREATE TABLE projects_customers (
    projects_id BIGINT NOT NULL,
	customers_id BIGINT NOT NULL,
    FOREIGN KEY(customers_id) REFERENCES customers(id),
    FOREIGN KEY (projects_id) REFERENCES projects(id)
);
ALTER TABLE projects_customers owner to postgres;

CREATE TABLE companies_developers (
    developers_id BIGINT NOT NULL,
    companies_id BIGINT NOT NULL,
    FOREIGN KEY(developers_id) REFERENCES developers(id),
    FOREIGN KEY (companies_id) REFERENCES companies(id)
);
ALTER TABLE companies_developers owner to postgres;




SELECT * FROM developers
LEFT JOIN developers_skills ON developers.id = developers_skills.developers_id;




-- Отримати список всіх працівників та їх досвід
SELECT first_name, last_name, branch, level
FROM developers
LEFT JOIN developers_skills
ON developers.id = developers_skills.developers_id
LEFT JOIN skills
ON skills.id = developers_skills.skills_id;

SELECT first_name, last_name, name  
FROM developers
LEFT JOIN projects_developers 
ON developers.id = projects_developers.developers_id
LEFT JOIN projects
ON projects.id = projects_developers.projects_id;

SELECT name, country FROM companies_developers 
LEFT JOIN companies 
ON companies.id = companies_developers.companies_id 
WHERE companies.name = 'UBD';


-- Отримати список всіх чоловіків
SELECT *
FROM developers
WHERE gender = 'male';


-- Отримати список працівників, що працюють у конкретному відділу
SELECT developers.*, name, descriptions
FROM developers
LEFT JOIN projects_developers ON developers.id = projects_developers.developers_id
LEFT JOIN projects ON projects.id = projects_developers.projects_id
WHERE projects_id = 2;

-- Вивести відділ з максимальною кількістю працівників

SELECT projects.*
FROM projects
WHERE id IN (
    SELECT projects_id
    FROM projects_developers
    GROUP BY projects_id
    HAVING count(developers_id) IN (
        SELECT count(developers_id)
        FROM projects_developers
        GROUP BY projects_id
        ORDER BY count(developers_id) DESC
        LIMIT 1
    )
); 

-- Вибрати людей, які не працюють у жодному відділі або працюють у двох і більше відділах
-- Працівники, які ніде не працюють
SELECT *, 'Free'
FROM developers
WHERE id NOT IN (
     SELECT developers_id FROM projects_developers
);


-- Працівники, які працюють в 2+ відділах
SELECT *, '2+ projects'
FROM developers
WHERE id IN (
    SELECT developers_id
    FROM projects_developers
    GROUP BY developers_id
    ORDER by count(projects_id) >= 2
);

-- Знайти всіх працівників, у яких у імені або у прізвищі є буква y
SELECT *
FROM developers
WHERE LOWER(first_name) LIKE '%y%' OR LOWER(last_name) LIKE '%y%';






