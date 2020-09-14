-- The kind of JOINing that we've done so far is called an INNER JOIN. In fact, we could rewrite the query to include the INNER keyword.

-- An INNER JOIN will only give us rows where there is a match between the two tables. Any students with a cohort_id of NULL will not appear in the results of this kind of join.

-- If the foreign key is NULL, the row will not be included in the result of an INNER JOIN.

-- Most of the time, like 99% of the time, we want to use an INNER JOIN. With a query like this, where we're getting a list of students and their cohort names, we probably don't want to include any students without a cohort. However, there are times when we do want to include data where there isn't a match. In these cases, we have to use an OUTER JOIN.

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;