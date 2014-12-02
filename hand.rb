class Hand

  attr_reader :hand_contents

  def initialize(starting_cards=[])
    @hand_contents = starting_cards
  end


  # BLACKJACK?
  # returns TRUE if it's a blackjack
  def blackjack?
    score == 21
  end

  # IS_A_BUST?
  # returns TRUE if it's a bust
  def is_a_bust?
    score > 21
  end

  # SCORE
  # Returns an int representing the best score possible
  def score
    score = 0
    aces_count = 0
    @hand_contents.each do |card|
      if card.type == :face
        score += 10
      elsif card.type == :ace
        aces_count += 1
        score += 11
      elsif card.type == :number
        score += card.rank.to_i
      end
    end

    while score > 21 && aces_count > 0
      score -= 10
      aces_count -= 1
    end
    score
  end

  def to_s
    (@hand_contents.map {|card| card.to_s}).join(", ")
  end

end
