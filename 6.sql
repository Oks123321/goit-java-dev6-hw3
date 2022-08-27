 --Вычислить среднюю ЗП программистов в самом дешевом проекте

SELECT branch, SUM (salary)
FROM developers
LEFT JOIN developers_skills ON developers.id = developers_skills.developers_id
LEFT JOIN skills ON skills.id = developers_skills.skills_id
WHERE branch = 'Java'
GROUP BY branch
;