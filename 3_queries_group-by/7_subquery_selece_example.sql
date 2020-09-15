
SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- SELECT (
--   SELECT count(*)
--   FROM table_name
-- ) as total, other_column
-- FROM other_table_name
-- ORDER BY total;

-- The result of a select is effectively a table that can be used as you would use a table
-- So a select statement may be used as a data source of another select statement.
-- So we could do something like this:

-- SELECT * FROM (
--   SELECT something_id
--   FROM someTable
--   WHERE something
-- ) as sub_table;

-- Now imagine that we want to calculate the average number of students that attend a cohort. We can calculate the total number of students for each cohort with the following query.

SELECT count(students)
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts;

-- But how do we get a single number for the average number of students per cohort?

SELECT count(students) as total_students
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts;

-- If we treat this as a table, we essentially want to find the average of the total_students column.

SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

-- The as totals_table part gives an alias to the sub query so that we can use it's name like we would use any other table's name. For example, the first line of that query could be written like this:

-- SELECT avg(totals_table.total_students) as average_students
-- In this case, the inner query can contain as many columns as we like:

SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students, cohorts.name as cohort_name
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
) as totals_table;

-- If we had the complete list here, this query would work. It would return the name of all of the assignments not completed by 'Ibrahim Schimmel'. However, we're cheating here because we're hard coding the list.

-- If the result of a query returns only one column, we can use that sub query in our WHERE clause.

SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);

-- SELECT * FROM table
-- WHERE id IN (
--   SELECT something_id
--   FROM someTable
--   WHERE something
-- );