# RUBY WARRIOR LEVEL 3
class Player
  def play_turn(warrior)
    # cool code goes here
    case
    when warrior.feel.enemy?
      warrior.attack!
    when warrior.health < 10
      warrior.rest!
    else
      warrior.walk!
    end
  end
end
