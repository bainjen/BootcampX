-- The admissions department wants to know the total number of students from any number of cohorts combined.

-- Select the total number of students who were in the first 3 cohorts.

-- SELECT COUNT(id)
-- FROM students
-- WHERE cohort_id = 1 
-- OR cohort_id = 2
-- OR cohort_id = 3; 

SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);