import mysql.connector

def set_conn():
    conn = mysql.connector.connect(
        user="root",
        password="",
        host="localhost",
        database="db_tokoku"
    )
    return conn

def inup(query, val):
    conn = set_conn()
    mycursor = conn.cursor()
    mycursor.execute(query, val)
    conn.commit()

def row_count(query):
    conn = set_conn()
    mycursor = conn.cursor()
    mycursor.execute(query)
    mycursor.fetchall()
    rc = mycursor.rowcount
    return rc

def get_data(query):
    conn = set_conn()
    if row_count(query) > 0:
        cursor = conn.cursor()
        cursor.execute(query)
        data = cursor.fetchall()
        conn.close()
        return data
    else:
        return None

def insert_data(table, data):
    col = ', '.join(data.keys())
    nval = "%s" + ", %s" * (len(data) - 1)
    query = f"INSERT INTO {table} ({col}) VALUES ({nval})"
    values = list(data.values())
    inup(query, values)
