-- If we want to calculate the total number of assignment_submissions for all students, the count aggregate function is perfect.

-- We want to apply the count() function to groups of data, rather than the entire query. The groups in this case are the names of students. We want to apply the count() function for each students.name.

-- We will start by selecting the student's name from the students table, and the and the total submissions from the assignment_submissions table.

-- Now we just need to tell SQL that we want count(assignment_submissions.*) to be run for each students.name, instead of the entire query. To do this, we use the GROUP BY clause.

-- SELECT students.name as student, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- GROUP BY students.name;

-- Alter the query slightly to only return currently enrolled students.

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;