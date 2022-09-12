SQL> set serverout on
SQL> create table assignment(radius number,area number)
  2  ;

Table created.

SQL> declare
  2      radius_var number;
  3      area_var number;
  4      pi number:=3.14;
  5  begin
  6      for radius_var in 5..9 loop
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
254.34

PL/SQL procedure successfully completed.

SQL> select * from assignment;

    RADIUS       AREA
---------- ----------
         5       78.5
         6     113.04
         7     153.86
         8     200.96
         9     254.34

SQL>


--in sql developer
--first create table after running it comment it 
--because it will created only once


--create table assignment_3b(radius number,area number);

declare
      radius_var number;
      area_var number;
      pi number:=3.14;
begin
      for radius_var in 5..8 loop
      area_var:=pi*radius_var*radius_var;
          dbms_output.put_line(area_var);
          insert into assignment_3b values(radius_var,area_var);
      end loop;
end;
/

output-
78.5
113.04
153.86
200.96


PL/SQL procedure successfully completed.


--delete from assignment_3b;


