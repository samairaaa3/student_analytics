-- =========================
-- SAMPLE STUDENTS
-- =========================
INSERT INTO students
(sfu_id, first_name, last_name, gender, birthdate, citizenship, is_international, admit_term, admit_year, major, faculty)
VALUES
('301000021', 'Samaira', 'Samaira', 'Female', '2005-06-03', 'India', TRUE, 'Fall', 2023, 'Data Science', 'Science'),
('301000022', 'Vedant', 'Sharma', 'Male',   '2003-12-02', 'India', TRUE, 'Fall', 2023, 'Computing Science', 'Applied Sciences'),
('301000023', 'Mehar',  'Arora',   'Female','2006-01-02', 'Canada', FALSE,'Fall', 2022, 'Psychology', 'Arts'),
('301000024', 'Riya',   'Sondhi',  'Female','2005-08-11', 'India', TRUE, 'Spring',2024, 'Statistics', 'Science'),
('301000025', 'Tanya','Tiwari',   'Female','2004-07-27', 'India', TRUE, 'Summer',2023, 'Business', 'Beedie');

-- =========================
-- SAMPLE COURSES
-- =========================
INSERT INTO courses (course_code, course_name, department, credits, level)
VALUES
('STAT 240', 'Introduction to Statistics for Life Sciences', 'STAT', 3.0, 200),
('CMPT 310', 'Artificial Intelligence Survey',              'CMPT', 3.0, 300),
('MATH 152', 'Calculus II',                                 'MATH', 3.0, 100),
('PSYC 100', 'Introduction to Psychology',                  'PSYC', 3.0, 100),
('BUS 272',  'Behaviour in Organizations',                  'BUS',  3.0, 200);

-- =========================
-- SAMPLE ENROLLMENTS
-- (student ↔ course per term)
-- =========================
INSERT INTO enrollments
(student_id, course_id, term, year, status, final_grade_letter, final_grade_numeric)
VALUES
(1, 1, 'Fall',   2024, 'completed', 'A',  90.0),
(1, 2, 'Fall',   2024, 'completed', 'A-', 85.0),
(1, 3, 'Fall',   2023, 'completed', 'B',  78.0),

(2, 2, 'Fall',   2024, 'completed', 'B+', 82.5),
(2, 3, 'Fall',   2023, 'completed', 'A',  92.0),

(3, 4, 'Spring', 2024, 'completed', 'A',  95.0),
(3, 1, 'Spring', 2024, 'completed', 'A',  93.0),

(4, 1, 'Fall',   2024, 'completed', 'A',  90.0),
(4, 5, 'Fall',   2024, 'completed', 'B+', 85.0),

(5, 5, 'Summer', 2024, 'completed', 'A-', 88.0);

-- =========================
-- SAMPLE ATTENDANCE
-- =========================
INSERT INTO attendances (enrollment_id, week_number, attended, attendance_pct)
VALUES
(1, 1, TRUE, 100), (1, 2, TRUE, 100), (1, 3, FALSE,  66), (1, 4, TRUE, 100),
(2, 1, TRUE, 100), (2, 2, TRUE, 100), (2, 3, TRUE, 100), (2, 4, TRUE, 100),
(3, 1, FALSE, 0),  (3, 2, TRUE, 100), (3, 3, TRUE, 100), (3, 4, TRUE, 100);

-- =========================
-- SAMPLE STUDY SESSIONS
-- =========================
INSERT INTO study_sessions (student_id, course_id, session_date, hours_studied, location)
VALUES
(1, 1, '2024-09-10', 3.5, 'Library'),
(1, 1, '2024-09-13', 2.0, 'Residence'),
(1, 2, '2024-09-15', 4.0, 'Library'),
(2, 3, '2023-09-20', 5.0, 'Library'),
(3, 4, '2024-01-15', 1.5, 'Dorm'),
(4, 5, '2024-11-01', 2.5, 'Library');

-- =========================
-- SAMPLE WELLBEING SCORES
-- =========================
INSERT INTO wellbeing_scores (student_id, record_date, sleep_hours, stress_level, mood_score, notes)
VALUES
(1, '2024-09-10', 7.5, 6, 8, 'Feeling okay.'),
(1, '2024-09-17', 6.0, 8, 6, 'Stressed due to exams.'),
(2, '2024-09-11', 8.0, 4, 9, 'Good mood.'),
(3, '2024-01-14', 5.0, 7, 5, 'Tired this week.'),
(4, '2024-10-05', 6.5, 5, 7, 'Fine.');

-- =========================
-- SAMPLE ADVISING SESSIONS
-- =========================
INSERT INTO advising_sessions (student_id, advisor_name, session_date, session_type, topic, risk_level, follow_up_needed)
VALUES
(1, 'Dr. Smith', '2024-09-25', 'Academic',      'Study planning for exam season', 'low',    FALSE),
(1, 'Dr. Kim',   '2024-10-10', 'Mental Health', 'High stress during midterms',    'medium', TRUE),
(3, 'Dr. Patel', '2024-01-20', 'Academic',      'Program planning',               'low',    FALSE),
(4, 'Dr. Wong',  '2024-10-05', 'Academic',      'Time management issues',         'medium', TRUE);
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
-- Average grade per student
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    ROUND(AVG(e.final_grade_numeric), 2) AS avg_grade
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY avg_grade DESC;
-- Average grade per student
SELECT
    c.course_code,
    c.course_name,
    ROUND(AVG(e.final_grade_numeric), 2) AS avg_grade
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_code, c.course_name
ORDER BY avg_grade ASC;
-- Attendance vs final grade (JOIN + GROUP BY)
SELECT
    s.first_name,
    s.last_name,
    c.course_code,
    ROUND(AVG(a.attendance_pct), 1) AS avg_attendance,
    e.final_grade_numeric
FROM enrollments e
JOIN students s
    ON e.student_id = s.student_id
JOIN courses c
    ON e.course_id = c.course_id
LEFT JOIN attendances a
    ON e.enrollment_id = a.enrollment_id
GROUP BY
    s.first_name, s.last_name,
    c.course_code, e.final_grade_numeric
ORDER BY avg_attendance DESC;
--Rank students by performance (WINDOW FUNCTION)
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    ROUND(AVG(e.final_grade_numeric), 2) AS avg_grade,
    RANK() OVER (ORDER BY AVG(e.final_grade_numeric) DESC) AS performance_rank
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY performance_rank;

