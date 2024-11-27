*** Settings ***

Library    SeleniumLibrary
Library    Process


*** Variables ***
${SITE_SAUCE}                https://www.saucedemo.com/
${EMAIL_LOGIN}               standard_user
${SENHA_LOGIN}               secret_sauce
${BTN_LOGIN}                 id=login-button
${ADD_PRODUCT_BACKPACK}      id=add-to-cart-sauce-labs-backpack
${CLICK_CAR}                 xpath=//a[@data-test='shopping-cart-link']
${REMOVE_PRODUCT}            id=remove-sauce-labs-backpack



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
    [Arguments]    ${product}
    Click Element                  ${product}

Selecionar Carrinho
    Click Element                  ${CLICK_CAR}

Remover Produto
    Click Element                ${REMOVE_PRODUCT}


*** Test Cases ***
Cenario 1: Inserir Credenciais Para Acesso
    Abrir Site
    Aguardar site carregar
    Inserir Email
    Inserir Senha
    Acessar Plataforma
    Aguardar site carregar

Cenario 2: Adicionar Itens Para Compra
    Selecionar Item    ${ADD_PRODUCT_BACKPACK}

Cenario 3: Remover Item do Carrinho
    Remover Produto

    
