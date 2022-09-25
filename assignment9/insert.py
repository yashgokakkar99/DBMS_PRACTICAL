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
        sql_insert=""" INSERT INTO CEO_DETAILS VALUES(:1, :2, :3, :4)"""
        data=[('SUNDAR','PiCHAI','GOOGLE',34),('MARK','ZUCK','FACEBOOK',38)]
        cur.executemany(sql_insert,data)
    except Exception as err:
        print('Error while inserting the data.',err)
    else:
        print('Insert completed')
        conn.commit()
finally:
    cur.close()
    conn.close()


