*** Settings ***

Library    SeleniumLibrary
Library    Process


*** Variables ***
${SITE_SAUCE}    https://www.saucedemo.com/
${EMAIL_LOGIN}   standard_user
${SENHA_LOGIN}   secret_sauce
${BTN_LOGIN}     id=login-button

*** Keywords ***    
Abrir Site
    Open Browser                ${SITE_SAUCE}    chrome
    Maximize Browser Window

Aguardar site carregar
    Sleep     2s

Inserir Email
    Input Text    id:user-name   ${EMAIL_LOGIN}

Inserir Senha
    Input Text    id:password    ${SENHA_LOGIN}

Acessar Plataforma
    Click Element                ${BTN_LOGIN}


*** Test Cases ***
Cenario 1: Inserir Credencias Para Acesso
    Abrir Site
    Aguardar site carregar
    Inserir Email
    Inserir Senha
    Acessar Plataforma
    Aguardar site carregar