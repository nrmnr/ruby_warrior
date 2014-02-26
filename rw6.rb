# RUBY WARRIOR LEVEL 6
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.feel(:backward).captive?
      warrior.rescue! :backward
      @rescued = true
    elsif !@rescued
      warrior.walk! :backward
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
