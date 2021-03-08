# require_relative 'coin.rb'


class CoinBox

  FULL_COINS_SET = {1 => 20, 2 => 20, 5 => 20, 10 => 20, 20 => 20, 50 => 20, 100 => 20, 200 => 20 }
  EMPTY_COINS_SET = {1 => 0, 2 => 0, 5 => 0, 10 => 0, 20 => 0, 50 => 0, 100 => 0, 200 => 0 }
  COINS_LIMIT = 20

  attr_reader :stack

  def initialize(coins=[])
    # initial stack = {1 : 20, 2 : 20, 10 : 20, 50 : 20, 100 : 20, 200 : 20 }
    @stack = EMPTY_COINS_SET
    # self.fill_out_stack
  end

  def load_coins(coins = [])
    if !is_stack_full?

      if coins.any?
        left = {}

        coins.map(&:amount).each do |amount|
          # byebug

          # check if coins can fit the stack
          unless stack[amount] == COINS_LIMIT
            stack[amount]+= 1 
          else

            # check if there already is a such key
            if left.has_key?(amount)
              left[amount]+= 1
            else
              left[amount] = 1
            end
            #return coins thad didn't fit in the coinbox
            # return left
          end
          
        end
        p left

      else
        # if there aren't coins
        puts "you are trying to load coinbox with nothing, you need rethink your behavior."
      end

    else
      puts 'Stack is already full of coins.'
    end

  end

  def fill_out_stack
    FULL_COINS_SET.each do |key, value|
      stack[key] = value
    end
  end

  # private
    def check_coins_left(key)
     stack[key] 
    end

    def is_stack_full?
      # byebug
      full = []
      stack.each do |coin, amount|
        full << (stack[coin] == 20) ? true : false
      end
      full.all? {|value| value == true }
    end
end