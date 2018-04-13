# Blackjack: A simple way to have fun on your own
# Paloch Suchato
# Last Modified 04/01/2018
#
class Deck

  def deckgen()
    suit = ["D","C","H","S"]
    # H is Heart, C is club, D is daimond, S is spade
    rank = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    card_deck = Array.new()

    rank.each do |item|
      suit.each do |su|
          card_deck.push(item + "-" + su)
      end
    end
    shuffle_card = card_deck.shuffle
    return shuffle_card
  end

end

class Hand

  def score(card)
    initial_score = 0
    card.each do |thing|
      key_thing = thing.split("-")
      if key_thing[0] == "A"
        initial_score += 1
      elsif key_thing[0] == "J" || key_thing[0] == "Q" || key_thing[0] == "K"
        initial_score += 10
      else
        initial_score += key_thing[0].to_i
      end
    end
    return initial_score
  end

end

class Dealer < Hand

  def initialize(deck)
    @card = deck
    return @card
  end

  def play()
    dealer_card = @card.pop(2)
    puts "Here is one of the dealer's card"
    puts dealer_card[0]
    return dealer_card
  end

end

class Player < Hand

  def initialize(deck)
    @card = deck
    return @card
  end

  def play()
    player_card = @card.pop(2)
    return player_card
  end

  def hit()
    player_card = @card.pop(1)
    return player_card[0]
  end

end

puts "Welcome to Blackjack"
puts "Gambling may be illegal in your STATE"
puts "You may face a felony by gambling"
puts "Do you which to proceed forward? (Y/N)"
consent = gets()
consent = consent.chomp

if consent == "Y"
  # Welcome dialouge
  puts "Welcome agian! What is your name"
  name = gets
  name = name.chomp
  puts "Hi #{name}, now our well trained dealer is drawing cards for you"

  #Shuffle
  deck_shuff = Deck.new()
  deck_shuff = deck_shuff.deckgen()

  #Dealer Draw
  casino_dealer = Dealer.new(deck_shuff)
  dealer_card = casino_dealer.play()
  dealer_score = casino_dealer.score(dealer_card)


  #Player Card
  casino_player = Player.new(deck_shuff)
  player_card = casino_player.play()
  puts "Here are your cards"
  puts player_card
  player_score = casino_player.score(player_card)
  puts "Here is your score"
  puts player_score
  if player_score == 21
    puts "Blackjack, you win!"
  else
    while TRUE
      puts "Do you want to hit or stand? (H/S)"
      hit_card = gets()
      hit_card = hit_card.chomp
      if hit_card == "H"
        player_card = player_card.push(casino_player.hit())
        puts "Here are your cards"
        puts player_card
        puts "Here is your score"
        player_score = casino_player.score(player_card)
        puts player_score
        if player_score == 21
          puts "Blackjack"
          break
        elsif player_score > 21
          puts "Bust!"
          break
        end
      else
        if player_score > dealer_score
          puts "you win"
          break
        elsif player_score == dealer_score
          puts "draw"
          break
        else
          puts "you lose"
          break
        end
      end
    end
  end
else
  puts "Bye!"
end
