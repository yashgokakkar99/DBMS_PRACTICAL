SQL> set serverout on
SQL> create table assignment(radius number,area number)
  2  ;

Table created.

SQL> declare
  2      radius_var number;
  3      area_var number;
  4  begin
  5      for radius_var in 5..8 loop
  6          area_var:=pi*radius_var*radius_var;
  7          dbms_output.put_line(area_var);
  8          insert into assignment values(radius_var,area_var);
  9      end loop;
 10  end;
 11  /
        area_var:=pi*radius_var*radius_var;
                  *
ERROR at line 6:
ORA-06550: line 6, column 19:
PLS-00201: identifier 'PI' must be declared
ORA-06550: line 6, column 9:
PL/SQL: Statement ignored


SQL> declare
  2      radius_var number;
  3      area_var number;
  4      pi number:=3.14;
  5  begin
  6      for radius_var in 5..8 loop
  7          area_var:=pi*radius_var*radius_var;
  8          dbms_output.put_line(area_var);
  9          insert into assignment values(radius_var,area_var);
 10      end loop;
 11  end;
 12  /
 
 
 output-
 
78.5
113.04
153.86
200.96

PL/SQL procedure successfully completed.

SQL> select * from assignment;

    RADIUS       AREA
---------- ----------
         5       78.5
         6     113.04
         7     153.86
         8     200.96

SQL>




