# RUBY WARRIOR LEVEL 2
class Player
  def play_turn(warrior)
    # cool code goes here
    if warrior.feel.enemy?
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
