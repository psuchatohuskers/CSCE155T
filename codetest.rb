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

  def score(initial_score,card)
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



deck_shuff = Deck.new()
deck_shuff = deck_shuff.deckgen()
puts deck_shuff.length

casino_dealer = Dealer.new(deck_shuff)
dealer_card = casino_dealer.play()
puts dealer_card
dealer_score = casino_dealer.score(0,dealer_card)
puts dealer_score

casino_player = Player.new(deck_shuff)
player_card = casino_player.play()
puts player_card
player_score = casino_player.score(0,player_card)
puts player_score
player_hit = casino_player.hit()
puts player_hit
player_card = player_card.push(player_hit)
puts player_card
player_score = casino_player.score(0,player_card)
puts player_score


puts "Welcome to Blackjack"
puts "Gambling may be illegal in your STATE"
puts "You may face a felony by gambling"
puts "Do you which to proceed forward? (Y/N)"''

if player_score > dealer_score
  puts "you win"
elsif player_score == dealer_score
  puts "draw"
else
  puts "you lose"
end
