INSERT INTO developers (first_name, last_name,age, gender) VALUES 
('Harry', 'Harryson', 35, 'male'),
('Jack', 'Sparrow', 28, 'male'),
('Julia', 'Petterson', 30, 'female'),
('Mary', 'Poppins', 40, 'female'),
('Tom', 'Soyer', 18, 'male'),
('Andrew', 'Smith', 50, 'male');

INSERT INTO skills (branch, level) VALUES
('Java', 'Junior'),
('Java', 'Middle'),
('Java', 'Senior'),
('C++', 'Junior'),
('C++', 'Middle'),
('C++', 'Senior'),
('JavaScript', 'Junior'),
('JavaScript', 'Middle'),
('JavaScript', 'Senior');

INSERT INTO developers_skills(developers_id, skills_id) VALUES
(1,1),
(1,5),
(2,9),
(2,7),
(3,6),
(3,4),
(4,2),
(4,8),
(5,2),
(6,9);

INSERT INTO projects(name, descriptions) VALUES
('My house', 'application for payment of utilities'),
('Our city', 'application for communication with the city authorities'),
('Travel', 'application about interesting travels'),
('Traffic schedule', 'schedule of urban and suburban transport'),
('Hot party', 'organization of parties and banquets'),
('Holiday', 'organization of children_s holidays');

INSERT INTO projects_developers(projects_id, developers_id) VALUES
(1,1),
(1,3),
(2,5),
(2,2),
(3,6),
(3,4),
(4,6),
(5,2),
(6,2);

INSERT INTO customers (name,description) VALUES
('Kolos','children_s health resort'),
('JEO Ltd','management company'),
('VMR','Vinnytsia City Council'),
('TOM-VOYAG', 'travel agency'),
('Bomba-Tur', 'tour operator');

INSERT INTO companies (name,country) VALUES
('UBD','Germany'),
('Optima','Ukraine'),
('Maximus','Poland'),
('Plast', 'Ukraine');

INSERT INTO companies_developers(companies_id, developers_id) VALUES
(1,1),
(1,4),
(2,2),
(2,6),
(2,5),
(3,3),
(3,2),
(4,6),
(4,1);



