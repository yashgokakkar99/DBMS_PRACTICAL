import cx_Oracle

try:

# create connection
    conn = cx_Oracle.connect('system/ashutosh@//localhost:1521/xe')
except Exception as err:
    print("Error while creating the connection",err)
else:
    try:
        #create cursor
        cur=conn.cursor()
        cur.callproc('ins_ceo_details',('Marc','Randolph','Netfkix',61))
    except Exception as err:
        print('Exceptions raised while executing procedure.',err)
    else:
        print('procedure executed')
    finally:
        cur.close()
finally:
    #cur.close()
    conn.close()


