# Ticket System - MVC API

## Descrição

Este projeto é uma API para gerenciar tickets e mensagens, seguindo o padrão MVC. A API permite a criação, atualização e listagem de tickets e mensagens associadas, bem como a geração de relatórios sobre a quantidade de tickets.

## Models

### Ticket
- **has_many :messages**

### Message
- **belongs_to :ticket**

## Controllers

### 0. ApplicationController
- **`Authenticate_request`**: Método para autenticar as requisições.

### 1. TicketsController
- **`index`**: Método para listar todos os tickets.
- **`create`**: Método para criar um novo ticket.
- **`update`**: Método para atualizar um ticket existente.
- **`set_ticket`**: Método para encontrar e definir um ticket.
- **`ticket_params`**: Método para filtrar os parâmetros permitidos para um ticket.

### 2. MessagesController
- **`index`**: Método para listar todas as mensagens associadas a um ticket.
- **`create`**: Método para criar uma nova mensagem associada a um ticket.
- **`messages_params`**: Método para filtrar os parâmetros permitidos para uma mensagem.

### 3. ReportsController
- **`tickets_counts`**: Método para gerar a contagem de tickets.
- **`export_csv`**: Método para exportar a contagem de tickets em formato CSV.

## Routes

- **`GET 'reports/tickets_count'`**: Rota para obter a contagem de tickets.
- **`GET 'reports/tickets.csv'`**: Rota para exportar os tickets para um arquivo CSV.

## Banco de Dados

- **PostgreSQL**: A API usa o banco de dados PostgreSQL para armazenar os dados dos tickets e mensagens.

## Como rodar o projeto

1. **Configuração do Banco de Dados:**
   - Certifique-se de que o PostgreSQL está instalado e em execução.
   - Configure o banco de dados no arquivo `config/database.yml`.
   - Rode as migrações:

   ```bash
   rails db:create
   rails db:migrate
