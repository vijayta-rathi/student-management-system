CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50),
    year INT
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks INT CHECK (marks >= 0 AND marks <= 100),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students (name, email, phone, department, year)
VALUES
('Aman Sharma', 'aman@gmail.com', '9876543210', 'CSE', 2),
('Riya Verma', 'riya@gmail.com', '9123456780', 'IT', 3);

INSERT INTO courses (course_name, credits)
VALUES
('Database Management Systems', 4),
('Operating Systems', 3);
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-01'),
(2, 2, '2025-01-02');
INSERT INTO grades (student_id, course_id, marks)
VALUES
(1, 1, 85),
(2, 2, 90);
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
SELECT s.name, c.course_name, g.marks
FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN courses c ON g.course_id = c.course_id;
SELECT s.name, g.marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.marks > 80;
CREATE VIEW student_report AS
SELECT s.name, c.course_name, g.marks
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id;
SELECT * FROM student_report;






