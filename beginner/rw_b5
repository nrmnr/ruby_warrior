# RUBY WARRIOR LEVEL 5
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    case
    when warrior.feel.captive?
      warrior.rescue!
    when warrior.health < @health # taking damage
      warrior.feel.enemy? ? warrior.attack! : warrior.walk!
    when warrior.feel.enemy?
      warrior.attack!
    when warrior.health < 15
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
