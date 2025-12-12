CREATE DATABASE mydb;
USE mydb;
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(20),
    description VARCHAR(200),
    fees INT,
    start_date DATE,
    end_date DATE,
    video_expire_days INT
);

INSERT INTO courses (course_id, course_name, description, fees, start_date, end_date, video_expire_days)
VALUES
(1, 'Data Science', 'Complete Data Science Course', 15000, '2026-01-10', '2026-02-10', 30),

(2, 'Web Development', 'Full Stack Web Dev', 12000, '2026-01-15', '2026-02-15', 25),

(3, 'Machine Learning', 'ML with projects', 18000, '2026-02-01', '2026-03-01', 20),

(4, 'Cloud Computing', 'AWS + Azure basics', 14000, '2026-02-10', '2026-03-10', 35),

(5, 'Cyber Security', 'Basics of Ethical Hacking', 11000, '2026-01-05', '2026-02-05', 15),

(6, 'DSA in Java', 'Data Structures & Algorithms', 9000, '2026-01-20', '2026-02-20', 30),

(7, 'React.js', 'Frontend with React', 8000, '2026-03-01', '2026-03-30', 20),

(8, 'Node.js', 'Backend with Node', 8500, '2026-03-05', '2026-04-05', 25),

(9, 'SQL Mastery', 'Advanced SQL + Joins', 6000, '2026-01-18', '2026-02-18', 10);
select * from courses;
CREATE TABLE students (
    reg_no INT PRIMARY KEY,
    name VARCHAR(30),
    email VARCHAR(200),
    mobile_no BIGINT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students (reg_no, name, email, mobile_no, course_id)
VALUES
(1, 'student1', 's1@gmail.com', 1234567890, 1),
(2, 'student2', 's2@gmail.com', 9876543210, 1),
(3, 'student3', 's3@gmail.com', 9123456780, 7),
(4, 'student4', 's4@gmail.com', 9988776655, 8),
(5, 'student5', 's5@gmail.com', 8877665544, 9),
(6, 'student6', 's6@gmail.com', 7766554433, 1);

select * from  students;

USE mydb;

CREATE TABLE users (
    email VARCHAR(200) PRIMARY KEY,
    password VARCHAR(200) NOT NULL,
    role ENUM('admin', 'student', 'teacher') NOT NULL
);

INSERT INTO users (email, password, role)
VALUES
('s1@gmail.com', 'pass123', 'student'),
('s2@gmail.com', 'pass234', 'student'),
('s3@gmail.com', 'pass345', 'student'),
('admin@gmail.com', 'admin123', 'admin'),
('teacher@gmail.com', 'tech123', 'teacher');

select * from users;

CREATE TABLE videos (
    video_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(200),
    description VARCHAR(500),
    youtube_url VARCHAR(500),
    added_at DATE,
    
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO videos (video_id, course_id, title, description, youtube_url, added_at)
VALUES
(1, 1, 'Intro to Data Science', 'Basics of DS', 'https://youtu.be/ds101', '2026-01-11'),
(2, 1, 'Python for Data Science', 'Python basics', 'https://youtu.be/ds102', '2026-01-12'),

(3, 2, 'HTML Basics', 'HTML overview', 'https://youtu.be/web201', '2026-01-16'),
(4, 2, 'CSS Basics', 'Learn CSS', 'https://youtu.be/web202', '2026-01-17'),

(5, 3, 'Machine Learning Intro', 'ML concepts', 'https://youtu.be/ml301', '2026-02-02'),
(6, 4, 'AWS Intro', 'Cloud basics', 'https://youtu.be/cc401', '2026-02-11');

select * from videos ;

USE mydb;

SELECT *
FROM students s
JOIN courses c
  ON s.course_id = c.course_id;
  
  SELECT *
FROM students s
JOIN courses c
  ON s.course_id = c.course_id
WHERE s.email = 's1@gmail.com';

SELECT 
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.video_expire_days,
    v.video_id,
    v.title,
    v.added_at
FROM students s
JOIN courses c 
    ON s.course_id = c.course_id
JOIN videos v 
    ON c.course_id = v.course_id
WHERE s.email = 's1@gmail.com'   -- change email as needed
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();




