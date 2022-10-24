
*** Settings ***
Documentation    Essa suite teste do site kabum
Resource         ../Resources/adicionaNoCarrinho_resources.robot
Test Setup       Abrir o navegador   
Test Teardown    Fechar o navegador

*** Test Cases ***
Valida adição de produto no carrinho
    Given que acesse o site "https://kabum.com.br"
    When selecione uma categoria no menu de “Departamento”
    And adicione um produto no carrinho
    Then deverá exibir produto incluso no carrinho de compras

Valida carrinho de compras vazio
    Given que acesse o site "https://kabum.com.br"
    When acessar o carrinho de compras
    Then deverá exibir carrinho de compras vazio