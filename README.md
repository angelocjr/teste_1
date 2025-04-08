# teste_1


---Explicação das principais decisões para desenvolvimento do app:
Optei por utilizar Docker e Docker Compose para orquestração dos containers, com o objetivo de facilitar a configuração e o isolamento do ambiente de desenvolvimento. Essa abordagem proporciona maior praticidade na replicação do ambiente entre diferentes máquinas, além de garantir consistência durante todo o ciclo de desenvolvimento.
Escolhi o PostgreSQL como banco de dados relacional, principalmente por sua robustez, escalabilidade e suporte a operações complexas com dados. Além disso, já possuo experiência prévia de três anos utilizando essa tecnologia, o que reforçou minha afinidade com a ferramenta.
Para armazenamento em memória e cache, optei pelo uso do Redis, uma solução NoSQL amplamente adotada no mercado, conhecida por seu alto desempenho e simplicidade na integração com aplicações web modernas.
A aplicação foi desenvolvida seguindo a arquitetura MVC (Model-View-Controller), com a qual tenho mais de três anos de experiência. Apesar de também dominar o desenvolvimento de APIs e microserviços, optei pelo MVC neste projeto por proporcionar uma estrutura clara, rápida de implementar e fácil de manter.
Visando manter um código limpo e aderente ao princípio DRY (Don't Repeat Yourself), utilizei partials nas views de criação e atualização de dinâmicas, além de controllers filhos que herdam de um controller pai (web_test_controller.rb). Essa abordagem permitiu o compartilhamento de métodos comuns entre os controllers, promovendo reutilização de lógica e organização do código.
A estrutura de controllers inclui três controladores principais:
•	**welcome_controller.rb**, responsável por renderizar a view inicial da aplicação e orquestrar a chamada dos outros controllers;
•	**dynamica_controller.rb** e **review_controller.rb**, que se encarregam das ações de CRUD (criação, leitura, atualização e exclusão) referentes às dinâmicas e avaliações, interagindo diretamente com os respectivos models.
Além disso, utilizei um layout base com yield, prática comum no Rails que permite a injeção de conteúdo dinâmico em uma estrutura de layout reutilizável. Essa abordagem garante consistência visual entre as páginas e facilita a manutenção da interface da aplicação.



---Coisas que faltaram e que talvez entendi errado
Trouxe uma lista de usuários de uma variavel dentro do model user e printei na view principal como foi pedido no arquivo, não sabia se era necessario desenvolver um sistema de login, provavelmente iria utilizar da gem do devise para executar essa ação.
Eu tambem iria dividir o welcome_controller em 3 services(criação, atualização e remoção), não consegui por falta de tempo para entregar o projeto e alguns compromissos que tenho marcado.



---Instalando aplicação linux(*necessario ter instalado docker e docker-composer):
1 Criar uma pasta com mkdir em seu sistema operacional (Não esquecer de atribuir permissão para seu usuário, comando 'chown').
2 Clonar o projeto teste_1 dentro da pasta criada, coamndo (git clone git@github.com:angelocjr/teste_1.git)
3 Montar o projeto utilizando do comando (docker-compose up --build -d)



---Usando a aplicação
O sistema é bem simples, para criação de dinamica e primeira review para a dinamica, basta clickar em (+). (algumas funcionalidades só vão aparecer depois de incluir a primeira dinamica)
Para adicionar mais reviews a uma dinamica, clicar em (UP), inserir nota e comentario, caso queria atualizar a descrição da dinamica, apenas inserir o texto no campo de descrição e clickar (enviar).
Para excluir dinamica, clickar el (Del).
Botão dinamica aleatoria traz uma dinamica aleatoria.
E campo de pesquisa traz uma pesquisa baseada na string inserida no campo de pesquisa.
