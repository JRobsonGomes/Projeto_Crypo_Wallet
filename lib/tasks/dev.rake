# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') {%x(rails db:drop)}
      show_spinner('Criando BD...') {%x(rails db:create)}
      show_spinner('Migrando BD...') {%x(rails db:migrate)}
      `rails dev:add_mining_types`
      `rails dev:add_coins`
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  desc 'Cadastra Moedas'
  task add_coins: :environment do
    show_spinner('Cadastrando Moedas...') do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://cdn2.iconfinder.com/data/icons/cryptocurrency-5/100/cryptocurrency_blockchain_crypto-02-512.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://guiadobitcoin.com.br/wp-content/uploads/2018/06/Dash-Logo.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image: 'https://www.cryptocompare.com/media/351360/zec.png',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Cadastra tipos de mineração'
  task add_mining_types: :environment do
    show_spinner('Cadastrando tipos de mineração...') do
      mining_types = [
        { description: 'Proof of Work', acronym: 'PoW' },
        { description: 'Proof of Stake', acronym: 'PoS' },
        { description: 'Proof of Capacity', acronym: 'PoC' }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluido!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
