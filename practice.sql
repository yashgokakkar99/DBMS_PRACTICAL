Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
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
| computer_student   |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database Aman;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| aman               |
| computer_student   |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

mysql> use aman
Database changed
mysql> use aman;
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table Student(id int,Name varchar(25), age int,mobile int);
Query OK, 0 rows affected (0.02 sec)

mysql> desc Student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | YES  |     | NULL    |       |
| Name   | varchar(25) | YES  |     | NULL    |       |
| age    | int         | YES  |     | NULL    |       |
| mobile | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Student values(1,"Aman",20,887766);
Query OK, 1 row affected (0.01 sec)

mysql> desc Student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | YES  |     | NULL    |       |
| Name   | varchar(25) | YES  |     | NULL    |       |
| age    | int         | YES  |     | NULL    |       |
| mobile | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from Student;
+------+------+------+--------+
| id   | Name | age  | mobile |
+------+------+------+--------+
|    1 | Aman |   20 | 887766 |
+------+------+------+--------+
1 row in set (0.00 sec)

mysql> select id,Name from Student;
+------+------+
| id   | Name |
+------+------+
|    1 | Aman |
+------+------+
1 row in set (0.00 sec)

mysql> insert into Student(id,Name,Age) values(2,'Ashu',21);
Query OK, 1 row affected (0.01 sec)

mysql> select * from Student;
+------+------+------+--------+
| id   | Name | age  | mobile |
+------+------+------+--------+
|    1 | Aman |   20 | 887766 |
|    2 | Ashu |   21 |   NULL |
+------+------+------+--------+
2 rows in set (0.00 sec)

mysql> insert into Student values(3,"Amans",20,887766),(4,"Aryab",20,995544);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+------+-------+------+--------+
| id   | Name  | age  | mobile |
+------+-------+------+--------+
|    1 | Aman  |   20 | 887766 |
|    2 | Ashu  |   21 |   NULL |
|    3 | Amans |   20 | 887766 |
|    4 | Aryab |   20 | 995544 |
+------+-------+------+--------+
4 rows in set (0.00 sec)

mysql> select * from Student where Name="Aman";
+------+------+------+--------+
| id   | Name | age  | mobile |
+------+------+------+--------+
|    1 | Aman |   20 | 887766 |
+------+------+------+--------+
1 row in set (0.00 sec)

mysql> select * from Student where age>20;
+------+------+------+--------+
| id   | Name | age  | mobile |
+------+------+------+--------+
|    2 | Ashu |   21 |   NULL |
+------+------+------+--------+
1 row in set (0.00 sec)

mysql> Alter table Student add column percentage flaot;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'flaot' at line 1
mysql> Alter table Student add column percentage int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+------+-------+------+--------+------------+
| id   | Name  | age  | mobile | percentage |
+------+-------+------+--------+------------+
|    1 | Aman  |   20 | 887766 |       NULL |
|    2 | Ashu  |   21 |   NULL |       NULL |
|    3 | Amans |   20 | 887766 |       NULL |
|    4 | Aryab |   20 | 995544 |       NULL |
+------+-------+------+--------+------------+
4 rows in set (0.00 sec)

mysql> Alter table Student rename column id to Stud_id;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+---------+-------+------+--------+------------+
| Stud_id | Name  | age  | mobile | percentage |
+---------+-------+------+--------+------------+
|       1 | Aman  |   20 | 887766 |       NULL |
|       2 | Ashu  |   21 |   NULL |       NULL |
|       3 | Amans |   20 | 887766 |       NULL |
|       4 | Aryab |   20 | 995544 |       NULL |
+---------+-------+------+--------+------------+
4 rows in set (0.00 sec)

mysql> Alter table Student modify Name char(25);
Query OK, 4 rows affected (0.05 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc Student;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| Stud_id    | int      | YES  |     | NULL    |       |
| Name       | char(25) | YES  |     | NULL    |       |
| age        | int      | YES  |     | NULL    |       |
| mobile     | int      | YES  |     | NULL    |       |
| percentage | int      | YES  |     | NULL    |       |
+------------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> Alter table Student drop percentage;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+---------+-------+------+--------+
| Stud_id | Name  | age  | mobile |
+---------+-------+------+--------+
|       1 | Aman  |   20 | 887766 |
|       2 | Ashu  |   21 |   NULL |
|       3 | Amans |   20 | 887766 |
|       4 | Aryab |   20 | 995544 |
+---------+-------+------+--------+
4 rows in set (0.00 sec)

mysql> update Student set age=21 where Name='Aman';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Student;
+---------+-------+------+--------+
| Stud_id | Name  | age  | mobile |
+---------+-------+------+--------+
|       1 | Aman  |   21 | 887766 |
|       2 | Ashu  |   21 |   NULL |
|       3 | Amans |   20 | 887766 |
|       4 | Aryab |   20 | 995544 |
+---------+-------+------+--------+
4 rows in set (0.00 sec)

mysql> delete from Student where Name='Ayrab';
Query OK, 0 rows affected (0.00 sec)

mysql> select * from Student;
+---------+-------+------+--------+
| Stud_id | Name  | age  | mobile |
+---------+-------+------+--------+
|       1 | Aman  |   21 | 887766 |
|       2 | Ashu  |   21 |   NULL |
|       3 | Amans |   20 | 887766 |
|       4 | Aryab |   20 | 995544 |
+---------+-------+------+--------+
4 rows in set (0.00 sec)

mysql> select * from Student;
+---------+-------+------+--------+
| Stud_id | Name  | age  | mobile |
+---------+-------+------+--------+
|       1 | Aman  |   21 | 887766 |
|       2 | Ashu  |   21 |   NULL |
|       3 | Amans |   20 | 887766 |
|       4 | Aryab |   20 | 995544 |
+---------+-------+------+--------+
4 rows in set (0.00 sec)

mysql> delete from Student where Stud_id=4;
Query OK, 1 row affected (0.01 sec)

mysql> select * from Student;
+---------+-------+------+--------+
| Stud_id | Name  | age  | mobile |
+---------+-------+------+--------+
|       1 | Aman  |   21 | 887766 |
|       2 | Ashu  |   21 |   NULL |
|       3 | Amans |   20 | 887766 |
+---------+-------+------+--------+
3 rows in set (0.00 sec)

mysql> drop Student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Student' at line 1
mysql> delete from Student;
Query OK, 3 rows affected (0.01 sec)

mysql> select * from Student;
Empty set (0.00 sec)

mysql>
