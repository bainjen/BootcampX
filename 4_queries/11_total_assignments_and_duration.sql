-- Get each day with the total number of assignments and the total duration of the assignments.

-- Select the day, number of assignments, and the total duration of assignments.
-- Order the results by the day.



SELECT day, COUNT(*) as num_of_assignments, SUM(duration) as duration
FROM assignments
GROUP BY day
ORDER BY day;

-- SELECT assignments.day, COUNT(assignments.*), assignments.duration 
-- FROM assignments
-- GROUP BY assignments.duration
-- ORDER BY assignments.day