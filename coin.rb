class Coin
  ACCEPTED_AMOUNTS = [1, 2, 5, 10, 10, 50, 100, 200]

  attr_reader :amount

  def initialize(amount)
    raise 'That coin does not accepted' unless ACCEPTED_AMOUNTS.include?(amount)
    @amount = amount
  end

end