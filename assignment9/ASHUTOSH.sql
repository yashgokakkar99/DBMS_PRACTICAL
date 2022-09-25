CREATE TABLE CEO_DETAILS(
    first_name varchar2(50),
    last_name varchar2(50),
    company varchar2(50),
    AGE number
)


select * from ceo_details;


create or replace procedure ins_ceo_details (P_f_name varchar2,P_l_name varchar2,P_company varchar2,P_age number)
is
begin
insert into ceo_details values(P_f_name,P_l_name,P_company,P_age);
COMMIT;
end;
/

EXEC ins_ceo_details('ASHUTOSH','GUPTA','TCS',30);