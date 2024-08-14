*** Settings ***
Library     RequestsLibrary
Library     AllureLibrary
Library     JSONLibrary

*** Variables ***
${base_url}     https://restcountries.com/v3.1

*** Keywords ***
Valido a requisição GET com sucesso do endpoint
    [Documentation]    Envia uma requisição GET para obter informações sobre um país
    [Arguments]    ${endpoint}
    Create Session    countries    ${base_url}
    ${response}=    GET On Session    countries    ${endpoint}git
    Should Be Equal As Numbers    ${response.status_code}    200
    [Return]    ${response.json()}

Validar Schema Da Resposta
    [Documentation]    Valida o schema do corpo da resposta contra o schema esperado
    [Arguments]    ${response}    ${schema_name}
    ${schema_file}=    Set Variable    ${EXECDIR}/api/tests/schemas/${schema_name}
    ${schema}=    Load JSON From File    ${schema_file}
    Validate Json By Schema    ${response}    ${schema}
