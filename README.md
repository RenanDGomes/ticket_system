# README

Projeto Tickets System - MVC API

Models: ticket & message
-> message belongs_to ticket
-> ticket has_many message

Controllers: 
0. Application:
   - def Authenticate_request
1. Tickets:
   - def index
   - def create
   - def update
   - def set_ticket
   - def ticket_params
2. Messages:
   - def index
   - def creaet
   - def messages_params
3. Reports:
   - def tickets_counts
   - def export_cs
  
Routes:
get 'reports/tickets_count', to: 'reports#tickets_count'
get 'reports/tickets.csv', to: 'reports#export_csv'
     
Banco: Postgres

* ...
