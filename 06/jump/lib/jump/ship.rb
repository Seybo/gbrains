require_relative 'mothership'

class Ship
  def jump
    raise 'Wrong mothership' unless block_given?
    puts "Jumping to <<#{yield}>>!"
  end
end
