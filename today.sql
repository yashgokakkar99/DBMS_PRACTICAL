ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| B1_data            |
| Bank               |
| BikeStore          |
| Computer_student   |
| Employee           |
| NEMESIS            |
| Princeton          |
| Student1           |
| TE                 |
| TEB                |
| b1                 |
| bhaiPakka          |
| client             |
| companny           |
| const              |
| dsa                |
| dyp                |
| employee           |
| employee1          |
| information_schema |
| joins              |
| k1                 |
| library            |
| madhuri            |
| manga              |
| mysql              |
| p1                 |
| performance_schema |
| sourabh            |
| student1           |
| suraj              |
| suyash             |
| sys                |
+--------------------+
33 rows in set (0.00 sec)

mysql> use Computer_student
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------------------+
| Tables_in_Computer_student |
+----------------------------+
| employee                   |
| student                    |
| student_detail             |
| student_details            |
| students                   |
+----------------------------+
5 rows in set (0.00 sec)

mysql> select * from employee;
+---------+------------+--------------+---------------+
| name    | occupation | working_date | working_hours |
+---------+------------+--------------+---------------+
| Robin   | Scientist  | 2020-10-04   | 12            |
| Warner  | Engineer   | 2020-10-04   | 10            |
| Peter   | Actor      | 2020-10-04   | 13            |
| Marco   | Doctor     | 2020-10-04   | 14            |
| Brayden | Teacher    | 2020-10-04   | 12            |
| Antonio | Business   | 2020-10-04   | 11            |
+---------+------------+--------------+---------------+
6 rows in set (0.00 sec)

mysql> Alter table employee add column city varchar(20);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+---------+------------+--------------+---------------+------+
| name    | occupation | working_date | working_hours | city |
+---------+------------+--------------+---------------+------+
| Robin   | Scientist  | 2020-10-04   | 12            | NULL |
| Warner  | Engineer   | 2020-10-04   | 10            | NULL |
| Peter   | Actor      | 2020-10-04   | 13            | NULL |
| Marco   | Doctor     | 2020-10-04   | 14            | NULL |
| Brayden | Teacher    | 2020-10-04   | 12            | NULL |
| Antonio | Business   | 2020-10-04   | 11            | NULL |
+---------+------------+--------------+---------------+------+
6 rows in set (0.00 sec)

mysql> update employee set city="pune" where working_hours=12;
Query OK, 2 rows affected (0.04 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update employee set city="Delhi" where working_hours=10;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set city="Nagpur" where working_hours=14;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set city="Mumbai" where working_hours=11;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set city="Nashik" where working_hours=13;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+---------+------------+--------------+---------------+--------+
| name    | occupation | working_date | working_hours | city   |
+---------+------------+--------------+---------------+--------+
| Robin   | Scientist  | 2020-10-04   | 12            | pune   |
| Warner  | Engineer   | 2020-10-04   | 10            | Delhi  |
| Peter   | Actor      | 2020-10-04   | 13            | Nashik |
| Marco   | Doctor     | 2020-10-04   | 14            | Nagpur |
| Brayden | Teacher    | 2020-10-04   | 12            | pune   |
| Antonio | Business   | 2020-10-04   | 11            | Mumbai |
+---------+------------+--------------+---------------+--------+
6 rows in set (0.00 sec)

mysql> select city,count(city) from employee group by city;
+--------+-------------+
| city   | count(city) |
+--------+-------------+
| pune   |           2 |
| Delhi  |           1 |
| Nashik |           1 |
| Nagpur |           1 |
| Mumbai |           1 |
+--------+-------------+
5 rows in set (0.04 sec)

mysql> select city,count(city) from employee group by city having city="pune";
+------+-------------+
| city | count(city) |
+------+-------------+
| pune |           2 |
+------+-------------+
1 row in set (0.00 sec)

mysql> select working_hours,sum(working_hours) from employee group by working_hours;
+---------------+--------------------+
| working_hours | sum(working_hours) |
+---------------+--------------------+
| 12            |                 24 |
| 10            |                 10 |
| 13            |                 13 |
| 14            |                 14 |
| 11            |                 11 |
+---------------+--------------------+
5 rows in set (0.05 sec)

mysql> selet name ,sum(working_hours) from employee group by name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selet name ,sum(working_hours) from employee group by name' at line 1
mysql> selet name ,sum(working_hours) from employee group by woking_hours;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selet name ,sum(working_hours) from employee group by woking_hours' at line 1
mysql>     SELECT emp_name, SUM(working_hours) AS "Total working hours"  
    ->     FROM employees  
    ->     GROUP BY emp_name;  
ERROR 1146 (42S02): Table 'Computer_student.employees' doesn't exist
mysql> ^C
mysql> 

