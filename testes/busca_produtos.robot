*** Settings ***
Resource    ../resources/main.robot
Test Setup    Dado que acesso o site amazon.com.br
Test Teardown    Fechar o navegador

*** Test Cases ***

O resultado da busca deve retornar com pelo menos 80% dos produtos sendo Iphone
    Dado verifico total de produtos que retornaram da busca
    E verifico o total de Iphones encontrados
    Então valido que 80% dos itens encontrados devem ser iphone

Valor do iphone mais caro não pode ser maior que US$2000 após conversão monetária
    Quando pesquiso Iphone mais caro
    Então o valor dele convertido para US$ deverá ser menor que US$2000  

Produtos diferentes de Iphone devem ser mais baratos
    Quando verifico produtos que não são Iphone
    Então verifico que o valor é menor que o Iphone