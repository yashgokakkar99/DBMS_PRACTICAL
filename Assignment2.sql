--INDEX
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

--creating index
mysql> create index index_bname on Book(bname);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

 --droping index
mysql> drop index index_bname on Book;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create index index_bname on Book(bname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

--Alter command in index

mysql> alter table Book add index index_price (price);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter table Book modify book_id int primary key;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter table Book drop primary key;
Query OK, 6 rows affected (0.08 sec)
Records: 6  Duplicates: 0  Warnings: 0


mysql> alter table Book add index(book_id);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> /* drop a index*/
mysql> alter table Book drop index index_price;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

--showing indexes
mysql> show index from Book;
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| book  |          1 | index_bname |            1 | bname       | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| book  |          1 | book_id     |            1 | book_id     | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.02 sec)

mysql> drop index index_bname on Book;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from Book;
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| book  |          1 | book_id  |            1 | book_id     | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.00 sec)
