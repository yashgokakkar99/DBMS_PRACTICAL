Join in mysql
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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

mysql> use computer_student;
Database changed
mysql> show tables;
+----------------------------+
| Tables_in_computer_student |
+----------------------------+
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
9 rows in set (0.00 sec)

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

mysql> select * from users outer join userprofile where users.auid=userprofile.auid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'outer join userprofile where users.auid=userprofile.auid' at line 1
mysql> select * from users inner join userprofile where users.auid=userprofile.auid;
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
| auid | username | password | createdate          | isActive | apid | auid | firstname | lastname | email                 | phone        |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
|    1 | admin    | pswrd123 | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf     | bettestroom@gmail.com | 600075764216 |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
1 row in set (0.00 sec)

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

mysql> select * from users left join userprofile;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select * from users left join userprofile where users.auid=userprofile.auid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where users.auid=userprofile.auid' at line 1
mysql> select t1.auid,t1.username,t1.password,t2.firstname,t2.lastname from users as t1 left join userprofile as t2 where t1.auid=t2.auid;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where t1.auid=t2.auid' at line 1
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

mysql> select * from users inner join userprofile on users.auid=userprofile.auid where firstname='jack';
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
| auid | username | password | createdate          | isActive | apid | auid | firstname | lastname | email                 | phone        |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
|    1 | admin    | pswrd123 | 2022-08-13 00:00:00 |        1 |    1 |    1 | Jack      | Wolf     | bettestroom@gmail.com | 600075764216 |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
1 row in set (0.00 sec)

mysql> select * from users inner join userprofile on users.auid=userprofile.auid where username='fox12';
Empty set (0.00 sec)

mysql> select * from users inner join userprofile using(auid);
+------+----------+----------+---------------------+----------+------+-----------+----------+-----------------------+--------------+
| auid | username | password | createdate          | isActive | apid | firstname | lastname | email                 | phone        |
+------+----------+----------+---------------------+----------+------+-----------+----------+-----------------------+--------------+
|    1 | admin    | pswrd123 | 2022-08-13 00:00:00 |        1 |    1 | Jack      | Wolf     | bettestroom@gmail.com | 600075764216 |
+------+----------+----------+---------------------+----------+------+-----------+----------+-----------------------+--------------+
1 row in set (0.00 sec)

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

mysql>
