
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

realizar a busca pelo produto "${PRODUTO}"
    Wait Until Element Is Visible  locator=input-busca
    Input Text   locator=input-busca  text=${PRODUTO}
    Click Element  locator=//button[contains(@class,'sc-dPyBCJ sc-ehmTmK bRbOJq iAKqAR')]
deverá exibir na listagem o produto "iphone"
    Location Should Be  url=${URL_IPHONE}
    Element Should Be Visible  locator=//h1[contains(.,'iPhone')]
    Element Text Should Be  locator=${MENU_CATEGORIAS_BUSCA}   expected=IPhone
    Element Text Should Be  locator=${ELEMENTO_NAVEGACAO}  expected=IPhone
    Element Should Contain    locator=${ELEMENTO_LISTA}  expected=iPhone
