*** Settings ***
Library     RequestsLibrary
Library     AllureLibrary
Library     JSONLibrary

*** Variables ***
${base_url}     https://restcountries.com/v3.1

*** Keywords ***
Valido a requisição GET com sucesso do endpoint
    [Documentation]    Envia uma requisição GET para obter informações sobre um país
    [Arguments]    ${get_endpoint}
    Create Session    countries    ${base_url}
    ${response}=    GET On Session    countries    ${get_endpoint}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log     ${response.elapsed.total_seconds()}
    [Return]    ${response}

Validar Schema Da Resposta
    [Documentation]    Valida o schema do corpo da resposta contra o schema esperado
    [Arguments]    ${response}    ${schema_name}
    ${schema_file}=    Set Variable    ${EXECDIR}/api/resources/schemas/${schema_name}
    ${schema}=    Load JSON From File    ${schema_file}
    Validate Json By Schema    ${response.json()}    ${schema}


Validar Requisicao GET com Tempo Limite
    [Documentation]    Envia uma requisição GET e valida o tempo de resposta.
    [Arguments]    ${response}      ${max_time}=1200ms  # Tempo máximo permitido em milissegundos
    ${elapsed_time}=    Set Variable    ${response.elapsed.total_seconds() * 1000}
    ${max_time_ms}=    Evaluate    int(${max_time.replace("ms", "")})
    Log    Tempo decorrido: ${elapsed_time} milissegundos
    Should Be True    ${elapsed_time} <= ${max_time_ms}    Tempo de resposta excedeu o limite de ${max_time_ms} milissegundos
    Should Be Equal As Numbers    ${response.status_code}    200
    [Return]    ${response.json()}

Enviar Requisicao POST com Sucesso
    [Documentation]    Envia uma requisição POST para um endpoint específico.
    [Arguments]    ${endpoint}    ${body_file}
    ${body}=    Load JSON From File    ${body_file}
    Create Session    reqres    https://reqres.in
    ${response}=    POST On Session    reqres    ${endpoint}    json=${body}
    Should Be Equal As Numbers    ${response.status_code}    201
    [Return]    ${response}



