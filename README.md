# Desafio para a vaga de estágio de desenvolvedor de software no NUTI

## Proposta do projeto
No código de uma página HTML há diversas tags para apresentar o conteúdo da melhor forma. Para uma análise mais cautelosa, há o interesse de contabilizar a quantidade de cada tag HTML em uma determinada página.

Sendo assim, é necessário criar um programa para identificar as tags HTML existentes nas páginas que forem carregadas por meio de uma lista de URL informada. Além disso, deve ser contado quantas vezes cada tag aparece em cada página.

É necessário mostrar as informações coletadas para possibilitar verificar os dados da URL informada. Assim, as URL, tags e as respectivas contagens devem ser armazenadas em um banco de dados.

### Componentes usados
* Ruby version 3.2.2 [Instalador do Ruby](https://rubyinstaller.org/)
* PostgreSQL 15.3 [Instalador do PostgreSQL](https://www.postgresql.org/download/windows/)
* Rails 7.0.6 [Documentação para instalação do Rails](https://guides.rubyonrails.org/getting_started.html)


## Instalação e execução
  Após clonar o projeto é necessário garantir que os componentes acima estão instalados, após isso você deve usar alguns comandos para rodar os códigos de criação de banco e levantar o servidor com Rails.
  Para instalar o Rails basta usar ocomando abaixo no terminal na pasta do projeto:
~~~ruby
gem install rails
~~~

Com isso o rails estará instalado em sua máquina, após isso é necessário instalar todos os componentes usados na aplicação com o comando abaixo:
~~~ruby
bundle install
~~~
### Configuração do banco de dados
Antes de rodar a criação do banco e os migrations da aplicação, é necessário configurar o projeto para fazer a conexão com seu banco de dados. Dentro desse projeto as configurações de banco ficam na pasta '''config -> database.yml'''

![Pasta da configuração de banco](https://github.com/karinasasaki/teste-nuti/assets/78616373/aecf4a15-21e6-4a44-97f2-8bfceb859296)

No arquivo database.yml altere as configurações de **username** e **password** para as configurados por você em seu banco de dados (Por padrão ele irá conectar no host Localhost).

![Configurações do banco de dados](https://github.com/karinasasaki/teste-nuti/assets/78616373/eb1b0acf-31df-4b73-b873-ffd2001a6d81)

### Criação de banco e rodando as migrations

Após configurar corretamente o banco de dados, poderá usar o comando abaixo no terminal do projeto para a criação do banco e das tabelas:

~~~ruby
rails db:create
~~~

![Criação de banco de dados](https://github.com/karinasasaki/teste-nuti/assets/78616373/5cb8b68d-284d-4699-9c83-5a1785b4a2cf)

Com a criação do banco, agora iremos rodar os migrate, responsável pela criação das tabelas no banco (Os códigos também estarão disponíveis na pasta ScriptsSQL nesse projeto).

~~~ruby
rails db:migrate
~~~

![Rodando os migrate](https://github.com/karinasasaki/teste-nuti/assets/78616373/dec32294-e292-4d22-9d8a-b3899bf80389)

### Executando o projeto

Com tudo configurado, podemos rodar o projeto com o comando abaixo

~~~ruby
rails s
~~~

![Rodando o projeto](https://github.com/karinasasaki/teste-nuti/assets/78616373/28ade86e-092e-44f0-891d-181e39eb6643)

## Regras de negócio

Na tela inicial, irá listar todas as URLs cadastradas e um botão para adicionar mais.

![Tela inicial](https://github.com/karinasasaki/teste-nuti/assets/78616373/75748be3-7a04-4ad0-bc00-a8ff9d56fe9a)

Na tela de cadastro de URLs, você poderá cadastrar varios links ao mesmo tempo, ele irá separar os links se ele for escrito com espaço, com vírgula, pulando uma linha ou com ponto e vírgula como demonstrado na imagem abaixo. (Todas elas são possíveis).

![Tela de cadastro](https://github.com/karinasasaki/teste-nuti/assets/78616373/a4cd3bdd-5d99-445f-98b5-892e9cdeb34a)

No exemplo acima, nem todos os links irão poder ser encontrados, como no exemplo do ***www.sitequenaoexisteTeste.com.br**, então o sistema apenas **ignora** e cadastra os que ele conseguir buscar. Após o cadastro ele irá redirecionar para a tela inicial e irá listar os links que cadastrou e registrou as tags.

![Tela inicial com todos os links](https://github.com/karinasasaki/teste-nuti/assets/78616373/f4066fa1-199d-46af-bbdb-f1d39dbdb7bb)

*O youtube também não apareceu no exemplo acima pelo fato que ele faz um redirecionamento  para requisição HTTP, o resultado é um 301 Moved Permanently, achei um post no stackOverflow que explica um pouco sobre esses problemas de requisição HTTP [Mensagem 301 HTTP no youtube](https://stackoverflow.com/questions/74646764/always-301-moved-permanently)*

Voltando para a tela inicial, agora todas as URLs mostradas já estão armazenadas as respectivas tags, entrando no primeiro exemplo do google, irá mostrar uma tabela parecida com a imagem abaixo, indicando as tags, data da ultima atualização e URL

![Tag do google parte 1](https://github.com/karinasasaki/teste-nuti/assets/78616373/f1f4421c-cb44-4996-9e22-3e2cd4501ad3)
![Tag do google parte 2](https://github.com/karinasasaki/teste-nuti/assets/78616373/df5566b9-6ccb-437b-97b6-8c9d043c334a)


Nos botões abaixo terá a opção de atualizar e excluir. Caso você atualize, ele irá fazer a mesma requisição novamente e atualizar a quantidade de Tags da URL, e caso exclua ele irá excluir da tabela URL e em cascata na tabela Tags as tags relacionada para aquela URL.

### Arquitetura do projeto

O projeto foi desenvolvedo na arquitetura MVC (Model, View, Controller)

![Arquitetura MVC](https://github.com/karinasasaki/teste-nuti/assets/78616373/5e5e960a-eed3-408d-8b4a-2098171eac70)


#### Model
As models ficam na pasta App->models e elas são responsáveis por manter o relacionamento entre o objeto e o banco de dados e lidar com validação, associação e transações de informação. *As models criadas para esse projeto são Tag e Url.*

#### Controller
Na pasta app->Controllers terá a controller *urls_controller.rb* responsável pela criação das rotas para adicionar, remove, atualizar e exibir as Urls e suas tags, além de fazer a requisição HTTP para os links informados pelo usuário e transformar em tags.

#### View
As Views estão na pasta app->views e são responsáveis pela apresentação visual do sistema para o usuário final, ela onde encontram o html das telas.





