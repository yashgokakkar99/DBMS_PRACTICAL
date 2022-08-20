

mysql> select * from employee;
+--------+----------+--------+------------+-----+
| Emp_id | Emp_name | city   | Emp_salary | age |
+--------+----------+--------+------------+-----+
|      1 | Aman     | nagpur |      12000 |  20 |
|      2 | Ashutosh | mumbai |      15000 |  21 |
|      3 | Aryan    | pune   |      20000 |  20 |
|      4 | sarthak  | nashik |      18000 |  21 |
+--------+----------+--------+------------+-----+
4 rows in set (0.00 sec)

mysql> select * from department ;
+--------+---------+
| Emp_id | Dname   |
+--------+---------+
|      1 | Account |
|      2 | sales   |
|      3 | Finance |
|      4 | sales   |
+--------+---------+
4 rows in set (0.00 sec)

--creating a view 
mysql> CREATE view Emp_details as select Emp_id,Emp_name,city from employee;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Emp_details;
+--------+----------+--------+
| Emp_id | Emp_name | city   |
+--------+----------+--------+
|      1 | Aman     | nagpur |
|      2 | Ashutosh | mumbai |
|      3 | Aryan    | pune   |
|      4 | sarthak  | nashik |
+--------+----------+--------+
4 rows in set (0.00 sec)



mysql> create view Employeename as select Emp_id,Emp_name from employee;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Employeename;
+--------+----------+
| Emp_id | Emp_name |
+--------+----------+
|      1 | Aman     |
|      3 | Aryan    |
|      2 | Ashutosh |
|      4 | sarthak  |
+--------+----------+
4 rows in set (0.00 sec)

 --creating a view from two table

mysql> create view Employee_Depart_details as select employee.Emp_id,employee.Emp_name,department.Dname from employee,department 
       where employee.Emp_id=department.Emp_id;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Employee_Depart_details;
+--------+----------+---------+
| Emp_id | Emp_name | Dname   |
+--------+----------+---------+
|      1 | Aman     | Account |
|      2 | Ashutosh | sales   |
|      3 | Aryan    | Finance |
|      4 | sarthak  | sales   |
+--------+----------+---------+
4 rows in set (0.00 sec)


--Alter command in view 
--Adding a column
mysql> Alter view Emp_details as select Emp_id,Emp_name,city,age from employee;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Emp_details;
+--------+----------+--------+-----+
| Emp_id | Emp_name | city   | age |
+--------+----------+--------+-----+
|      1 | Aman     | nagpur |  20 |
|      2 | Ashutosh | mumbai |  21 |
|      3 | Aryan    | pune   |  20 |
|      4 | sarthak  | nashik |  21 |
+--------+----------+--------+-----+
4 rows in set (0.00 sec)


--updating in view
mysql> update Emp_details set age=22 where Emp_name="Aryan";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Emp_details;
+--------+----------+--------+-----+
| Emp_id | Emp_name | city   | age |
+--------+----------+--------+-----+
|      1 | Aman     | nagpur |  20 |
|      2 | Ashutosh | mumbai |  21 |
|      3 | Aryan    | pune   |  22 |
|      4 | sarthak  | nashik |  21 |
+--------+----------+--------+-----+
4 rows in set (0.00 sec)


--delete command in view
mysql> delete from Emp_details where age=22;
Query OK, 1 row affected (0.01 sec)

mysql> select * from Emp_details;
+--------+----------+--------+-----+
| Emp_id | Emp_name | city   | age |
+--------+----------+--------+-----+
|      1 | Aman     | nagpur |  20 |
|      2 | Ashutosh | mumbai |  21 |
|      4 | sarthak  | nashik |  21 |
+--------+----------+--------+-----+
3 rows in set (0.00 sec)


--drop view
mysql> drop view Employee_Depart_details;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Employee_Depart_details;
ERROR 1146 (42S02): Table 'computer_student.employee_depart_details' doesn't exist




