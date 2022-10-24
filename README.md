<b> <h1> Desafio KaBuM com Robot Framework / Selenium</b> </h1> 

Projeto desenvolvido durante o desafio proposto pela Kabum, com uso do Robot Framework e Selenium

Instalações Necessárias:

- Python 3.10.8 ou mais atual
- Robot Framework: <br>
  pip install robot-framework <br>
- Library SeleniumLIbrary:<br>
  pip install --upgrade robotframework-seleniumlibrary <br>
- Editor/IDE, recomendável VScode Studio

<b> <h2> Passos para execução dos testes: </b> </h2>

No terminal. executar o comando: robot ./nomedoteste.robot

<b> Testes do login:</b> robot -d Resultados_Login .\Testes\login_testes.robot
<br>
<b> Testes de busca do produto: </b> robot -d Resultados_BuscaProduto .\Testes\buscaProduto_testes.robot  

<b> Testes de adição do produto ao carrinho de compras: </b> robot -d Resultados_AdicionaCarrinho .\Testes\adicionaNoCarrinho_testes.robot

Para execução de um cenário específico, executar: 
robot -t "nome do caso de teste" .\nomedoteste.robot

Ex: robot -t "Valida carrinho de compras vazio" .\Testes\adicionaNoCarrinho_testes.robot
