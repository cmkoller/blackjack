# shuffle
# deal (single card)
  # Pop first item
  # Return the card, not the deck

class Deck

  def initialize()
    # Array of CARD instances
    @cards = []

    suits = ['♦', '♣', '♠', '♥']
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']

    pairings = ranks.product(suits)

    pairings.each do |pair|
      card = Card.new(pair[0], pair[1])
      @cards << card
    end
  end

  # SHUFFLE
  # Randomizes the deck
  def shuffle
    @cards.shuffle!
  end

  # DEAL
  # Removes and returns one card from the deck
  def deal
    @cards.pop
  end

end
