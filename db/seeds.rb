# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    [
        {
            email: 'michael@faraday.com', 
            password: 'bolichepuc', 
            nome: 'Michael Faraday', 
            idade: 76, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'ada@lovelace.com', 
            password: 'bolichepuc', 
            nome: 'Ada Lovelace', 
            idade: 36, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'carl@sagan.com', 
            password: 'bolichepuc', 
            nome: 'Carl Sagan', 
            idade: 62, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'steve@jobs.com', 
            password: 'bolichepuc', 
            nome: 'Steve Jobs', 
            idade: 56, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'marie@curie.com', 
            password: 'bolichepuc', 
            nome: 'Marie Curie', 
            idade: 66, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'alan@turing.com', 
            password: 'bolichepuc', 
            nome: 'Alan Turing', 
            idade: 41, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'eratos@tenes.com', 
            password: 'bolichepuc', 
            nome: 'Eratóstenes', 
            idade: 82, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'charles@babbage.com', 
            password: 'bolichepuc', 
            nome: 'Charles Babbage', 
            idade: 79, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'edsger@dijkstra.com', 
            password: 'bolichepuc', 
            nome: 'Edsger Dijkstra', 
            idade: 72, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'nikola@tesla.com', 
            password: 'bolichepuc', 
            nome: 'Nikola Tesla', 
            idade: 86, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'albert@einstein.com', 
            password: 'bolichepuc', 
            nome: 'Albert Einstein', 
            idade: 76, 
            qtd_jogos: nil, 
            tipo_user: true
        },
        {
            email: 'stephen@hawking.com', 
            password: 'bolichepuc', 
            nome: 'Stephen Hawking', 
            idade: 76, 
            qtd_jogos: nil, 
            tipo_user: true
        }
    ]
)
