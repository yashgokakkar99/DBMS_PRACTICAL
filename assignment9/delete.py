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
        sql=""" DELETE FROM CEO_DETAILS """
        cur.execute(sql)
    except Exception as err:
        print('Error occur while deleting the records.',err)
    else:
        print('cDeletion completed')
        conn.commit()
finally:
    cur.close()
    conn.close()


