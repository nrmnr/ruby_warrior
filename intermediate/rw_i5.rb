# RUBY WARRIOR INTERMEDIATE LEVEL 5
class Player
  def play_turn(warrior)
    # add your code here
    dirs = [:forward, :left, :right, :backward]
    case
    when warrior.listen.any?{|sp| sp.enemy?}, warrior.listen.any?{|sp| sp.captive?}
      e_dirs = dirs.select{|dir| warrior.feel(dir).enemy?}
      c_dirs = dirs.select{|dir| warrior.feel(dir).captive?}
      case
      when warrior.feel.stairs?
        warrior.walk! :left
      when e_dirs.size > 1
        warrior.bind! e_dirs.first
      when !e_dirs.empty?
        warrior.attack! e_dirs.first
      when warrior.health < 20
        warrior.rest!
      when !c_dirs.empty?
        warrior.rescue! c_dirs.first
      else
        sp = warrior.listen.find{|sp| sp.enemy? or sp.captive?}
        warrior.walk!(warrior.direction_of sp)
      end
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end
end
