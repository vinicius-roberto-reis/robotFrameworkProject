*** Settings ***
Library           RequestsLibrary
Resource           ../resources/keywords/web_keywords.robot

*** Test Cases ***
Abre e fecha o site RDC Viagens
    [Documentation]    Testa site RDC Viagens
    [Tags]   cenario_positivo
    Inicia sessão 
    Encerra sessão