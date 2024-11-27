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
${FIRTS_NAME_CHECKOUT}       Yann
${LAST_NAME_CHECKOUT}        Batista
${POSTAL_CODE_CHECKOUT}      00000001
${BTN_SKIP}                  id=continue
${FINISH_CHECKOUT}           id=finish
${SUCESS_BUY}                Thank you for your order!


*** Keywords ***    
Abrir Site
    Open Browser    ${SITE_SAUCE}    chrome
    Maximize Browser Window

Aguardar site carregar
    Sleep     2s

Inserir Email
    Input Text    id:user-name          ${EMAIL_LOGIN}

Inserir Senha
    Input Text    id:password           ${SENHA_LOGIN}

Acessar Plataforma
    Click Element                       ${BTN_LOGIN}

Selecionar Item
    Click Element                       ${SELECT_PRODUCT} 

Selecionar Carrinho
    Click Element                       ${CLICK_CAR}

Iniciação Checkout
    Click Element                       ${CHECKOUT_BUTTON}

Inserir Nome Checkout
    Input Text    id=first-name         ${FIRTS_NAME_CHECKOUT}         

Inserir Sobrenome Checkout
    Input Text    id=last-name          ${LAST_NAME_CHECKOUT}

Inserir Postal Checkout
    Input Text   id=postal-code         ${POSTAL_CODE_CHECKOUT}       

Continuar Compra
    Click Element                       ${BTN_SKIP}

Finalização Checkout
    Click Element                       ${FINISH_CHECKOUT}

Verificar Sucesso da Compra
    ${TEXT_HEADER}    Get Text    xpath=//h2[@data-test="complete-header"]
    Should Be Equal As Strings          ${TEXT_HEADER}    ${SUCESS_BUY}


*** Test Cases ***

Cenario 1: Login no Sistema
    Abrir Site
    Aguardar site carregar
    Inserir Email
    Inserir Senha
    Acessar Plataforma
    Aguardar site carregar

Cenario 2: Seleção de Produto
    Selecionar Item
    Selecionar Carrinho

Cenario 3: Processo de Checkout
    Iniciação Checkout
    Aguardar site carregar
    Inserir Nome Checkout
    Inserir Sobrenome Checkout
    Inserir Postal Checkout
    Continuar Compra
    Finalização Checkout

Cenario 4: Verificação de Sucesso da Compra
    Verificar Sucesso da Compra
