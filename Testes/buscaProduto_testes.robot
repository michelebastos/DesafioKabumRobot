
*** Settings ***
Documentation    Essa suite teste do site kabum valida a busca de um produto
Resource         ../Resources/buscaProduto_resources.robot
Test Setup       Abrir o navegador   
Test Teardown    Fechar o navegador

*** Test Cases ***
Valida busca do produto iphone
    Given que acesse o site "https://kabum.com.br"
    Then realizar a busca pelo produto "iphone"
    Then deverá exibir na listagem o produto "iphone"