import cx_Oracle

try:

# create connection
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
except Exception as err:
    print("Error while creating the connection",err)
else:
    print(conn.version)
    try:
        #create cursor
        cur=conn.cursor()
        #sql=""" UPDATE CEO_DETAILS  SET AGE=:age WHERE AGE <= :age"""
        sql1=""" UPDATE CEO_DETAILS  SET AGE=:age WHERE COMPANY='GOOGLE' """
        cur.execute(sql1,{'age':40})
    except Exception as err:
        print('Error occur while updating the records.',err)
    else:
        print('completed')
        conn.commit()
finally:
    cur.close()
    conn.close()

