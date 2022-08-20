
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
| computer_student   |
| employee           |
| information_schema |
| mysql              |
| performance_schema |
| student            |
| sys                |
+--------------------+
7 rows in set (0.03 sec)

mysql> use computer_student
Database changed
mysql> create table Book (book_id int not null,bname varchar (25),Author varchar (25),price int );
Query OK, 0 rows affected (0.05 sec)

mysql> insert into Book values(1,"DBMS","XYZ",400),(2,"OS","ABC",250),(3,"SP","MNO",300),(4,"CNS","PQR",200),(5,"TOC","QWE",450),(6,"SPM","ARE",500);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Book;
+---------+-------+--------+-------+
| book_id | bname | Author | price |
+---------+-------+--------+-------+
|       1 | DBMS  | XYZ    |   400 |
|       2 | OS    | ABC    |   250 |
|       3 | SP    | MNO    |   300 |
|       4 | CNS   | PQR    |   200 |
|       5 | TOC   | QWE    |   450 |
|       6 | SPM   | ARE    |   500 |
+---------+-------+--------+-------+
6 rows in set (0.00 sec)

mysql> create index index_bname on Book(bname);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from index_bname;
ERROR 1146 (42S02): Table 'computer_student.index_bname' doesn't exist
mysql> drop index index_bname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> drop index index_bname on Book;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Book;
+---------+-------+--------+-------+
| book_id | bname | Author | price |
+---------+-------+--------+-------+
|       1 | DBMS  | XYZ    |   400 |
|       2 | OS    | ABC    |   250 |
|       3 | SP    | MNO    |   300 |
|       4 | CNS   | PQR    |   200 |
|       5 | TOC   | QWE    |   450 |
|       6 | SPM   | ARE    |   500 |
+---------+-------+--------+-------+
6 rows in set (0.00 sec)

mysql> select bname from Book where price =400;
+-------+
| bname |
+-------+
| DBMS  |
+-------+
1 row in set (0.01 sec)

mysql> select bname from Book where price >200;
+-------+
| bname |
+-------+
| DBMS  |
| OS    |
| SP    |
| TOC   |
| SPM   |
+-------+
5 rows in set (0.00 sec)

mysql> create index index_bname on Book(bname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select bname from Book where price =400;
+-------+
| bname |
+-------+
| DBMS  |
+-------+
1 row in set (0.00 sec)

mysql> select bname from Book where price >200;
+-------+
| bname |
+-------+
| DBMS  |
| OS    |
| SP    |
| TOC   |
| SPM   |
+-------+
5 rows in set (0.00 sec)

mysql> alter table Book add index index_price (price);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Book where price >200;
+---------+-------+--------+-------+
| book_id | bname | Author | price |
+---------+-------+--------+-------+
|       2 | OS    | ABC    |   250 |
|       3 | SP    | MNO    |   300 |
|       1 | DBMS  | XYZ    |   400 |
|       5 | TOC   | QWE    |   450 |
|       6 | SPM   | ARE    |   500 |
+---------+-------+--------+-------+
5 rows in set (0.01 sec)

mysql> alter table Book drop index index_price (price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(price)' at line 1
mysql> alter table Book drop index_price;
ERROR 1091 (42000): Can't DROP 'index_price'; check that column/key exists
mysql> alter table Book drop index_price(price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(price)' at line 1
mysql> Alter table Book modify book_id int primary key;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter table Book drop primary key;
Query OK, 6 rows affected (0.08 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Book;
+---------+-------+--------+-------+
| book_id | bname | Author | price |
+---------+-------+--------+-------+
|       1 | DBMS  | XYZ    |   400 |
|       2 | OS    | ABC    |   250 |
|       3 | SP    | MNO    |   300 |
|       4 | CNS   | PQR    |   200 |
|       5 | TOC   | QWE    |   450 |
|       6 | SPM   | ARE    |   500 |
+---------+-------+--------+-------+
6 rows in set (0.00 sec)

mysql> /* to drop a index*/
mysql> Alter table Book drop index(price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(price)' at line 1
mysql> alter table Book drop index(price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(price)' at line 1
mysql> alter table Book add index(book_id);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table Book drop index(book_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(book_id)' at line 1
mysql> /* drop a index*/
mysql> alter table Book drop index index_price;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from Book;
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| book  |          1 | index_bname |            1 | bname       | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| book  |          1 | book_id     |            1 | book_id     | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.02 sec)

mysql>
