# RUBY WARRIOR LEVEL 9
class Player
  def play_turn(warrior)
    # cool code goes here
    @health ||= warrior.health
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.look(:backward).any? {|sp| sp.enemy?}
      warrior.walk!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.look.any?{|sp| sp.enemy?}
      warrior.shoot!
    elsif warrior.health < 10
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
