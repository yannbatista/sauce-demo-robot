*** Settings ***

Library    SeleniumLibrary
Library    Process

*** Variables ***
${SITE_SAUCE}        https://www.saucedemo.com/
${EMAIL_LOGIN}       locked_out_user
${SENHA_ERRADA}      secret_sauce  
${BTN_LOGIN}         id:login-button
${MSG_ERRO}          xpath://h3[@data-test="error"]
${ERRO_ESPERADO}     Epic sadface: Sorry, this user has been locked out.

*** Keywords ***    
Abrir Site
    Open Browser                         ${SITE_SAUCE}    chrome
    Maximize Browser Window

Aguardar site carregar
    Sleep     2s

Inserir Email
    Input Text    id:user-name           ${EMAIL_LOGIN}

Inserir Senha
    Input Text    id:password            ${SENHA_ERRADA}

Acessar Plataforma
    Click Element                        ${BTN_LOGIN}

Validar Mensagem de Erro
    Wait Until Element Is Visible        ${MSG_ERRO}    timeout=5s
    ${erro}=    Get Text                 ${MSG_ERRO}
    Should Be Equal                      ${erro}    ${ERRO_ESPERADO}    Mensagem de erro não confere!

Fechar Navegador
    Close Browser

*** Test Cases ***
Cenario 1: Validar Mensagem ao Inserir Credenciais Erradas
    Abrir Site
    Aguardar site carregar
    Inserir Email
    Inserir Senha
    Acessar Plataforma
    Validar Mensagem de Erro
    Fechar Navegador

