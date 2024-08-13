*** Settings ***
Library           RequestsLibrary
Resource           ../resources/keywords/api_keywords.robot


*** Test Cases ***
Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    Obter Informacoes Do Pais
