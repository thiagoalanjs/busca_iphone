## Projeto de automação de teste com Robot Framework##

Esse repositório contém um projeto de automação de testes que roda a feature no site do google e amazon:

 "busca_produtos.robot" - Realiza testes buscando por produtos 

### Instalação do Robot Framework ###
Siga o passo a passo - https://medium.com/lusitanos-qa/instala%C3%A7%C3%A3o-do-ambiente-para-utilizar-o-robot-framework-em-aplica%C3%A7%C3%B5es-web-34a141b9bf44 

Para esse projeto também devemos instalar as bibliotecas **RequestsLibrary** e **Selenium** rodando os comandos abaixo:

```shell
pip install robotframework-requests

pip install robotframework-seleniumlibrary
```

### Executar o projeto ###

Acessar a pasta do projeto e rodar o comando abaixo:

```shell
robot testes/
```

#### Analisando o relatório de testes ####

Para ver o relatório de testes e checar os cenários que passaram ou não é só abrir o arquivo report.html gerado depois da execução da suíte de testes:

![image](https://github.com/thiagoalanjs/busca_iphone/assets/32438113/0c654a56-5f84-4073-9f3d-ab4aa1b07310)


#### Observações ####

OBS 1.: No cenário que avaliamos o percentual de produtos que tem que retornar 80% de produto Iphone está quebrando pois só retorna certa de 55% (não se trata de código de automação)

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/c9fd2ec3-70d1-433c-8c63-512425eeae57)

OBS.: No cenário da conversão de de BRL para USD onde não deveria passar de U$2000 o teste também quebra pelo motivo de um valor creio eu que cadastrado erroneamente em um produto da amazon conforme imagens abaixo:

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/fcd7689a-5014-4fe2-abca-d5afb6a082da)

![image](https://github.com/thiagoalanjs/desafio_avancado/assets/32438113/2ec75a7f-d519-4508-802e-bb550b41ccfa)


