# python_sql Daily Tasks - 25-09-2026

This repository contains Python and SQL tasks completed as part of the daily assignment.

## Folder Structure

```text
daily_tasks_25-09-26/
|
|-- python/
|   |-- expense_tracker.py
|   |-- task_api.py
|   |-- atm_system.py
|
|-- sql/
|   |-- movie_booking.sql
|   |-- salary_queries.sql
|   |-- employee_department.sql
|   |-- employee_delete_trigger.sql
|   |-- product_sales.sql
|   |-- monthly_performance_view.sql
|
|-- README.md
```

## Python Tasks

### 1. Mini Expense Tracker

A simple expense tracking program using Python file handling.

Features:

* Add a new expense
* Store expense details in a text file
* View all expenses
* Calculate total expenses
* Validate user input

### 2. Task Management CRUD API

A Task Management API developed using FastAPI.

Features:

* Create a task
* View all tasks
* View a task by ID
* Update a task
* Delete a task
* Handle task not found errors

Run the API using:

```bash
cd python
python -m uvicorn task_api:app --reload
```

Open Swagger documentation:

```text
http://127.0.0.1:8000/docs
```

### 3. ATM Simulation System

A simple ATM simulation program.

Features:

* Check account balance
* Deposit money
* Withdraw money
* Check insufficient balance
* Validate entered amount

## SQL Tasks

### 1. Movie Booking Database

Created a Movie Booking database with tables for:

* Movies
* Theaters
* Shows
* Customers
* Bookings

Primary keys and foreign keys are used to create relationships between the tables.

### 2. Salary Queries

Queries are included to find:

* Top 3 highest salaries
* Second highest salary
* Duplicate records

### 3. Employee Department Reports

SQL JOINs are used to generate employee and department reports.

Included:

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN

### 4. Employee Delete Trigger

A MySQL trigger stores deleted employee details in the `deleted_employees` table.

`DELIMITER //` is used because the trigger contains semicolons inside the `BEGIN` and `END` block.

### 5. Product Sales Analysis

Subqueries are used for product sales analysis.

Queries include:

* Products with sales
* Products without sales
* Product with the highest sales quantity
* Products with price above the average price

### 6. Monthly Performance Report

A SQL view is created to display monthly performance.

The report contains:

* Month
* Total sales
* Total quantity
* Total revenue

## SQL File Execution Order

Run the SQL files in the following order:

```text
1. movie_booking.sql
2. salary_queries.sql
3. employee_department.sql
4. employee_delete_trigger.sql
5. product_sales.sql
6. monthly_performance_view.sql
```

## Technologies Used

* Python
* FastAPI
* Uvicorn
* MySQL
* MySQL Workbench

## Requirements

Install FastAPI and Uvicorn before running the Task Management API.

```bash
pip install fastapi uvicorn
```

## Author

Dammuru Somalinga
