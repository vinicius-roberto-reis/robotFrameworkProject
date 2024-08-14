*** Settings ***
Library           RequestsLibrary
Resource           ../resources/keywords/api_keywords.robot

*** Variables ***
${endpoint}     /name/Brazil
${max_time}     1500ms

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

Validar Tempo de Resposta da API
    [Documentation]    Testa se a resposta da API é retornada dentro do tempo esperado de 200ms.
    [Tags]   cenario_performance
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${endpoint}
    Validar Requisicao GET com Tempo Limite    ${response}    ${max_time}

