*** Settings ***
Library    RequestsLibrary
Library  AllureLibrary

*** Keywords ***
Obter Informacoes Do Pais
    [Documentation]    Envia uma requisição GET para obter informações sobre um país
    Create Session    countries    ${BASE_URL}
    ${response}=    GET On Session    countries    /name/Brazil
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}

