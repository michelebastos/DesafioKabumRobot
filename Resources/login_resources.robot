*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  https://kabum.com.br.
${EMAIL_VALIDO}  midsa.cardoso@gmail.com
${EMAIL_INVALIDO}  email@email.com
${CPF_INVALIDO}  32428461811
${SENHA_INVALIDA}  1
${BTN_ENTRAR}  //button[@type='submit'][contains(.,'Entrar')]
${ELEMENTO_LOGIN_INVALIDO}  //p[@class='sc-cCjUiG fyRXCW'][contains(.,'E-mail, CPF, CNPJ ou senha incorretos')]
${CNPJ_INVALIDO}  71841311000120

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

realizar login com email e senha nulos
    Click Element  locator=linkLoginHeader
    Click Element  locator=${BTN_ENTRAR} 

deverá exibir mensagem solicitando o preenchimento dos campos
    Element Should Be Visible  locator=//div[@class='sc-fnGiBr zSKVC'][contains(.,'Insira seu E-mail, CPF ou CNPJ.')]

realizar login com email e senha invalidos
    Click Element  locator=linkLoginHeader
    Wait Until Element Is Visible  locator=${BTN_ENTRAR} 
    Input Text   locator=//input[contains(@type,'text')]  text= ${EMAIL_INVALIDO}
    Input Text   locator=//input[contains(@type,'password')]  text= ${SENHA_INVALIDA}
    Click Element  locator=${BTN_ENTRAR} 

exibe mensagem "${MSG_LOGIN_INVALIDO}"
    Wait Until Element Is Visible  locator=${ELEMENTO_LOGIN_INVALIDO}
    Element Should Be Visible  locator=${ELEMENTO_LOGIN_INVALIDO}  message=${MSG_LOGIN_INVALIDO}

realizar login com cpf e senha invalidos
    Click Element  locator=linkLoginHeader
    Wait Until Element Is Visible  locator=${BTN_ENTRAR} 
    Input Text   locator=//input[contains(@type,'text')]  text= ${CPF_INVALIDO}
    Input Text   locator=//input[contains(@type,'password')]  text= ${SENHA_INVALIDA}
    Click Element  locator=${BTN_ENTRAR} 

realizar login com cnpj e senha invalidos
    Click Element  locator=linkLoginHeader
    Wait Until Element Is Visible  locator=${BTN_ENTRAR} 
    Input Text   locator=//input[contains(@type,'text')]  text= ${CNPJ_INVALIDO}
    Input Text   locator=//input[contains(@type,'password')]  text= ${SENHA_INVALIDA}
    Click Element  locator=${BTN_ENTRAR} 