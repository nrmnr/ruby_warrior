# RUBY WARRIOR LEVEL 4
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.health < @health # taking damage
      warrior.feel.enemy? ? warrior.attack! : warrior.walk!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < 12
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
