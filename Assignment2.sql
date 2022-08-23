CREATE TABLE `users` (
  `auid` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `createdate` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL
);


CREATE TABLE `userprofile` (
  `apid` int(10) UNSIGNED NOT NULL,
  `auid` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(45) NOT NULL
);

Insert into users
(auid, username,password, createdate, isActive)
values
(1,'admin','pswrd123', curdate(), 1);
Insert into userprofile
(apid, auid, firstname, lastname, email, phone)
values
(1,1,'Jack', 'Wolf', 'bettestroom@gmail.com','600075764216');
Insert into users
(auid,username,password, createdate, isActive)
values
(2, 'admin1','pass506', curdate(), 1);
Insert into userprofile
(apid, auid, firstname, lastname, email, phone)
values
(2, 3, 'Tom', 'Collins', 'tnkc@outlook.com','878511311054');
Insert into users
(auid, username,password, createdate, isActive)
values
(4,'fox12','45@jgo0', curdate(), 1);
Insert into userprofile
(apid, auid, firstname, lastname, email, phone)
values
(4,5,'Bill', 'Fonskin', 'bill_1290@gmail.com','450985764216');
Insert into users
(auid,username,password, createdate, isActive)
values
(6, 'lexus1267','98hnfRT6', curdate(), 1);
Insert into userprofile
(apid, auid, firstname, lastname, email, phone)
values
(7, 7, 'Ivan', 'Levchenko', 'ivan_new@outlook.com','878511311054');

mysql> select * from users;
+------+-----------+----------+---------------------+----------+
| auid | username  | password | createdate          | isActive |
+------+-----------+----------+---------------------+----------+
|    1 | admin     | pswrd123 | 2022-08-13 00:00:00 |        1 |
|    2 | admin1    | pass506  | 2022-08-13 00:00:00 |        1 |
|    4 | fox12     | 45@jgo0  | 2022-08-13 00:00:00 |        1 |
|    6 | lexus1267 | 98hnfRT6 | 2022-08-13 00:00:00 |        1 |
+------+-----------+----------+---------------------+----------+
4 rows in set (0.00 sec)

mysql> select * from userprofile;
+------+------+-----------+-----------+-----------------------+--------------+
| apid | auid | firstname | lastname  | email                 | phone        |
+------+------+-----------+-----------+-----------------------+--------------+
|    1 |    1 | Jack      | Wolf      | bettestroom@gmail.com | 600075764216 |
|    2 |    3 | Tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    7 |    7 | Ivan      | Levchenko | ivan_new@outlook.com  | 878511311054 |
+------+------+-----------+-----------+-----------------------+--------------+
4 rows in set (0.00 sec)

/*synatx-SELECT columns FROM tableA 
INNER JOIN tableB
ON tableA.column = tableB.column;
*/
mysql> select t2.apid,t1.auid,t1.username,t2.firstname,t2.email,t1.password from users as t1 inner join
    -> userprofile as t2 where t1.auid=t2.auid;
+------+------+----------+-----------+-----------------------+----------+
| apid | auid | username | firstname | email                 | password |
+------+------+----------+-----------+-----------------------+----------+
|    1 |    1 | admin    | Jack      | bettestroom@gmail.com | pswrd123 |
+------+------+----------+-----------+-----------------------+----------+
1 row in set (0.00 sec)

mysql> select * from users inner join userprofile where users.auid=userprofile.auid;
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
| auid | username | password | createdate          | isActive | apid | auid | firstname | lastname | email                 | phone        |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
|    1 | admin    | pswrd123 | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf     | bettestroom@gmail.com | 600075764216 |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
1 row in set (0.00 sec)

--cross join
/*syntax-SELECT columns FROM tableA
CROSS JOIN tableB;
*/
mysql> select * from users cross join userprofile ;
+------+-----------+----------+---------------------+----------+------+------+-----------+-----------+-----------------------+--------------+
| auid | username  | password | createdate          | isActive | apid | auid | firstname | lastname  | email                 | phone        |
+------+-----------+----------+---------------------+----------+------+------+-----------+-----------+-----------------------+--------------+
|    6 | lexus1267 | 98hnfRT6 | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf      | bettestroom@gmail.com | 600075764216 |
|    4 | fox12     | 45@jgo0  | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf      | bettestroom@gmail.com | 600075764216 |
|    2 | admin1    | pass506  | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf      | bettestroom@gmail.com | 600075764216 |
|    1 | admin     | pswrd123 | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf      | bettestroom@gmail.com | 600075764216 |
|    6 | lexus1267 | 98hnfRT6 | 2022-08-13 00:00:00 |        1 |    2 |    3 | Tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    4 | fox12     | 45@jgo0  | 2022-08-13 00:00:00 |        1 |    2 |    3 | Tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    2 | admin1    | pass506  | 2022-08-13 00:00:00 |        1 |    2 |    3 | Tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    1 | admin     | pswrd123 | 2022-08-13 00:00:00 |        1 |    2 |    3 | Tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    6 | lexus1267 | 98hnfRT6 | 2022-08-13 00:00:00 |        1 |    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    4 | fox12     | 45@jgo0  | 2022-08-13 00:00:00 |        1 |    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    2 | admin1    | pass506  | 2022-08-13 00:00:00 |        1 |    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    1 | admin     | pswrd123 | 2022-08-13 00:00:00 |        1 |    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    6 | lexus1267 | 98hnfRT6 | 2022-08-13 00:00:00 |        1 |    7 |    7 | Ivan      | Levchenko | ivan_new@outlook.com  | 878511311054 |
|    4 | fox12     | 45@jgo0  | 2022-08-13 00:00:00 |        1 |    7 |    7 | Ivan      | Levchenko | ivan_new@outlook.com  | 878511311054 |
|    2 | admin1    | pass506  | 2022-08-13 00:00:00 |        1 |    7 |    7 | Ivan      | Levchenko | ivan_new@outlook.com  | 878511311054 |
|    1 | admin     | pswrd123 | 2022-08-13 00:00:00 |        1 |    7 |    7 | Ivan      | Levchenko | ivan_new@outlook.com  | 878511311054 |
+------+-----------+----------+---------------------+----------+------+------+-----------+-----------+-----------------------+--------------+
16 rows in set (0.00 sec)

--left join
/*
SELECT columns FROM tableA
LEFT [OUTER] JOIN tableB
ON tableA.column = tableB.column;
*/
mysql> select t1.auid,t1.username,t1.password,t2.firstname,t2.lastname from users as t1 left join userprofile as t2 on  t1.auid=t2.auid;
+------+-----------+----------+-----------+----------+
| auid | username  | password | firstname | lastname |
+------+-----------+----------+-----------+----------+
|    1 | admin     | pswrd123 | Jack      | Wolf     |
|    2 | admin1    | pass506  | NULL      | NULL     |
|    4 | fox12     | 45@jgo0  | NULL      | NULL     |
|    6 | lexus1267 | 98hnfRT6 | NULL      | NULL     |
+------+-----------+----------+-----------+----------+
4 rows in set (0.00 sec)

--right join
/* 
SELECT columns FROM tableA 
RIGHT [OUTER] JOIN tableB
ON tableA.column = tableB.column;
*/
mysql> select t1.auid,t1.username,t1.password,t2.firstname,t2.lastname from users as t1 right join userprofile as t2 on  t1.auid=t2.auid;
+------+----------+----------+-----------+-----------+
| auid | username | password | firstname | lastname  |
+------+----------+----------+-----------+-----------+
|    1 | admin    | pswrd123 | Jack      | Wolf      |
| NULL | NULL     | NULL     | Tom       | Collins   |
| NULL | NULL     | NULL     | Bill      | Fonskin   |
| NULL | NULL     | NULL     | Ivan      | Levchenko |
+------+----------+----------+-----------+-----------+
4 rows in set (0.00 sec)
--using
mysql> select t1.auid,t1.username,t1.password,t2.firstname,t2.lastname from users as t1 right join userprofile as t2 using(auid);
+------+----------+----------+-----------+-----------+
| auid | username | password | firstname | lastname  |
+------+----------+----------+-----------+-----------+
|    1 | admin    | pswrd123 | Jack      | Wolf      |
| NULL | NULL     | NULL     | Tom       | Collins   |
| NULL | NULL     | NULL     | Bill      | Fonskin   |
| NULL | NULL     | NULL     | Ivan      | Levchenko |
+------+----------+----------+-----------+-----------+
4 rows in set (0.00 sec)



--view
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

