*** Settings ***
Library     SeleniumLibrary  

*** Variables ***
${url}                          https://rdcviagens.com.br
${HOME_LOGIN_BTN}               id:btn-login
${LOGIN_EMAIL_BTN}              id:login-email
${LOGIN_PASSWORD_BTN}           id:login-password
${LOGIN_CAPTCHA_CKB}            xpath: (//*[@class='recaptcha-checkbox-checkmark'])
${LOGIN_ENTER_BTN}              id:login-trigger
${LOGIN_RECAPTCHA_IFRAME}       xpath: //*[@id="recaptcha-site"]/*/*/*
${LOGIN_RECAPTCHA_CBX}          xpath: //div[@class="recaptcha-checkbox-border"]
${LOGIN_CHALANGE_IFRAME}        xpath: //iframe[@title='o desafio reCAPTCHA expira em dois minutos' and @style='width: 400px; height: 580px;']
${LOGIN_CHALANGE_IMG}           xpath: //div[@class='rc-imageselect-challenge']

*** Keywords ***
Inicia sessão
    Set Screenshot Directory    web/screenshot
    Open Browser                    ${url}      chrome
    Maximize Browser Window

Encerra sessão
    Capture Page Screenshot
    Close Browser

Dado que estou na pagina da RDC Viagens
    Title Should Be    RDC Viagens - Home

Quando realizo o login
    Click Element    ${HOME_LOGIN_BTN}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_BTN}
    Input Text    ${LOGIN_EMAIL_BTN}     teste@testeautomatizado.com
    Input Password    ${LOGIN_PASSWORD_BTN}     teste@123
    Select Frame    ${LOGIN_RECAPTCHA_IFRAME}  
    Click Element   ${LOGIN_RECAPTCHA_CBX}  
    Unselect Frame

Entao valido que o desafio do Recaptcha foi exibido
    Wait Until Element Is Visible    ${LOGIN_CHALANGE_IFRAME} 
    Select Frame    ${LOGIN_CHALANGE_IFRAME}  
    Wait Until Element Is Visible   ${LOGIN_CHALANGE_IMG}   
