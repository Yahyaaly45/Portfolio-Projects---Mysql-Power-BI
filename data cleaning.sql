use projects_db;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(25) null;

describe hr;


SELECT 
    birthdate
FROM
    hr;

set sql_safe_updates = 0;

SET SQL_MODE = ' ';


alter table hr
modify column birthdate date;

UPDATE hr 
SET 
    birthdate = CASE
        WHEN
            birthdate LIKE '%/%'
        THEN
            DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'),
                    '%Y-%m-%d')
        WHEN
            birthdate LIKE '%-%'
        THEN
            DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'),
                    '%Y-%m-%d')
        ELSE NULL
    END; 

SELECT 
    birthdate
FROM
    hr;



select * from hr;


UPDATE hr 
SET 
    hire_date = CASE
        WHEN
            hire_date LIKE '%/%'
        THEN
            DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'),
                    '%Y-%m-%d')
        WHEN
            hire_date LIKE '%-%'
        THEN
            DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'),
                    '%Y-%m-%d')
        ELSE NULL
    END; 

UPDATE hr 
SET 
    termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%sUTC'))
WHERE
    termdate IS NOT NULL AND termdate != '';
    
  select termdate from hr;  
    
    UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;


ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

alter table hr add column age int;

UPDATE hr 
SET age = timestampdiff(YEAR, birthdate, curdate());

UPDATE hr
SET birthdate = DATE_SUB(birthdate, INTERVAL 100 YEAR)
WHERE birthdate >= '2060-01-01' AND birthdate < '2070-01-01';


SELECT 
    MIN(age) AS youngest, MAX(age) AS oldest
FROM
    hr;

SELECT COUNT(*) FROM hr
WHERE age < 18;


SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();


SELECT COUNT(*) FROM hr WHERE termdate = '0000-00-00';


select * from hr;











