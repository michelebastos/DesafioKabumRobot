*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  https://kabum.com.br
${URL_CARRINHO}  https://www.kabum.com.br/carrinho
${URL_PS}  https://www.kabum.com.br/gamer/playstation
${BTN_IR_PARA_O_CARRINHO}  //button[@class='sc-f69d9ee4-0 gyvuju buttonGoToCart'][contains(.,'IR PARA O CARRINHO')]


*** Keywords ***
Abrir o navegador
    Open Browser  browser=${BROWSER} 
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
que acesse o site "https://kabum.com.br"
    Go to  url=${URL}  
    Wait Until Element Is Visible  locator=linkLoginHeader
    Click Element  locator=//button[contains(.,'Entendi')]

selecione uma categoria no menu de “Departamento”
    Click Element  locator=//span[contains(.,'DEPARTAMENTOS')]
    Wait Until Element Is Visible  locator=//a[@class='sc-TRNrF iCIdkt itemCategoriaMenu'][contains(.,'Games')]
    Click Element  locator=//a[@class='sc-TRNrF iCIdkt itemCategoriaMenu'][contains(.,'Games')]
    Wait Until Element Is Visible  locator=//a[@href='https://www.kabum.com.br/gamer/playstation']
    Click Element  locator=//a[@href='https://www.kabum.com.br/gamer/playstation']
    Location Should Be  url=${URL_PS}

adicione um produto no carrinho
    Wait Until Element Is Visible  locator=//img[contains(@title,'Console Sony PlayStation 5 Edição Digital + FIFA 23')]
    Click Element  locator=//img[contains(@title,'Console Sony PlayStation 5 Edição Digital + FIFA 23')]
    Click Element  locator=//button[@class='sc-8b813326-0 hUMrjh'][contains(.,'COMPRAR')]
    Wait Until Element Is Visible  locator=//strong[contains(.,'PRODUTO ADICIONADO NO CARRINHO')]

deverá exibir produto incluso no carrinho de compras
    Wait Until Element Is Visible  locator=${BTN_IR_PARA_O_CARRINHO} 
    Click Element  locator=${BTN_IR_PARA_O_CARRINHO} 
    Location Should Be  url=${URL_CARRINHO}
    Element Text Should Be  locator=//a[contains(@class,'Name-styles__Name-sc-896612d4-2 idKFQI productName')]  expected=Console Sony PlayStation 5 Edição Digital + FIFA 23
    Element Should Be Visible  locator=//input[@class='Quantity-styles__QuantityInput-sc-d6427ac4-4 cHsxPe']
    Element Text Should Be  locator=//p[contains(@class,'Price-sc-5b1fdffd-2 gHaiIN')]  expected=R$ 4.299,90

acessar o carrinho de compras
    Wait Until Element Is Visible  locator=linkCarrinhoHeader
    Click Element  locator=linkCarrinhoHeader
    Location Should Be  url=${URL_CARRINHO}

deverá exibir carrinho de compras vazio
    Wait Until Element Is Visible  locator=//button[@class='styles__Button-sc-888987f0-0 iUGnTZ'][contains(.,'CONTINUAR COMPRANDO')]
    Element Text Should Be  locator=//b[contains(.,'O seu carrinho está vazio.')]  expected=O seu carrinho está vazio.