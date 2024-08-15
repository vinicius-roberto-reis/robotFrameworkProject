*** Settings ***
Library    Process
Library    insert_data.py  # Importando o arquivo Python diretamente

*** Test Cases ***
Insert Data Test
    Run Process    python    -c    "from insert_data import insert_data; insert_data()"
    Log    Data insertion process completed.
