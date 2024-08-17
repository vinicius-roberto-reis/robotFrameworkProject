*** Settings ***
Resource           ../resources/keywords/web_keywords.robot
Test Setup         Inicia sessão
Test Teardown      Encerra sessão

*** Test Cases ***
Recaptcha ao realizar login
    [Documentation]    Vaidar que desafio do recaptcha é exibido ao tentar realizar o login
    [Tags]   recaptcha_challenge
    Dado que estou na pagina da RDC Viagens
    Quando realizo o login
    Entao valido que o desafio do Recaptcha foi exibido