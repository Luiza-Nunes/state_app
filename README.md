# State APP

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.


### 🔧 Instalação

Clone o repositório:
```
git clone git@github.com:Luiza-Nunes/state_app.git
```

Dentro da pasta do projeto, será necessário fazer o build da imagem docker:
```
sudo docker-compose build
```

Após o build finalizar, necessário subir a imagem:
```
sudo docker-compose up
```

Caso houver erro de permissão no arquivo setup_app.sh quando rodar o comando anterior, necessário rodar o próximo comando para dar permissão e depois subir a imagem:
```
sudo chmod +x config/setup_app.sh
```
```
sudo docker-compose up
```

Com a imagem rodando, entrar em outro terminal e anotar o CONTAINER_ID da imagem:
```
sudo docker ps
```

Entrar no bash:
```
sudo docker exec -it <CONTAINER_ID> bash
```

Dentro do bash, rodar os comandos para criar o banco:
```
rails db:create db:migrate db:seed
```

## ⚙️ Executando os testes

Para executar os testes, precisa entrar no bash:
```
sudo docker exec -it <CONTAINER_ID> bash
```

E rodar o comando:
```
rspec spec
```

### ⌨️ Executando o Rubocop

Para rodar o Rubocop, precisa entrar no bash:
```
sudo docker exec -it <CONTAINER_ID> bash
```

E rodar o comando:
```
rubocop
```
