# RUBY WARRIOR LEVEL 7
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    case
    when warrior.feel.wall?
      warrior.pivot!
    when warrior.feel.enemy?
      warrior.attack!
    when warrior.health < @health # taking damage
      warrior.walk!(warrior.health < 9 ? :backward : :forward)
    when warrior.health < 15
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
