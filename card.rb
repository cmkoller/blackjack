# Initialize
# Getters for suit and rank

class Card
  # Suit = one-character string, one of the following: ♦ ♣ ♠ ♥
  # Rank = one-character string, 1-9 or J, Q, K, A

  attr_reader :rank

  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end

  # TYPE
  # Returns :FACE if face card, :ACE if ace, :NUMBER otherwise
  def type
    if @rank == 'K' || @rank == 'Q' || @rank == 'J'
      :face
    elsif @rank == 'A'
      :ace
    else
      :number
    end
  end

  def to_s
    return "#{@rank} #{@suit}"
  end

end
