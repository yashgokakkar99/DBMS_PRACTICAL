-- Write a PL/SQL code block to calculate the area of a circle for a value of radius varying from 5 to 
-- 9. Store the radius and the corresponding values of calculated area in an empty table named areas, 
-- consisting of two columns, radius and area.


--CREATE TABLE circle_area (radius number, area number);


declare 
radius_var number;
area_var number;
pi number:= 3.14;
begin
for radius_var in 5..9 loop
area_var:=pi*radius_var*radius_var;
dbms_output.put_line(area_var);
insert into circle_area values(radius_var,area_var);
end loop;
end;
/


select * from circle_area;




SQL> select * from circle_area;

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


