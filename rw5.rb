# RUBY WARRIOR LEVEL 5
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.health < @health # taking damage
      warrior.feel.enemy? ? warrior.attack! : warrior.walk!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < 15
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
