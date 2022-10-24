
*** Settings ***
Documentation    Essa suite teste do site kabum
Resource         ../Resources/login_resources.robot
Test Setup       Abrir o navegador   
Test Teardown    Fechar o navegador

*** Test Cases ***
Valida login com campos nulos
    [Documentation]  Este teste verifica se exibe mensagem ao inserir email e senha nulos
    Given que acesse o site "https://kabum.com.br"
    When realizar login com email e senha nulos
    Then deverá exibir mensagem solicitando o preenchimento dos campos

Valida login com email e senha invalidos
    [Documentation]  Este teste verifica se exibe mensagem ao inserir email e senha invalidos
    Given que acesse o site "https://kabum.com.br"
    When realizar login com email e senha invalidos
    Then exibe mensagem "E-mail, CPF, CNPJ ou senha incorretos"

Valida login com cpf e senha invalidos
    [Documentation]  Este teste verifica se exibe mensagem ao inserir cpf e senha invalidos
    Given que acesse o site "https://kabum.com.br"
    When realizar login com cpf e senha invalidos
    Then exibe mensagem "E-mail, CPF, CNPJ ou senha incorretos"

Valida login com cnpj e senha invalidos
    [Documentation]  Este teste verifica se exibe mensagem ao inserir cnpj e senha invalidos
    Given que acesse o site "https://kabum.com.br"
    When realizar login com cnpj e senha invalidos
    Then exibe mensagem "E-mail, CPF, CNPJ ou senha incorretos"