# RUBY WARRIOR LEVEL 9
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    case
    when warrior.feel.wall?
      warrior.pivot!
    when warrior.feel.captive?
      warrior.rescue!
    when warrior.look(:backward).any? {|sp| sp.enemy?}
      warrior.walk!
    when warrior.feel.enemy?
      warrior.attack!
    when warrior.look.any?{|sp| sp.enemy?}
      warrior.shoot!
    when warrior.health < 10
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
