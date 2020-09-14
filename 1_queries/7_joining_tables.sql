-- So far, we've only SELECTed data from a single table, but in a real world database, things will rarely be this simple. We will usually need to SELECT data from multiple tables at the same time.

-- Let's look at the BootcampX database — currently we have four tables, but for now we'll only focus on students and cohorts. If we want to select the name and cohort_id of all students, that's a simple query with a single table

-- It's easy for us to use this relationship to see that Armand Hilll was in the FEB12 cohort. But the database doesn't know that we want to JOIN the tables using these columns. We must explicitly tell the database to join these two tables using the cohort_id from students and the id from cohorts. We do this with the ON keyword.


-- Every JOIN must also have an ON.


SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id;

-- --or

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM cohorts JOIN students ON cohort_id = cohorts.id;

-- --or

-- SELECT students.name as student_name, email, cohorts.name as cohort_name
-- FROM students JOIN cohorts ON cohorts.id = cohort_id;
