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

Cenario 2: Adicionar Itens Para Compra
    Selecionar Item
    Selecionar Carrinho
    Iniciação Checkout

Cenario 3: Cancelar Compra Antes de Finalizar
    Inserir Nome Checkout            ${FIRST_NAME_CHECKOUT}
    Inserir Sobrenome Checkout       ${LAST_NAME_CHECKOUT}
    Inserir Postal Checkout          ${POSTAL_CODE_CHECKOUT}
    Continuar Compra
    Aguardar site carregar
    Cancelar a Compra