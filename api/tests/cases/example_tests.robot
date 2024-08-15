*** Settings ***
Library           RequestsLibrary
Resource          ../../keywords/example_keywords.robot
Variables         ../../resources/variables/variables.robot

*** Variables ***
${get_endpoint}     /name/Brazil
${post_body_file}   ${EXECDIR}/api/resources/bodies/post_user_body.json
${max_time}     1500ms
${post_endpoint}    /api/users


*** Test Cases ***
Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}

Validar Informacoes Do Pais
    [Documentation]    Testa a resposta da API de informações sobre um país
    [Tags]   cenario_positivo
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}
    Validar Schema Da Resposta    ${response}    response_schema.json

Validar Tempo de Resposta da API
    [Documentation]    Testa se a resposta da API é retornada dentro do tempo esperado de 200ms.
    [Tags]   cenario_performance
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}
    Validar Requisicao GET com Tempo Limite    ${response}    ${max_time}

Validar Requisicao POST Criacao de Usuario
    [Documentation]    Testa a criação de um usuário com sucesso usando a API POST.
    ${response}=    Enviar Requisicao POST com Sucesso    ${post_endpoint}    ${post_body_file}
    Log    ${response.json()}