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
        sql=""" SELECT * FROM CEO_DETAILS """
        cur.execute(sql)
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
    finally:
        cur.close()
finally:
    #cur.close()
    conn.close()


