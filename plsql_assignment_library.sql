/*

create table borrower1(rollno int,Name varchar(20),doi date,nameOfBook varchar(20),status varchar(5));

create table fines(roll_no int,todaydate date,amnt int);

insert into borrower1 values(05,'Aman','08-05-2022','DBMS','i');
insert into borrower1 values(15,'Sallu','08-15-2022','TOC','i');
insert into borrower1 values(09,'kariman','08-23-2022','SPOS','i');
insert into borrower1 values(55,'Rishu','08-29-2022','CNS','i');
insert into borrower1 values(34,'Aashish','09-05-2022','DBMS','i');
insert into borrower1 values(37,'Lala','08-18-2022','TOC','i');
insert into borrower1 values(05,'Iqr','08-05-2022','DBMS','i');
insert into borrower1 values(10,'Adam','08-12-2022','DBMS','i');



select * from borrower1;
select * from fines;

*/

DECLARE 
roll_number number;
name1 varchar(20);
dateofissue date;
System_date date;
noOfDays number(20);
amnt number;
BEGIN
roll_number:=:roll_number;
name1:=:name1;
select Sysdate into System_date from dual;
select doi into dateofissue from borrower1 where rollno=roll_number and nameOfBook=name1;
dbms_output.put_line(dateofissue);
noOfDays:=System_date - dateofissue;
dbms_output.put_line(noOfDays);
if noOfDays>15 and noOfdays<30 then
amnt:=noOfdays*5;
dbms_output.put_line('Fine: ' ||amnt);
elsif noOfdays>30 then
amnt:=noOfdays*50;
dbms_output.put_line('Fine: ' ||amnt);
else
dbms_output.put_line('No fine');
END IF;
IF noOfDays>15 THEN
INSERT INTO fines values(roll_number,Sysdate,amnt);
UPDATE borrower1 set status ='r' where rollno=roll_number;
END if;
exception
when no_data_found then
dbms_output.put_line(roll_number||' Not Found');

END;
/
