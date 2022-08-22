

mysql> use computer_student;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_computer_student |
+----------------------------+
| book                       |
| department                 |
| emp_details                |
| employee                   |
| employee_departemnt        |
| employeename               |
| student_details            |
| supplier                   |
| userprofile                |
| users                      |
+----------------------------+
10 rows in set (0.02 sec)

mysql> select * from employee;
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      1 | Aman     | nagpur |      12000 |  20 | AIDS       |
|      2 | Ashutosh | mumbai |      15000 |  21 | Comp       |
|      4 | sarthak  | nashik |      18000 |  21 | Comp       |
|      5 | Aryan    | pune   |      20000 |  20 | IT         |
|      6 | Swapnil  | Pune   |      19000 |  22 | ENTC       |
+--------+----------+--------+------------+-----+------------+
5 rows in set (0.00 sec)


mysql> select * from employee where Emp_salary>(select Emp_salary from employee where Emp_id=2);
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      4 | sarthak  | nashik |      18000 |  21 | Comp       |
|      5 | Aryan    | pune   |      20000 |  20 | IT         |
|      6 | Swapnil  | Pune   |      19000 |  22 | ENTC       |
+--------+----------+--------+------------+-----+------------+
3 rows in set (0.01 sec)

mysql> select * from employee where Emp_salary<=(select Emp_salary from employee where Emp_id=6);
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      1 | Aman     | nagpur |      12000 |  20 | AIDS       |
|      2 | Ashutosh | mumbai |      15000 |  21 | Comp       |
|      4 | sarthak  | nashik |      18000 |  21 | Comp       |
|      6 | Swapnil  | Pune   |      19000 |  22 | ENTC       |
+--------+----------+--------+------------+-----+------------+
4 rows in set (0.00 sec)

mysql> select * from employee where Emp_salary=(select Emp_salary from employee where Emp_id=6);
+--------+----------+------+------------+-----+------------+
| Emp_id | Emp_name | city | Emp_salary | age | department |
+--------+----------+------+------------+-----+------------+
|      6 | Swapnil  | Pune |      19000 |  22 | ENTC       |
+--------+----------+------+------------+-----+------------+
1 row in set (0.00 sec)


mysql> select * from employee where department in (select department from employee where Emp_id=2);
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      2 | Ashutosh | mumbai |      15000 |  21 | Comp       |
|      4 | sarthak  | nashik |      18000 |  21 | Comp       |
+--------+----------+--------+------------+-----+------------+
2 rows in set (0.01 sec)

mysql> select * from employee where department not in (select department from employee where Emp_id=2);
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      1 | Aman     | nagpur |      12000 |  20 | AIDS       |
|      5 | Aryan    | pune   |      20000 |  20 | IT         |
|      6 | Swapnil  | Pune   |      19000 |  22 | ENTC       |
+--------+----------+--------+------------+-----+------------+
3 rows in set (0.01 sec)

mysql> select * from employee where Emp_salary<(select Emp_salary from employee where Emp_id=4);
+--------+----------+--------+------------+-----+------------+
| Emp_id | Emp_name | city   | Emp_salary | age | department |
+--------+----------+--------+------------+-----+------------+
|      1 | Aman     | nagpur |      12000 |  20 | AIDS       |
|      2 | Ashutosh | mumbai |      15000 |  21 | Comp       |
+--------+----------+--------+------------+-----+------------+
2 rows in set (0.00 sec)

mysql>

