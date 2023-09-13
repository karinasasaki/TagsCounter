# Tags Counter 

Teste prático solicitado para a vaga de estágio de desenvolvedor de software no NUTI (Núcleo de Tecnologia da Informação - UFMT).


## 💻 Proposta do projeto

No código de uma página HTML há diversas tags para apresentar o conteúdo da melhor forma. Para uma análise mais cautelosa, há o interesse de contabilizar a quantidade de cada tag HTML em uma determinada página.

Sendo assim, é necessário criar um programa para identificar as tags HTML existentes nas páginas que forem carregadas por meio de uma lista de URL informada. Além disso, deve ser contado quantas vezes cada tag aparece em cada página.

É necessário mostrar as informações coletadas para possibilitar verificar os dados da URL informada. Assim, as URL, tags e as respectivas contagens devem ser armazenadas em um banco de dados.


### 🚀 Tecnologias utilizadas

* Ruby
* Ruby on Rails
* PostgreSQL
* Node.js
* Bootstrap


## 👩‍💻 Instalação e execução

### 1. Clone este projeto na sua máquina

### 2. Instale as dependências necessárias

* [Ruby 3.2.2](https://rubyinstaller.org/)
* [PostgreSQL 15.4](https://www.postgresql.org/download/windows/)
* [Node.js](https://nodejs.org/en)

Verifique se o Ruby foi instalado corretamente:
~~~ruby
ruby -v
~~~

Para instalar o Rails basta usar ocomando abaixo no terminal da pasta do projeto:
~~~ruby
gem install rails -v 7.0.6
~~~

Com o Rails instalado em sua máquina, é necessário instalar as bibliotecas (gems) usadas na aplicação com o comando abaixo:
~~~ruby
bundle install
~~~

Verifique se todas as dependências foram instaladas corretamente:
~~~ruby
rails -v
psql –V
node -v
~~~

### 3. Configuração do banco de dados

Antes de rodar a criação do banco e as migrações da aplicação, é necessário configurar o projeto para fazer a conexão com seu banco de dados. Dentro desse projeto as configurações de banco ficam na pasta `config/database.yml`

No arquivo `database.yml` altere as configurações de **username** e **password** para os mesmos valores colocado por você durante a instalação do banco de dados (por padrão ele irá conectar no host localhost).

### 4. Criação de banco e migrações

Utilize o comando abaixo no terminal do projeto para a criação do banco e das tabelas:

~~~ruby
rails db:create
~~~

Resposta:
> Created database 'TagsCount_development'
> 
> Created database 'TagsCount_test'


Utilize o comando abaixo no terminal do projeto para a criação das tabelas no banco:

~~~ruby
rails db:migrate
~~~

Resposta:
> == 20230802035529 CreateUrls: migrating =======================================
>-- create_table(:urls)
>   -> 0.0110s
>== 20230802035529 CreateUrls: migrated (0.0114s) ==============================
>
>== 20230802035616 CreateTags: migrating =======================================
>-- create_table(:tags)
>   -> 0.0163s
>== 20230802035616 CreateTags: migrated (0.0168s) ==============================


### 5. Executando o projeto

Com tudo configurado, podemos rodar o projeto com o comando abaixo:

~~~ruby
rails s
~~~

Resposta:
> Booting Puma
> 
> Rails 7.0.6 application starting in development
> 
> Run `bin/rails server --help` for more startup options
> 
> *** SIGUSR2 not implemented, signal based restart unavailable!
> 
> *** SIGUSR1 not implemented, signal based restart unavailable!
> 
> *** SIGHUP not implemented, signal based logs reopening unavailable!
> 
> Puma starting in single mode...
> * Puma version: 5.6.6 (ruby 3.2.2-p53) ("Birdie's Version")
> *  Min threads: 5 
> *  Max threads: 5 
> *  Environment: development
> *    PID: 18860
> * Listening on http://[::1]:3000
> * Listening on http://127.0.0.1:3000
>
> Use Ctrl-C to stop


## 🤝 Regras de negócio

A tela inicial irá listar todas as URLs cadastradas e um botão para adicionar mais.

![Tela Inicial](https://github.com/karinasasaki/teste-nuti/assets/78616373/0120533e-0385-4e59-864d-0e2a8ba8bb93)

Na tela de cadastro de URLs, você poderá cadastrar vários links ao mesmo tempo, ele irá separar os links se ele for escrito com espaço, com vírgula, com quebra de linha ou com ponto e vírgula como demonstrado na imagem abaixo. (Todas elas são possíveis).

![Tela de cadastro de URL](https://github.com/karinasasaki/teste-nuti/assets/78616373/6af91ddb-ad24-4635-afdd-c168e74975aa)

No exemplo acima, nem todos os links poderão ser encontrados, como no exemplo do ***www.SiteQueNãoExiste.com.br**, então o sistema apenas **ignora** e cadastra os que ele conseguir buscar. Após o cadastro ele irá redirecionar para a tela inicial e irá listar os links que cadastrou e registrou as tags.

![Tela inicial com os link](https://github.com/karinasasaki/teste-nuti/assets/78616373/8f7cb071-ac6a-461b-ba1b-a1d8e3405821)

Voltando para a tela inicial, agora todas as URLs mostradas já estão armazenadas as respectivas tags, entrando no primeiro exemplo do Google, irá mostrar uma tabela parecida com a imagem abaixo, indicando as tags e a data da ultima atualização.

![Tag do google parte 1](https://github.com/karinasasaki/teste-nuti/assets/78616373/aa6bdbdc-f0f5-4964-9739-20f1743289b1)
![Tag do google parte 2](https://github.com/karinasasaki/teste-nuti/assets/78616373/b5d76ba7-8432-4a13-ac65-6a0f9f3292ec)

Nos botões abaixo terá a opção de atualizar e excluir. Caso você atualize, ele irá fazer a mesma requisição novamente e atualizar a quantidade de Tags da URL, e caso exclua ele irá excluir da tabela URL e em cascata na tabela Tags as tags relacionada para aquela URL.


### Arquitetura do projeto

O projeto foi desenvolvido na arquitetura MVC (Model, View, Controller).

#### Model
As models ficam na pasta `app/models` e elas são responsáveis por manter o relacionamento entre o objeto e o banco de dados e lidar com validação, associação e transações de informações. *As models criadas para esse projeto são Tag e Url.*

#### View
As Views estão na pasta `app/views` e são responsáveis pela apresentação visual do sistema para o usuário final, ela onde se encontram os HTMLs das telas.

#### Controller
Na pasta `app/controllers` terá a controller *urls_controller.rb* responsável pela criação das rotas para adicionar, remover, atualizar e exibir as Urls e suas tags, além de fazer a requisição HTTP para os links informados pelo usuário e transformar em tags.


### DER 
O DER (Diagrama de entidade e relacionamento) do projeto pode ser encontrado na pasta DER do projeto como na figura abaixo. Nela demonstra as duas tabelas do banco com seu relacionamento 1 para N.

![DER](https://github.com/karinasasaki/teste-nuti/assets/78616373/39797b9c-3d0f-4f58-9d67-bae9e6e39484)


### Script do SQL
Caso queira fazer alguma consulta direto pro banco de dados sem o uso do framework e/ou da aplicação, poderá usar os exemplos deixados na pasta `scripts_sql`.

Foram adicionados exemplos de criação do banco, consulta e inserção sobre as tabelas mencionadas.
