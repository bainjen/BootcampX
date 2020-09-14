-- Recently we've been having trouble emailing students without a gmail account. To make sure that we can reliably contact all students, we'll need to make sure that student's without a gmail account have a phone number.

-- Get all of the students without a gmail.com or phone number.

-- Get their name, email, id, and cohort_id.

SELECT name, email, id, cohort_id
FROM students
WHERE phone IS NULL 
AND email NOT IN ('%gmail.com');

--other method

-- SELECT name, id, email, cohort_id
-- FROM students
-- WHERE email NOT LIKE '%gmail.com'
-- AND phone IS NULL;