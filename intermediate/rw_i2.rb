# RUBY WARRIOR INTERMEDIATE LEVEL 2
class Player
  def play_turn(warrior)
    # add your code here
    e_dir = [:forward, :left, :right, :backward].find{|dir| warrior.feel(dir).enemy?}
    case
    when e_dir
      warrior.attack! e_dir
    when warrior.health < 15
      warrior.rest!
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end
end
