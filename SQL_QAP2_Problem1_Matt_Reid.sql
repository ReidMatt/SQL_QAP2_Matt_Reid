CREATE TABLE IF NOT EXISTS students (
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
school_enrollment_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS professors (
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
department VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
id SERIAL PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
course_description TEXT,
professors_id INT,
FOREIGN KEY (professors_id) REFERENCES professors(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS enrollments (
student_id INT,
course_id INT,
enrollment_date DATE NOT NULL,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);


INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
('John', 'Doe', 'john.doe@gemail.com', '2020-09-01'),
('Judy', 'Smith', 'judy.smith@email.com', '2021-09-01'),
('Alice', 'Brown', 'alice.brown@email.com', '2022-09-01'),
('Bob', 'Davis', 'bob.davis@email.com', '2019_09-01'),
('Charlie', 'Wilson', 'charlie.wilson@email.com', '2021-09-01');

INSERT INTO professors (first_name, last_name, department)
VALUES
('Emily', 'Johnson', 'Physics'),
('Mark', 'Lee', 'Computer Science'),
('Anna', 'Miller', 'Mathematics'),
('Tom', 'Clark', 'Chemistry');

INSERT INTO courses (course_name, course_description, professors_id)
VALUES
('Physics 101', 'Introductory physics course', 1),
('Computer Science 101', 'Basics of computer science', 2),
('Calculus 101', 'Introductory calculus course', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1,1, '2023-01-15'),
(2,1, '2023-01-16'),
(3,2, '2023-01-17'),
(4,2, '2023-01-18'),
(5,3, '2023-01-19');

SELECT CONCAT('students.first_name, ', 'students.last_name') AS full_name
FROM students student
INNER JOIN enrollments enrollments ON student.id = enrollments.student_id
INNER JOIN courses course ON enrollments.course_id = course_id
WHERE course.course_name = 'Physics 101';

SELECT course.course_name, CONCAT('professor.first_name, ', 'professor.last_name') AS professor_name
FROM courses course
INNER JOIN professors professor ON course.professors_id = professor.id;

SELECT DISTINCT c.course_name
FROM courses c
INNER JOIN enrollments e ON c.id = e.course_id;

UPDATE students
SET email = 'new.email@gmail.com'
WHERE id = 1;

DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 1;


