# RUBY WARRIOR INTERMEDIATE LEVEL 6
class Player
  def play_turn(warrior)
    # add your code here
    dirs = [:forward, :left, :right, :backward]
    tick_sp = warrior.listen.find{|sp| sp.ticking?}
    case
    when dir = dirs.find{|dir| warrior.feel(dir).captive?}
      warrior.rescue! dir
    when tick_sp
      dir = warrior.direction_of tick_sp
      case
      when warrior.feel(dir).enemy?
        warrior.walk!(dir == :forward ? :left : :forward)
      else
        warrior.walk! dir
      end
    when warrior.listen.any?{|sp| sp.enemy?}
      e_dirs = dirs.select{|dir| warrior.feel(dir).enemy?}
      case
      when !e_dirs.empty?
        warrior.attack! e_dirs.first
      else
        sp = warrior.listen.find{|sp| sp.enemy?}
        warrior.walk!(warrior.direction_of sp)
      end
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end
end
