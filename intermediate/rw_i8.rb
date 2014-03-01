# RUBY WARRIOR INTERMEDIATE LEVEL 8
class Player
  def play_turn(warrior)
    # add your code here
    couple = warrior.look.map{|sp| sp.enemy? ? "1":"0"}.join =~ /^11/
    case
    when couple
      warrior.detonate!
    when warrior.feel.enemy?
      warrior.attack!
    when warrior.feel.captive?
      warrior.rescue!
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end
end
