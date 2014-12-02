#!/usr/bin/env ruby

require_relative 'hand'
require_relative 'deck'
require_relative 'card'

def play_blackjack

  deck = Deck.new
  deck.shuffle

  player_hand = Hand.new([deck.deal, deck.deal])
  dealer_hand = Hand.new([deck.deal, deck.deal])

  puts "Player was dealt #{player_hand}"
  puts "Dealer was dealt #{dealer_hand}"


  if dealer_hand.blackjack?
    if player_hand.blackjack?
      return "It's a tie!"
    end
    return "Blackjack, dealer wins!"
  end

  while !player_hand.is_a_bust?
    puts
    puts "Player score: #{player_hand.score}"
    if player_hand.blackjack?
      return "Blackjack, player wins!"
    end
    print "Hit or stand? Type H or S: "
    input = gets.chomp.downcase
    if input == 'h'
      new_card = deck.deal
      player_hand.hand_contents << new_card
      puts "Player was dealt #{new_card}."
      puts "Player's hand: #{player_hand}"

    elsif input == 's'
      "Player score: #{player_hand.score}"
      break
    else
      puts "Invalid input. Please type H or S."
    end
  end

  if player_hand.is_a_bust?
    return "Bust! Game over..."
  end

  while dealer_hand.score < 17
    new_card = deck.deal
    dealer_hand.hand_contents << new_card
    puts
    puts "Dealer was dealt #{new_card}"
    puts "Dealer's hand is #{dealer_hand}"
  end

  if dealer_hand.score > 21
    return "Bust! You win!"
  elsif dealer_hand == 21
    return "Blackjack! Dealer wins."
  elsif dealer_hand.score > player_hand.score
    return "Dealer wins!"
  elsif dealer_hand.score < player_hand.score
    return "Player wins!"
  else
    return "It's a tie!"
  end
end

puts play_blackjack
