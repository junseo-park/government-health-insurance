import pandas
import numpy
import pymysql

db = pymysql.connect("localhost", "root", "abc123lime", "publichealth")
cursor = db.cursor()
cursor.execute("SHOW TABLES")
data = cursor.fetchone()
print(data)