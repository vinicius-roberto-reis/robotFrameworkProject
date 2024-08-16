import pyodbc
from datetime import datetime
from robot.api import logger

class SimpleDBListener:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        print('\nListener inicializado\n')
        self.connection_string = (
            'DRIVER={SQL Server};'
            'SERVER=DESKTOP-QAV6K6I\\SQLEXPRESS;'
            'DATABASE=RdcDB;'
            'Trusted_Connection=yes;'
        )
        self.start_time = None
        self.end_time = None

    def start_test(self, name, attributes):
        self.start_time = datetime.now()
        print(f"\nSTARTING TEST: {name} at {self.start_time}\n")

    def end_test(self, name, attributes):
        self.end_time = datetime.now()
        test_name = self.clean_test_name(str(name))  # Remove o prefixo desnecessário
        test_status = attributes.status
        print(f"\nENDING TEST: {test_name} at {self.end_time} with status {test_status}\n")
        self.save_to_database(test_name, test_status)

    def clean_test_name(self, test_name):
        # Encontra a posição inicial do nome do teste e extrai o conteúdo entre aspas
        start_index = test_name.find("name='") + len("name='")
        end_index = test_name.find("'", start_index)
        return test_name[start_index:end_index]

    def save_to_database(self, test_name, test_status):
        try:
            print('\nSalvando dados no banco de dados\n')
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO tbl_execution (date_time_start, date_time_end, test_case, result) "
                "VALUES (?, ?, ?, ?)",
                (self.start_time, self.end_time, test_name, test_status)
            )
            conn.commit()
            cursor.close()
            conn.close()
            print("\nDados inseridos com sucesso no banco de dados.\n")
        except Exception as e:
            print(f"\nOcorreu um erro ao salvar dados no banco de dados: {e}\n")
