# Jogo de Boliche
> Desenvolvimento de um jogo de Boliche para realização de um trabalho da disciplina Engenharia de Software

<br><br>
<img src="http://www.pizzariafontanaditrevi.com.br/web-files/img/logotipo_boliche.png" width="100" height="145">

## Sobre o Jogo 

O boliche é um jogo esportivo que tem como objetivo alcançar maiores pontuações, realizando jogadas a fim de derrubar todos os pinos em uma única jogada fazendo um **Strike**. No final de cada partida, o jogador que possuir o maior número de pontos é o vencedor.

## Regras do Jogo

* Cada **partida** pode ser composto por **10 frames ou rodadas**
* Cada **frame** os jogadores tem direito a **2 jogadas**, ou seja, o jogador possui **2 tentativas** de derrubar todos os pinos.
* Se o jogador conseguir um **Strike** na primeira jogada, ele não fará a segunda jogada.

## Pontuação

* Cada **pino** derrubado é **1 ponto** acrescido no frame.
* Um **Strike** no frame tem bônus da soma dos pinos derrubados das **2 próximas jogadas**.
* Um **Spare** no frame tem bônus da soma dos pinos derrubados da **próxima jogada**.
* Quando **nenhum** pino é derrubado não é acrescido ponto.
* A pontuação total da partida é entre **0 e 300**.
* Quando é feito um **Strike** no 10º frame, o jogador tem direito a mais 2 jogadas, totalizando 12 jogadas.

### Exemplo

<img src="https://i.imgur.com/f1HiRdL.png">

## Configuração o ambiente para Desenvolvimento e Execução do Projeto

O ambiente é executado em containers do Docker, com isso, deve-se configurar corretamente para que possa rodar sem problemas

### Download das ferramentas

_NOTE: Todos os sistemas deverão possuir arquitetura x86_64_

Para realizar o download e a instalação do docker nos ambientes, basta clicar nos links e acompanhar o passo-a-passo no site oficial do docker.

#### MAC/Windows

* [Docker for Windows](https://docs.docker.com/docker-for-windows/install/) 
* [Docker for MAC](https://docs.docker.com/docker-for-mac/install/)

#### Linux

```bash
$ sudo apt update
$ sudo apt install curl
$ curl -fsSL https://get.docker.com/ sh
$ sudo apt install docker-compose
```
Se tiver problemas com a instalação ou que o usuário não possui permissões para execução do Docker, bastamos rodar o seguinte comando: 

```bash
$ sudo usermod -aG docker $USER
```

Após instalação iniciamos o servico com: 

```bash
$ service docker start
$ docker --version
$ docker-compose --version
```
### Configurando o projeto para rodar localmente

Primeiramente iremos efetuar o download do repositório

```bash
$ git clone https://github.com/eltonfonseca/boliche.git
$ cd boliche
```
Montando a imagem do container

```bash
$ docker-compose build
```
Ele vai baixar as imagens necessárias para efetuar a construção da nossa imagem personalizada. Após feito esse processo, iremos rodar o comando abaixo, para subir a aplicação.

```bash
$ docker-compose up &
```
Após subir o container, vamos criar o banco de dados e rodar suas migrations

```bash
$ docker-compose run web rails db:create db:migrate
```

Para derrubar o container e deletá-lo, bastamos rodar o seguinte comando: 

```bash
$ docker-compose down
```

## Equipe de Desenvolvimento

| Programador                | E-mail                       | Github                                                     |
|----------------------------|------------------------------|------------------------------------------------------------|
| Elton Júnior Fonseca       | eltonjuniorfonseca@gmail.com | [github.com/eltonfonseca](https://github.com/eltonfonseca) |
| Felipe Hercules de Almeida | hercrof@gmail.com            | [github.com/FelipeHerc](https://github.com/FelipeHerc)     |
| Gean Matos                 | geanwsm@gmail.com            | [github.com/geanwsm](https://github.com/geanwsm)           |
