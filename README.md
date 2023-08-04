# Teste prático para a vaga de estágio de desenvolvedor de software no NUTI

## Proposta do projeto
No código de uma página HTML há diversas tags para apresentar o conteúdo da melhor forma. Para uma análise mais cautelosa, há o interesse de contabilizar a quantidade de cada tag HTML em uma determinada página.

Sendo assim, é necessário criar um programa para identificar as tags HTML existentes nas páginas que forem carregadas por meio de uma lista de URL informada. Além disso, deve ser contado quantas vezes cada tag aparece em cada página.

É necessário mostrar as informações coletadas para possibilitar verificar os dados da URL informada. Assim, as URL, tags e as respectivas contagens devem ser armazenadas em um banco de dados.

### Componentes usados
* Ruby version 3.2.2 [Instalador do Ruby](https://rubyinstaller.org/)
* PostgreSQL 15.3 [Instalador do PostgreSQL](https://www.postgresql.org/download/windows/)
* Rails 7.0.6 [Documentação para instalação do Rails](https://guides.rubyonrails.org/getting_started.html)
* Node.js [Instalador do Node.js](https://nodejs.org/en)

## Instalação e execução
  Após clonar o projeto é necessário garantir que os componentes acima estão instalados, após isso você deve usar alguns comandos para rodar os códigos de criação de banco e levantar o servidor com Rails.
  Para instalar o Rails basta usar ocomando abaixo no terminal na pasta do projeto:
~~~ruby
gem install rails
~~~

Com isso o rails estará instalado em sua máquina, após isso é necessário instalar as bibliotecas (gem) usadas na aplicação com o comando abaixo:
~~~ruby
bundle install
~~~
### Configuração do banco de dados
Antes de rodar a criação do banco e os migrations da aplicação, é necessário configurar o projeto para fazer a conexão com seu banco de dados. Dentro desse projeto as configurações de banco ficam na pasta '''config -> database.yml'''

![Pasta da configuração de banco](https://github.com/karinasasaki/teste-nuti/assets/78616373/ad108efa-e437-4065-bd60-53bfeebd66f8)

No arquivo database.yml altere as configurações de **username** e **password** para as configurados por você em seu banco de dados (Por padrão ele irá conectar no host Localhost).

![Configurações do banco de dados](https://github.com/karinasasaki/teste-nuti/assets/78616373/ff20e2b5-bb0f-4b08-83f8-346fe9918d24)

### Criação de banco e rodando as migrations

Após configurar corretamente o banco de dados, poderá usar o comando abaixo no terminal do projeto para a criação do banco e das tabelas:

~~~ruby
rails db:create
~~~

![Criação de banco de dados](https://github.com/karinasasaki/teste-nuti/assets/78616373/3a3066c4-9e05-442b-9673-e984efbd745d)

Com a criação do banco, agora iremos rodar os migrate, responsável pela criação das tabelas no banco (Os códigos também estarão disponíveis na pasta scripts_sql nesse projeto).

~~~ruby
rails db:migrate
~~~

![Rodando o Migrate](https://github.com/karinasasaki/teste-nuti/assets/78616373/7fb48f90-20a9-4177-82c0-063713a6ea9b)

### Executando o projeto

Com tudo configurado, podemos rodar o projeto com o comando abaixo

~~~ruby
rails s
~~~

![Rodando o projeto](https://github.com/karinasasaki/teste-nuti/assets/78616373/eb34812d-0b4c-440f-8b63-6ad3b86bea0e)


## Regras de negócio

Na tela inicial, irá listar todas as URLs cadastradas e um botão para adicionar mais.

![Tela Inicial](https://github.com/karinasasaki/teste-nuti/assets/78616373/0120533e-0385-4e59-864d-0e2a8ba8bb93)


Na tela de cadastro de URLs, você poderá cadastrar varios links ao mesmo tempo, ele irá separar os links se ele for escrito com espaço, com vírgula, pulando uma linha ou com ponto e vírgula como demonstrado na imagem abaixo. (Todas elas são possíveis).

![Tela de cadastro de URL](https://github.com/karinasasaki/teste-nuti/assets/78616373/6af91ddb-ad24-4635-afdd-c168e74975aa)


No exemplo acima, nem todos os links irão poder ser encontrados, como no exemplo do ***www.SiteQueNãoExiste.com.br**, então o sistema apenas **ignora** e cadastra os que ele conseguir buscar. Após o cadastro ele irá redirecionar para a tela inicial e irá listar os links que cadastrou e registrou as tags.

![Tela inicial com os link](https://github.com/karinasasaki/teste-nuti/assets/78616373/8f7cb071-ac6a-461b-ba1b-a1d8e3405821)

Voltando para a tela inicial, agora todas as URLs mostradas já estão armazenadas as respectivas tags, entrando no primeiro exemplo do google, irá mostrar uma tabela parecida com a imagem abaixo, indicando as tags e a data da ultima atualização.

![Tag do google parte 1](https://github.com/karinasasaki/teste-nuti/assets/78616373/aa6bdbdc-f0f5-4964-9739-20f1743289b1)
![Tag do google parte 2](https://github.com/karinasasaki/teste-nuti/assets/78616373/b5d76ba7-8432-4a13-ac65-6a0f9f3292ec)


Nos botões abaixo terá a opção de atualizar e excluir. Caso você atualize, ele irá fazer a mesma requisição novamente e atualizar a quantidade de Tags da URL, e caso exclua ele irá excluir da tabela URL e em cascata na tabela Tags as tags relacionada para aquela URL.

### Arquitetura do projeto

O projeto foi desenvolvedo na arquitetura MVC (Model, View, Controller)

![Arquivo MVC](https://github.com/karinasasaki/teste-nuti/assets/78616373/8a14a5a8-d418-4af7-8210-72c1f8c96640)


#### Model
As models ficam na pasta App->models e elas são responsáveis por manter o relacionamento entre o objeto e o banco de dados e lidar com validação, associação e transações de informação. *As models criadas para esse projeto são Tag e Url.*

#### Controller
Na pasta app->Controllers terá a controller *urls_controller.rb* responsável pela criação das rotas para adicionar, remove, atualizar e exibir as Urls e suas tags, além de fazer a requisição HTTP para os links informados pelo usuário e transformar em tags.

#### View
As Views estão na pasta app->views e são responsáveis pela apresentação visual do sistema para o usuário final, ela onde encontram o html das telas.


### DER 
O DER (Diagrama de entidade e relacionamento) do projeto pode ser encontrado na pasta DER do projeto como na figura abaixo. Nela demonstra as duas tabelas do banco com seu relacionamento 1 pra N.

![DER](https://github.com/karinasasaki/teste-nuti/assets/78616373/39797b9c-3d0f-4f58-9d67-bae9e6e39484)

## Script do SQL
Caso queira fazer alguma consulta direto pro banco de dados sem o uso do framework e/ou da aplicação, poderá usar os exemplos que deixei na pasta *scripts_sql* como monstra na figura abaixo:

![Scripts_SQL](https://github.com/karinasasaki/teste-nuti/assets/78616373/72235914-dc21-4e5f-96ab-26625e05bc19)

Foram adicionados exemplos de criação do banco, consulta e inserção sobre as tabelas mencionadas.





