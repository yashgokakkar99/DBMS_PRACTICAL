
Assignment 1  --(25/07/22) and (26/07/22)

/* b. Write at least 10 SQL queries on the suitable database application using SQL DML
statements.
Note: Instructor will design the queries which demonstrate the use of concepts like Insert, Select,
Update, Delete with operators, functions, and set operator etc.
*/

Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.



mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
6 rows in set (0.09 sec)

-- creating a databse
mysql> create database computer_student;
Query OK, 1 row affected (0.03 sec)

-- to check databses 
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| computer_student   |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use computer_student;
Database changed

-- creating table in mysql
mysql> create table student_details (Roll_no int, Name char(30),Age int,City varchar(20), percentage float);
Query OK, 0 rows affected (0.04 sec)

-- inserting values into table
mysql> insert into student_details values(101,'Aditya',20,'Pune',91.50);
Query OK, 1 row affected (0.01 sec)

mysql> select * from student_details;
+---------+--------+------+------+------------+
| Roll_no | Name   | Age  | City | percentage |
+---------+--------+------+------+------------+
|     101 | Aditya |   20 | Pune |       91.5 |
+---------+--------+------+------+------------+
1 row in set (0.00 sec)

mysql> insert into student_details values(102,'Aman',20,'Patna',95.50);
Query OK, 1 row affected (0.01 sec)

-- showing all the data from atble using select statement
mysql> select * from student_details;
+---------+--------+------+-------+------------+
| Roll_no | Name   | Age  | City  | percentage |
+---------+--------+------+-------+------------+
|     101 | Aditya |   20 | Pune  |       91.5 |
|     102 | Aman   |   20 | Patna |       95.5 |
+---------+--------+------+-------+------------+
2 rows in set (0.00 sec)

-- inserting multiple values at a time
mysql> insert into student_details values(103,'Akshat',21,'delhi',88.50),(104,'Ashutosh',22,'pune',97.8),(105,'Sarthak',20,'Gujarat',98.30);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+
| Roll_no | Name     | Age  | City    | percentage |
+---------+----------+------+---------+------------+
|     101 | Aditya   |   20 | Pune    |       91.5 |
|     102 | Aman     |   20 | Patna   |       95.5 |
|     103 | Akshat   |   21 | delhi   |       88.5 |
|     104 | Ashutosh |   22 | pune    |       97.8 |
|     105 | Sarthak  |   20 | Gujarat |       98.3 |
+---------+----------+------+---------+------------+
5 rows in set (0.00 sec)

mysql> insert into student_details(Roll_no,Name) values(106,'swapnil');
Query OK, 1 row affected (0.01 sec)

mysql> select * from student_details;
+---------+----------+------+---------+------------+
| Roll_no | Name     | Age  | City    | percentage |
+---------+----------+------+---------+------------+
|     101 | Aditya   |   20 | Pune    |       91.5 |
|     102 | Aman     |   20 | Patna   |       95.5 |
|     103 | Akshat   |   21 | delhi   |       88.5 |
|     104 | Ashutosh |   22 | pune    |       97.8 |
|     105 | Sarthak  |   20 | Gujarat |       98.3 |
|     106 | swapnil  | NULL | NULL    |       NULL |
+---------+----------+------+---------+------------+
6 rows in set (0.00 sec)

mysql> select Name,Age,city from student_details;
+----------+------+---------+
| Name     | Age  | city    |
+----------+------+---------+
| Aditya   |   20 | Pune    |
| Aman     |   20 | Patna   |
| Akshat   |   21 | delhi   |
| Ashutosh |   22 | pune    |
| Sarthak  |   20 | Gujarat |
| swapnil  | NULL | NULL    |
+----------+------+---------+
6 rows in set (0.00 sec)

mysql> select Name,Age,city from student_details where Roll_no=104;
+----------+------+------+
| Name     | Age  | city |
+----------+------+------+
| Ashutosh |   22 | pune |
+----------+------+------+
1 row in set (0.01 sec)

mysql> select Name,Age,city from student_details where City='Pune';
+----------+------+------+
| Name     | Age  | city |
+----------+------+------+
| Aditya   |   20 | Pune |
| Ashutosh |   22 | pune |
+----------+------+------+
2 rows in set (0.01 sec)

mysql> select Name,Age,city from student_details where percentage>91.5;
+----------+------+---------+
| Name     | Age  | city    |
+----------+------+---------+
| Aman     |   20 | Patna   |
| Ashutosh |   22 | pune    |
| Sarthak  |   20 | Gujarat |
+----------+------+---------+
3 rows in set (0.00 sec)

mysql> select * from student_details where percentage>91.5;
+---------+----------+------+---------+------------+
| Roll_no | Name     | Age  | City    | percentage |
+---------+----------+------+---------+------------+
|     102 | Aman     |   20 | Patna   |       95.5 |
|     104 | Ashutosh |   22 | pune    |       97.8 |
|     105 | Sarthak  |   20 | Gujarat |       98.3 |
+---------+----------+------+---------+------------+
3 rows in set (0.00 sec)

mysql> select * from student_details where percentage>91.5 AND percentage<98.30;
+---------+----------+------+-------+------------+
| Roll_no | Name     | Age  | City  | percentage |
+---------+----------+------+-------+------------+
|     102 | Aman     |   20 | Patna |       95.5 |
|     104 | Ashutosh |   22 | pune  |       97.8 |
+---------+----------+------+-------+------------+
2 rows in set (0.00 sec)

-- Alter command for adding column ,deleting column ,modifying value and column rename.
mysql> Alter table student_details add column Division char;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+----------+
| Roll_no | Name     | Age  | City    | percentage | Division |
+---------+----------+------+---------+------------+----------+
|     101 | Aditya   |   20 | Pune    |       91.5 | NULL     |
|     102 | Aman     |   20 | Patna   |       95.5 | NULL     |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL     |
|     104 | Ashutosh |   22 | pune    |       97.8 | NULL     |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | NULL     |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL     |
+---------+----------+------+---------+------------+----------+
6 rows in set (0.00 sec)

mysql> Alter table student_details add column Grade char;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+----------+-------+
| Roll_no | Name     | Age  | City    | percentage | Division | Grade |
+---------+----------+------+---------+------------+----------+-------+
|     101 | Aditya   |   20 | Pune    |       91.5 | NULL     | NULL  |
|     102 | Aman     |   20 | Patna   |       95.5 | NULL     | NULL  |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL     | NULL  |
|     104 | Ashutosh |   22 | pune    |       97.8 | NULL     | NULL  |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | NULL     | NULL  |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL     | NULL  |
+---------+----------+------+---------+------------+----------+-------+
6 rows in set (0.00 sec)

mysql> Alter table student_details drop column Grade;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+----------+
| Roll_no | Name     | Age  | City    | percentage | Division |
+---------+----------+------+---------+------------+----------+
|     101 | Aditya   |   20 | Pune    |       91.5 | NULL     |
|     102 | Aman     |   20 | Patna   |       95.5 | NULL     |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL     |
|     104 | Ashutosh |   22 | pune    |       97.8 | NULL     |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | NULL     |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL     |
+---------+----------+------+---------+------------+----------+
6 rows in set (0.00 sec)

mysql> Alter table student_details modify Division varchar(5);
Query OK, 6 rows affected (0.05 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> Alter table student_details rename column Division to Batch;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+-------+
| Roll_no | Name     | Age  | City    | percentage | Batch |
+---------+----------+------+---------+------------+-------+
|     101 | Aditya   |   20 | Pune    |       91.5 | NULL  |
|     102 | Aman     |   20 | Patna   |       95.5 | NULL  |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL  |
|     104 | Ashutosh |   22 | pune    |       97.8 | NULL  |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | NULL  |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL  |
+---------+----------+------+---------+------------+-------+
6 rows in set (0.00 sec)

-- updating the data 
mysql> update student_details set Batch='A3' where City='Pune';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+-------+
| Roll_no | Name     | Age  | City    | percentage | Batch |
+---------+----------+------+---------+------------+-------+
|     101 | Aditya   |   20 | Pune    |       91.5 | A3    |
|     102 | Aman     |   20 | Patna   |       95.5 | NULL  |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL  |
|     104 | Ashutosh |   22 | pune    |       97.8 | A3    |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | NULL  |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL  |
+---------+----------+------+---------+------------+-------+
6 rows in set (0.00 sec)

mysql> update student_details set Batch='A2' where Age=20;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+-------+
| Roll_no | Name     | Age  | City    | percentage | Batch |
+---------+----------+------+---------+------------+-------+
|     101 | Aditya   |   20 | Pune    |       91.5 | A2    |
|     102 | Aman     |   20 | Patna   |       95.5 | A2    |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL  |
|     104 | Ashutosh |   22 | pune    |       97.8 | A3    |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | A2    |
|     106 | swapnil  | NULL | NULL    |       NULL | NULL  |
+---------+----------+------+---------+------------+-------+
6 rows in set (0.00 sec)

mysql> update student_details set percentage=96.50  where Name='swapnil';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+-------+
| Roll_no | Name     | Age  | City    | percentage | Batch |
+---------+----------+------+---------+------------+-------+
|     101 | Aditya   |   20 | Pune    |       91.5 | A2    |
|     102 | Aman     |   20 | Patna   |       95.5 | A2    |
|     103 | Akshat   |   21 | delhi   |       88.5 | NULL  |
|     104 | Ashutosh |   22 | pune    |       97.8 | A3    |
|     105 | Sarthak  |   20 | Gujarat |       98.3 | A2    |
|     106 | swapnil  | NULL | NULL    |       96.5 | NULL  |
+---------+----------+------+---------+------------+-------+
6 rows in set (0.00 sec)

mysql> Alter table student_details drop column Batch;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student_details;
+---------+----------+------+---------+------------+
| Roll_no | Name     | Age  | City    | percentage |
+---------+----------+------+---------+------------+
|     101 | Aditya   |   20 | Pune    |       91.5 |
|     102 | Aman     |   20 | Patna   |       95.5 |
|     103 | Akshat   |   21 | delhi   |       88.5 |
|     104 | Ashutosh |   22 | pune    |       97.8 |
|     105 | Sarthak  |   20 | Gujarat |       98.3 |
|     106 | swapnil  | NULL | NULL    |       96.5 |
+---------+----------+------+---------+------------+
6 rows in set (0.00 sec)

-- delete the particluar data from the table
mysql> delete from student_details where Roll_no=106;
Query OK, 1 row affected (0.01 sec)

mysql> select * from student_details;
+---------+----------+------+---------+------------+
| Roll_no | Name     | Age  | City    | percentage |
+---------+----------+------+---------+------------+
|     101 | Aditya   |   20 | Pune    |       91.5 |
|     102 | Aman     |   20 | Patna   |       95.5 |
|     103 | Akshat   |   21 | delhi   |       88.5 |
|     104 | Ashutosh |   22 | pune    |       97.8 |
|     105 | Sarthak  |   20 | Gujarat |       98.3 |
+---------+----------+------+---------+------------+
5 rows in set (0.00 sec)


mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| computer_student   |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use student;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_student |
+-------------------+
| abatch            |
+-------------------+
1 row in set (0.02 sec)

mysql> select * from abatch;
+---------+---------+--------+--------+
| stud_id | Name    | city   | Mobile |
+---------+---------+--------+--------+
|     101 | Sarthak | Patna  | 883337 |
|     102 | Aryan   | Mumbai | 889977 |
|     103 | Viraj   | Nagar  | 449977 |
|     104 | Aman    | Pune   | 889667 |
+---------+---------+--------+--------+
4 rows in set (0.02 sec)

-- whole table data is deleted
mysql> delete from abatch;
Query OK, 4 rows affected (0.00 sec)

mysql> select * from abatch;
Empty set (0.00 sec)

mysql>
