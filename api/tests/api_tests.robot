*** Settings ***
Library           RequestsLibrary
Resource           ../resources/keywords/api_keywords.robot
#Variables          ../resources/variables/api_variables.robot
Variables          variables.yaml

*** Test Cases ***
Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    Log    ${base_url}  # Adicione esta linha
    Obter Informacoes Do Pais
