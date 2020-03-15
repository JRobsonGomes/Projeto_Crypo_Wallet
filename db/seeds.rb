# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# comandos Rails para apagar e recriar todos os dados
# rails db:drop db:create db:migrate db:seed

# Coin.create!(
#   [
#     {
#       description: 'Bitcoin',
#       acronym: 'BTC',
#       url_image: 'https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png'
#     },
#     {
#       description: 'Ethereum',
#       acronym: 'ETH',
#       url_image: 'https://cdn2.iconfinder.com/data/icons/cryptocurrency-5/100/cryptocurrency_blockchain_crypto-02-512.png'
#     },
#     {
#       description: 'Dash',
#       acronym: 'DASH',
#       url_image: 'https://guiadobitcoin.com.br/wp-content/uploads/2018/06/Dash-Logo.png'
#     }
#   ]
# )

spinner = TTY::Spinner.new('[:spinner] Cadastrando moedas...')
spinner.auto_spin
coins = [
  {
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png'
  },
  {
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://cdn2.iconfinder.com/data/icons/cryptocurrency-5/100/cryptocurrency_blockchain_crypto-02-512.png'
  },
  {
    description: 'Dash',
    acronym: 'DASH',
    url_image: 'https://guiadobitcoin.com.br/wp-content/uploads/2018/06/Dash-Logo.png'
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
spinner.success('(Concluido!)')