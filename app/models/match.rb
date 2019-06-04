class Match < ApplicationRecord
  has_and_belongs_to_many :users

  def self.criaBOT(dificuldade)
    random = rand(1..3)
    case dificuldade
    when 1
      case random
      when 1
        bot = User.find_by(nome: 'Michael Faraday')
        if bot.tipo_user
          return bot
        end
      when 2
        bot = User.find_by(nome: 'Ada Lovelace')
        if bot.tipo_user
          return bot
        end
      when 3
        bot = User.find_by(nome: 'Carl Sagan')
        if bot.tipo_user
          return bot
        end
      end
    when 2
      case random
      when 1
        bot = User.find_by(nome: 'Steve Jobs')
        if bot.tipo_user
          return bot
        end
      when 2
        bot = User.find_by(nome: 'Marie Curie')
        if bot.tipo_user
          return bot
        end
      when 3
        bot = User.find_by(nome: 'Alan Turing')
        if bot.tipo_user
          return bot
        end
      end  
    when 3
      case random
      when 1
        bot = User.find_by(nome: 'Eratóstenes')
        if bot.tipo_user
          return bot
        end
      when 2
        bot = User.find_by(nome: 'Charles Babbage')
        if bot.tipo_user
          return bot
        end
      when 3
        bot = User.find_by(nome: 'Edsger Dijkstra')
        if bot.tipo_user
          return bot
        end
      end
    when 4
      case random
      when 1
        bot = User.find_by(nome: 'Nikola Tesla')
        if bot.tipo_user
          return bot
        end
      when 2
        bot = User.find_by(nome: 'Albert Einstein')
        if bot.tipo_user
          return bot
        end
      when 3
        bot = User.find_by(nome: 'Stephen Hawking')
        if bot.tipo_user
          return bot
        end
      end  
    end  
  end
end
