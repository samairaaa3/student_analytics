# Student Analytics SQL & Python Project
A complete end-to-end data analytics project using PostgreSQL, SQL, Pandas, SQLAlchemy, and Jupyter Notebook.
This project demonstrates relational database design, analytical SQL queries, Python-based data extraction, and real visualizations of student performance.
## 1. Project Overview
This project simulates a student academic analytics system.
It includes:
A relational PostgreSQL database
Analytical SQL queries (JOINs, GROUP BY, Window Functions)
Data extraction into Python with Pandas
Visualizations such as grade trends and attendance vs performance
Real-world workflow similar to Data Analyst / BI Analyst projects
## 2. Technologies Used
Category	Tools
Database	PostgreSQL, DBeaver
Programming	SQL, Python
Python Libraries	Pandas, SQLAlchemy, Matplotlib
Environment	Conda, Jupyter Lab / Notebook
## 3. Database Schema
The project consists of three main tables.
# students
student_id
sfu_id
first_name
last_name
gender
birthdate
# courses
course_id
course_code
course_name
department
# enrollments
enrollment_id
student_id
course_id
final_grade_numeric
attendance_pct
## 4. Features Implemented
# SQL Features
Creation of normalized relational tables
Primary and foreign key constraints
JOIN queries
Aggregations (AVG, COUNT)
Window functions (RANK, ROW_NUMBER)
Analytical reports such as:
Student GPA ranking
Course-level performance patterns
Attendance vs Final Grade
# Python Features
Connecting to PostgreSQL via SQLAlchemy
Reading data into Pandas DataFrames
Cleaning & transforming data
Visualizations including:
Scatter plots for attendance vs grades
Course-wise grade comparison
## 5. How to Run the Project
Step 1 — Load the SQL File
Run the file:
student_analytics.sql
in DBeaver or using psql:
psql -d student_analytics -f student_analytics.sql
Step 2 — Install Python Packages
pip install pandas sqlalchemy psycopg2-binary matplotlib
Step 3 — Start Jupyter
jupyter lab
Open:
analysis.ipynb
Step 4 — Run All Notebook Cells
The notebook will:
Connect to PostgreSQL
Execute SQL queries
Load the results into Pandas
Create visualizations
## 7. Purpose of the Project
This project demonstrates practical skills for:
Data Analyst
Business Intelligence Analyst
Data Scientist (analytics side)
SQL-heavy internships or co-op roles
It highlights:
Ability to design and query relational databases
Ability to blend SQL + Python workflows
Understanding of data analysis and visualization
Writing clean, reusable queries
Building end-to-end analytical pipelines

