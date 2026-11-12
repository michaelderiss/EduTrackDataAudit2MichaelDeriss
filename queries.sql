1) List every enrollment showing the student's full name, the course title, and their completion percentage
  
My Query: SELECT s.name AS student_name, c.title AS course_title, e.completion_percentage FROM enrollments e JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id;
-------------------------
2) Show the name and email of students who have passed at least one course, along with the title of the course they passed
  
My Query:  SELECT s.name AS student_name, s.email, c.title AS passed_course FROM enrollments e JOIN students s ON e.student_id = s.id JOIN courses c ON e.course_id = c.id WHERE e.passed = TRUE;
-------------------------
3) Calculate the average completion percentage per instructor, ordered from highest to lowest
  
My Query: SELECT c.instructor_name, ROUND(AVG(e.completion_percentage), 2) AS avg_completion_percentage FROM courses c JOIN enrollments e ON c.id = e.course_id GROUP BY c.instructor_name ORDER BY avg_completion_percentage DESC;
-------------------------
4) Find all students who have no enrollments

My Query: SELECT s.id, s.name, s.email, s.signup_date FROM students s LEFT JOIN enrollments e ON s.id = e.student_id WHERE e.id IS NULL;
-------------------------
5)  Find all courses that have no enrollments

My Query: SELECT c.id, c.title, c.category, c.instructor_name FROM courses c LEFT JOIN enrollments e ON c.id = e.course_id WHERE e.id IS NULL;
-------------------------
6) Count how many courses each student is enrolled in; show only students enrolled in more than one course

My Query: SELECT s.name AS student_name, COUNT(e.course_id) AS total_courses FROM students s JOIN enrollments e ON s.id = e.student_id GROUP BY s.id, s.name HAVING COUNT(e.course_id) > 1 ORDER BY total_courses DESC;
-------------------------
7) Calculate total revenue per category using the course price from the courses table (monthly_fee)

My Query: SELECT c.category, SUM(c.monthly_fee) AS total_revenue FROM enrollments e JOIN courses c ON e.course_id = c.id GROUP BY c.category ORDER BY total_revenue DESC;
-------------------------
8) Show each instructor alongside the number of students currently enrolled in their courses

My Query: SELECT c.instructor_name, COUNT(DISTINCT e.student_id) AS unique_students_enrolled FROM courses c LEFT JOIN enrollments e ON c.id = e.course_id GROUP BY c.instructor_name ORDER BY unique_students_enrolled DESC;
-------------------------
9) Check for enrollments where student_id does not match any existing student

My Query: SELECT e.* FROM enrollments e LEFT JOIN students s ON e.student_id = s.id WHERE s.id IS NULL;
-------------------------
10) Check for enrollments where course_id does not match any existing course

My Query: SELECT e.* FROM enrollments e LEFT JOIN courses c ON e.course_id = c.id WHERE c.id IS NULL;
