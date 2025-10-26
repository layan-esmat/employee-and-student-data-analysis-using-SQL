# Employee and Student Data Analysis Using MySQL

This project demonstrates how to use MySQL to analyze employee and student data.  
It includes SQL scripts for creating tables, inserting sample data, and applying aggregate functions, grouping, and filtering techniques to extract meaningful insights.

---

## Contents

### 1. Employees Table
- Create and populate the `Employees` table  
- Perform operations using:
  - `COUNT()`
  - `AVG()`
  - `MAX()`
  - `MIN()`
  - `SUM()`
- Use `GROUP BY` and `HAVING` to summarize employee data  
- Add a new column (`Department`) and analyze data per department  

### 2. Students Table
- Create and populate the `Students` table  
- Practice filtering and subqueries:
  - Students with marks above the average  
  - Count total students  
  - Display A+ students  
  - Find students with the minimum mark  

---

## How to Run

1. Open MySQL Workbench or your preferred SQL client.  
2. Create a new database (optional):  
   ```sql
   CREATE DATABASE lab5db;
   USE lab5db;
