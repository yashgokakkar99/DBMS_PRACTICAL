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


