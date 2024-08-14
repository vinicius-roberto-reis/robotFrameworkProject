*** Settings ***
Library           RequestsLibrary
Resource           ../resources/keywords/api_keywords.robot

*** Variables ***
${endpoint}     /name/Brazil

*** Test Cases ***
Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    Valido a requisição GET com sucesso do endpoint     ${endpoint}

Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${endpoint}
    Validar Schema Da Resposta    ${response}    response_schema.json