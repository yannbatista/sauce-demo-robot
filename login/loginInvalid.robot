*** Settings ***
Library    Browser

*** Variables ***
${SITE_SAUCE}        https://www.saucedemo.com/
${USERNAME}          standard_user
${PASSWORD}          senha_errada
${ERRO_ESPERADO}        

*** Test Cases ***
Cenario 1: Validar Login Com Credenciais Erradas
    Abrir Navegador e Site
    Preencher Campos De Login
    Clicar No Botao Login
    Validar Mensagem De Erro


*** Keywords ***
Abrir Navegador e Site
    New Browser    chromium
    New Context
    New Page                                                                        ${SITE_SAUCE}

Preencher Campos De Login
    Wait For Elements State    input[data-test="username"]          visible         timeout=10s
    Fill Text                  input[data-test="username"]                          ${USERNAME}
    Fill Text                  input[data-test="password"]                          ${PASSWORD}

Clicar No Botao Login
    Wait For Elements State    input[data-test="login-button"]      enabled         timeout=10s
    Click                      input[data-test="login-button"]

Validar Mensagem De Erro
    Wait For Elements State    h3[data-test="error"]                visible         timeout=10s
    ${erro}=    Get Text       h3[data-test="error"]
    Should Be Equal As Strings                                                      ${erro}    ${ERRO_ESPERADO}
