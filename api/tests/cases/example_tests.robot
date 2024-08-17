*** Settings ***
Library           RequestsLibrary
Resource          ../../keywords/example_keywords.robot
Variables         ../../resources/variables/variables.robot

*** Variables ***
${get_endpoint}     /name/Brazil
${post_body_file}   ${EXECDIR}/api/resources/bodies/post_user_body.json
${max_time}     1500ms  #variavel para teste de performance
${post_endpoint}    /api/users


*** Test Cases ***
Validar Informacoes Do Pais
    [Documentation]    Testa a resposta valida do GET
    [Tags]   cenario_positivo_GET
    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}

Validar Schema da resposta
    [Documentation]    Testa a o schema do response body da aplicação
    [Tags]   cenario_schema
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}
    Validar Schema Da Resposta    ${response}    response_schema.json

Validar Tempo de Resposta da API
    [Documentation]    Testa se a resposta da API é retornada dentro do tempo esperado em ms.
    [Tags]   cenario_performance
    ${response}=    Valido a requisição GET com sucesso do endpoint     ${get_endpoint}
    Validar Requisicao GET com Tempo Limite    ${response}    ${max_time}

Validar Requisicao POST Criacao de Usuario
    [Documentation]    Testa a resposta valida do POST
    [Tags]   cenario_positivo_POST
    ${response}=    Enviar Requisicao POST com Sucesso    ${post_endpoint}    ${post_body_file}
    Log    ${response.json()}