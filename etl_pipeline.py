import pandas as pd
import mysql.connector


df = pd.read_csv("../data/sales.csv")


df.dropna(inplace=True)

# Create derived column
df["total_amount"] = df["quantity"] * df["price"]

# Convert date
df["order_date"] = pd.to_datetime(df["order_date"])
# CONNECT MYSQL

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="ecommerce_dw"
)

cursor = conn.cursor()


# LOAD INTO MYSQL

for _, row in df.iterrows():
    cursor.execute("""
        INSERT INTO fact_sales
        (order_id, customer_id, product, category, quantity, price, total_amount, order_date, city)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, (
        row.order_id,
        row.customer_id,
        row.product,
        row.category,
        row.quantity,
        row.price,
        row.total_amount,
        row.order_date,
        row.city
    ))

conn.commit()
cursor.close()
conn.close()

print("ETL Pipeline executed successfully!")
