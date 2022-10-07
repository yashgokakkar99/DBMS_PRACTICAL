print('hello world')

import cx_Oracle

# create connection
conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
print(conn.version)
   
def create_table():
    cur=conn.cursor()
    sql_create=""" 
     CREATE TABLE emp_DETAILS(
    first_name varchar2(50),
    last_name varchar2(50),
    company varchar2(50),
    AGE number
)
"""
        
    cur.execute(sql_create)
    print('Table created .')


def insert_data():
    cur=conn.cursor()
    try:
        sql_insert=""" INSERT INTO emp_DETAILS VALUES(:1, :2, :3, :4)"""
        data=[('SUNDAR','PiCHAI','GOOGLE',34),('MARK','ZUCK','FACEBOOK',38),
               ('ARYAN','SHARMA','TCS',30),('SARTHAk','PAWAR','AMAZO',29),
               ('SHREYA','KULKARNI','WIPRO',42),('ASHUTOSH','GUPTA','GOOGLE',25)]
        cur.executemany(sql_insert,data)
    except Exception as err:
        print('Error while inserting the data.',err)
    else:
        print('Insert completed')
        conn.commit()
    finally:
        cur.close()
        conn.close()
        
def fetcha_data():
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
    cur=conn.cursor()
    try:
        #create cursor

        sql=""" SELECT * FROM emp_DETAILS """
        cur.execute(sql)
        row=cur.fetchall()
        #row=cur.fetchmany(2)
        #row=cur.fetchone
        print(row)
        for index,record in enumerate(row):
            print('Index is',index, ':',record)
    except Exception as err:
        print('Error occur while fetching the records.',err)
    cur.close()
        
def update():
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
    cur = conn.cursor()
    try:
        #create cursor
        #sql=""" UPDATE CEO_DETAILS  SET AGE=:age WHERE AGE <= :age"""
        sql1=""" UPDATE emp_DETAILS  SET AGE=:age WHERE COMPANY='GOOGLE' """
        cur.execute(sql1,{'age':40})
    except Exception as err:
        print('Error occur while updating the records.',err)
    else:
        print('completed')
        conn.commit()
    finally:
        cur.close()
        conn.close()
        
def delete_data():
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
    cur=conn.cursor()
    try:
        #create cursor

        sql=""" DELETE FROM emp_DETAILS """
        cur.execute(sql)
    except Exception as err:
        print('Error occur while deleting the records.',err)
    else:
        print('cDeletion completed')
        conn.commit()
    cur.close()

        
'''def fetchingall_data():
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
    cur=conn.cursor()
    try:
        #create cursor

        sql=""" SELECT * FROM emp_DETAILS  WHERE AGE <= :age"""
        cur.execute(sql,{'age':50})
        row=cur.fetchall()
        #row=cur.fetchmany(2)
        #row=cur.fetchone
        print(row)
        for index,record in enumerate(row):
            print('Index is',index, ':',record)
    except Exception as err:
        print('Error occur while fetching the records.',err)
    else:
        print('completed')
    cur.close()'''




# printing the starting line  
print("WELCOME TO CEO_DETAILS DATA")  
  
# creating options  
while True:  
    print("\nMAIN MENU")  
    print("1. creating table")  
    print("2. inserting data")  
    print("3. displaying data")  
    print("4. updating data")  
    print("5. deleting table")  
    print("6. Exit")  
    choice1 = int(input("Enter the Choice:"))  
  
    if choice1 == 1:  
        create_table()
        print("\nTable created sucessfully")  
         
      
    elif choice1 == 2: 
        insert_data() 
        print("\ninserting data sucessfully")  
        
    elif choice1 == 3:  
        fetcha_data()
        print("displaying data sucessfully") 
    
    elif choice1 == 4:  
        update()
        print("updating data sucessfully") 
    
    elif choice1 == 5:  
        delete_data()
        print("deletion successfully")
        
    
    elif choice1 == 6:  
        break  
      
    else:  
        print("Oops! Incorrect Choice.")  
