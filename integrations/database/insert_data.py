import pyodbc
print("Script insert_data.py is runninfffffffffffffffffffffffffffffffffffffffffffffffffffg")
def insert_data():
    try:
        # Tentar estabelecer conexão
        conn = pyodbc.connect(
            'DRIVER={SQL Server};SERVER=DESKTOP-QAV6K6I\\SQLEXPRESS;DATABASE=RdcDB;Trusted_Connection=yes;')
        print("Connection to database established successfully.")

        cursor = conn.cursor()

        # Inserir valores completos para as colunas DATETIME
        cursor.execute(
            "INSERT INTO tbl_execution (date_time_start, date_time_end, test_case, result) VALUES (?, ?, ?, ?)",
            ('2024-08-1', '2024-08-14 ', 'teste', 'asa'))
        conn.commit()
        print("Data inserted successfully.")

        # Verificar se os dados foram inseridos
        cursor.execute("SELECT * FROM tbl_execution WHERE result='PASSoi'")
        rows = cursor.fetchall()
        for row in rows:
            print(row)

        conn.close()
        print("Connection closed.")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    print("Calling insert_data method")
    insert_data()