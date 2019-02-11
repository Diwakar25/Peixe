# Peixe

Repositório com o desafio Peixe Urbano (https://github.com/PeixeUrbano/desafio-ios)

O projeto foi feito no Xcode 10.0 e Swift 4.2  e está internacionalizado
A unica dependencia utilizado foi SDWebImage para download e cache das imagens (como especificado) com Cocoapods
##### Documentação:

O projeto foi desenvolvido baseado em Clean swift, focando no seu core de Controler, Presenter e Interactor.
A seguir vou descrever a estrutura de organização do projeto e entrar em detalhes quando preciso.

O projeto está organizado em 6 pastas:
- AppDelegate
- Router
- Networking
- Constants
- Common
- Scenes

##### AppDelegate
Contém apenas o arquivo AppDelegate, futuramente podendo conter algumas abstrações relacionadas ao mesmo.

##### Router
Contem a camada e navegação do aplicativo

- MainRouter.swift  - Princial router da aplicação, responsável por criar a tab controller, pode ser fragmentado para escalar a aplicação 
- RouterBuilder.swift - Classe responsável por fazer o assembly das Scenes, também permite a injeção de alguma dependência se necessário 
- BaseTabBarController e BaseNavigationController - Duas heranças para customização e padronização do aplicativo

##### Networking
Contém a abstração para comunicação com a API

- APIService.swift - Contém a abstração de comunicação com a API ultilizando NSURlRequest, recebe um Generico para parse de retorno e um APIBaseRequest
- APIBaseRequest.swift - Protocolo necessário para gerar um request para APIService
- HTTPMethod e APIServiceError - enum de protocolo http e possiveis erros de serviço

##### Constants
Contém as constantes de API, Cores e nomes de imagens utilizados no aplicativo 

##### Common 
Contém as classes de uso comum e abstrações, como Font, Formatter, LoaderView e Alert 

##### Scenes
Contém as Scenes do aplicativo, Deal, Product, Travel e City.

Deal é uma Scene generica, comum a Product, Travel e City, nela esta implementado, a controller, o presenter e o arquivo de models.
O aruivo DealModels.swift contém os models de retorno e a viewModel comum para as 3 Scenes
A reutilização é feita atraves de protocolos criados em DealSceneProtocol

As Scenes Product, Travel e City so implementam Interactor(regra de negocio) e seu arquivo de Models especifico, contendo a Model para o request para o API service



