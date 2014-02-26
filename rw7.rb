# RUBY WARRIOR LEVEL 7
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.health < @health # taking damage
      if warrior.feel.enemy?
        warrior.attack!
      elsif warrior.health > 9
        warrior.walk!
      else
        warrior.walk!(:backward)
      end
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
