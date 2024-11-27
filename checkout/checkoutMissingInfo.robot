*** Settings ***

Library    SeleniumLibrary
Library    Process


*** Variables ***
${SITE_SAUCE}                https://www.saucedemo.com/
${EMAIL_LOGIN}               standard_user
${SENHA_LOGIN}               secret_sauce
${BTN_LOGIN}                 id=login-button
${SELECT_PRODUCT}            id=add-to-cart-sauce-labs-backpack
${CLICK_CAR}                 xpath=//a[@data-test='shopping-cart-link']
${CHECKOUT_BUTTON}           id=checkout
${FIRST_NAME_CHECKOUT}       Yann
${LAST_NAME_CHECKOUT}        Batista
${POSTAL_CODE_CHECKOUT}      00000001
${BTN_SKIP}                  id=continue
${FINISH_CHECKOUT}           id=finish
${SUCESS_BUY}                Thank you for your order!
${FIRST_NAME_ERROR}          First Name is required
${LAST_NAME_ERROR}           Error: Last Name is required
${POSTAL_CODE_ERROR}         Postal Code is required
${CANCEL_BUY}                id=cancel



*** Keywords ***
Abrir Site
    Open Browser                 ${SITE_SAUCE}    chrome
    Maximize Browser Window

Aguardar site carregar
    Sleep     3

Inserir Email
    Input Text    id=user-name    ${EMAIL_LOGIN}

Inserir Senha
    Input Text    id=password     ${SENHA_LOGIN}

Acessar Plataforma
    Click Element                  ${BTN_LOGIN}

Selecionar Item
    Click Element                  ${SELECT_PRODUCT}

Selecionar Carrinho
    Click Element                  ${CLICK_CAR}

Iniciação Checkout
    Click Element                  ${CHECKOUT_BUTTON}

Inserir Nome Checkout
    [Arguments]                    ${name}
    Input Text    id=first-name    ${name}

Inserir Sobrenome Checkout
    [Arguments]                     ${surname}
    Input Text    id=last-name      ${surname}

Inserir Postal Checkout
    [Arguments]    ${postal_code}
    Input Text    id=postal-code    ${postal_code}

Continuar Compra
    Click Element                   ${BTN_SKIP}

Verificar Falha da Compra
    [Arguments]    ${expected_error}
    ${TEXT_HEADER}=    Get Text        xpath=//h3[@data-test="error"]
    Should Contain                  ${TEXT_HEADER}    ${expected_error}

Cancelar a Compra
    Click Element                   ${CANCEL_BUY}

*** Test Cases ***
Cenario 1: Inserir Credenciais Para Acesso
    Abrir Site
    Aguardar site carregar
    Inserir Email
    Inserir Senha
    Acessar Plataforma
    Aguardar site carregar

Cenario 2: Verificar Erro de Nome no Checkout
    Selecionar Item
    Selecionar Carrinho
    Iniciação Checkout
    Inserir Nome Checkout            ${EMPTY}
    Inserir Sobrenome Checkout       ${LAST_NAME_CHECKOUT}
    Inserir Postal Checkout          ${POSTAL_CODE_CHECKOUT}
    Continuar Compra
    Verificar Falha da Compra        ${FIRST_NAME_ERROR}
    Aguardar site carregar
    Cancelar a Compra
    Iniciação Checkout

Cenario 3: Verificar Erro de Sobrenome no Checkout
    Inserir Nome Checkout            ${FIRST_NAME_CHECKOUT}
    Inserir Sobrenome Checkout       ${EMPTY}
    Inserir Postal Checkout          ${POSTAL_CODE_CHECKOUT}
    Continuar Compra
    Verificar Falha da Compra        ${LAST_NAME_ERROR} 
    Aguardar site carregar
    Cancelar a Compra
    Iniciação Checkout

Cenario 4: Verificar Erro de Código Postal no Checkout
    Inserir Nome Checkout            ${FIRST_NAME_CHECKOUT}
    Inserir Sobrenome Checkout       ${LAST_NAME_CHECKOUT}
    Inserir Postal Checkout          ${EMPTY}
    Continuar Compra
    Verificar Falha da Compra        ${POSTAL_CODE_ERROR}
    Aguardar site carregar