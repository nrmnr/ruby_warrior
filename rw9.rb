# RUBY WARRIOR LEVEL 9
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.health < @health
      if warrior.feel.enemy?
        warrior.attack!
      else
        warrior.walk!
      end
    elsif warrior.look.any?{|s| s.enemy?}
      warrior.shoot!
    elsif warrior.health < 20
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
