# RUBY WARRIOR INTERMEDIATE LEVEL 3
class Player
  def play_turn(warrior)
    # add your code here
    dirs = [:forward, :left, :right, :backward]
    e_dirs = dirs.select{|dir| warrior.feel(dir).enemy?}
    c_dir = dirs.find{|dir| warrior.feel(dir).captive?}
    case
    when e_dirs.size > 1
      warrior.bind! e_dirs.first
    when !e_dirs.empty?
      warrior.attack! e_dirs.first
    when warrior.health < 15
      warrior.rest!
    when c_dir
      warrior.rescue! c_dir
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end
end
