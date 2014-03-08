# RUBY WARRIOR INTERMEDIATE LEVEL 9
class Player
  def play_turn(warrior)
    # add your code here
    dirs = [:forward, :left, :right, :backward]
    ticking_spaces = warrior.listen.select{|sp| sp.ticking?}
    enemy_dirs = dirs.select{|dir| warrior.feel(dir).enemy?}
    couple = warrior.look.map{|sp| sp.enemy? ? "1":"0"}.join =~ /^11/
    unless ticking_spaces.empty?
      enable_detonate = ticking_spaces.select{|sp| warrior.distance_of(sp)<3}.empty?
      case
      when warrior.feel(:left).enemy?
        warrior.bind! :left
      when warrior.feel(:right).enemy?
        warrior.bind! :right
      when t_dir = dirs.find{|d| warrior.feel(d).ticking?}
        warrior.rescue! t_dir
      when warrior.feel.enemy?
        enable_detonate ? warrior.detonate! : warrior.attack!
      when warrior.health < 10
        warrior.rest!
      else
        warrior.walk!
      end
    else
      target_sp = warrior.listen.select{|sp| sp.captive? or sp.enemy?}
      case
      when dir = dirs.find{|dir| warrior.feel(dir).enemy?}
        warrior.attack! dir
      when warrior.health < 15
        warrior.rest!
      when dir = dirs.find{|dir| warrior.feel(dir).captive?}
        warrior.rescue! dir
      when !target_sp.empty?
        warrior.walk!(warrior.direction_of target_sp.first)
      else
        warrior.walk! warrior.direction_of_stairs
      end
    end
  end
end
