# RUBY WARRIOR LEVEL 8
class Player
  def play_turn(warrior)
    # cool code goes here
    if warrior.look.any?{|sp| sp.captive?}
      warrior.feel.captive? ? warrior.rescue! : warrior.walk!
    elsif warrior.look.any?{|sp| sp.enemy?}
      warrior.shoot!
    else
      warrior.walk!
    end
  end
end
