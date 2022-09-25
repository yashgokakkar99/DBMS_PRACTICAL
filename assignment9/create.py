import cx_Oracle

# create connection
conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
print(conn.version)
   
#create cursor
cur=conn.cursor()
sql_create=""" 
CREATE TABLE CEO_DETAILS(
    first_name varchar2(50),
    last_name varchar2(50),
    company varchar2(50),
    AGE number
)
"""
        
cur.execute(sql_create)
print('Table created .')
